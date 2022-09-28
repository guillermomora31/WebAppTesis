Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient
Public Class CrearEvaluacion
    Inherits System.Web.UI.Page

    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Call mostrarContenidos()
            Call mostrarTemario()
            Call mostrarModulo()
        End If

    End Sub

    Protected Sub mostrarContenidos()



        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        mycmd.CommandText = "select id,contenido from tb_temario"

        Dim myreader As MySqlDataReader

        myreader = mycmd.ExecuteReader()
        Dim lcontenido As String

        dplContenido.Items.Clear()

        Do While myreader.Read()

            lcontenido = ""

            lcontenido = myreader.GetString(0) + " - " + myreader.GetString(1)
            dplContenido.Items.Add(lcontenido)


        Loop


        myreader.Close()
        mysqlConex.Close()



    End Sub

    Protected Sub mostrarTemario()



        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        mycmd.CommandText = "select id,valor from tb_parametro where parametro = 'tema'"

        Dim myreader As MySqlDataReader

        myreader = mycmd.ExecuteReader()

        Dim ltema As String


        ltema = ""

        Do While myreader.Read()

            ltema = myreader.GetString(0) + " - " + myreader.GetString(1)

        Loop


        myreader.Close()
        mysqlConex.Close()

        Me.txtTemario.Text = ""
        Me.txtTemario.Text = ltema


    End Sub
    Protected Sub mostrarModulo()



        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        mycmd.CommandText = "select id,valor from tb_parametro where parametro = 'modulo'"

        Dim myreader As MySqlDataReader

        myreader = mycmd.ExecuteReader()

        Dim lmodulo As String


        lmodulo = ""

        Do While myreader.Read()

            lmodulo = myreader.GetString(0) + " - " + myreader.GetString(1)

        Loop


        myreader.Close()
        mysqlConex.Close()

        Me.txtModulo.Text = ""
        Me.txtModulo.Text = lmodulo


    End Sub
    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        'Create a Command object.
        Dim mycmd As MySqlCommand

        mycmd = mysqlConex.CreateCommand
        mycmd.Connection = mysqlConex

        Dim lsql As String

        Dim lresp As String

        Dim l

        lresp = "N"
        If rbSi.Checked = True Then
            lresp = "S"
        End If

        Dim lresp2 As String
        lresp2 = "N"
        If rb1Si.Checked = True Then
            lresp2 = "S"
        End If

        Dim lresp3 As String
        lresp3 = "N"
        If rb2Si.Checked = True Then
            lresp3 = "S"
        End If

        Dim lresp4 As String
        lresp4 = "N"
        If rb3Si.Checked = True Then
            lresp4 = "S"
        End If
        Dim lidModulo As Int16
        Dim lidtemario As Int16
        Dim lidContenido As Int16


        lidModulo = Int(Mid(Me.txtModulo.Text, 1, fposicion(Me.txtModulo.Text)))

        lidtemario = Int(Mid(Me.txtTemario.Text, 1, fposicion(Me.txtTemario.Text)))

        lidContenido = Int(Mid(Me.dplContenido.SelectedValue, 1, fposicion(Me.dplContenido.SelectedValue)))

        lsql = "INSERT INTO TB_EVALUACION VALUES ("
        lsql = lsql & lidModulo & ","
        lsql = lsql & lidtemario & ","
        lsql = lsql & lidContenido & ",0,'"
        lsql = lsql & Me.txtNombrePregunta.Text & "','"
        lsql = lsql & Me.txtEnunciadoPregunta.Text & "',"
        lsql = lsql & Me.txtPuntuacion.Text & ",'"
        lsql = lsql & Me.txtEleccion1.Text & "','"
        lsql = lsql & lresp & "','"
        lsql = lsql & Me.TxtEleccion2.Text & "','"
        lsql = lsql & lresp2 & "','"
        lsql = lsql & Me.TxtEleccion3.Text & "','"
        lsql = lsql & lresp3 & "','"
        lsql = lsql & Me.txtEleccion4.Text & "','"
        lsql = lsql & lresp4 & "','A')"
        myCmd.CommandText = lsql

        mycmd.ExecuteNonQuery()

        ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Registro exitoso ...');", True)




    End Sub

    Protected Function fposicion(ltexto As String) As Int16

        fposicion = 0

        fposicion = InStr(1, ltexto, "-") - 2

        Return fposicion

    End Function

End Class