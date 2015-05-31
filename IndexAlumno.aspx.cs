using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class IndexAlumno : System.Web.UI.Page
{
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
                if (Cita.IdUsuario != 0)
                {
                    lblPDiaCita.Text = "Fecha: " + Cita.Dia.Day + "/" + Cita.Dia.Month + "/" + Cita.Dia.Year;
                    lblPHoraCita.Text = "Hora: " + Cita.Hora.ToString();
                }
                else
                {
                    lblPDiaCita.Text = "No hay cita pendiente.";
                }

                if(Request["Cita"] != null)
                    txtNumCita.Text = Request["Cita"].ToString();

                if(Request["re"] != null)
                {
                    if (Request["re"] == "error")
                        Response.Write(@"<script language = 'javascript'>alert('Esta cita ya esta ocupada. Seleccione otra.') </script>");
                    else if(Request["re"] == "exito")
                        Response.Write(@"<script language = 'javascript'>alert('Cita agendada Exitosamente.') </script>");
                    else if (Request["re"] == "pendiente")
                        Response.Write(@"<script language = 'javascript'>alert('Ya tienes una cita pendiente.') </script>");
                }
            }
        }
        else
        {
            Response.Redirect("~\\Login.aspx");
        }
    }
    protected void GridView_Citas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SelectRow")
        {
            txtNumCita.Text = e.CommandArgument.ToString();
            int cita = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("IndexAlumno.aspx?Cita="+cita+"#Citas");
        }
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
    public void enviarCorrreo()
    {
        string name = txtName.Text;
        string email = txtEmail.Text;
        string msg = txtMesg.Text;
        if(new Emailhtml().enviarcorreo(name, email, msg)){
            Response.Write(@"<script language = 'javascript'>alert('Correo enviado') </script>");
        }else{
             Response.Write(@"<script language = 'javascript'>alert('Correo no enviado') </script>");
        }
        
    }
}