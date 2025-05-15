<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoSucursalesSeleccionadas.aspx.cs" Inherits="TP7_GRUPO_24.ListadoSucursalesSeleccionadas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
        <asp:HyperLink ID="hlSeleccionarSucursales" runat="server" NavigateUrl="~/SeleccionarSucursales.aspx">Listado de Sucursales</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="hlMostrarSucursales" runat="server" NavigateUrl="~/ListadoSucursalesSeleccionadas.aspx">Mostrar sucursales seleccionadas</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <div>
            Mostrar Sucursales Seleccionadas:</div>
        <asp:GridView ID="gvSucursales" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Id Sucursal">
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_IdSucursal" runat="server" Text='<%# Bind("Id_Sucursal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre Sucursal">
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_NombreSucursal" runat="server" Text='<%# Bind("NombreSucursal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descripcion Sucursal">
                    <ItemTemplate>
                        <asp:Label ID="lbl_it_DescripcionSucursal" runat="server" Text='<%# Bind("DescripcionSucursal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
