<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Facturacion.aspx.vb" Inherits="SistemaFacturacion.Facturacion" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="jumbotron" style="text-align: center; height: 110px; padding-top: 10px;">

        <p>
            <b>Sistema de facturacion</b><br />
            Todas las herramientas que necesitas para tu negocio en crecimiento. 
            Contamos con el sistema de Contabilidad más completo para Pymes en República Dominicana.
        </p>
    </div>

    <h3>Funciones principales del sistema:</h3>
    <div class="container" style="margin-top: 5%">
        <div class="row">
            <div class="col-md-4">
                <p><a href="/RegistrarProducto" class="btn btn-primary btn-lg">Registrar productos&raquo;</a></p>
            </div>
            <div class="col-md-4">
                <p><a href="/Facturar" class="btn btn-primary btn-lg">Facturar &raquo;</a></p>
            </div>
        </div>
    </div>
</asp:Content>
