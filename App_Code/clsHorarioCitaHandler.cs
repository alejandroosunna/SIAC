using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descripción breve de clsHorarioCitaHandler
/// </summary>
public class clsHorarioCitaHandler
{
	public clsHorarioCitaHandler()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public bool CheckDisponible(int IdHoraCita, int IdAdministrador)
    {
        bool Disponible = false;
        clsHorarioCita HoraCita = new clsHorarioCita();
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();
            String Query = "select * from tbHorasCitas where IdHoraCita = @IdHoraCita and IdAdministrador = @IdAdministrador;";
            SqlParameter[] Data = new SqlParameter[2];
            Data[0] = new SqlParameter("@IdHoraCita", IdHoraCita);
            Data[0].DbType = DbType.Int32;
            Data[1] = new SqlParameter("@IdAdministrador", IdAdministrador);
            Data[1].DbType = DbType.String;
            SqlCommand Command = new SqlCommand(Query, Connection);
            Command.Parameters.AddRange(Data);
            SqlDataReader DataReader = Command.ExecuteReader();

            if (DataReader.Read())
            {
                HoraCita.LoadEventFromDataReader(DataReader);

                if (HoraCita.Disponible != 0)
                {
                    Disponible = true;
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
        return Disponible;
    }

    public void AddNewCita(clsHorarioCita HoraCita)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbControlDeCitas"].ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);

        try
        {
            Connection.Open();
            String Query = "insert into tbHorasCitas (IdAdministrador, Hora, Dia, Disponible) values (@IdAdministrador, @Hora, @Dia, @Disponible);";
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