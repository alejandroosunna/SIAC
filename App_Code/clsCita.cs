using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsCitas
/// </summary>
public class clsCita : ObjetoBase
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
        IdCita = (int)CheckDbNull(DataReader["IdCita"], TipoDeObjeto.TipoInteger);
        IdUsuario = (int)CheckDbNull(DataReader["IdUsuario"], TipoDeObjeto.TipoInteger);
        IdAdministrador = (int)CheckDbNull(DataReader["IdAdministrador"], TipoDeObjeto.TipoInteger);
        Hora = (string)CheckDbNull(DataReader["Hora"], TipoDeObjeto.TipoString);
        Dia = (DateTime)CheckDbNull(DataReader["Dia"], TipoDeObjeto.TipoDateTime);
        FechaAgendada = (DateTime)CheckDbNull(DataReader["FechaAgendada"], TipoDeObjeto.TipoDateTime);
        Comentario = (string)CheckDbNull(DataReader["Comentario"], TipoDeObjeto.TipoString);
        Disponible = (int)CheckDbNull(DataReader["Disponible"], TipoDeObjeto.TipoInteger);
    }
}