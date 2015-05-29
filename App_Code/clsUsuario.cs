using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsAlumnos
/// </summary>
public class clsUsuario
{
    public int IdUsuario { get; set; }
	public int IdAdministrador {get; set;}
    public string Nombre { get; set; }
    public string ApellidoPaterno { get; set; }
    public string ApellidoMaterno { get; set; }
    public int NumControl { get; set; }
    public string Contraseña { get; set; }

	public clsUsuario()
	{
        IdUsuario = 0;
        IdAdministrador = 0;
        Nombre = "";
        ApellidoPaterno = "";
        ApellidoMaterno = "";
        NumControl = 0;
        Contraseña = "";
	}

    public void LoadEventFromDataReader(SqlDataReader DataReader)
    {
        IdUsuario = (int)DataReader["IdUsuario"];
        IdAdministrador = (int)DataReader["IdAdministrador"];
        Nombre = (string)DataReader["Nombre"];
        ApellidoPaterno = (string)DataReader["ApellidoPaterno"];
        ApellidoMaterno = (string)DataReader["ApellidoMaterno"];
        NumControl = (int)DataReader["NumControl"];
        Contraseña = (string)DataReader["Contraseña"];
    }
}