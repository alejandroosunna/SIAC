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
                Response.Redirect("~\\Login.aspx");
            }
            else
            {
                clsUsuario Usuario = (new clsUsuarioHandler()).GetUsuario(Convert.ToInt32(Session["IdLoginAlumno"]));
             /*   lblNombreUsuario.Text = Alumno.Nombre;
                lblnumControl.Text = Alumno.NumControl.ToString();*/
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
            Session["IdCita"] = e.CommandArgument.ToString();
            //Response.Redirect("IndexAlumno.aspx?id=" + e.CommandArgument.ToString());
        }
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        clsCita Cita = new clsCita();

        if(Session["IdCita"] != null)
            Cita.IdCita = Convert.ToInt32(Session["IdCita"]);
        else
            Response.Write(@"<script language = 'javascript'>alert('Seleccione una cita') </script>");

        Cita.IdUsuario = Convert.ToInt32(Session["IdLoginAlumno"]);
        Cita.IdAdministrador = Convert.ToInt32(Session["IdAdministrador"]);
        Cita.FechaAgendada = DateTime.Now;
        Cita.Disponible = 1;
        Cita.Comentario = txtComentario.Text;
    }
}