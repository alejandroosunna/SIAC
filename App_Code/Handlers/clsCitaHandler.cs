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
public class clsCitaHandler : ObjetoBase
{
	public clsCitaHandler()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public clsCita GetCita(int IdUsuario)
    {
        clsCita Citas = new clsCita();

        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            String Query = "select * from tbCitas where IdUsuario = @IdUsuario;";
            SqlParameter Data = new SqlParameter("@IdUsuario", IdUsuario);
            Data.DbType = DbType.Int32;
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

    public clsCita[] GetListCitas(int IdAdministrador)
    {
        clsCita[] Citas = new clsCita[0];

        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            String Query = "select * from tbCitas where IdAdministrador = @IdAdministrador and Disponible = 1;";
            SqlParameter Data = new SqlParameter("@IdAdministrador", IdAdministrador);
            Data.DbType = DbType.Int32;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            SqlDataReader DataReader = Command.ExecuteReader();
            //DataTable tb = DataReader.GetSchemaTable();
            //int countRows= tb.Rows.Count;

            if (DataReader.Read())
            {
                int countRows = DataReader.FieldCount;
                for (int x = 0; x < countRows; x++)
                {
                    Citas[x].LoadEventFromDataReader(DataReader);
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

        return Citas;
    }

    public int CheckCitaAndAdd(clsCita Cita)
    {
        int checkCita = 0; // 0 existe, 1 no existe, 2 ya tiene una cita
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            String Query = "select * from tbCitas where IdCita = @IdCita and Disponible = 0;";
            SqlParameter Data = new SqlParameter("@IdCita", Cita.IdCita);
            Data.DbType = DbType.Int32;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.Add(Data);
            SqlDataReader DataReader = Command.ExecuteReader();

            if (DataReader.Read())
            {
                DataReader.Dispose();

                Query = "select * from tbCitas where IdUsuario = @IdUsuario;";
                Data = new SqlParameter("@IdUsuario", Cita.IdUsuario);
                Data.DbType = DbType.Int32;
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

                    Query = "update tbCitas set IdUsuario = @IdUsuario, FechaAgendada = @FechaAgendada, Disponible = @Disponible, Comentario = @Comentario where IdCita = @IdCita;";
                    SqlParameter[] _Data = new SqlParameter[5];
                    _Data[0] = new SqlParameter("@IdUsuario", Cita.IdUsuario);
                    _Data[0].DbType = DbType.Int32;
                    _Data[1] = new SqlParameter("@FechaAgendada", Cita.FechaAgendada);
                    _Data[1].DbType = DbType.DateTime;
                    _Data[2] = new SqlParameter("@Disponible", Cita.Disponible);
                    _Data[2].DbType = DbType.Int32;
                    _Data[3] = new SqlParameter("@Comentario", Cita.Comentario);
                    _Data[3].DbType = DbType.String;
                    _Data[4] = new SqlParameter("@IdCita", Cita.IdCita);
                    _Data[4].DbType = DbType.Int32;
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

    public void AddNewCita(clsCita Cita)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();
            String Query = "insert into tbCitas (IdAdministrador, Hora, Dia, Disponible) values (@IdAdministrador, @Hora, @Dia, @Disponible);";
            SqlParameter[] Data = new SqlParameter[4];
            Data[0] = new SqlParameter("@IdAdministrador", Cita.IdAdministrador);
            Data[0].DbType = DbType.Int32;
            Data[1] = new SqlParameter("@Hora", Cita.Hora);
            Data[1].DbType = DbType.String;
            Data[2] = new SqlParameter("@Dia", Cita.Dia);
            Data[2].DbType = DbType.Date;
            Data[3] = new SqlParameter("@Disponible", Cita.Disponible);
            Data[3].DbType = DbType.Int32;
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

    public void UpdateCita(clsCita Cita)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
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
            Data[2] = new SqlParameter("@Disponible", Cita.Disponible);
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
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
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
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
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