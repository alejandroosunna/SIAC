using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descripción breve de clsCitaHandler
/// </summary>
public class csCitaHandler : ObjetoBase
{
	public csCitaHandler()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public csCita GetCita(int IdUsuario)
    {
        csCita Citas = new csCita();

        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            SqlParameter Data = new SqlParameter("@IdUsuario", IdUsuario);
            Data.DbType = DbType.Int32;

            String Query = "select * from tbCitas where IdUsuario = @IdUsuario;";

            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            SqlDataReader DataReader = Command.ExecuteReader();
            
            if (DataReader.Read())
            {
                Citas.LoadEventFromDataReader(DataReader);
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

        return Citas;
    }

    public List<csCita> GetListCitas(int idCarrera)
    {
        List<csCita> listCita = new List<csCita>();

        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            //String Query = "select * from tbCitas where IdAdministrador = @IdAdministrador and Disponible = 1;";
            SqlParameter Data = new SqlParameter("@IdCarrera", idCarrera);
            Data.DbType = DbType.Int32;

            String Query = "select * from tbCitas where IdCoordinador = @IdCarrera and Estado = 0 order by FechaDisponible asc;";

            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            SqlDataReader DataReader = Command.ExecuteReader();

            while (DataReader.Read())
            {
                csCita Cita = new csCita();
                Cita.LoadEventFromDataReader(DataReader);
                listCita.Add(Cita);
            }

            DataReader.Close();
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

        return listCita;
    }

    public int CheckCitaAndAdd(csCita Cita)
    {
        int checkCita = 0; // 0 existe, 1 no existe, 2 ya tiene una cita
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();

            SqlParameter Data = new SqlParameter("@IdCita", Cita.IdCita);
            Data.DbType = DbType.Int32;

            String Query = "select * from tbCitas where IdCita = @IdCita and Disponible = 0;";

            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            SqlDataReader DataReader = Command.ExecuteReader();

            if (DataReader.Read())
            {
                DataReader.Dispose();

                Data = new SqlParameter("@IdUsuario", Cita.IdUsuario);
                Data.DbType = DbType.Int32;

                Query = "select * from tbCitas where IdUsuario = @IdUsuario;";
                Command = new SqlCommand(Query, Connection);
                Command.Parameters.Add(Data);
                DataReader = Command.ExecuteReader();

                if (DataReader.Read())
                {
                    checkCita = 2;
                }
                else
                {
                    DataReader.Dispose();
                    
                    SqlParameter[] _Data = new SqlParameter[5];
                    _Data[0] = new SqlParameter("@IdUsuario", Cita.IdUsuario);
                    _Data[0].DbType = DbType.Int32;
                    _Data[1] = new SqlParameter("@FechaAgendada", Cita.FechaAgendada);
                    _Data[1].DbType = DbType.DateTime;
                    _Data[2] = new SqlParameter("@Estado", Cita.Estado);
                    _Data[2].DbType = DbType.Int32;
                    _Data[3] = new SqlParameter("@Comentario", Cita.Comentario);
                    _Data[3].DbType = DbType.String;
                    _Data[4] = new SqlParameter("@IdCita", Cita.IdCita);
                    _Data[4].DbType = DbType.Int32;

                    Query = "update tbCitas set IdUsuario = @IdUsuario, FechaAgendada = @FechaAgendada, Estado = @Estado where IdCita = @IdCita;";

                    SqlCommand _Command = new SqlCommand(Query, Connection);
                    _Command.Parameters.AddRange(_Data);
                    SqlDataReader _DataReader = _Command.ExecuteReader();
                    checkCita = 1;
                }
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

        return checkCita;
    }

    public void AddNewCita(csCita Cita)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();
            String Query = "INSERT INTO tbCitas (IdCoordinador, FechaDisponible,FechaAgendada, Estado) values (@IdCoordinador, @FechaDisponible, @FechaAgendada, @Estado);";
            SqlParameter[] Data = new SqlParameter[4];
            Data[0] = new SqlParameter("@IdCoordinador", Cita.IdCoordinador);
            Data[0].DbType = DbType.Int32;
            Data[1] = new SqlParameter("@FechaDisponible", Cita.FechaDisponible);
            Data[1].DbType = DbType.Date;
            Data[2] = new SqlParameter("@FechaAgendada", Cita.FechaAgendada);
            Data[2].DbType = DbType.Date;
            Data[3] = new SqlParameter("@Estado", Cita.Estado);
            Data[3].DbType = DbType.Int32;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.AddRange(Data);
            Command.ExecuteReader();
            Query = "";
            
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

    public void UpdateCita(csCita Cita)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();
            String Query = "update tbCitas set IdUsuario = @IdUsuario, FechaAgendada = @FechaAgendada, Disponible = @Disponible, Comentario = @Comentario;";
            SqlParameter[] Data = new SqlParameter[4];
            Data[0] = new SqlParameter("@IdUsuario", Cita.IdUsuario);
            Data[0].DbType = DbType.Int32;
            Data[1] = new SqlParameter("@FechaAgendada", Cita.FechaAgendada);
            Data[1].DbType = DbType.DateTime;
            Data[2] = new SqlParameter("@Disponible", Cita.Estado);
            Data[2].DbType = DbType.Int32;
            Data[3] = new SqlParameter("@Comentario", Cita.Comentario);
            Data[3].DbType = DbType.String;
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

    public bool DeleteCita(int IdCita)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        bool error = false;

        try
        {
            Connection.Open();
            String Query = "delete from tbCitas where IdCita = @IdCita;";
            SqlParameter Data = new SqlParameter("@IdCita", IdCita);
            Data.DbType = DbType.Int32;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            SqlDataReader DataReader = Command.ExecuteReader();
        }
        catch (Exception ex)
        {
            LogError(ex.Message);
            error = true;
        }
        finally
        {
            Connection.Close();
            Connection = null;
        }

        return error;
    }

    public bool Delete(int IdCita)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        bool error = false;

        try
        {
            Connection.Open();
            String Query = "update tbCitas set Disponible = 2 where IdCita = @IdCita;";
            SqlParameter Data = new SqlParameter("@IdCita", IdCita);
            Data.DbType = DbType.Int32;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            SqlDataReader DataReader = Command.ExecuteReader();
        }
        catch (Exception ex)
        {
            LogError(ex.Message);
            error = true;
        }
        finally
        {
            Connection.Close();
            Connection = null;
        }

        return error;
    }
}