using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarCita : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdAdministrador"] == null)
            Response.Redirect("~\\Login.aspx");
    }


    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session["IdAdministrador"] = null;
        Response.Redirect("~\\Login.aspx");
    }

    protected void btnAgregarCita_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime Date = new DateTime(01/01/0001);

            if (calenDia.SelectedDate.ToShortDateString() != Date.ToShortDateString() && txtHora.Text != "")
            {
                clsCita Cita = new clsCita();

                Cita.IdAdministrador = Convert.ToInt32(Session["IdAdministrador"]);
                Cita.Hora = txtHora.Text;
                Cita.Dia = calenDia.SelectedDate;
                Cita.Disponible = 0;

                (new clsCitaHandler()).AddNewCita(Cita);
                Response.Redirect("~\\AgregarCita.aspx");
            }
            else
            {
                Response.Write(@"<script language = 'javascript'>alert('Llene todos los campos.') </script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write(@"<script language = 'javascript'>alert('Error al dar de alta la cita. Verefique los datos.') </script>");
        }
    }
}