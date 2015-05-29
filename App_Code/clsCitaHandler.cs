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
public class clsCitaHandler
{
	public clsCitaHandler()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public clsCita GetCita(int IdCita)
    {
        clsCita Citas = new clsCita();

        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        try
        {
            Connection.Open();
            String Query = "select * from tbCitas where IdCita = @IdCita;";
            SqlParameter Data = new SqlParameter("@IdCita", IdCita);
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
            (new clsErrortxt()).LogError(ex.Message);
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
            (new clsErrortxt()).LogError(ex.Message);
        }
        finally
        {
            Connection.Close();
            Connection = null;
        }

        return Citas;
    }

    public void AddNewCita(clsHorarioCita HoraCita)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();
            String Query = "insert into tbCitas (IdAdministrador, Hora, Dia, Disponible) values (@IdAdministrador, @Hora, @Dia, @Disponible);";
            SqlParameter[] Data = new SqlParameter[4];
            Data[0] = new SqlParameter("@IdAdministrador", HoraCita.IdAdministrador);
            Data[0].DbType = DbType.Int32;
            Data[1] = new SqlParameter("@Hora", HoraCita.Hora);
            Data[1].DbType = DbType.String;
            Data[2] = new SqlParameter("@Dia", HoraCita.Dia);
            Data[2].DbType = DbType.Date;
            Data[3] = new SqlParameter("@Disponible", HoraCita.Disponible);
            Data[3].DbType = DbType.Int32;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.AddRange(Data);
            Command.ExecuteReader();
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
    }
}