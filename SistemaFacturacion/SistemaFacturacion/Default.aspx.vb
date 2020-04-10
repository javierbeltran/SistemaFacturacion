Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Session("Bool") Is Nothing Then
            Session("ListaFacturados") = New List(Of TipoFacturacion)
            Session("ListaProductos") = New List(Of TipoProducto)
            Session("Bool") = True
        End If
    End Sub
End Class