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
}