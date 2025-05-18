using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace TP7_GRUPO_24
{
    public class GestionSucursales
    {
        Conexion conexion = new Conexion();

        public void ParametrosBuscar(SqlCommand sqlCommand, Sucursal sucursal)
        {
            SqlParameter sqlParameter = new SqlParameter();
            sqlParameter = sqlCommand.Parameters.Add("@NombreSucursal", SqlDbType.NVarChar, 100);
            sqlParameter.Value = sucursal.NombreSucursal + "%";
        }
   
        public void ParametrosProvincia(SqlCommand sqlCommand, Sucursal sucursal) // Agregado.
        {
            SqlParameter sqlParameter = new SqlParameter();
            sqlCommand.Parameters.Add("@Id_ProvinciaSucursal", SqlDbType.Int).Value = sucursal.Id_ProvinciaSucursal;
        }

        public DataTable FiltrarTabla(Sucursal sucursal)
        {
            SqlCommand sqlCommand = new SqlCommand();
            string nombreTabla = "Sucursal";
            ParametrosBuscar(sqlCommand, sucursal);
           Conexion conexion = new Conexion();
            string consultasql = "SELECT NombreSucursal, DescripcionSucursal, URL_Imagen_Sucursal, Id_Sucursal FROM Sucursal WHERE NombreSucursal LIKE @NombreSucursal";
            DataTable tabla = conexion.ObtenerTablaFiltrada(sqlCommand, consultasql, nombreTabla);
            return tabla;
        }

        public DataTable ObtenerTodasLasSucursales() // Agregado.
        {
            string consultaSQL = "SELECT NombreSucursal, DescripcionSucursal, URL_Imagen_Sucursal, Id_Sucursal FROM Sucursal";
            using (SqlConnection con = conexion.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand(consultaSQL, con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable tabla = new DataTable("Sucursal");
                adapter.Fill(tabla);
                return tabla;
            }
        }

        public DataTable FiltrarPorProvincia(Sucursal sucursal) // Agregado.
        {
            SqlCommand sqlCommand = new SqlCommand();
            ParametrosProvincia(sqlCommand, sucursal);
            string consultaSQL = @"
        Select
            S.NombreSucursal, 
            S.DescripcionSucursal, 
            S.URL_Imagen_Sucursal, 
            S.Id_Sucursal, 
            P.DescripcionProvincia,
            P.Id_Provincia
        From 
            Sucursal S
        Inner Join
            Provincia P On S.Id_ProvinciaSucursal = P.Id_Provincia
        Where 
            S.Id_ProvinciaSucursal = @Id_ProvinciaSucursal";

            Conexion conexion = new Conexion();
            string nombreTabla = "Sucursal";
            DataTable tabla = conexion.ObtenerTablaFiltrada(sqlCommand, consultaSQL, nombreTabla);
            return tabla;
        }

        public DataTable LeerConsulta() // Para Botones de DataList.
        {
            string consultaSQL = "Select P.Id_Provincia, P.DescripcionProvincia FROM Provincia P";
            using (SqlConnection con = conexion.ObtenerConexion())
            {
            SqlCommand cmd = new SqlCommand(consultaSQL, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable tabla = new DataTable();
            adapter.Fill(tabla);
            return tabla;
            }
        }
    }
}