using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IndexAdmin : System.Web.UI.Page
{
    List<int> seleccionados = new List<int>();
    protected void Page_Load(object sender, EventArgs e)
    {
        

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
        GridViewRow row = GridView_Citas.SelectedRow;

        int id = Convert.ToInt32(GridView_Citas.DataKeys[row.RowIndex].Value);

        if (!buscarRepetido(id))
        {
            seleccionados.Add(id);
        }
        
        
    }

    protected void SqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    private bool buscarRepetido(int id)
    {
     
        for (int i = 0; i < seleccionados.Count; i++)
        {
            if (seleccionados[i] == id)
            {
                seleccionados.Remove(i);
                return true;
            }
        }
        return false;
    }

    protected void btnElinarCitas_Click(object sender, EventArgs e)
    {
        foreach (var item in seleccionados)
        {
            (new csCitaHandler()).DeleteCita(item);
        }

        Response.Redirect("~\\IndexAdmin.aspx");
    }
}