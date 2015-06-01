using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsUsuarioHandler
/// </summary>
public class clsUsuarioHandler : ObjetoBase
{
    public clsUsuarioHandler()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    public clsUsuario CheckLogin(int NumControl, string Contraseña) 
    {
        clsUsuario Usuario = new clsUsuario();
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            String Query = "select * from tbUsuarios where NumControl = @NumControl and Contraseña = @Contraseña;";
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
                Usuario.LoadEventFromDataReader(DataReader);
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

        return Usuario;
    }

    public clsUsuario GetUsuario(int IdAlumno)
    {
        clsUsuario Usuario = new clsUsuario();
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            String Query = "select * from tbUsuarios where IdUsuario = @IdUsuario;";
            SqlParameter Data = new SqlParameter("@IdUsuario", IdAlumno);
            Data.DbType = DbType.Int32;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            SqlDataReader DataReader = Command.ExecuteReader();

            if (DataReader.Read())
            {
                Usuario.LoadEventFromDataReader(DataReader);
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

        return Usuario;
    }

    public void AddNewUsuario(clsUsuario Usuario)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();
            String Query = "insert into tbUsuarios (IdAdministrador, Nombre, ApellidoPaterno, ApellidoMaterno, NumControl, Contraseña) "
            + "values (@IdAdministrador, @Nombre, @ApellidoPaterno, @ApellidoMaterno, @NumControl, @Contraseña);";
            SqlParameter[] Data = new SqlParameter[6];
            Data[0] = new SqlParameter("@IdAdministrador", Usuario.IdAdministrador);
            Data[0].DbType = DbType.Int32;
            Data[1] = new SqlParameter("@Nombre", Usuario.Nombre);
            Data[1].DbType = DbType.String;
            Data[2] = new SqlParameter("@ApellidoPaterno", Usuario.ApellidoPaterno);
            Data[2].DbType = DbType.String;
            Data[3] = new SqlParameter("@ApellidoMaterno", Usuario.ApellidoMaterno);
            Data[3].DbType = DbType.String;
            Data[4] = new SqlParameter("@NumControl", Usuario.NumControl);
            Data[4].DbType = DbType.Int32;
            Data[5] = new SqlParameter("@Contraseña", Usuario.Contraseña);
            Data[5].DbType = DbType.String;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.AddRange(Data);
            Command.ExecuteReader();
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
    }

    public void DeleteUsuario(int IdUsuario)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();
            String Query = "delete from tbUsuarios where IdUsuario = @IdUsuario;";
            SqlParameter Data = new SqlParameter("@IdUsuario", IdUsuario);
            Data.DbType = DbType.Int32;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            Command.ExecuteReader();
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
    }
}