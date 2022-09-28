
Imports DevExpress.Web
Imports DevExpress.Web.Data
Imports MySql.Data.MySqlClient

Public Class Registro
    Inherits System.Web.UI.Page
    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")


    'Public AspxCmbParroquiaStr As String
    'Public ASPxCmbCiudadStr As String
    'Public ASPxCmbProvinciaStr As String
    'Public ASPxCmbCantonStr As String
    Public AspxtxtusuarioStr As String
    Public AspxCmbRolStr As String
    Public AspxCmbNivelStr As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Not IsPostBack) Then
            ApplyLayoud(0)
        End If
    End Sub
    Private Sub ApplyLayoud(ByVal layoudIndex As Integer)
        AspxGrigWeb2_1.BeginUpdate()
        Try
            AspxGrigWeb2_1.ClearSort()
            Select Case layoudIndex
                Case 0
                    AspxGrigWeb2_1.GroupBy(CType(AspxGrigWeb2_1.Columns("Rol"), GridViewDataColumn))
            End Select
        Finally

            AspxGrigWeb2_1.EndUpdate()
        End Try
    End Sub
    Protected Sub AspxGrigWeb2_1_ToolbarItemClick(ByVal source As Object, ByVal e As ASPxGridToolbarItemClickEventArgs)
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

    Protected Sub ASPxTxtpwd_usua_OnLoad(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim texboxcontrol As ASPxTextBox = TryCast(sender, ASPxTextBox)
        Dim AspxlblpassR As ASPxLabel = Me.AspxGrigWeb2_1.FindEditFormTemplateControl("AspxlblpassR")
        Dim Aspxlblpass As ASPxLabel = Me.AspxGrigWeb2_1.FindEditFormTemplateControl("Aspxlblpass")
        Dim ASPxTxtpwd_usuaR As ASPxTextBox = Me.AspxGrigWeb2_1.FindEditFormTemplateControl("ASPxTxtpwd_usuaR")
        If Me.AspxGrigWeb2_1.IsNewRowEditing Then
            texboxcontrol.Enabled = True
            Aspxlblpass.ClientVisible = True
            AspxlblpassR.ClientVisible = True
            ASPxTxtpwd_usuaR.ClientVisible = True
        Else
            texboxcontrol.Enabled = False
            texboxcontrol.ClientVisible = False
            Aspxlblpass.ClientVisible = False
            AspxlblpassR.ClientVisible = False
            ASPxTxtpwd_usuaR.ClientVisible = False
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

    Protected Sub Aspxtxtusuario_Validation(ByVal sender As Object, ByVal e As DevExpress.Web.ValidationEventArgs)
        If (TryCast(e.Value, String)).Length = 0 Then
            e.IsValid = False
        End If
    End Sub

    'Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click

    '    Response.Redirect("Login.aspx")

    'End Sub

    'Protected Sub btnRegistrar_Click(sender As Object, e As EventArgs) Handles btnRegistrar.Click


    '    Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

    '    mysqlConex.Open()

    '    Dim mycmd As MySqlCommand
    '    mycmd = mysqlConex.CreateCommand


    '    Dim lsql As String

    '    Dim lperfil As String

    '    lperfil = ""
    '    If rbtnEstudiante.Checked = True Then
    '        lperfil = "E"
    '    End If

    '    If rbtnDocente.Checked = True Then
    '        lperfil = "D"
    '    End If

    '    If rbtnAdmin.Checked = True Then
    '        lperfil = "A"
    '    End If

    '    Dim lidNivel As String
    '    Dim lnivel As String

    '    lnivel = lstNivel.SelectedItem.Text.ToString()
    '    lidNivel = Mid(lnivel, 1, fposicion(lnivel))

    '    lsql = "INSERT INTO TB_USUARIO VALUES (0,'"
    '    lsql = lsql & Me.txtUsuario.Text & "','"
    '    lsql = lsql & Me.txtClave.Text & "','"
    '    lsql = lsql & Me.txtNombre.Text & "','"
    '    lsql = lsql & Me.txtCorreo.Text & "','"
    '    lsql = lsql & lperfil & "','"
    '    lsql = lsql & Me.txtCodigoClase.Text & "','"
    '    lsql = lsql & lidNivel & "')"

    '    mycmd.CommandText = lsql

    '    mycmd.ExecuteNonQuery()

    '    ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Registro con exito ...');", True)


    'End Sub

    'Protected Function fposicion(ltexto As String) As Int16

    '    fposicion = 0

    '    fposicion = InStr(1, ltexto, "-") - 2

    '    Return fposicion

    'End Function

    Protected Sub AspxCmbRol_OnLoad(ByVal sender As Object, ByVal e As System.EventArgs)
        If AspxCmbRolStr <> "" Then

            Dim comboItem As ASPxComboBox = TryCast(sender, ASPxComboBox)
            comboItem.DataBind()
            For lwindice As Integer = 0 To comboItem.Items.Count - 1
                If comboItem.Items(lwindice).Value = AspxCmbRolStr Then
                    comboItem.SelectedIndex = lwindice
                    Exit For
                End If
            Next
        End If
    End Sub

    Private Sub AspxGrigWeb2_1_StartRowEditing(sender As Object, e As ASPxStartRowEditingEventArgs) Handles AspxGrigWeb2_1.StartRowEditing
        Me.AspxGrigWeb2_1.SettingsText.PopupEditFormCaption = "Modificacion"
        AspxCmbRolStr = Me.AspxGrigWeb2_1.GetRowValuesByKeyValue(e.EditingKeyValue, "rol").ToString
        AspxCmbNivelStr = Me.AspxGrigWeb2_1.GetRowValuesByKeyValue(e.EditingKeyValue, "nivel").ToString
        AspxtxtusuarioStr = Me.AspxGrigWeb2_1.GetRowValuesByKeyValue(e.EditingKeyValue, "id").ToString
    End Sub

    Private Sub AspxGrigWeb2_1_RowInserting(sender As Object, e As ASPxDataInsertingEventArgs) Handles AspxGrigWeb2_1.RowInserting
        Dim AspxCmbRol As ASPxComboBox = Me.AspxGrigWeb2_1.FindEditFormTemplateControl("AspxCmbRol")
        Dim AspxCmbNivel As ASPxComboBox = Me.AspxGrigWeb2_1.FindEditFormTemplateControl("AspxCmbNivel")

        e.NewValues("rol") = AspxCmbRol.Value

        If IsNothing(AspxCmbNivel.Value) Then
            e.NewValues("nivel") = ""
        Else
            e.NewValues("nivel") = AspxCmbNivel.Value
        End If


    End Sub

    Private Sub AspxGrigWeb2_1_RowUpdating(sender As Object, e As ASPxDataUpdatingEventArgs) Handles AspxGrigWeb2_1.RowUpdating
        Dim AspxCmbRol As ASPxComboBox = Me.AspxGrigWeb2_1.FindEditFormTemplateControl("AspxCmbRol")
        Dim AspxCmbNivel As ASPxComboBox = Me.AspxGrigWeb2_1.FindEditFormTemplateControl("AspxCmbNivel")

        e.NewValues("rol") = AspxCmbRol.Value

        If IsNothing(AspxCmbNivel.Value) Then
            e.NewValues("nivel") = ""
        Else
            e.NewValues("nivel") = AspxCmbNivel.Value
        End If
    End Sub

    Protected Sub AspxCmbNivel_OnLoad(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim comboItem As ASPxComboBox = TryCast(sender, ASPxComboBox)
        If AspxCmbRolStr = "E" And AspxCmbNivelStr <> "" Then
            For lwindice As Integer = 0 To comboItem.Items.Count - 1
                If comboItem.Items(lwindice).Value = AspxCmbNivelStr Then
                    comboItem.SelectedIndex = lwindice
                    Exit For
                End If
            Next
        Else
            If AspxCmbNivelStr = "" And AspxCmbRolStr = "" Then
                comboItem.SelectedIndex = 0
            Else
                comboItem.SelectedIndex = -1
                comboItem.ClientEnabled = False
            End If

        End If

        ''If AspxCmbNivelStr <> "" Then
        ''    For lwindice As Integer = 0 To comboItem.Items.Count - 1
        ''        If comboItem.Items(lwindice).Value = AspxCmbNivelStr Then
        ''            comboItem.SelectedIndex = lwindice
        ''            Exit For
        ''        End If
        ''    Next
        ''Else
        ''    comboItem.SelectedIndex = -1
        ''    comboItem.ClientEnabled = False
        ''    ''    comboItem.Enabled = False
        ''End If
    End Sub

    Private Sub AspxGrigWeb2_1_CancelRowEditing(sender As Object, e As ASPxStartRowEditingEventArgs) Handles AspxGrigWeb2_1.CancelRowEditing
        AspxtxtusuarioStr = ""
        AspxCmbRolStr = ""
        AspxCmbNivelStr = ""
    End Sub

    Private Sub AspxGrigWeb2_1_InitNewRow(sender As Object, e As ASPxDataInitNewRowEventArgs) Handles AspxGrigWeb2_1.InitNewRow
        Me.AspxGrigWeb2_1.SettingsText.PopupEditFormCaption = "Ingreso"
    End Sub

    Private Sub Registro_Init(sender As Object, e As EventArgs) Handles Me.Init
        ''If String.IsNullOrEmpty(Session("Usuario")) Then
        ''    Me.Response.Redirect("Login.aspx", True)
        ''End If
    End Sub

    Private Sub AspxGrigWeb2_1_RowValidating(sender As Object, e As ASPxDataValidationEventArgs) Handles AspxGrigWeb2_1.RowValidating
        Dim lsql As String
        If Not e.NewValues("id") Is Nothing AndAlso e.NewValues("id").ToString().Length > 0 Then
            Dim ClDataCon As New ClDataCon
            lsql = "select * from TB_USUARIO where id='" & e.NewValues("id") & "'"
            If AspxGrigWeb2_1.IsNewRowEditing Then
                If ClDataCon.FuncDatos_Verificar(lsql) Then
                    AddError(e.Errors, AspxGrigWeb2_1.Columns("id"), "Usuario ya fue Ingresada")
                    e.RowError = e.RowError & "Usuario ya fue Ingresada" & Chr(13)
                End If
            End If
            'If AspxGrigWeb2_1.IsEditing Then
            '    If e.NewValues("id") <> e.OldValues("id") Then

            '        If ClDataCon.FuncDatos_Verificar(lsql) Then
            '            AddError(e.Errors, AspxGrigWeb2_1.Columns("id"), "Usuario ya fue Ingresada")
            '            e.RowError = e.RowError & "Usuario ya fue Ingresada" & Chr(13)
            '        End If
            '    End If
            'End If
        End If
    End Sub

    Private Sub AddError(ByVal errors As Dictionary(Of GridViewColumn, String), ByVal column As GridViewColumn, ByVal errorText As String)
        If errors.ContainsKey(column) Then
            Return
        End If
        errors(column) = errorText
    End Sub

End Class