Imports System.Linq
Public Class Facturar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            If Session("ListaProductos") IsNot Nothing Then
                Dim ListaProductos = CType(Session("ListaProductos"), List(Of TipoProducto))
                For Each item As TipoProducto In ListaProductos
                    Dim oListItem As New ListItem()

                    oListItem.Value = item.Codigo
                    oListItem.Text = item.NombreProducto
                    ddlProductos.Items.Add(oListItem)
                Next
            End If

            llenarConsulta()
        End If
        txtPrecio.Text = CType(Session("ListaProductos"), List(Of TipoProducto)).Find(Function(x) x.Codigo = Integer.Parse(ddlProductos.SelectedValue)).Precio

    End Sub

    Private Sub llenarConsulta()
        grdConsulta.DataSource = Session("ListaFacturados")
        grdConsulta.DataBind()
    End Sub

    Private Sub cmdAgregar_Click(sender As Object, e As EventArgs) Handles cmdAgregar.Click
        If Not String.IsNullOrEmpty(txtCantidad.Text) Or Session("ListaFacturados") IsNot Nothing Then
            Dim ListaFacturados = CType(Session("ListaFacturados"), List(Of TipoFacturacion))
            Dim SigCod = 1
            If ListaFacturados.Count > 0 Then
                SigCod = ListaFacturados.Max(Function(x) x.Codigo) + 1
            End If

            ListaFacturados.Add(New TipoFacturacion With {
                    .Codigo = SigCod,
                    .NombreProducto = ddlProductos.SelectedItem.Text,
                    .Cantidad = Integer.Parse(txtCantidad.Text),
                    .Precio = txtPrecio.Text,
                    .Total = .Cantidad * .Precio,
                    .Fecha = DateTime.Now})

            Session("ListaFacturados") = ListaFacturados
            llenarConsulta()
            CType(Session("ListaProductos"), List(Of TipoProducto)).Find(Function(x) x.Codigo = Integer.Parse(ddlProductos.SelectedValue)).Cantidad -= Integer.Parse(txtCantidad.Text)

            Limpiar()
            lblSuccess.Visible = True
            lblAlerta.Visible = False

        Else
            lblAlerta.Visible = True

        End If
    End Sub

    Private Sub Limpiar()
        txtCantidad.Text = String.Empty
    End Sub
End Class