using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsCitas
/// </summary>
public class clsCita
{
    public int IdCita { get; set; }
    public int IdUsuario { get; set; }
    public int IdAdministrador { get; set; }
    public string Hora { get; set; }
    public DateTime Dia { get; set; }
    public DateTime FechaAgendada { get; set; }
    public int Disponible { get; set; }
    public string Comentario { get; set; }

	public clsCita()
	{
        IdCita = 0;
        IdUsuario = 0;
        IdAdministrador = 0;
        Hora = "";
        Dia = DateTime.Now;
        FechaAgendada = DateTime.Now;
        Disponible = 0;
        Comentario = "";
	}

    public void LoadEventFromDataReader(SqlDataReader DataReader)
    {
        IdCita = (int)DataReader["IdCita"];
        IdUsuario = (int)DataReader["IdUsuario"];
        IdAdministrador = (int)DataReader["IdAdministrador"];
        Hora = (string)DataReader["Hora"];
        Dia = (DateTime)DataReader["Dia"];
        FechaAgendada = (DateTime)DataReader["FechaAgendada"];
        Comentario = (string)DataReader["Comentario"];
        Disponible = (int)DataReader["Disponible"];
    }
}