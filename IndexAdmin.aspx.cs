using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IndexAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdAdministrador"] != null)
        {
            clsAdministrador Administrador = (new clsAdministradorHandler()).GetAdministrador(Convert.ToInt32(Session["IdAdministrador"]));

            lblNombre.Text = "Bienvenido(a) " + Administrador.Nombre;
        }
        else
        {
            Response.Redirect("~\\Login.aspx");
        }
    }
    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session["IdAdministrador"] = null;
        Response.Redirect("~\\Login.aspx");
    }
}