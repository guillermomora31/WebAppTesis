
Imports DevExpress.Web
Imports DevExpress.Web.Data
Imports MySql.Data.MySqlClient

Public Class Parametros
    Inherits System.Web.UI.Page
    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")

    Public AspxTxtParametroStr As String
    Public AspxTxtIdentificadorStr As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim lusuario As String = Session("usuario")

        If lusuario = "" Then
            Try
                Me.Dispose()
                Response.Redirect("Login.aspx")
            Catch ex As Exception

            End Try

        End If

        If (Not IsPostBack) Then

        End If
    End Sub

    Protected Sub AspxGrigWeParametro_ToolbarItemClick(ByVal source As Object, ByVal e As ASPxGridToolbarItemClickEventArgs)
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

    Private Sub AspxGrigWeParametro_StartRowEditing(sender As Object, e As ASPxStartRowEditingEventArgs) Handles AspxGrigWeParametro.StartRowEditing
        Me.AspxGrigWeParametro.SettingsText.PopupEditFormCaption = "Modificacion"
        ''AspxCmbRolStr = Me.AspxGrigWeParametro.GetRowValuesByKeyValue(e.EditingKeyValue, "rol").ToString
        ''AspxCmbNivelStr = Me.AspxGrigWeParametro.GetRowValuesByKeyValue(e.EditingKeyValue, "nivel").ToString
        AspxTxtParametroStr = Me.AspxGrigWeParametro.GetRowValuesByKeyValue(e.EditingKeyValue, "parametro").ToString
        AspxTxtIdentificadorStr = Me.AspxGrigWeParametro.GetRowValuesByKeyValue(e.EditingKeyValue, "id").ToString
    End Sub

    Private Sub AspxGrigWeParametro_CancelRowEditing(sender As Object, e As ASPxStartRowEditingEventArgs) Handles AspxGrigWeParametro.CancelRowEditing
        AspxTxtParametroStr = ""
        AspxTxtIdentificadorStr = ""
    End Sub

    Private Sub AspxGrigWeParametro_InitNewRow(sender As Object, e As ASPxDataInitNewRowEventArgs) Handles AspxGrigWeParametro.InitNewRow
        Me.AspxGrigWeParametro.SettingsText.PopupEditFormCaption = "Ingreso"
        AspxTxtParametroStr = ""
        AspxTxtIdentificadorStr = ""
    End Sub



    Private Sub AspxGrigWeParametro_RowDeleting(sender As Object, e As ASPxDataDeletingEventArgs) Handles AspxGrigWeParametro.RowDeleting
        Dim lsql As String = ""
        lsql = "DELETE From TB_PARAMETRO Where parametro = '" & e.Values(0) & "' And id = '" & e.Values(2) & "'"

        SqlWebParametro.DeleteCommandType = SqlDataSourceCommandType.Text
        SqlWebParametro.DeleteCommand = lsql


    End Sub


    Protected Sub AspxTxtParametro_OnLoad(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim AspxTxtParametro As ASPxTextBox = TryCast(sender, ASPxTextBox)

        If AspxTxtParametroStr = "" Then
            AspxTxtParametro.Enabled = True
        Else
            AspxTxtParametro.Enabled = False
        End If

    End Sub


    Protected Sub ASPxTxtIndentificador_OnLoad(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ASPxTxtIndentificador As ASPxTextBox = TryCast(sender, ASPxTextBox)

        If AspxTxtIdentificadorStr = "" Then
            ASPxTxtIndentificador.Enabled = True
        Else
            ASPxTxtIndentificador.Enabled = False
        End If

    End Sub


End Class