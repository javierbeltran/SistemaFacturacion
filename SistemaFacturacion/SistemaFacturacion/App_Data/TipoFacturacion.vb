Public Class TipoFacturacion
    Private _NombreProducto As String
    Private _Fecha As DateTime
    Private _Total As Decimal
    Private _Cantidad As Integer
    Private _Codigo As Integer
    Private _Precio As Integer

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
    Public Property Fecha() As DateTime
        Get
            Return _Fecha
        End Get
        Set(ByVal value As DateTime)
            _Fecha = value
        End Set

    End Property
    Public Property Total() As Decimal
        Get
            Return _Total
        End Get
        Set(ByVal value As Decimal)
            _Total = value
        End Set
    End Property

    Public Property Cantidad() As Integer
        Get
            Return _Cantidad
        End Get
        Set(ByVal value As Integer)
            _Cantidad = value
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
        Me.Cantidad = 0
        Me.Total = 0
        Me.Codigo = 0
        Me.Fecha = Date.Now
        Me.Precio = 0

    End Sub
End Class
