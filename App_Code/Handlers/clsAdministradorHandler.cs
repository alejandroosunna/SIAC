using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descripción breve de clsAdministradorHandler
/// </summary>
public class clsAdministradorHandler : ObjetoBase
{
	public clsAdministradorHandler()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public clsAdministrador CheckLogin(int NumControl, string Contraseña)
    {
        clsAdministrador Administrador = new clsAdministrador();
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            String Query = "select * from tbAdministradores where NumControl = @NumControl and Contraseña = @Contraseña;";
            SqlParameter[] Data = new SqlParameter[2];
            Data[0] = new SqlParameter("@NumControl", NumControl);
            Data[0].DbType = DbType.Int32;
            Data[1] = new SqlParameter("@Contraseña", Contraseña);
            Data[1].DbType = DbType.String;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.AddRange(Data);
            SqlDataReader DataReader = Command.ExecuteReader();

            if (DataReader.Read())
            {
                Administrador.LoadEventFromDataReader(DataReader);
            }
        }
        catch (Exception ex)
        {
            LogError(ex.Message);
        }
        finally
        {
            Connection.Close();
            Connection = null;
        }

        return Administrador;
    }

    public clsAdministrador GetAdministrador(int IdAdministrador)
    {
        clsAdministrador Administrador = new clsAdministrador();
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            String Query = "select * from tbAdministradores where IdAdministrador = @IdAdministrador;";
            SqlParameter Data = new SqlParameter("@IdAdministrador", IdAdministrador);
            Data.DbType = DbType.Int32;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            SqlDataReader DataReader = Command.ExecuteReader();

            if (DataReader.Read())
            {
                Administrador.LoadEventFromDataReader(DataReader);
            }
        }
        catch (Exception ex)
        {
            LogError(ex.Message);
        }
        finally
        {
            Connection.Close();
            Connection = null;
        }

        return Administrador;
    }
}