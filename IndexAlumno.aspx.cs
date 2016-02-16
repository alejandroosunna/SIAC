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
        if (Session["IdLoginAlumno"] != null)
        {
            bool strCerrarSesion = Convert.ToBoolean(Request["IdLogin"]);
            if (strCerrarSesion == true)
            {
                Session["IdLoginAlumno"] = null;
                Session["IdAdministrador"] = null;
                Response.Redirect("~\\Login.aspx");
            }
            else
            {
                clsUsuario Usuario = (new clsUsuarioHandler()).GetUsuario(Convert.ToInt32(Session["IdLoginAlumno"]));
                lblNombre.Text = "Alumno: " + Usuario.Nombre + " " + Usuario.ApellidoPaterno + ".";
                lblNumControl.Text = "Numero de Control: " + Usuario.NumControl + ".";

                clsCita Cita = (new clsCitaHandler()).GetCita(Convert.ToInt32(Session["IdLoginAlumno"]));
                if (Cita.Disponible == 1)
                {
                    lblPDiaCita.Text = "Fecha: " + Cita.Dia.Day + "/" + Cita.Dia.Month + "/" + Cita.Dia.Year;
                    lblPHoraCita.Text = "Hora: " + Cita.Hora.ToString();
                    btnEliminarCita.Visible = true;
                    GridViewCitas.Visible = false;
                    txtComentario.Visible = true;
                    btnEnviar.Visible = true;
                }
                else
                {
                    lblPDiaCita.Text = "No hay cita pendiente.";
                    GridViewCitas.Visible = true;
                    txtComentario.Visible = false;
                    btnEnviar.Visible = false;

                    List<clsCita> listCita = (new clsCitaHandler()).GetListCitas(Usuario.IdAdministrador);

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
                        dr["Hora"] = listCita[y].Hora;
                        dr["Dia"] = listCita[y].Dia.ToString("dd / MM / yyyy");

                        dt.Rows.Add(dr);
                    }

                    GridViewCitas.DataSource = dt;
                    GridViewCitas.DataBind();
                }

                if(Request["re"] != null)
                {
                    if (Request["re"] == "error")
                        Response.Write(@"<script language = 'javascript'>alert('Esta cita ya esta ocupada. Seleccione otra.') </script>");
                    else if(Request["re"] == "exito")
                        Response.Write(@"<script language = 'javascript'>alert('Cita agendada Exitosamente.') </script>");
                    else if (Request["re"] == "pendiente")
                        Response.Write(@"<script language = 'javascript'>alert('Ya tienes una cita pendiente.') </script>");
                }

                //PaginadoCitas(PrimeraVez: true);
            }
        }
        else
            Response.Redirect("~\\Login.aspx");
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        clsCita Cita = new clsCita();

        if(Request["Cita"] != null)
            Cita.IdCita = Convert.ToInt32(Request["Cita"]);
        else
            Response.Write(@"<script language = 'javascript'>alert('Seleccione una cita') </script>");

        Cita.IdUsuario = Convert.ToInt32(Session["IdLoginAlumno"]);
        Cita.IdAdministrador = Convert.ToInt32(Session["IdAdministrador"]);
        Cita.FechaAgendada = DateTime.Now;
        Cita.Disponible = 1;
        Cita.Comentario = txtComentario.Text;

        int checkCita = (new clsCitaHandler()).CheckCitaAndAdd(Cita);
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
        int IdCita = (new clsCitaHandler()).GetCita(Convert.ToInt32(Session["IdLoginAlumno"])).IdCita;

        if((new clsCitaHandler()).Delete(IdCita))
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

            clsUsuario Usuario = (new clsUsuarioHandler()).GetUsuario(Convert.ToInt32(Session["IdLoginAlumno"]));
            List<clsCita> listCita = (new clsCitaHandler()).GetListCitas(Usuario.IdAdministrador);
            List<clsCita> listCitaGroup = new List<clsCita>();
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
                    if (listCitaGroup[posX].Dia == listCita[x].Dia)
                    {
                        listCitaGroup.Add(listCita[x]);
                        posX++;
                    }
                    else
                    {
                        CitaPaginado = new clsCitaPaginado();
                        CitaPaginado.listCitas = listCitaGroup;
                        listCitaPaginado.Add(CitaPaginado);
                        listCitaGroup = new List<clsCita>();
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
            dr["Hora"] = listCitaPaginado[paginaActual].listCitas[y].Hora;
            dr["Dia"] = listCitaPaginado[paginaActual].listCitas[y].Dia.ToString("dd / MM / yyyy");

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