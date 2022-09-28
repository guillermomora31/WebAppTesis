Imports MySql.Data.MySqlClient
Public Class Progreso
    Inherits System.Web.UI.Page

    Dim barras(4) As Int16
    Dim nombres(4) As String
    Public lsql As String

    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            mostrarGrafica(False)
            mostrarPantalla()
        End If
    End Sub

    Private Sub mostrarPantalla()

        Dim lRR As Integer = fRecursosRevisados()
        Dim lRPR As Integer = fRecursosPorRevisar()

        Dim lPOR As Double = 0

        If lRPR > 0 Then
            lPOR = (lRR / lRPR) * 100
        End If


        'Me.ASPxLblMsg.Text = "% Recursos Revisados: " & lPOR.ToString

        Dim lparam = fParametroRecurso()


        If lPOR >= lparam Then
            Me.lblinformacion.Text = "Ya esta listo para rendir Evaluacion...."
        Else
            Me.lblinformacion.Text = "Debe revisar Recursos para rendir evaluacion......."
        End If

    End Sub
    Protected Sub mostrarGrafica(general As Boolean)


        'Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        'mysqlConex.Open()

        Dim lestudiante As String = ""
        lsql = ""
        lestudiante = Session("usuario")
        'Dim mycmd As MySqlCommand
        'mycmd = mysqlConex.CreateCommand
        'If general = True Then
        'mycmd.CommandText = "select puntaje_total,nombre from tb_avance inner join tb_usuario on tb_avance.id_estudiante = tb_usuario.id and tb_usuario.id='" + lestudiante + "'"
        'lsql = "select puntaje_total,nombre from tb_avance inner join tb_usuario on tb_avance.id_estudiante = tb_usuario.id and tb_usuario.id='" + lestudiante + "'"
        'Else
        'mycmd.CommandText = "select a.progreso,a.id_contenido from tb_avance_detalle a inner join tb_usuario b on a.id_estudiante = b.id and b.id='" + lestudiante + "'"
        'lsql = "select a.progreso,a.id_contenido from tb_avance_detalle a inner join tb_usuario b on a.id_estudiante = b.id and b.id='" + lestudiante + "'"
        lsql = "select a.progreso,a.id_contenido from tb_avance_detalle a inner join tb_usuario b on a.id_estudiante = b.id and " &
                "b.id='" & lestudiante & "'"

        'SqlDataGraf_Detalle.SelectCommand = lsql
        'WebChartControl2.DataBind()

        'AspxPpGraf.ShowOnPageLoad = True

        'End If

        'Dim myreader As MySqlDataReader

        'myreader = mycmd.ExecuteReader()
        'Dim cont As Int16 = 0

        'Do While myreader.Read()

        '    barras(cont) = myreader.GetInt32(0)
        '    nombres(cont) = myreader.GetString(1)
        '    cont = cont + 1


        'Loop

        'myreader.Close()
        'mysqlConex.Close()

        'Grafica.Series("Series1").Points.DataBindXY(nombres, barras)

    End Sub
    Protected Sub btnGeneral_Click(sender As Object, e As EventArgs) Handles btnGeneral.Click
        mostrarGrafica(True)
    End Sub

    Protected Function consultaEstudiante() As String



        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()


        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        mycmd.CommandText = "select valor from tb_temp where id = 'usuario'"


        Dim myreader As MySqlDataReader

        myreader = mycmd.ExecuteReader()

        consultaEstudiante = ""

        Do While myreader.Read()

            consultaEstudiante = myreader.GetString(0)

        Loop

        myreader.Close()
        mysqlConex.Close()

        Return consultaEstudiante

    End Function

    Protected Sub btnDetalle_Click(sender As Object, e As EventArgs) Handles btnDetalle.Click
        mostrarGrafica(False)
    End Sub

    Protected Sub btnCerrar_Click(sender As Object, e As EventArgs) Handles btnCerrar.Click

        Dim lparam = fParametroRecurso()

        Dim lpor = Int(Me.txtRecursos.Text)
        If lpor >= lparam Then
            Response.Redirect("EvaluacionEstudiante.aspx")
        Else
            Response.Redirect("PanelAvance.aspx")
        End If

    End Sub

    Private Function fRecursosRevisados() As Integer


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String = ""

        lsql = "select count(*)"
        lsql = lsql + " from user_contenido_recursos a, tb_contenido b, tb_contenido_recurso c"
        lsql = lsql + " where a.id_contenido = b.id_contenido "
        lsql = lsql + " and a.id_contenido = c.id_contenido "
        lsql = lsql + " and a.id_recurso = c.id_recurso "
        lsql = lsql + " and a.id_user = '" + lusuario + "'"
        lsql = lsql + " and b.nivel = '" + lnivel & "';"
        mycmd.CommandText = lsql

        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        fRecursosRevisados = 0

        Do While myReader.Read()
            fRecursosRevisados = Int(myReader.GetString(0))
        Loop

        mysqlConex.Close()

    End Function
    Private Function fRecursosPorRevisar() As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String = ""

        lsql = "select count(*) "
        lsql = lsql + "From tb_contenido_recurso a, tb_contenido c "
        lsql = lsql + "where a.id_contenido = c.id_contenido "
        lsql = lsql + "and c.nivel = '" + lnivel + "' "

        mycmd.CommandText = lsql

        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        fRecursosPorRevisar = 0

        Do While myReader.Read()
            fRecursosPorRevisar = Int(myReader.GetString(0))
        Loop

        mysqlConex.Close()
    End Function

    Private Function fParametroRecurso() As Integer


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String = ""

        lsql = "select valor "
        lsql = lsql + " from tb_parametro where id ='VPPR'"
        mycmd.CommandText = lsql

        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        fParametroRecurso = 0

        Do While myReader.Read()
            fParametroRecurso = Int(myReader.GetString(0))
        Loop

        mysqlConex.Close()

    End Function
End Class