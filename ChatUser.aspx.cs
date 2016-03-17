using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChatUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        csUsuario usuario = (new csUsuarioHandler()).GetUsuario(Convert.ToInt32(Session["IdUsuario"]));
        nickname.Text = usuario.Nombre + usuario.Apellidos;
        lblNumControl.Text = usuario.IdUsuario.ToString();
    }
}