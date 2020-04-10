<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Facturar.aspx.vb" Inherits="SistemaFacturacion.Facturar" %>

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
    <h3>Facturacion</h3>
    <div class="container" style="margin-top: 5%">
        <label runat="server" id="lblAlerta" visible="false" class="alert alert-danger" role="alert">
            Valores invalidos, por favor introducir datos validos
        </label>
        <label runat="server" id="lblSuccess" visible="false" class="alert alert-success" role="alert">
            Producto registrado satisfactoriamente
        </label>
        <div class="row">
            <div class="col-12">
                <label>Producto</label>
                <asp:DropDownList AutoPostBack="true" runat="server" ID="ddlProductos">
                </asp:DropDownList>
            </div>
            <div class="col-12">
                <label>Cantidad</label>
                <asp:TextBox runat="server" ID="txtCantidad" onkeypress="return SoloNumeros()"></asp:TextBox>
            </div>
            <div class="col-12">
                <label>Precio</label>
                <asp:TextBox ReadOnly="true" runat="server" ID="txtPrecio" onkeypress="return SoloNumeros()"></asp:TextBox>
            </div>
            <div class="col-12" style="margin-top:5px!important; ">
                <asp:Button runat="server" ID="cmdAgregar" Text="Agregar" />
            </div>
        </div>
        <div class="row">
        <h2>Registros:</h2>
            <asp:GridView ID="grdConsulta" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                CellPadding="0" DataKeyNames="Codigo" GridLines="None" SelectedIndex="0"
                Width="100%" CssClass="table" RowHoverCssClass="row-over" AlternatingRowStyle-CssClass="alt"
                 EmptyDataText="No existen registros">
                <Columns>
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="NombreProducto"  HeaderText="Producto" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Total"  HeaderText="Total" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Fecha" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"
                        SortExpression="Fecha_Registro">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="85px" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
