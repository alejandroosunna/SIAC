using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    private static string nombre;
    private static string numerocontrol;

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
                    nombre = Usuario.Nombre + Usuario.Apellidos;
                    numerocontrol = Usuario.IdUsuario + "";

                }
            }
            else
                Response.Redirect("~\\IndexAlumno.aspx");
        }
        else
            Response.Redirect("~\\Login.aspx");
    }
    protected void ClickSalir()
    {
        
    }
    [WebMethod]
    public static string ObtenerUsuario()
    {
        string jsondata;

        jsondata = JsonConvert.ToString(nombre);
       
        return jsondata;
    }

    [WebMethod]
    public static string ObtenerIdUsuario()
    {
        string jsondata;

        jsondata = JsonConvert.ToString(numerocontrol);
        
        return jsondata;
    }
    protected void Salir_Click(object sender, EventArgs e)
    {
        Session["IdUsuario"] = null;
        Response.Redirect("~\\Login.aspx");
    }
}
