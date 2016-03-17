﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Alumno : System.Web.UI.MasterPage
{
    static string nombre,numerocontrol;
    static bool single = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        csUsuario usuario = (new csUsuarioHandler()).GetUsuario(Convert.ToInt32(Session["IdUsuario"]));
        nombre = usuario.Nombre + usuario.Apellidos;
        numerocontrol = usuario.IdUsuario+"";
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
        single = true;
        return jsondata;
    }
}
