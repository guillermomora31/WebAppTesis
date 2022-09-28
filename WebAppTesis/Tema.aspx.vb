Imports DevExpress.Web
Imports DevExpress.Web.Data
Imports MySql.Data.MySqlClient

Partial Class Tema
    Inherits System.Web.UI.Page

    Public ASPxCmbUnidadStr As String
    Protected Sub AspxGrigWeTema_ToolbarItemClick(ByVal source As Object, ByVal e As ASPxGridToolbarItemClickEventArgs)
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


    Protected Sub ASPxCmbUnidad_OnLoad(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim comboItem As ASPxComboBox = TryCast(sender, ASPxComboBox)
        comboItem.DataBind()
        If ASPxCmbUnidadStr <> "" Then
            For lwindice As Integer = 0 To comboItem.Items.Count - 1
                If comboItem.Items(lwindice).Value = ASPxCmbUnidadStr Then
                    comboItem.SelectedIndex = lwindice
                    comboItem.ClientEnabled = False
                    Exit For
                End If
            Next
        Else
            If comboItem.Items.Count > 0 Then
                comboItem.SelectedIndex = 0
            End If
        End If
    End Sub

    Private Sub AspxGrigWeTema_StartRowEditing(sender As Object, e As ASPxStartRowEditingEventArgs) Handles AspxGrigWeTema.StartRowEditing
        Me.AspxGrigWeTema.SettingsText.PopupEditFormCaption = "Modificacion"
        ASPxCmbUnidadStr = Me.AspxGrigWeTema.GetRowValuesByKeyValue(e.EditingKeyValue, "id_unidad").ToString
    End Sub

    Private Sub AspxGrigWeTema_InitNewRow(sender As Object, e As ASPxDataInitNewRowEventArgs) Handles AspxGrigWeTema.InitNewRow
        Me.AspxGrigWeTema.SettingsText.PopupEditFormCaption = "Ingreso"
        ASPxCmbUnidadStr = ""
    End Sub

    Private Sub AspxGrigWeTema_CancelRowEditing(sender As Object, e As ASPxStartRowEditingEventArgs) Handles AspxGrigWeTema.CancelRowEditing
        ASPxCmbUnidadStr = ""
    End Sub

    Private Sub AspxGrigWeTema_RowInserting(sender As Object, e As ASPxDataInsertingEventArgs) Handles AspxGrigWeTema.RowInserting
        Dim ASPxCmbUnidad As ASPxComboBox = AspxGrigWeTema.FindEditFormTemplateControl("ASPxCmbUnidad")
        e.NewValues("id_unidad") = ASPxCmbUnidad.Value
    End Sub
End Class
