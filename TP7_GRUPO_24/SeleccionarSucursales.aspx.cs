using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TP7_GRUPO_24
{
    public partial class SeleccionarSucursales : System.Web.UI.Page
    {
        Sucursal sucursal = new Sucursal();
        GestionSucursales gestionSucursales = new GestionSucursales();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                cargarListView();
            }
        }

        private void cargarListView()
        {
            sucursal = new Sucursal(txtSucursales.Text);
            var tabla = gestionSucursales.FiltrarTabla(sucursal);
            ListViewSucursales.DataSource = tabla;
            ListViewSucursales.DataBind();

        }

        protected void btnSeleccionar_Command1(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoSeleccionar")
            {
                string[] datos = e.CommandArgument.ToString().Split('-');

                int idSucursal = int.Parse(datos[0].Trim());
                string nombreSucursal = datos[1].Trim();
                string descripcionSucursal = datos[2].Trim();

                sucursal = new Sucursal(idSucursal, nombreSucursal, descripcionSucursal, "");

                if (Session["SucursalesSeleccionadas"] == null)
                {

                    Session["SucursalesSeleccionadas"] = crearTabla();
                }
                lblMensaje.Text = "Sucursal Agregada";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
                agregarFila((DataTable)Session["SucursalesSeleccionadas"], sucursal);
            }
        }

        private DataTable crearTabla()
        {
            DataTable datatable = new DataTable();
            DataColumn dataColumn = new DataColumn("Id_Sucursal", System.Type.GetType("System.String"));
            datatable.Columns.Add(dataColumn);

            dataColumn = new DataColumn("NombreSucursal", System.Type.GetType("System.String"));
            datatable.Columns.Add(dataColumn);       

            dataColumn = new DataColumn("DescripcionSucursal", System.Type.GetType("System.String"));
            datatable.Columns.Add(dataColumn);

            return datatable;

        }

        private DataTable agregarFila(DataTable dataTable, Sucursal sucursal)
        {
            DataRow datarow = dataTable.NewRow();
            datarow["Id_Sucursal"] = sucursal.idSucursal;
            datarow["NombreSucursal"] = sucursal.NombreSucursal;
            datarow["DescripcionSucursal"] = sucursal.DescripcionSucursal;
            dataTable.Rows.Add(datarow);

            return dataTable;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            var pager = ListViewSucursales.FindControl("DataPager1") as DataPager;
            if (pager != null)
            {
                pager.SetPageProperties(0, pager.PageSize, false); // Ir a la primera página
            }

            cargarListView();
        }

        protected void ListViewSucursales_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            var pager = ListViewSucursales.FindControl("DataPager1") as DataPager;
            if (pager != null)
            {
                pager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            }
            cargarListView();
        }

    }

}