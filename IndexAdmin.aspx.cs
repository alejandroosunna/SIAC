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
        if (Session["IdUsuario"] != null && Session["IdRol"] != null)
        {
            if (Convert.ToInt32(Session["IdRol"]) == 1)
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
                    lblNombre.Text = "Coordinador: " + Usuario.Nombre + " " + Usuario.Apellidos + ".";
                }
            }
            else
                Response.Redirect("~\\IndexAlumno.aspx");
        }
        else
            Response.Redirect("~\\Login.aspx");
    }
    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session["IdUsuario"] = null;
        Response.Redirect("~\\Login.aspx");
    }
    protected void GridView_Citas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            (new csCitaHandler()).DeleteCita(Convert.ToInt32(e.CommandArgument));
            Response.Redirect("~\\IndexAdmin.aspx");
        }
    }
    protected void btnNuevaCita_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\AgregarCita.aspx");
    }

    protected void GridView_Citas_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void SqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}