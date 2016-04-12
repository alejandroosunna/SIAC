using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChatUser : System.Web.UI.Page
{
    static string nombre;
    static string numerocontrol;
    static bool single = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        csUsuario usuario = (new csUsuarioHandler()).GetUsuario(Convert.ToInt32(Session["IdUsuario"]));

        nombre = usuario.Nombre + "(" + usuario.IdUsuario + ")";
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