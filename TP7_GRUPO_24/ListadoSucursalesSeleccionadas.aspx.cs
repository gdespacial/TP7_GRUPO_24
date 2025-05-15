using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TP7_GRUPO_24
{
    public partial class ListadoSucursalesSeleccionadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SucursalesSeleccionadas"] != null)
                {
                    gvSucursales.DataSource = (DataTable)Session["SucursalesSeleccionadas"];
                    gvSucursales.DataBind();
                }
            }
        }
    }
}