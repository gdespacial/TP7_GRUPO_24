using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace TP7_GRUPO_24
{
    public class Sucursal
    {
        private int _idSucursal;
        private string _NombreSucursal;
        private string _DescripcionSucursal;
        private string _URL_Imagen_Sucursal;


        public Sucursal()
        {

        }

        public Sucursal(int idSucursal, string NombreSucursal ,string DescripcionSucursal, string URL_Imagen_Sucursal)
        {
            _idSucursal = idSucursal;
            _NombreSucursal = NombreSucursal;
            _DescripcionSucursal = DescripcionSucursal;
            _URL_Imagen_Sucursal = URL_Imagen_Sucursal;
        }

        public int idSucursal
        {
            get
            {
                return _idSucursal;
            }
            set
            {
                _idSucursal = value;
            }
        }

        public string NombreSucursal
        {
            get
            {
                return _NombreSucursal;
            }
            set
            {
                _NombreSucursal = value;
            }
        }

        public string DescripcionSucursal
        {
            get
            {
                return _DescripcionSucursal;
            }
            set
            {
                _DescripcionSucursal = value;
            }
        }

        public string URL_Imagen_Sucursal
        {
            get
            {
                return _URL_Imagen_Sucursal;
            }
            set
            {
                _URL_Imagen_Sucursal = value;
            }
        }
    }
}