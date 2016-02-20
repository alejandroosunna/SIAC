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
    public static List<clsCitaPaginado> listCitaPaginado;
    public int countCitaPaginado;
    public int paginaActual;
    public int tmpUltimaPagina;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdUsuario"] != null && Session["IdRol"] != null)
        {
            if(Convert.ToInt32(Session["IdRol"]) == 2)
            {
                bool result = bool.TryParse(Request["IdLogin"], out result);
                if (result)
                {
                    Session["IdUsuario"] = null;
                    Session["IdRol"] = null;
                    Response.Redirect("~\\Login.aspx");
                }
                else
                {
                    csUsuario Usuario = (new csUsuarioHandler()).GetUsuario(Convert.ToInt32(Session["IdUsuario"]));
                    lblNombre.Text = "Alumno: " + Usuario.Nombre + " " + Usuario.Apellidos + ".";
                    lblNumControl.Text = "Numero de Control: " + Usuario.IdUsuario + ".";

                    csCita Cita = (new csCitaHandler()).GetCita(Convert.ToInt32(Session["IdUsuario"]));
                    if (Cita.Estado == 1)
                    {
                        
                        lblPDiaCita.Text = "Fecha: " + Cita.FechaDisponible.ToString("dd / MM / yyyy");
                        lblPHoraCita.Text = "Hora: " + Cita.FechaDisponible.ToString("t");
                        btnEliminarCita.Visible = true;
                        GridViewCitas.Visible = false;
                        //txtComentario.Visible = true;
                        //btnEnviar.Visible = true;
                    }
                    else
                    {
                        lblPDiaCita.Text = "No hay cita pendiente.";
                        btnEliminarCita.Visible = false;
                        GridViewCitas.Visible = true;
                        //txtComentario.Visible = false;
                        //btnEnviar.Visible = false;

                        List<csCita> listCita = (new csCitaHandler()).GetListCitas(Usuario.IdCarrera);

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
                            //(new ObjetoBase()).LogError(listCita[y].FechaDisponible.ToString("t"));

                            dt.Rows.Add(dr);
                        }

                        GridViewCitas.DataSource = dt;
                        GridViewCitas.DataBind();

                        dt = new DataTable();
                        dt = (new csMotivoHandler()).GetDataSet(Usuario.IdCarrera);

                        DropDListMotivos.DataSource = dt;
                        DropDListMotivos.DataValueField = "IdMotivo";
                        DropDListMotivos.DataTextField = "Motivo";
                        DropDListMotivos.DataBind();
                    }

                    if (Request["re"] != null)
                    {
                        if (Request["re"] == "error")
                            Response.Write(@"<script language = 'javascript'>alert('Esta cita ya esta ocupada. Seleccione otra.') </script>");
                        else if (Request["re"] == "exito")
                            Response.Write(@"<script language = 'javascript'>alert('Cita agendada Exitosamente.') </script>");
                        else if (Request["re"] == "pendiente")
                            Response.Write(@"<script language = 'javascript'>alert('Ya tienes una cita pendiente.') </script>");
                    }

                    //PaginadoCitas(PrimeraVez: true);
                }
            }
            else
                Response.Redirect("~\\IndexAdmin.aspx");

        }
        else
            Response.Redirect("~\\Login.aspx");
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        csCita Cita = new csCita();

        if(Request["Cita"] != null)
            Cita.IdCita = Convert.ToInt32(Request["Cita"]);
        else
            Response.Write(@"<script language = 'javascript'>alert('Seleccione una cita') </script>");

        Cita.IdUsuario = Convert.ToInt32(Session["IdUsuario"]);
        //Cita.IdAdministrador = Convert.ToInt32(Session["IdAdministrador"]);
        Cita.FechaAgendada = DateTime.Now;
        Cita.Estado = 1;
        //Cita.Comentario = txtComentario.Text;

        int checkCita = (new csCitaHandler()).CheckCitaAndAdd(Cita);
        if (checkCita == 1)
            Response.Redirect("IndexAlumno.aspx?re=exito");
        else if(checkCita == 0)
            Response.Redirect("IndexAlumno.aspx?re=error");
        else if(checkCita == 2)
            Response.Redirect("IndexAlumno.aspx?re=pendiente");
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        enviarCorrreo();
    }

    protected void btnEliminarCita_Click(object sender, EventArgs e)
    {
        int IdCita = (new csCitaHandler()).GetCita(Convert.ToInt32(Session["IdUsuario"])).IdCita;

        if((new csCitaHandler()).Delete(IdCita))
            Response.Write(@"<script language = 'javascript'>alert('Error. Pongase en contacto con sistemas.') </script>");
        else
            Response.Write(@"<script language = 'javascript'>alert('Exito. Su cita ha sido eliminada.') </script>");
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

    private void PaginadoCitas(bool PrimeraVez = false, bool Izquierda = false, bool Derecha = false)
    {
        if (PrimeraVez)
        {

            csUsuario Usuario = (new csUsuarioHandler()).GetUsuario(Convert.ToInt32(Session["IdUsuario"]));
            List<csCita> listCita = (new csCitaHandler()).GetListCitas(Usuario.IdCarrera);
            List<csCita> listCitaGroup = new List<csCita>();
            clsCitaPaginado CitaPaginado;
            listCitaPaginado = new List<clsCitaPaginado>();
            countCitaPaginado = 0;
            paginaActual = 0;
            tmpUltimaPagina = 0;

            int countList = listCita.Count;
            int posX = 0;
            int x;

            for (x = 0; x < countList; x++)
            {
                if (x == 0)
                    listCitaGroup.Add(listCita[x]);
                else
                {
                    if (listCitaGroup[posX].FechaDisponible.ToString("dd / MM / yyyy") == listCita[x].FechaDisponible.ToString("dd / MM / yyyy"))
                    {
                        listCitaGroup.Add(listCita[x]);
                        posX++;
                    }
                    else
                    {
                        CitaPaginado = new clsCitaPaginado();
                        CitaPaginado.listCitas = listCitaGroup;
                        listCitaPaginado.Add(CitaPaginado);
                        listCitaGroup = new List<csCita>();
                        listCitaGroup.Add(listCita[x]);
                        posX = 0;
                    }
                }
            }

            CitaPaginado = new clsCitaPaginado();
            CitaPaginado.listCitas = listCitaGroup;
            listCitaPaginado.Add(CitaPaginado);
            countCitaPaginado = listCitaPaginado.Count;
            tmpUltimaPagina = listCitaPaginado.Count - 1;

            //if (countCitaPaginado < 1)
            //    btnSiguiente.Visible = false;
            //btnAnterior.Visible = false;
        }
        else if (Izquierda)
        {
            //if (paginaActual > 0)
            //    btnAnterior.Visible = false;
            //else
            //{
            //    if(!btnAnterior.Visible)
            //        btnAnterior.Visible = true;
            //    paginaActual--;
            //}
        }
        else if (Derecha)
        {
            //if (paginaActual < tmpUltimaPagina)
            //    btnSiguiente.Visible = false;
            //else
            //{
            //    if(!btnSiguiente.Visible)
            //        btnSiguiente.Visible = true;
            //    paginaActual++;
            //}
        }

        dt = new DataTable();
        dt.Columns.Add("Apartar");
        dt.Columns.Add("NumeroCita");
        dt.Columns.Add("Hora");
        dt.Columns.Add("Dia");


        (new ObjetoBase()).LogError(paginaActual.ToString() + "-" + PrimeraVez.ToString() + "-" + Izquierda.ToString() + "-" + Derecha.ToString());

        for (int y = 0; y < listCitaPaginado[paginaActual].listCitas.Count; y++)
        {
            DataRow dr = dt.NewRow();
            dr["Apartar"] = listCitaPaginado[paginaActual].listCitas[y].IdCita.ToString();
            dr["NumeroCita"] = listCitaPaginado[paginaActual].listCitas[y].IdCita.ToString();
            dr["Hora"] = listCitaPaginado[paginaActual].listCitas[y].FechaDisponible.ToString("HH:mm");
            dr["Dia"] = listCitaPaginado[paginaActual].listCitas[y].FechaDisponible.ToString("dd / MM / yyyy");

            dt.Rows.Add(dr);
        }

        GridViewCitas.DataSource = dt;//listCitaPaginado[0].listCitas;
        GridViewCitas.DataBind();
    }

    protected void GridViewCitas_DataBound(object sender, EventArgs e)
    {
        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    LinkButton lb = GridViewCitas.Rows[i].Controls[0].Controls[0] as LinkButton;
        //    lb.Text = "Seleccionar";//dt.Rows[i]["Apartar"].ToString();
        //}
    }

    protected void GridViewCitas_SelectedIndexChanged(object sender, EventArgs e)
    {
        //GridView gv = (GridView)sender;
        //int filaSeleccionada = gv.SelectedIndex;
        //LinkButton lb = gv.Rows[filaSeleccionada].Cells[0].Controls[0] as LinkButton;

        GridViewRow row = GridViewCitas.SelectedRow;

        int id = Convert.ToInt32(GridViewCitas.DataKeys[row.RowIndex].Value);
        (new ObjetoBase()).LogError(id.ToString());
    }
   
}