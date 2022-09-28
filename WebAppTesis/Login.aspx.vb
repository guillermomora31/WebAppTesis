Imports System.Data.SqlClient
Imports System.Configuration
Imports MySql.Data.MySqlClient
Imports System.Data.Common
Imports System.Data

Public Class Login
    Inherits System.Web.UI.Page


    Public lsql As String

    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            Session.Clear()

            Session.Timeout = 500

            TxtUsuario.Text = ""
            txtClave.Text = ""

            TxtCa_Usua.Text = ""
            txtClave_Ant.Text = ""
            txtClave_Act.Text = ""
        End If
    End Sub

    Protected Sub ASPxBtnIng_Click(sender As Object, e As EventArgs) Handles ASPxBtnIng.Click

        Dim ClDataCon As New ClDataCon

        Dim DtableConsul As DataTable
        Dim currentRows() As DataRow
        Dim rowConsul As DataRow

        Dim DataSetConsul As New DataSet

        Dim DrSet As New DataSet
        DrSet = Nothing

        lsql = "SELECT nombre,rol,nivel FROM TB_USUARIO where id = '" & Me.TxtUsuario.Text & "' and clave = '" & Me.txtClave.Text & "'"

        Dim cont As Integer
        Dim lnombre As String
        Dim lrol As String
        Dim lnivel As String
        Dim lid_usua As String

        Dim lusuario As String = Me.TxtUsuario.Text.Trim


        If Not ClDataCon.ConsultaDB(lsql, DrSet) Then
            ASPxLblMensaje.Text = "Error en Conexion." & Chr(13) & "Consulte al Administrador del Sistema."
            ClDataCon.Libera_Conexion()
            Exit Sub
        End If


        lnombre = ""
        lrol = ""
        lnivel = ""
        lid_usua = ""

        cont = 0

        DtableConsul = DrSet.Tables(0)
        currentRows = DtableConsul.Select(Nothing, Nothing, DataViewRowState.CurrentRows)

        If currentRows.Length = 0 Then
            ASPxLblMensaje.Text = "Usuario o Contrasena no validos"
            Exit Sub
        End If


        For Each rowConsul In currentRows
            lnombre = rowConsul(0)
            lrol = rowConsul(1)
            lnivel = rowConsul(2)

            Session("Usuario") = lusuario
            Session("rol") = lrol
            Session("nivel") = lnivel
            Session("nombre") = lnombre
        Next

        'ClDataCon.DbConnection.Close()

        If lrol <> "E" Then
            Response.Redirect("Menu.aspx")
        Else
            mostrarGrafica(False)
            mostrarPantalla()
            'Response.Redirect("PanelAvance.aspx")
        End If
    End Sub


    Protected Sub ASPxBtnCambiar_Click(sender As Object, e As EventArgs) Handles ASPxBtnCambiar.Click

        Dim ClDataCon As New ClDataCon

        Dim DataSetConsul As New DataSet
        Dim DtrTmp As DbDataReader

        lsql = "SELECT nombre,clave FROM TB_USUARIO where id = '" & Me.TxtCa_Usua.Text & "'"

        ClDataCon.ConsultaDB(lsql, DataSetConsul)
        DtrTmp = DataSetConsul.CreateDataReader

        Dim cont As Integer
        Dim lusuario As String
        Dim lclave As String

        lusuario = ""
        lclave = ""

        cont = 0

        If DtrTmp.HasRows Then
            DtrTmp.Read()
            cont = cont + 1
            lusuario = DtrTmp(0).Trim
            lclave = DtrTmp(1).Trim

            If lclave <> Me.txtClave_Ant.Text Then
                ASPxLblMsg_Cambio.Text = "Clave Incorrecta ..."
                Exit Sub
            End If

            lsql = "UPDATE TB_USUARIO "
            lsql = lsql & "SET CLAVE = '" & Me.txtClave_Act.Text.Trim & "'"
            lsql = lsql & " WHERE id = '" & Me.TxtCa_Usua.Text.Trim & "'"

            If ClDataCon.Eje_Sentenci_Mysql(lsql) = "" Then
                ASPxLblMsg_Cambio.Text = "Clave actualizada con exito ..."
            End If

        Else
            ASPxLblMsg_Cambio.Text = "Usuario No existe ..."

        End If

        ClDataCon.DbConnection.Close()
        ClDataCon.Libera_Conexion()


        ''ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Clave actualizada con exito ...');", True)
    End Sub


    Private Sub mostrarPantalla()

        ''Dim lRR As Integer = fRecursosRevisados()
        ''Dim lRPR As Integer = fRecursosPorRevisar()

        ''Dim lPOR As Double = 0

        ''If lRPR > 0 Then
        ''    lPOR = (lRR / lRPR) * 100
        ''End If


        ''Me.ASPxLblMsg.Text = "% Recursos Revisados: " & lPOR.ToString

        ''Dim lparam = fParametroRecurso()


        ''If lPOR > lparam Then
        ''    Me.lblinformacion.Text = "Ya esta listo para rendir Evaluacion...."
        ''Else
        ''    Me.lblinformacion.Text = "Debe revisar Recursos para rendir evaluacio......."
        ''End If

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String = ""

        lsql = "select a.id_unidad,a.id_tema,a.id_contenido "
        lsql = lsql + "from tb_contenido a, tb_unidad b, tb_tema c "
        lsql = lsql + " where a.nivel = '" + lnivel + "'"
        lsql = lsql + " and a.id_unidad = b.id_unidad "
        lsql = lsql + " and a.id_unidad = c.id_unidad "
        lsql = lsql + " and a.id_tema = c.id_tema "
        lsql = lsql + " and Not exists(select b.id_contenido from user_contenido b "
        lsql = lsql + " where a.id_unidad = b.id_unidad "
        lsql = lsql + " and a.id_tema = b.id_tema "
        lsql = lsql + " and a.id_contenido = b.id_contenido "
        lsql = lsql + " and b.id_user = '" + lusuario + "') LIMIT 1;"
        mycmd.CommandText = lsql

        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()


        Dim lid_unidad As Integer = 0
        Dim lid_tema As Integer = 0
        Dim lid_contenido As Integer = 0


        Dim lPR As Integer = 0
        Dim lPE As Integer = 0
        Dim lRR As Integer = 0
        Dim lER As Integer = 0
        Dim lRXR As Integer = 0
        Dim lEXR As Integer = 0


        Do While myReader.Read()

            lid_unidad = myReader.GetInt32(0)
            lid_tema = myReader.GetInt32(1)
            lid_contenido = myReader.GetInt32(2)

            'PORCENTAJE RECURSOS
            lPR = fParametroContenido(lid_unidad, lid_tema, lid_contenido, "R")

            'PORCENTAJE EJERCICIOS
            lPE = fParametroContenido(lid_unidad, lid_tema, lid_contenido, "E")

            'RECURSOS REVISADOS
            lRR = fRecursosRevisados(lid_unidad, lid_tema, lid_contenido, "R")

            'EJERCICIOS REVISADOS
            lER = fRecursosRevisados(lid_unidad, lid_tema, lid_contenido, "E")

            'RECURSOS POR REVISAR
            lRXR = fRecursosPorRevisar(lid_unidad, lid_tema, lid_contenido, "R")

            'EJERCICIOS POR REVISAR
            lEXR = fRecursosPorRevisar(lid_unidad, lid_tema, lid_contenido, "E")

        Loop

        mysqlConex.Close()

        Dim lPOR_R As Double = 0

        If lRXR > 0 Then
            lPOR_R = (lRR / lRXR) * 100
        End If

        Dim lPOR_E As Double = 0

        If lEXR > 0 Then
            lPOR_E = (lER / lEXR) * 100
        End If

        Me.ASPxLblMsgR.Text = "% Recursos Revisados: " & lPOR_R.ToString
        Me.ASPxLblMsgE.Text = "% Ejercicios Revisados: " & lPOR_E.ToString

        If lPOR_R <> 0 Or lPOR_E <> 0 Then

            If lPOR_R >= lPR And lPOR_E >= lPE Then
                Session("bd") = 1
                Me.lblinformacion.Text = "Ya esta listo para rendir Evaluacion...."
            Else
                Session("bd") = 0
                Me.lblinformacion.Text = "Debe revisar Recursos y Ejercicios para rendir evaluacion......."
            End If
        Else
            Session("bd") = 0
            Me.lblinformacion.Text = "Debe revisar Recursos y Ejercicios para rendir evaluacion......."

        End If

    End Sub
    Protected Sub mostrarGrafica(general As Boolean)


        Dim lestudiante As String = ""
        lsql = ""
        lestudiante = Session("usuario")

        lsql = "select a.progreso,b.tx_descripcion "
        lsql = lsql & "from tb_avance_detalle a,tb_contenido b,tb_usuario c "
        lsql = lsql & "where a.id_estudiante = c.id "
        lsql = lsql & "And c.id='" + lestudiante + "' "
        lsql = lsql & "And a.id_contenido = b.id_contenido "
        lsql = lsql & "And a.id_unidad = b.id_unidad "
        lsql = lsql & "And a.id_tema = b.id_tema group by 1,2 "

        SqlDataGraf_Detalle.SelectCommand = lsql
        WebChartControl2.DataBind()

        AspxPpGraf.ShowOnPageLoad = True

    End Sub

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

    Protected Sub ASPxBtnAceptar_Click(sender As Object, e As EventArgs) Handles ASPxBtnAceptar.Click

        Dim lbd As Integer

        lbd = Session("bd")
        If lbd = 1 Then
            Response.Redirect("EvaluacionEstudiante.aspx")
        Else
            Response.Redirect("PanelAvance.aspx")
        End If
    End Sub


    Private Function fParametroContenido(fid_unidad, fid_tema, fid_contenido, ftipo) As Integer


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String = ""

        lsql = "select valor "
        lsql = lsql + " from tb_param_contenido "
        lsql = lsql + " where id_unidad = " + fid_unidad.ToString + ""
        lsql = lsql + " and id_tema = " + fid_tema.ToString + ""
        lsql = lsql + " and id_contenido = " + fid_contenido.ToString + ""

        If ftipo = "R" Then
            lsql = lsql + " and identificador = 'PPRR'"
        Else
            lsql = lsql + " and identificador = 'PRE'"
        End If
        mycmd.CommandText = lsql

        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        fParametroContenido = 0

        Do While myReader.Read()
            fParametroContenido = Int(myReader.GetString(0))
        Loop

        mysqlConex.Close()

    End Function

    Private Function fRecursosRevisados(fid_unidad, fid_tema, fid_contenido, ftipo) As Integer


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String = ""

        lsql = "select count(*)"
        lsql = lsql + " from user_contenido_recursos a, tb_contenido b, tb_contenido_recurso c"
        lsql = lsql + " where a.id_unidad = c.id_unidad "
        lsql = lsql + " and a.id_tema = c.id_tema "
        lsql = lsql + " and a.id_contenido = c.id_contenido "
        lsql = lsql + " and a.id_recurso = c.id_recurso "
        lsql = lsql + " and a.id_unidad = " + fid_unidad.ToString + ""
        lsql = lsql + " and a.id_tema = " + fid_tema.ToString + ""
        lsql = lsql + " and a.id_contenido = " + fid_contenido.ToString + ""
        lsql = lsql + " and a.id_user = '" + lusuario + "'"
        lsql = lsql + " and b.nivel = '" + lnivel & "'"
        lsql = lsql + " and a.id_unidad = b.id_unidad "
        lsql = lsql + " and a.id_tema = b.id_tema "
        lsql = lsql + " and a.id_contenido = b.id_contenido "

        If ftipo = "R" Then
            lsql = lsql + " and a.tipo = 'R'"
        Else
            lsql = lsql + " and a.tipo = 'E'"
        End If

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

    Private Function fRecursosPorRevisar(fid_unidad, fid_tema, fid_contenido, ftipo) As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String = ""

        lsql = "select count(*) "
        lsql = lsql + "From tb_contenido_recurso a, tb_contenido c "
        lsql = lsql + " where a.id_unidad = c.id_unidad "
        lsql = lsql + " and a.id_tema = c.id_tema "
        lsql = lsql + " and a.id_contenido = c.id_contenido "
        lsql = lsql + " and a.id_unidad = " + fid_unidad.ToString + ""
        lsql = lsql + " and a.id_tema = " + fid_tema.ToString + ""
        lsql = lsql + " and a.id_contenido = " + fid_contenido.ToString + ""
        lsql = lsql + " and c.nivel = '" + lnivel + "' "

        If ftipo = "R" Then
            lsql = lsql + "and a.tipo_recurso <> 7 "
        Else
            lsql = lsql + "and a.tipo_recurso = 7 "
        End If

        mycmd.CommandText = lsql


        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        fRecursosPorRevisar = 0

        Do While myReader.Read()
            fRecursosPorRevisar = Int(myReader.GetString(0))
        Loop

        mysqlConex.Close()
    End Function

End Class