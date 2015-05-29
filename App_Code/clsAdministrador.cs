using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsAdministrador
/// </summary>
public class clsAdministrador : ObjetoBase
{
    public int IdAdministrador { get; set; }
    public string Nombre { get; set; }
    public string ApellidoPaterno { get; set; }
    public string ApellidoMaterno { get; set; }
    public int NumControl { get; set; }
    public string Contraseña { get; set; }

	public clsAdministrador()
	{
        IdAdministrador = 0;
        Nombre = "";
        ApellidoPaterno = "";
        ApellidoMaterno = "";
        NumControl = 0;
        Contraseña = "";
	}

    public void LoadEventFromDataReader(SqlDataReader DataReader)
    {
        IdAdministrador = (int)CheckDbNull(DataReader["IdAdministrador"], TipoDeObjeto.TipoInteger);
        Nombre = (string)CheckDbNull(DataReader["Nombre"], TipoDeObjeto.TipoString);
        ApellidoPaterno = (string)CheckDbNull(DataReader["ApellidoPaterno"], TipoDeObjeto.TipoString);
        ApellidoMaterno = (string)CheckDbNull(DataReader["ApellidoMaterno"], TipoDeObjeto.TipoString);
        NumControl = (int)CheckDbNull(DataReader["NumControl"], TipoDeObjeto.TipoInteger);
        Contraseña = (string)CheckDbNull(DataReader["Contraseña"], TipoDeObjeto.TipoString);
    }
}