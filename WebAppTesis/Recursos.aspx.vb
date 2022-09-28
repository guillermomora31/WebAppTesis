Imports DevExpress.Web
Imports DevExpress.Web.Data
Imports MySql.Data.MySqlClient
Public Class Recursos

    Inherits System.Web.UI.Page

    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim lusuario As String = Session("usuario")

        If lusuario = "" Then
            Try
                Me.Dispose()
                Response.Redirect("Login.aspx")
            Catch ex As Exception

            End Try

        End If

        If Not IsPostBack Then
            Session("ruta") = System.Configuration.ConfigurationManager.AppSettings("rutaContenido")
            'mostrarContenidos()
            'mostrarRecursos()
            'mostrarContenidosRecursos()
        End If
    End Sub

    Protected Sub AspxGrigWeRecurso_ToolbarItemClick(ByVal source As Object, ByVal e As ASPxGridToolbarItemClickEventArgs)
        Select Case e.Item.Name
            Case "ExportToPDF"
                Export_AspxGrid.WritePdfToResponse()
            Case "ExportToXLS"
                Export_AspxGrid.WriteXlsToResponse()
            Case "ExportToXLSX"
                Export_AspxGrid.WriteXlsxToResponse()
            Case Else
        End Select
    End Sub

    Private Sub AspxGrigWeRecurso_RowDeleting(sender As Object, e As ASPxDataDeletingEventArgs) Handles AspxGrigWeRecurso.RowDeleting
        Dim lruta As String = RUTA_DATOS()
        Dim lpath As String

        'lpath = Server.MapPath(lruta + larchivo)
        lpath = Server.MapPath(lruta + e.Values(2))

        System.IO.File.Delete(lpath)
        SqlWebRecurso.DeleteCommandType = SqlDataSourceCommandType.Text
        SqlWebRecurso.DeleteCommand = "delete From tb_contenido_recurso Where id_contenido = " & e.Values(0) & " And id_recurso=" & e.Values(1)
    End Sub

    Private Function RUTA_DATOS() As String


        Dim lvalor As String = System.Configuration.ConfigurationManager.AppSettings("rutaContenido")

        Return lvalor

    End Function



End Class