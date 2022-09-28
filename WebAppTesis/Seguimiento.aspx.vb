Imports MySql.Data.MySqlClient
Public Class Seguimiento
    Inherits System.Web.UI.Page

    Dim barras(4) As Int16
    Dim nombres(4) As String
    Dim lestudiante As String
    Dim lidEstudiante As String
    Dim lsql As String
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
            dplEstudiante.DataBind()
            If dplEstudiante.Items.Count > 0 Then
                dplEstudiante.SelectedIndex = 0
            End If
            lidEstudiante = dplEstudiante.Value
            mostrarGrafica(lidEstudiante)
        End If

    End Sub

    Protected Sub mostrarGrafica(vestudiante As String)

        lsql = ""

        If Len(vestudiante) > 0 Then
            lsql = "select puntaje_total,nombre from tb_avance inner join tb_usuario on tb_avance.id_estudiante = tb_usuario.id and tb_usuario.id='" + vestudiante + "'"
        Else
            lsql = "select puntaje_total,nombre from tb_avance inner join tb_usuario on tb_avance.id_estudiante = tb_usuario.id "
        End If

        SqlDataGraf_Est.SelectCommand = lsql
        WebChartControl1.DataBind()

    End Sub
    Protected Sub BtnConsultar_Click(sender As Object, e As EventArgs) Handles btnConsultar.Click
        lidEstudiante = dplEstudiante.Value
        mostrarGrafica(lidEstudiante)
    End Sub

    Protected Sub BtnTodos_Click(sender As Object, e As EventArgs) Handles btnTodos.Click
        mostrarGrafica("")
    End Sub

End Class