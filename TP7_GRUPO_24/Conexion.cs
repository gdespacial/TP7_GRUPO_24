using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace TP7_GRUPO_24
{
    public class Conexion
    {
        //string connectionString = @"Data Source=DESKTOP-9AUAVE3\SQLEXPRESS;Initial Catalog=BDSucursales;Integrated Security=True";
        string connectionString = @"Data Source=localhost\\sqlexpress;Initial Catalog=BDSucursales;Integrated Security=True";
        public SqlConnection ObtenerConexion()  // Metodo simple para obtener la conexion a SQL.
        {
            SqlConnection conexion = new SqlConnection(connectionString);
            conexion.Open();
            return conexion;
        }

            public DataTable ObtenerTablaFiltrada(SqlCommand comando, string consultaSQL, string nombreTabla)
            {
                SqlConnection conexion = ObtenerConexion();

                comando.Connection = conexion;
                comando.CommandText = consultaSQL;
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(comando); // Usar DataAdapter + DataSet para cargas simples.
                DataSet dataTable = new DataSet();
                sqlDataAdapter.Fill(dataTable, nombreTabla);
                return dataTable.Tables[nombreTabla];
            }
        }
    }