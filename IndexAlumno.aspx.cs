using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class IndexAlumno : System.Web.UI.Page
{
    public DataTable dt;
    public int estadoCita;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdUsuario"] != null && Session["IdRol"] != null)
        {
            if(Convert.ToInt32(Session["IdRol"]) == 2)
            {
                bool result = bool.TryParse(Request["Logout"], out result);
                if (result)
                {
                    Session["IdUsuario"] = null;
                    Session["IdRol"] = null;
                    Session["IdCarrera"] = null;
                    Response.Redirect("~\\Login.aspx");
                }
                else if (Request["Cita"] != null)
                {
                    if (Request["Cita"] == "error")
                        Response.Write(@"<script language = 'javascript'>alert('Esta cita ya esta ocupada. Seleccione otra.') </script>");
                    else if (Request["Cita"] == "exito")
                        Response.Write(@"<script language = 'javascript'>alert('Cita agendada Exitosamente.') </script>");
                    else if (Request["Cita"] == "pendiente")
                        Response.Write(@"<script language = 'javascript'>alert('Ya tienes una cita pendiente.') </script>");
                }
                else if (Request["Delete"] != null)
                {
                    if (Request["Delete"] == "exito")
                        Response.Write(@"<script language = 'javascript'>alert('Cita eliminada con exito.') </script>");
                    if (Request["Delete"] == "error")
                        Response.Write(@"<script language = 'javascript'>alert('Error al eliminar la cita.') </script>");
                }

                csCitaHandler CitaHandler = new csCitaHandler();
                csUsuario Usuario = (new csUsuarioHandler()).GetUsuario(Convert.ToInt32(Session["IdUsuario"]));

                lblNombre.Text = "Alumno: " + Usuario.Nombre + " " + Usuario.Apellidos + ".";
                lblNumControl.Text = "Numero de Control: " + Usuario.IdUsuario + ".";

                estadoCita = 1; //Agendada
                csCita Cita = CitaHandler.GetCita(Convert.ToInt32(Session["IdUsuario"]), estadoCita);

                if (Cita.Estado != 0 && Cita.Estado == 1)
                {
                    if (DateTime.Now > Cita.FechaDisponible)
                    {
                        estadoCita = 3; //Update cita con error.
                        if (!(CitaHandler.Delete(Cita.IdCita, estadoCita)))
                        {
                            Response.Write(@"<script language = 'javascript'>alert('Tu cita ya expiro.') </script>");

                            lblPDiaCita.Text = "Ningun pendiente";
                            lblPHoraCita.Text = "";
                            btnEliminarCita.Visible = false;
                            GridViewCitas.Visible = true;
                            DropDListMotivos.Visible = true;
                        }
                        else
                            Response.Redirect("~//IndexAlumno.aspx?Logout=true");
                    }
                    else
                    {
                        lblPDiaCita.Text = "Fecha: " + Cita.FechaDisponible.ToString("dd / MM / yyyy");
                        lblPHoraCita.Text = "Hora: " + Cita.FechaDisponible.ToString("t");
                        btnEliminarCita.Visible = true;
                        GridViewCitas.Visible = false;
                        DropDListMotivos.Visible = false;
                    }
                }
                else
                {
                    lblPDiaCita.Text = "Ningun pendiente.";
                    lblPHoraCita.Text = "";
                    btnEliminarCita.Visible = false;
                    GridViewCitas.Visible = true;
                    DropDListMotivos.Visible = true;

                    List<csCita> listCita = CitaHandler.GetListCitas(Usuario.IdCarrera);

                    dt = new DataTable();
                    dt.Columns.Add("Apartar");
                    dt.Columns.Add("NumeroCita");
                    dt.Columns.Add("Hora");
                    dt.Columns.Add("Dia");

                    for (int y = 0; y < listCita.Count; y++)
                    {
                        DataRow dr = dt.NewRow();
                        dr["Apartar"] = listCita[y].IdCita.ToString();
                        dr["NumeroCita"] = listCita[y].IdCita.ToString();
                        dr["Hora"] = listCita[y].FechaDisponible.ToString("t");
                        dr["Dia"] = listCita[y].FechaDisponible.ToString("dd / MM / yyyy");

                        dt.Rows.Add(dr);
                    }

                    GridViewCitas.DataSource = dt;
                    GridViewCitas.DataBind();
                    DataTable Dt = new DataTable();
                    DataView Dv = default(DataView);
                    Dv = (DataView)SqlDataDropDListMotivos.Select(DataSourceSelectArguments.Empty);
                    Dt = Dv.ToTable();
                    for (int i = 0; i < Dt.Rows.Count; i++)
                    {
                        DropDListMotivos.Items.Add("op" + i.ToString());
                        DropDListMotivos.Items[i].Value = Dt.Rows[i]["IdMotivo"].ToString();
                        DropDListMotivos.Items[i].Text = Dt.Rows[i]["Motivo"].ToString();
                    }
                }                

            }
            else
                Response.Redirect("~\\IndexAdmin.aspx");

        }
        else
            Response.Redirect("~\\Login.aspx");
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        enviarCorrreo();
    }

    protected void btnEliminarCita_Click(object sender, EventArgs e)
    {
        int IdCita = (new csCitaHandler()).GetCita(Convert.ToInt32(Session["IdUsuario"])).IdCita;
        estadoCita = 3;

        if (!(new csCitaHandler()).Delete(IdCita, estadoCita))
            Response.Redirect("~\\IndexAlumno.aspx?Delete=exito");
        else
            Response.Redirect("~\\IndexAlumno.aspx?Delete=error");
    }

    public void enviarCorrreo()
    {
        string name = txtName.Text;
        string email = txtEmail.Text;
        string msg = txtMesg.Text;

        if (new Emailhtml().enviarcorreo(name, email, msg))
            Response.Write(@"<script language = 'javascript'>alert('Correo enviado') </script>");
        else
            Response.Write(@"<script language = 'javascript'>alert('Correo no enviado') </script>");
    }

    protected void GridViewCitas_SelectedIndexChanged(object sender, EventArgs e)
    {
        csCita Cita = new csCita();
        Cita.IdCita = Convert.ToInt32(GridViewCitas.DataKeys[GridViewCitas.SelectedRow.RowIndex].Value);
        Cita.IdUsuario = Convert.ToInt32(Session["IdUsuario"]);
        Cita.FechaAgendada = DateTime.Now;
        Cita.Estado = 1;

        int idMotivo = Convert.ToInt32(DropDListMotivos.SelectedItem.Value);
        int checkCita = (new csCitaHandler()).CheckCitaAndAddCitaMotivo(Cita, idMotivo);

        if (checkCita == 1)
            Response.Redirect("IndexAlumno.aspx?Cita=exito");
        else if (checkCita == 0)
            Response.Redirect("IndexAlumno.aspx?Cita=error");
        else if (checkCita == 2)
            Response.Redirect("IndexAlumno.aspx?Cita=pendiente");
    }
}