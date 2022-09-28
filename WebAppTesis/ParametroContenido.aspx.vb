Imports MySql.Data.MySqlClient
Partial Class ParametroContenido
    Inherits System.Web.UI.Page

    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            ASPxCmbUnidad.DataBind()
            If ASPxCmbUnidad.Items.Count > 0 Then
                ASPxCmbUnidad.SelectedIndex = 0
            End If

            ASPxCmbTema.DataBind()
            If ASPxCmbTema.Items.Count > 0 Then
                ASPxCmbTema.SelectedIndex = 0
            End If

            ASPxCmbContenidos.DataBind()
            If ASPxCmbContenidos.Items.Count > 0 Then
                ASPxCmbContenidos.SelectedIndex = 0
            End If


        End If

    End Sub


    Protected Sub btnIngresar_Click(sender As Object, e As EventArgs) Handles btnIngresar.Click

        Dim lsql As String
        Dim lcontenido As String = ""
        Dim lunidad As String = ""
        Dim ltema As String = ""

        lcontenido = ASPxCmbContenidos.Value

        lunidad = ASPxCmbUnidad.Value

        ltema = ASPxCmbTema.Value

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        lsql = "INSERT INTO TB_PARAM_CONTENIDO VALUES ("
        lsql = lsql & lunidad & ","
        lsql = lsql & ltema & ","
        lsql = lsql & lcontenido & ",0,'"
        lsql = lsql & Me.txtId.Text.Trim & "','"
        lsql = lsql & Me.txtValor.Text & "','"
        lsql = lsql & Me.txtDescripcion.Text & "')"

        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()


        lblmessager.Text = "Grabacion Ok!"
        popupmensaje.ShowOnPageLoad = True
    End Sub

    Protected Sub ASPxBtnRegresar_Click(sender As Object, e As EventArgs) Handles ASPxBtnRegresar.Click
        Response.Redirect("ParametroCabContenido.aspx")
    End Sub
    Protected Sub AspxBotOk_Click(sender As Object, e As EventArgs) Handles AspxBotOk.Click

    End Sub
End Class
