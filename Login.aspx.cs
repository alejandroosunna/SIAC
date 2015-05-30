using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdLoginAlumno"] != null)
        {
            Response.Redirect("~\\IndexAlumno.aspx");
        }
        else if (Session["IdLoginAdministrador"] != null)
        {
            Response.Redirect("~\\IndexAdministrador.aspx");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
          clsUsuario Usuario = (new clsUsuarioHandler()).CheckLogin(Convert.ToInt32(txtNumControl.Text), txtContraseña.Text);

           if (Usuario.IdUsuario != 0)
           {
               Session["IdLoginAlumno"] = Usuario.IdUsuario;
               Session["IdAdministrador"] = Usuario.IdAdministrador;
               Response.Redirect("~\\IndexAlumno.aspx");
           }
           else
           {
               //lblAlerta.Text = "Credenciales Incorrectas";
               Response.Write(@"<script language = 'javascript'>alert('Credenciales incorrectas') </script>");
           }
    }
}