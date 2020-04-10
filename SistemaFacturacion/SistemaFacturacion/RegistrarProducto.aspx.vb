Public Class RegistrarProducto
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        llenarConsulta()
    End Sub

    Private Sub cmdAgregar_Click(sender As Object, e As EventArgs) Handles cmdAgregar.Click
        If Not String.IsNullOrEmpty(txtNombre.Text) And Not String.IsNullOrEmpty(txtPrecio.Text) And Not String.IsNullOrEmpty(txtCantidad.Text) And Session("ListaProductos") IsNot Nothing Then

            Dim lista = CType(Session("ListaProductos"), List(Of TipoProducto))
            Dim CodMax As Integer
            If CType(Session("ListaProductos"), List(Of TipoProducto)).Count > 0 Then
                CodMax = lista.Max(Function(x) x.Codigo) + 1
            Else
                CodMax = 1
            End If

            lista.Add(New TipoProducto With {.Codigo = CodMax, .Cantidad = txtCantidad.Text, .NombreProducto = txtNombre.Text, .Precio = Decimal.Parse(txtPrecio.Text), .Categoria = ddlCategoria.SelectedValue})
            Session("ListaProductos") = lista

            lblAlerta.Visible = False
            lblSuccess.Visible = True
            cmdGuardar.Visible = False

            llenarConsulta()
            Limpiar()
        Else
            lblAlerta.Visible = True
            cmdGuardar.Visible = False

        End If
    End Sub
    Private Sub llenarConsulta()
        grdConsulta.DataSource = Session("ListaProductos")
        grdConsulta.DataBind()

    End Sub

    Private Sub Limpiar()
        txtNombre.Text = String.Empty
        txtPrecio.Text = String.Empty
        txtCantidad.Text = String.Empty
        ddlCategoria.SelectedIndex = 0
    End Sub

    Protected Sub Editar(sender As Object, e As EventArgs)
        Dim rowIndex = CType(CType(sender, LinkButton).Parent.Parent, GridViewRow).RowIndex
        ViewState("ItemCodigo") = rowIndex

        Dim item As TipoProducto = CType(Session("ListaProductos"), List(Of TipoProducto))(rowIndex)
        txtNombre.Text = item.NombreProducto
        txtPrecio.Text = item.Precio
        txtCantidad.Text = item.Cantidad
        ddlCategoria.SelectedValue = item.Categoria

        cmdGuardar.Visible = True

        lblAlerta.Visible = False
        lblSuccess.Visible = False
    End Sub

    Private Sub cmdGuardar_Click(sender As Object, e As EventArgs) Handles cmdGuardar.Click
        Dim Item = CType(Session("ListaProductos"), List(Of TipoProducto))(Integer.Parse(ViewState("ItemCodigo")))

        Item.Cantidad = txtCantidad.Text
        Item.NombreProducto = txtNombre.Text
        Item.Precio = Decimal.Parse(txtPrecio.Text)
        Item.Categoria = ddlCategoria.SelectedValue

        cmdGuardar.Visible = False
        llenarConsulta()
        Limpiar()
    End Sub
End Class