using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsAdministrador
/// </summary>
public class clsAdministrador
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
        IdAdministrador = (int)DataReader["IdAdministrador"];
        Nombre = (string)DataReader["Nombre"];
        ApellidoPaterno = (string)DataReader["ApellidoPaterno"];
        ApellidoMaterno = (string)DataReader["ApellidoMaterno"];
        NumControl = (int)DataReader["NumControl"];
        Contraseña = (string)DataReader["Contraseña"];
    }
}