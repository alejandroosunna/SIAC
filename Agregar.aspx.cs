using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Agregar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdAdministrador"] == null)
            Response.Redirect("~\\Login.aspx");
    }
    protected void txtNumControl_TextChanged(object sender, EventArgs e)
    {
        txtContraseña.Text = Server.HtmlEncode(txtNumControl.Text);
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            clsUsuario Usuario = new clsUsuario();

            Usuario.IdAdministrador = Convert.ToInt32(Session["IdAdministrador"]);
            Usuario.Nombre = txtNombre.Text;
            Usuario.ApellidoPaterno = txtApellidoPaterno.Text;
            Usuario.ApellidoMaterno = txtApellidoMaterno.Text;
            Usuario.NumControl = Convert.ToInt32(txtNumControl.Text);
            Usuario.Contraseña = txtContraseña.Text;

            (new clsUsuarioHandler()).AddNewUsuario(Usuario);

            Response.Redirect("~\\Agregar.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(@"<script language = 'javascript'>alert('Error al agregar el usuario. Verifica que los datos sean los correctos.') </script>");
        }
    }
}