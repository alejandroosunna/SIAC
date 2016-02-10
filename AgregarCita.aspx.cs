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

    protected void btnGenerarCitas_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime Date = new DateTime(01 / 01 / 0001);
            DateTime wfinicio = new DateTime(calenDia.SelectedDate.Year, calenDia.SelectedDate.Month, calenDia.SelectedDate.Day, Convert.ToInt16(txtHora0.Text), 0, 0);
            GenerateDates(wfinicio, Convert.ToInt16(txtDias.Text), Convert.ToDouble(txtHora1.Text), Convert.ToDouble(txtIntervalo.Text));
        }
        catch
        {
            Response.Write(@"<script language = 'javascript'>alert('Ah ocurrido un error') </script>");
        }
       
    }
    private void GenerateDates(DateTime xfInicio,int xdias, double xhoraFinal,double xintervalo)
    {
        DateTime Date = new DateTime(01 / 01 / 0001);
        DateTime fInicio = xfInicio;
        clsCita Cita = new clsCita();
        try
        {
            for (int i = 1; i <= xdias; i++)
            {
                for (int j = fInicio.Hour; j < xhoraFinal;)
                {
                    Cita.IdAdministrador = Convert.ToInt32(Session["IdAdministrador"]);
                    Cita.Hora = fInicio.Hour.ToString() + ":" + fInicio.Minute.ToString();
                    Cita.Dia = fInicio;
                    Cita.Disponible = 0;
                    fInicio = fInicio.AddMinutes(xintervalo);
                    j = fInicio.Hour;
                    (new clsCitaHandler()).AddNewCita(Cita);
                }
                fInicio = xfInicio;
                fInicio = fInicio.AddDays(i);
            }
            Response.Redirect("~\\AgregarCita.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(@"<script language = 'javascript'>alert('Error al dar de alta la cita. Verefique los datos.') </script>");
        }
    }

}