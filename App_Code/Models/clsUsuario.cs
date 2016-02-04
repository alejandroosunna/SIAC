using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsAlumnos
/// </summary>
public class clsUsuario : ObjetoBase
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
        Nombre = " ";
        ApellidoPaterno = " ";
        ApellidoMaterno = " ";
        NumControl = 0;
        Contraseña = " ";
	}

    public void LoadEventFromDataReader(SqlDataReader DataReader)
    {
        IdUsuario = (int)CheckDbNull(DataReader["IdUsuario"], TipoDeObjeto.TipoInteger);
        IdAdministrador = (int)CheckDbNull(DataReader["IdAdministrador"], TipoDeObjeto.TipoInteger);
        Nombre = (string)CheckDbNull(DataReader["Nombre"], TipoDeObjeto.TipoString);
        ApellidoPaterno = (string)CheckDbNull(DataReader["ApellidoPaterno"], TipoDeObjeto.TipoString);
        ApellidoMaterno = (string)CheckDbNull(DataReader["ApellidoMaterno"], TipoDeObjeto.TipoString);
        NumControl = (int)CheckDbNull(DataReader["NumControl"], TipoDeObjeto.TipoInteger);
        Contraseña = (string)CheckDbNull(DataReader["Contraseña"], TipoDeObjeto.TipoString);
    }
}