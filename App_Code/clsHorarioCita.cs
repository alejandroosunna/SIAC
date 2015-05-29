using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


/// <summary>
/// Descripción breve de clsHorarioCita
/// </summary>
public class clsHorarioCita
{
    public int HorarioCita { get; set; }
    public int IdAdministrador { get; set; }
    public string Hora { get; set; }
    public DateTime Dia { get; set; }
    public int Disponible { get; set; }

	public clsHorarioCita()
	{
        HorarioCita = 0;
        IdAdministrador = 0;
        Hora = "";
        Dia = DateTime.Now;
        Disponible = 0;
	}

    public void LoadEventFromDataReader(SqlDataReader DataReader)
    {
        HorarioCita = (int)DataReader["HorarioCita"];
        IdAdministrador = (int)DataReader["IdAdministrador"];
        Hora = (string)DataReader["Hora"];
        Dia = (DateTime)DataReader["Dia"];
        Disponible = (int)DataReader["Disponible"];
    }
}