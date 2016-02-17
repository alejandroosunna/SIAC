﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsUsuarioHandler
/// </summary>
public class csUsuarioHandler : ObjetoBase
{
    public csUsuarioHandler()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public csUsuario CheckLogin(int NumControl, string Contraseña) 
    {
        csUsuario Usuario = new csUsuario();
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();

            SqlParameter[] Data = new SqlParameter[2];
            Data[0] = new SqlParameter("@NumControl", NumControl);
            Data[0].DbType = DbType.Int32;
            Data[1] = new SqlParameter("@Contraseña", Contraseña);
            Data[1].DbType = DbType.String;

            String Query = "select * from tbUsuarios where NumControl = @NumControl and Contraseña = @Contraseña;";

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

    public csUsuario GetUsuario(int IdUsuario)
    {
        csUsuario Usuario = new csUsuario();
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();

            SqlParameter Data = new SqlParameter("@IdUsuario", IdUsuario);
            Data.DbType = DbType.Int32;

            String Query = "select * from tbUsuarios where IdUsuario = @IdUsuario;";

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

    public void AddNewUsuario(csUsuario Usuario)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();

            SqlParameter[] Data = new SqlParameter[6];
            Data[0] = new SqlParameter("@IdUsuario", Usuario.IdUsuario);
            Data[0].DbType = DbType.Int32;
            Data[1] = new SqlParameter("@IdCarrera", Usuario.IdCarrera);
            Data[1].DbType = DbType.Int32;
            Data[2] = new SqlParameter("@IdRol", Usuario.IdRol);
            Data[2].DbType = DbType.Int32;
            Data[3] = new SqlParameter("@Nombre", Usuario.Nombre);
            Data[3].DbType = DbType.String;
            Data[4] = new SqlParameter("@Apellidos", Usuario.Apellidos);
            Data[4].DbType = DbType.String;
            Data[5] = new SqlParameter("@Contraseña", Usuario.Contraseña);
            Data[5].DbType = DbType.String;

            String Query = "insert into tbUsuarios (IdUsuario, IdCarrera, IdRol, Nombre, Apellidos, Contraseña) "
            + "values (@IdUsuario, @IdCarrera, @IdRol, @Nombre, @Apellidos, @Contraseña);";

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