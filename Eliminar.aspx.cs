using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Eliminar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdAdministrador"] == null)
            Response.Redirect("~\\Login.aspx");
    }
    protected void GridView_Usuarios_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            (new clsUsuarioHandler()).DeleteUsuario(Convert.ToInt32(e.CommandArgument));
            Response.Redirect("~\\Eliminar.aspx");
        }
    }
    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session["IdAdministrador"] = null;
        Response.Redirect("~\\Login.aspx");
    }
}