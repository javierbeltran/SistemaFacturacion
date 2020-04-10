Friend Class TipoProducto

    Private _NombreProducto As String
    Private _Categoria As String
    Private _Precio As Integer
    Private _Codigo As Integer
    Private _Cantidad As Integer
    Public Property Cantidad() As Integer
        Get
            Return _Cantidad
        End Get
        Set(ByVal value As Integer)
            _Cantidad = value
        End Set
    End Property

    Public Property Codigo() As Integer
        Get
            Return _Codigo
        End Get
        Set(ByVal value As Integer)
            _Codigo = value
        End Set
    End Property

    Public Property NombreProducto() As String
        Get
            Return _NombreProducto
        End Get
        Set(ByVal value As String)
            _NombreProducto = value
        End Set

    End Property
    Public Property Categoria() As String
        Get
            Return _Categoria
        End Get
        Set(ByVal value As String)
            _Categoria = value
        End Set
    End Property

    Public Property Precio() As Integer
        Get
            Return _Precio
        End Get
        Set(ByVal value As Integer)
            _Precio = value
        End Set
    End Property

    Public Sub New()
        Me.Categoria = String.Empty
        Me.NombreProducto = String.Empty
        Me.Precio = 0
        Me.Codigo = 0
        Me.Cantidad = 0
    End Sub
End Class
