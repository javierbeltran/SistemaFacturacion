<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RegistrarProducto.aspx.vb" Inherits="SistemaFacturacion.RegistrarProducto" %>

<asp:Content runat="server" ID="Cuerpo" ContentPlaceHolderID="MainContent">
    <style>
        .mr-2 {
        margin-right: 10px;
                }
</style>
    <script>
        function SoloNumeros() {
            var AsciiValue = event.keyCode
            if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                event.returnValue = true;
            else
                event.returnValue = false;
        }
    </script>

    <div class="jumbotron" style="text-align: center; height: 80px; padding-top: 1px;">
        <h2 style="font-size: 39px!important;">Sistema de facturacion</h2>
    </div>
    <h3>Registro de productos</h3>
    <div class="container" style="margin-top: 5%">
        <label runat="server" id="lblAlerta" visible="false" class="alert alert-danger" role="alert">
            Valores invalidos, por favor introducir datos validos
        </label>
        <label runat="server" id="lblSuccess" visible="false" class="alert alert-success" role="alert">
            Producto registrado satisfactoriamente
        </label>
        <div class="row">
            <div class="col-12">
                <label class="mr-2">Nombre producto</label>
                <asp:TextBox runat="server" ID="txtNombre"></asp:TextBox>
            </div>
            <div class="col-12">
                <label class="mr-2">Precio producto</label>
                <asp:TextBox runat="server" onkeypress="return SoloNumeros()" ID="txtPrecio"></asp:TextBox>
            </div>

            <div class="col-12">
                <label class="mr-2">Cantidad de producto</label>
                <asp:TextBox runat="server" onkeypress="return SoloNumeros()" ID="txtCantidad"></asp:TextBox>
            </div>

            <div class="col-12">
                <label class="mr-2">Categoria del producto</label>
                <asp:DropDownList runat="server" ID="ddlCategoria">
                    <asp:ListItem Selected="True" Value="Otro">Otro</asp:ListItem>
                    <asp:ListItem Value="Cocina">Cocina</asp:ListItem>
                    <asp:ListItem Value="Jardin">Jardin</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-12">
                <asp:Button runat="server" ID="cmdAgregar" Text="Agregar" />
                <asp:Button runat="server" Visible="false" ID="cmdGuardar" Text="Guardar" />
            </div>
        </div>
                <div class="row">
        <h2>Registros:</h2>
            <asp:GridView ID="grdConsulta" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                CellPadding="0" DataKeyNames="Codigo" GridLines="None" SelectedIndex="0"
                Width="100%" CssClass="table" RowHoverCssClass="row-over" AlternatingRowStyle-CssClass="alt"
                 EmptyDataText="No existen registros">
                <Columns>
                    <asp:TemplateField> 
                        <Itemtemplate>
                            <asp:LinkButton runat="server" OnClick="Editar">Editar</asp:LinkButton>
                        </Itemtemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="NombreProducto"  HeaderText="Producto" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Categoria"  HeaderText="Categoria" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
