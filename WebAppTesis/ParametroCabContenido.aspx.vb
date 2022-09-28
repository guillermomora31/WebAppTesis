
Imports DevExpress.Web
Imports DevExpress.Web.Data

Partial Class ParametroCabContenido
    Inherits System.Web.UI.Page

    Public ASPxCmbUnidadStr As String
    Public ASPxCmbTemaStr As String
    Public ASPxCmbContenidosStr As String

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

    Protected Sub AspxGrigWeParametroCab_ToolbarItemClick(ByVal source As Object, ByVal e As ASPxGridToolbarItemClickEventArgs)
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

    Private Sub AspxGrigWeParametroCab_RowDeleting(sender As Object, e As ASPxDataDeletingEventArgs) Handles AspxGrigWeParametroCab.RowDeleting

        SqlWebParametro.DeleteCommandType = SqlDataSourceCommandType.Text
        'SqlWebParametro.DeleteCommand = "delete From tb_param_contenido Where id_parma = " & e.Values(0) & " And identificador=" & e.Values(1)
        SqlWebParametro.DeleteCommand = "delete From tb_param_contenido Where id_param = " & e.Values(6)
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



    Protected Sub ASPxCmbTema_OnLoad(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim comboItem As ASPxComboBox = TryCast(sender, ASPxComboBox)
        comboItem.DataBind()
        If ASPxCmbTemaStr <> "" Then
            For lwindice As Integer = 0 To comboItem.Items.Count - 1
                If comboItem.Items(lwindice).Value = ASPxCmbTemaStr Then
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

    Private Sub AspxGrigWeParametroCab_StartRowEditing(sender As Object, e As ASPxStartRowEditingEventArgs) Handles AspxGrigWeParametroCab.StartRowEditing
        Me.AspxGrigWeParametroCab.SettingsText.PopupEditFormCaption = "Modificacion"

        ASPxCmbUnidadStr = AspxGrigWeParametroCab.GetRowValuesByKeyValue(e.EditingKeyValue, "idUnidad").ToString
        ASPxCmbTemaStr = AspxGrigWeParametroCab.GetRowValuesByKeyValue(e.EditingKeyValue, "idTema").ToString
        ASPxCmbContenidosStr = AspxGrigWeParametroCab.GetRowValuesByKeyValue(e.EditingKeyValue, "idContenido").ToString
    End Sub

    Private Sub AspxGrigWeParametroCab_InitNewRow(sender As Object, e As ASPxDataInitNewRowEventArgs) Handles AspxGrigWeParametroCab.InitNewRow
        Me.AspxGrigWeParametroCab.SettingsText.PopupEditFormCaption = "Ingreso"
        ASPxCmbUnidadStr = ""
        ASPxCmbTemaStr = ""
        ASPxCmbContenidosStr = ""
    End Sub


    Protected Sub ASPxCmbContenidos_OnLoad(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim comboItem As ASPxComboBox = TryCast(sender, ASPxComboBox)
        comboItem.DataBind()
        If ASPxCmbContenidosStr <> "" Then
            For lwindice As Integer = 0 To comboItem.Items.Count - 1
                If comboItem.Items(lwindice).Value = ASPxCmbContenidosStr Then
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

    Private Sub AspxGrigWeParametroCab_RowInserting(sender As Object, e As ASPxDataInsertingEventArgs) Handles AspxGrigWeParametroCab.RowInserting
        Dim ASPxCmbUnidad As ASPxComboBox = AspxGrigWeParametroCab.FindEditFormTemplateControl("ASPxCmbUnidad")
        Dim ASPxCmbTema As ASPxComboBox = AspxGrigWeParametroCab.FindEditFormTemplateControl("ASPxCmbTema")
        Dim ASPxCmbContenidos As ASPxComboBox = AspxGrigWeParametroCab.FindEditFormTemplateControl("ASPxCmbContenidos")
        Dim ASPxMemoDesc As ASPxMemo = AspxGrigWeParametroCab.FindEditFormTemplateControl("ASPxMemoDesc")

        Dim txt_descripcion As String = ASPxMemoDesc.Text

        SqlWebParametro.InsertCommandType = SqlDataSourceCommandType.Text
        SqlWebParametro.InsertParameters.Clear()
        SqlWebParametro.InsertCommand = "INSERT INTO tb_param_contenido (id_unidad, id_tema, id_contenido, identificador, valor, txt_descripcion) " &
                                        "VALUES (" & ASPxCmbUnidad.Value & "," & ASPxCmbTema.Value & "," & ASPxCmbContenidos.Value & ",'" & e.NewValues("identificador").ToString & "'," & e.NewValues("valor").ToString & ",'" & txt_descripcion & "')"


        'SqlWebParametro.Insert()
        ''SqlWebParametro.InsertParameters.Add("id_unidad", ASPxCmbUnidad.Value)
        ''SqlWebParametro.InsertParameters.Add("id_tema", ASPxCmbTema.Value)
        ''SqlWebParametro.InsertParameters.Add("id_contenido", ASPxCmbContenidos.Value)
        ''SqlWebParametro.InsertParameters.Add("identificador", e.NewValues("identificador").ToString)
        ''SqlWebParametro.InsertParameters.Add("valor", e.NewValues("valor").ToString)
        ''SqlWebParametro.InsertParameters.Add("txt_descripcion", "-")



        'e.NewValues("id_unidad") = ASPxCmbUnidad.Value
        'e.NewValues("id_tema") = ASPxCmbTema.Value

        'e.NewValues("id_contenido") = ASPxCmbContenidos.Value
    End Sub

    Private Sub AspxGrigWeParametroCab_RowUpdating(sender As Object, e As ASPxDataUpdatingEventArgs) Handles AspxGrigWeParametroCab.RowUpdating
        Dim ASPxMemoDesc As ASPxMemo = AspxGrigWeParametroCab.FindEditFormTemplateControl("ASPxMemoDesc")
        e.NewValues("txt_descripcion") = ASPxMemoDesc.Text
    End Sub
End Class
