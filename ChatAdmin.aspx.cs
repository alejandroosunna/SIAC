using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;


public partial class ChatAdmin : System.Web.UI.Page
{
    static string nombre;
    static string numerocontrol;
    static bool single = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        csUsuario usuario = (new csUsuarioHandler()).GetUsuario(Convert.ToInt32(Session["IdUsuario"]));
        numControl.Text = usuario.IdUsuario.ToString();
        nombre = usuario.Nombre +"("+ usuario.IdUsuario + ")";
        numerocontrol = usuario.IdUsuario.ToString();
    }
    [WebMethod]
    public static string ObtenerUsuario()
    {
        string jsondata;
    
            jsondata = JsonConvert.ToString(nombre);
            single = true;
      
        
        return jsondata;
    }

    [WebMethod]
    public static string ObtenerIdUsuario()
    {
        string jsondata;

        jsondata = JsonConvert.ToString(numerocontrol);

        return jsondata;
    }
}