Imports Microsoft.VisualBasic

Public Class Contador
    Public counter As Int32

    Public Function IncrementCounter() As Int32
        Static counter As Integer = 0
        counter += 1
        Return counter
    End Function
End Class
