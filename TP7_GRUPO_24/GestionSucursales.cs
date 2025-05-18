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

        public DataTable FiltrarTabla(Sucursal sucursal)
        {
            SqlCommand sqlCommand = new SqlCommand();
            string nombreTabla = "Sucursales";
            ParametrosBuscar(sqlCommand, sucursal);
           Conexion conexion = new Conexion();
            string consultasql = "SELECT NombreSucursal, DescripcionSucursal, URL_Imagen_Sucursal, Id_Sucursal FROM Sucursal WHERE NombreSucursal LIKE @NombreSucursal";
            DataTable tabla = conexion.ObtenerTablaFiltrada(sqlCommand, consultasql, nombreTabla);
            return tabla;

        }
    }
}