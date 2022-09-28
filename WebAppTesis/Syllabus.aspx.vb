
Imports DevExpress.Web
Imports DevExpress.Web.Data
Imports MySql.Data.MySqlClient

Public Class Syllabus
    Inherits System.Web.UI.Page
    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")

    Public AspxtxtusuarioStr As String
    Public AspxCmbRolStr As String
    Public AspxCmbNivelStr As String

    Public ASPxCmbUnidadStr As String
    Public ASPxCmbTemaStr As String


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
            'ApplyLayoud(0)
        End If
    End Sub
    Private Sub ApplyLayoud(ByVal layoudIndex As Integer)
        AspxGrigWeRegistro.BeginUpdate()
        Try
            AspxGrigWeRegistro.ClearSort()
            Select Case layoudIndex
                Case 0
                    AspxGrigWeRegistro.GroupBy(CType(AspxGrigWeRegistro.Columns("Rol"), GridViewDataColumn))
            End Select
        Finally

            AspxGrigWeRegistro.EndUpdate()
        End Try
    End Sub
    Protected Sub AspxGrigWeRegistro_ToolbarItemClick(ByVal source As Object, ByVal e As ASPxGridToolbarItemClickEventArgs)
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

    Protected Sub Aspxtxtcedula_Validation(ByVal sender As Object, ByVal e As DevExpress.Web.ValidationEventArgs)
        If (TryCast(e.Value, String)).Length = 0 Then
            e.IsValid = False
        End If
    End Sub


    Protected Sub Aspxtxtusuario_OnLoad(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Aspxtxtusuario As ASPxTextBox = TryCast(sender, ASPxTextBox)

        If AspxtxtusuarioStr = "" Then
            Aspxtxtusuario.Enabled = True
        Else
            Aspxtxtusuario.Enabled = False
        End If

    End Sub

    Private Sub AspxGrigWeRegistro_StartRowEditing(sender As Object, e As ASPxStartRowEditingEventArgs) Handles AspxGrigWeRegistro.StartRowEditing
        Me.AspxGrigWeRegistro.SettingsText.PopupEditFormCaption = "Modificacion"
        AspxCmbNivelStr = Me.AspxGrigWeRegistro.GetRowValuesByKeyValue(e.EditingKeyValue, "nivel").ToString

        ASPxCmbUnidadStr = AspxGrigWeRegistro.GetRowValuesByKeyValue(e.EditingKeyValue, "id_unidad").ToString
        ASPxCmbTemaStr = AspxGrigWeRegistro.GetRowValuesByKeyValue(e.EditingKeyValue, "id_tema").ToString
    End Sub

    Private Sub AspxGrigWeRegistro_RowInserting(sender As Object, e As ASPxDataInsertingEventArgs) Handles AspxGrigWeRegistro.RowInserting
        ''Dim AspxCmbRol As ASPxComboBox = Me.AspxGrigWeRegistro.FindEditFormTemplateControl("AspxCmbRol")
        Dim AspxCmbNivel As ASPxComboBox = Me.AspxGrigWeRegistro.FindEditFormTemplateControl("AspxCmbNivel")
        Dim ASPxCmbUnidad As ASPxComboBox = Me.AspxGrigWeRegistro.FindEditFormTemplateControl("ASPxCmbUnidad")
        Dim ASPxCmbTema As ASPxComboBox = Me.AspxGrigWeRegistro.FindEditFormTemplateControl("ASPxCmbTema")

        ''e.NewValues("rol") = AspxCmbRol.Value

        If IsNothing(AspxCmbNivel.Value) Then
            e.NewValues("nivel") = ""
        Else
            e.NewValues("nivel") = AspxCmbNivel.Value
        End If


        'e.NewValues("id_contenido") = CodigoContenido()
        e.NewValues("id_contenido") = 0
        e.NewValues("estado") = "A"

        e.NewValues("id_unidad") = ASPxCmbUnidad.Value
        e.NewValues("id_tema") = ASPxCmbTema.Value


    End Sub

    Private Sub AspxGrigWeRegistro_RowUpdating(sender As Object, e As ASPxDataUpdatingEventArgs) Handles AspxGrigWeRegistro.RowUpdating
        ''Dim AspxCmbRol As ASPxComboBox = Me.AspxGrigWeRegistro.FindEditFormTemplateControl("AspxCmbRol")
        Dim AspxCmbNivel As ASPxComboBox = Me.AspxGrigWeRegistro.FindEditFormTemplateControl("AspxCmbNivel")
        Dim ASPxCmbUnidad As ASPxComboBox = Me.AspxGrigWeRegistro.FindEditFormTemplateControl("ASPxCmbUnidad")
        Dim ASPxCmbTema As ASPxComboBox = Me.AspxGrigWeRegistro.FindEditFormTemplateControl("ASPxCmbTema")

        ''e.NewValues("rol") = AspxCmbRol.Value

        If IsNothing(AspxCmbNivel.Value) Then
            e.NewValues("nivel") = ""
        Else
            e.NewValues("nivel") = AspxCmbNivel.Value
        End If

        e.NewValues("id_unidad") = ASPxCmbUnidad.Value
        e.NewValues("id_tema") = ASPxCmbTema.Value

    End Sub

    Protected Sub AspxCmbNivel_OnLoad(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim comboItem As ASPxComboBox = TryCast(sender, ASPxComboBox)
        ''If AspxCmbRolStr = "E" And AspxCmbNivelStr <> "" Then
        For lwindice As Integer = 0 To comboItem.Items.Count - 1
            If comboItem.Items(lwindice).Value = AspxCmbNivelStr Then
                comboItem.SelectedIndex = lwindice
                Exit For
            End If
        Next
        ''Else
        ''    If AspxCmbNivelStr = "" And AspxCmbRolStr = "" Then
        ''        comboItem.SelectedIndex = 0
        ''    Else
        ''        comboItem.SelectedIndex = -1
        ''        comboItem.ClientEnabled = False
        ''    End If

        ''End If

    End Sub

    Private Sub AspxGrigWeRegistro_CancelRowEditing(sender As Object, e As ASPxStartRowEditingEventArgs) Handles AspxGrigWeRegistro.CancelRowEditing
        AspxtxtusuarioStr = ""
        AspxCmbRolStr = ""
        AspxCmbNivelStr = ""
    End Sub

    Private Sub AspxGrigWeRegistro_InitNewRow(sender As Object, e As ASPxDataInitNewRowEventArgs) Handles AspxGrigWeRegistro.InitNewRow
        Me.AspxGrigWeRegistro.SettingsText.PopupEditFormCaption = "Ingreso"
        AspxCmbNivelStr = ""
        ASPxCmbUnidadStr = ""
        ASPxCmbTemaStr = ""
    End Sub

    Private Sub AspxGrigWeRegistro_RowValidating(sender As Object, e As ASPxDataValidationEventArgs) Handles AspxGrigWeRegistro.RowValidating
        ''Dim lsql As String
        ''If Not e.NewValues("id") Is Nothing AndAlso e.NewValues("id").ToString().Length > 0 Then
        ''    Dim ClDataCon As New ClDataCon
        ''    lsql = "select * from TB_USUARIO where id='" & e.NewValues("id") & "'"
        ''    If AspxGrigWeRegistro.IsNewRowEditing Then
        ''        If ClDataCon.FuncDatos_Verificar(lsql) Then
        ''            AddError(e.Errors, AspxGrigWeRegistro.Columns("id"), "Usuario ya fue Ingresada")
        ''            e.RowError = e.RowError & "Usuario ya fue Ingresada" & Chr(13)
        ''        End If
        ''    End If
        ''    'If AspxGrigWeRegistro.IsEditing Then
        ''    '    If e.NewValues("id") <> e.OldValues("id") Then

        ''    '        If ClDataCon.FuncDatos_Verificar(lsql) Then
        ''    '            AddError(e.Errors, AspxGrigWeRegistro.Columns("id"), "Usuario ya fue Ingresada")
        ''    '            e.RowError = e.RowError & "Usuario ya fue Ingresada" & Chr(13)
        ''    '        End If
        ''    '    End If
        ''    'End If
        ''End If
    End Sub

    Private Sub AddError(ByVal errors As Dictionary(Of GridViewColumn, String), ByVal column As GridViewColumn, ByVal errorText As String)
        If errors.ContainsKey(column) Then
            Return
        End If
        errors(column) = errorText
    End Sub

    Protected Function CodigoContenido() As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        mycmd.CommandText = "SELECT max(id_contenido) as id FROM TB_CONTENIDO"

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        CodigoContenido = 0

        Do While myReader.Read()

            CodigoContenido = myReader.GetInt32(0)

        Loop
        CodigoContenido = CodigoContenido + 1
        myReader.Close()
        mysqlConex.Close()


    End Function

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
End Class