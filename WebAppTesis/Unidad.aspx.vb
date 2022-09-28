Imports DevExpress.Web
Imports DevExpress.Web.Data
Imports MySql.Data.MySqlClient

Partial Class Unidad
    Inherits System.Web.UI.Page

    Protected Sub AspxGrigWeUnidad_ToolbarItemClick(ByVal source As Object, ByVal e As ASPxGridToolbarItemClickEventArgs)
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

    Private Sub AspxGrigWeUnidad_RowInserting(sender As Object, e As ASPxDataInsertingEventArgs) Handles AspxGrigWeUnidad.RowInserting
        e.NewValues("estado") = "A"
    End Sub
End Class
