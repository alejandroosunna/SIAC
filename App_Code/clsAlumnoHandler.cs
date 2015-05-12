using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsAlumnoHandler
/// </summary>
public class clsAlumnoHandler
{
    public clsAlumnoHandler()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    public clsAlumno CheckLogin(int NumControl, string Contraseña) 
    {
        clsAlumno Alumno = new clsAlumno();
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            String Query = "select * from tbLogins where NumControl = @NumControl and Contraseña = @Contraseña;";
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
                Alumno.LoadEventFromDataReader(DataReader);
            }
        }
        catch (Exception ex)
        {
            (new clsErrortxt()).LogError(ex.Message);
        }
        finally
        {
            Connection.Close();
            Connection = null;
        }

        return Alumno;
    }

    public clsAlumno GetAlumno(int IdAlumno)
    {
        clsAlumno Alumno = new clsAlumno();
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            String Query = "select * from tbLogins where IdLogin = @IdLogin;";
            SqlParameter Data = new SqlParameter("@IdLogin", IdAlumno);
            Data.DbType = DbType.Int32;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            SqlDataReader DataReader = Command.ExecuteReader();

            if (DataReader.Read())
            {
                Alumno.LoadEventFromDataReader(DataReader);
            }
        }
        catch (Exception ex)
        {
            (new clsErrortxt()).LogError(ex.Message);
        }
        finally
        {
            Connection.Close();
            Connection = null;
        }

        return Alumno;
    }
}