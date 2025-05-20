<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="TP7_GRUPO_24.SeleccionarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
    html, body {
        height: 100%;
        margin: 0;
    }

    .contenedor-principal {
        display: flex;
        justify-content: center; /* centra horizontalmente */
        align-items: center;     /* centra verticalmente */
        height: 100vh;           /* usa toda la altura de la ventana */
    }

    .contenedor-botones {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .boton-container {
        margin-bottom: 15px;
    }

    .boton-provincia {
        width: 140px;
        padding: 8px;
        font-size: 14px;
        background-color: white;
        border: 1px solid #aaa;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .boton-provincia:hover {
        background-color: #f0f0f0;
    }
</style>
</head>
    
<body>
        
    <form id="form1" runat="server">
        <table style="width:100%;">
    <tr>
        <!-- Columna para DataList (1 columna) -->
        <td style="width: 20%; vertical-align: top;">
        <div class="contenedor-principal">
    <asp:DataList ID="DataListProvincias" runat="server" CssClass="contenedor-botones">
        <ItemTemplate>
            <div class="boton-container">
                <asp:Button ID="btnProvincias" runat="server"
                    Text='<%# Eval("DescripcionProvincia") %>'
                    CommandArgument='<%# Eval("Id_Provincia") %>'
                    CommandName="eventoBoton"
                    CssClass="boton-provincia"
                    OnCommand="btnProvincias_Command" />
            </div>
        </ItemTemplate>
    </asp:DataList>
</div>
            </td>

         <td style="width: 80%; vertical-align: top;">

        <asp:HyperLink ID="hlSeleccionarSucursales" runat="server" NavigateUrl="~/SeleccionarSucursales.aspx">Listado de Sucursales</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="hlMostrarSucursales" runat="server" NavigateUrl="~/ListadoSucursalesSeleccionadas.aspx">Mostrar sucursales seleccionadas</asp:HyperLink>
            <h2>Listado de sucursales</h2>
        <p>
            Busqueda por nombre de sucursal:<asp:TextBox ID="txtSucursales" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </p>


        <asp:ListView ID="ListViewSucursales" runat="server" GroupItemCount="4" DataKeyNames="Id_Sucursal" OnPagePropertiesChanging="ListViewSucursales_PagePropertiesChanging" >
            <AlternatingItemTemplate>  
                      <td style="background-color: #E0FFFF; color: #000000; text-align: center; vertical-align: top;">
                    <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' /><br />
                    <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' /><br />
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' Height="100px" Width="100px" /><br />
                    <asp:Button ID="btnSeleccionar" runat="server"
                        CommandArgument='<%# Eval("Id_Sucursal") + " - " + Eval("NombreSucursal") + " - " + Eval("DescripcionSucursal") %>'
                        CommandName="eventoSeleccionar" OnCommand="btnSeleccionar_Command1" Text="Seleccionar" />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #008A8C; color: #FFFFFF;">NombreSucursal:
                    <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                    <br />DescripcionSucursal:
                    <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                    <br />URL_Imagen_Sucursal:
                    <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                    <br />
                    Id_Sucursal:
                    <asp:Label ID="Id_SucursalLabel1" runat="server" Text='<%# Eval("Id_Sucursal") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No se han devuelto datos.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
  <tr id="itemPlaceholderContainer" runat="server">
            <td id="itemPlaceholder" runat="server"></td>
        </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">NombreSucursal:
                    <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                    <br />DescripcionSucursal:
                    <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                    <br />URL_Imagen_Sucursal:
                    <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                  <td style="background-color: #DCDCDC; color: #000000; text-align: center; vertical-align: top;">
            <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' /><br />
            <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' /><br />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' Height="100px" Width="100px" /><br />
            <asp:Button ID="btnSeleccionar" runat="server"
                CommandArgument='<%# Eval("Id_Sucursal") + " - " + Eval("NombreSucursal") + " - " + Eval("DescripcionSucursal") %>'
                CommandName="eventoSeleccionar" OnCommand="btnSeleccionar_Command1" Text="Seleccionar" />
        </td>
            </ItemTemplate>
            <LayoutTemplate>
              <table runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; font-family: Verdana, Arial, Helvetica, sans-serif;">
            <tr runat="server">
                <td runat="server">
                    <table id="groupPlaceholderContainer" runat="server" border="0">
                        <tr id="groupPlaceholder" runat="server"></tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:DataPager ID="DataPager1" runat="server" PageSize="12" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
            </Fields>
        </asp:DataPager>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #008A8C; font-weight: bold;color: #FFFFFF;">NombreSucursal:
                    <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                    <br />DescripcionSucursal:
                    <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                    <br />URL_Imagen_Sucursal:
                    <asp:Label ID="URL_Imagen_SucursalLabel" runat="server" Text='<%# Eval("URL_Imagen_Sucursal") %>' />
                    <br />Id_Sucursal:
                    <asp:Label ID="Id_SucursalLabel" runat="server" Text='<%# Eval("Id_Sucursal") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
             </td>
    </tr>
</table>

    </form>
        
</body>
</html>
