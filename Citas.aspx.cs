using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Services;
using Newtonsoft.Json;

public partial class Citas : System.Web.UI.Page
{
    public static DataTable TableData = new DataTable();
    protected static int coord;
    protected void Page_Load(object sender, EventArgs e)
    {
        coord = Convert.ToInt32(Session["IdCarrera"]);
        if (!IsPostBack)
        {
            GetAllData();
        }
    }

    private void GetAllData()
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        using (var con = new SqlConnection(ConnectionString))
        {
            con.Open();
            SqlParameter Data = new SqlParameter("@IdCoordinador", coord);
            Data.DbType = DbType.Int32;
            const string query = "select * from tbCitas ";
            using (var cmd = new SqlCommand(query, con))
            {
                using (var sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (TableData)
                    {
                        TableData.Clear();
                        sda.Fill(TableData);
                    }
                }
            }
        }
    }

    [WebMethod]
    public static csCita[] GetData()
    {
        var details = new List<csCita>();
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        using (var con = new SqlConnection(ConnectionString)) {
            SqlParameter Data = new SqlParameter("@IdCoordinador", coord);
            Data.DbType = DbType.Int32;
            const string query = "select * from tbCitas where idCoordinador =  @IdCoordinador order by FechaDisponible";
            using (var cmd = new SqlCommand(query, con))
            {
                using (var sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;

                    TableData.Clear();
                    details.AddRange(from DataRow dtrow in TableData.Rows
                                     select new csCita
                                     {
                                         IdCita = Convert.ToInt32(dtrow["idCita"]),
                                         IdUsuario = Convert.ToInt32(dtrow["idUsuario"]),
                                         FechaAgendada = Convert.ToDateTime(dtrow["FechaAgendad"]),
                                         FechaDisponible = Convert.ToDateTime(dtrow["FechaDisponible"]),
                                         Estado = Convert.ToInt32(dtrow["Estado"]),
                                         Comentario = dtrow["Comentario"].ToString()
                                     });
                }
            }
        }
        return details.ToArray();
    }
    [WebMethod]
    public static string EditCita(int cid)
    {
        string jsondata;
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        using (var con = new SqlConnection(ConnectionString))
        {
            var query = "select * from tbCitas where idCita = " + cid + "";
            using (var cmd = new SqlCommand(query, con))
            {
                using (var sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    TableData.Clear();
                    sda.Fill(TableData);
                    jsondata = JsonConvert.SerializeObject(TableData);
                }
            }
        }
        return jsondata;
    }

    [WebMethod]
    public static void UpdateCita(csCita cita, int cid)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        using (var con = new SqlConnection(ConnectionString))
        {
            var query = "update tbCitas set idCita = '" + cita.IdCita + "', idUsuario = '" + cita.IdUsuario + "', fechaAgendada='" +
                cita.FechaAgendada + "',fechaDisponible = " + cita.FechaDisponible + "', estado= " + cita.Estado +
                "', comentario= '" + cita.Comentario + "'";

            con.Open();
            var cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();


        }
    }

    [WebMethod]
    public static void RemoveCita(int cid)
    {
        String ConnectionString = ConfigurationManager.ConnectionStrings["dbProyectoCoordinacion"].ConnectionString;
        using (var con = new SqlConnection(ConnectionString))
        {
            var query = "delete from tbcitas where idCita='" + cid + "'";
            con.Open();
            var cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}