Imports MySql.Data.MySqlClient
Imports WebApplication1

Public Class EvaluacionEstudiante
    Inherits System.Web.UI.Page

    Public lrow As Integer
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

            CargarIdPregunta()
            cargarPreguntas()

        End If

    End Sub


    Protected Sub btnSiguiente_Click(sender As Object, e As EventArgs) Handles btnSiguiente_.Click



        If rdbEleccion1.Checked = True And lblResp1.Text = "S" Then
            VariablesGlobales.lbdOk = True
        ElseIf rdbEleccion2.Checked = True And lblResp2.Text = "S" Then
            VariablesGlobales.lbdOk = True
        ElseIf rdbEleccion3.Checked = True And lblResp3.Text = "S" Then
            VariablesGlobales.lbdOk = True
        ElseIf rdbEleccion4.Checked = True And lblResp4.Text = "S" Then
            VariablesGlobales.lbdOk = True
        End If

        grabarRespuesta()
        rdbEleccion1.Checked = False
        rdbEleccion2.Checked = False
        rdbEleccion3.Checked = False
        rdbEleccion4.Checked = False
        VariablesGlobales.lbdOk = False


        Dim lcantidad As Integer = fCantidadPreguntas()
        Dim lcont As Integer = 0

        lcont = fPreguntasPorContestar()

        lrow = Session("fila") + 1

        Session("fila") = lrow

        If lrow <= lcantidad And lrow <= lcont Then
            cargarPreguntas()
        Else
            Session("fila") = 0
            factualizaIntento()
            actualizaPerfil()
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Finalizo Evaluacion');", True)
            Response.Redirect("ResumenRespuestas.aspx")
        End If


    End Sub
    Private Sub actualizaAvanceDetalle()


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand


        Dim lsql As String

        Dim fid_unidad As String = Session("unidad")
        Dim fid_tema As String = Session("tema")
        Dim fid_contenido As String = Session("contenido")

        Dim lnivel As String = Session("nivel")

        lsql = "select  id_contenido,puntaje "
        lsql = lsql + "from tb_contenido "
        lsql = lsql + " where nivel = '" + lnivel + "'"
        lsql = lsql + " and id_unidad = " + fid_unidad.ToString + ""
        lsql = lsql + " and id_tema = " + fid_tema.ToString + ""
        lsql = lsql + " and id_contenido = " + fid_contenido.ToString + ""

        mycmd.CommandText = lsql

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()


        Do While myReader.Read()
            Dim lid_contenido As Integer = 0
            Dim lpuntaje As Integer = 0
            lid_contenido = myReader.GetInt32(0)
            lpuntaje = myReader.GetInt32(1)
            Call llenaAvanceDetalle(fid_unidad, fid_tema, lid_contenido, lpuntaje)
        Loop

        myReader.Close()
        mysqlConex.Close()


    End Sub
    Private Sub actualizaAvance()

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand


        Dim lsql As String

        Dim lnivel As String = Session("nivel")
        Dim lniveles As String = ""


        Select Case lnivel
            Case "B"
                lniveles = "('B')"
            Case "I"
                lniveles = "('B','I')"
            Case "A"
                lniveles = "('B','I','A')"
        End Select

        lsql = "select  id_unidad,id_tema,id_contenido,sum(puntaje) "
        lsql = lsql + "from tb_contenido "
        lsql = lsql + " where nivel in " + lniveles + ""
        mycmd.CommandText = lsql

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        Dim lid_unidad As Integer = 0
        Dim lid_tema As Integer = 0
        Dim lid_contenido As Integer = 0
        Dim lpuntaje As Integer = 0


        Do While myReader.Read()
            lid_unidad = myReader.GetInt32(0)
            lid_tema = myReader.GetInt32(1)
            lid_contenido = myReader.GetInt32(2)
            lpuntaje = myReader.GetInt32(3)
            Call llenaAvance(lid_unidad, lid_tema, lid_contenido, lpuntaje)
        Loop

        myReader.Close()
        mysqlConex.Close()


    End Sub

    Private Sub llenaAvanceDetalle(lunidad As String, ltema As String, fidcontenido As Integer, fpuntaje As Integer)

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lusuario As String = Session("usuario")

        Dim lsql As String

        lsql = "DELETE FROM TB_AVANCE_DETALLE "
        lsql = lsql & " WHERE id_unidad = " + lunidad & ""
        lsql = lsql & " and id_tema = " + ltema & ""
        lsql = lsql & " and id_contenido = " + fidcontenido.ToString & ""
        lsql = lsql & " AND id_estudiante = '" + lusuario & "'"

        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()

        'grafica
        lsql = "INSERT INTO TB_AVANCE_DETALLE VALUES (0,"
        lsql = lsql & lunidad & ","
        lsql = lsql & ltema & ","
        lsql = lsql & fidcontenido.ToString & ",'"
        lsql = lsql & lusuario & "',"
        lsql = lsql & fpuntaje.ToString & ")"
        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()

        'CONTENIDOS APRENDIDOS
        lsql = "INSERT INTO USER_CONTENIDO VALUES ("
        lsql = lsql & lunidad & ","
        lsql = lsql & ltema & ","
        lsql = lsql & fidcontenido.ToString & ",'"
        lsql = lsql & lusuario & "','A')"

        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()


    End Sub

    Private Sub llenaAvance(fid_unidad As String, fid_tema As String, fidcontenido As String, fpuntaje As String)



        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand


        Dim lusuario As String = Session("usuario")

        Dim lsql As String

        lsql = "DELETE FROM TB_AVANCE "
        lsql = lsql & " WHERE id_unidad = " + fid_unidad & ""
        lsql = lsql & " AND  id_tema = " + fid_tema & ""
        lsql = lsql & " and id_contenido = " + fidcontenido & ""
        lsql = lsql & " AND id_estudiante = '" + lusuario & "'"

        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()


        lsql = "INSERT INTO TB_AVANCE VALUES (0,"
        lsql = lsql & fid_unidad & ","
        lsql = lsql & fid_tema & ","
        lsql = lsql & fidcontenido & ",'"
        lsql = lsql & lusuario & "',"
        lsql = lsql & fpuntaje & ")"

        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()

    End Sub

    Private Sub factualizaIntento()


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand


        Dim lsql As String

        Dim lusuario As String = Session("usuario")
        Dim lintento As Integer = fintentos() + 1

        lsql = "UPDATE USER_INTENTOS "
        lsql = lsql & "SET INTENTO = " & lintento.ToString & ""
        lsql = lsql & " WHERE USUARIO = '" & lusuario & "'"

        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()

    End Sub

    Private Sub CargarIdPregunta()


        VariablesGlobales.num.Initialize()

        Dim cont As Integer = 1

        Dim i As Integer = 0
        Dim bd As Boolean
        Dim j As Integer

        Dim lcantidad = fCantidadPreguntas()

        Dim lvez As Integer = 0
        Do While cont <= lcantidad

            Dim numAleatorio As New Random()
            Dim valorAleatorio As Integer = numAleatorio.Next(0, lcantidad +1)

            If valorAleatorio <> 0 Then
                If lvez = 0 Then
                    bd = False
                    lvez = lvez + 1
                Else
                    For j = 1 To cont - 1
                        If VariablesGlobales.num(j, 1) <> valorAleatorio Then
                            bd = False
                        Else
                            bd = True
                            Exit For
                        End If
                    Next
                End If
                If bd = False Then
                    VariablesGlobales.num(cont, 1) = valorAleatorio
                    cont = cont + 1
                End If
            End If


        Loop


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String

        lsql = "select  c.id_pregunta "
        lsql = lsql + "from tb_usuario a, tb_contenido b, tb_preguntas c "
        lsql = lsql + " where a.nivel = b.nivel "
        lsql = lsql + " and b.id_unidad = c.id_unidad "
        lsql = lsql + " and b.id_tema = c.id_tema "
        lsql = lsql + " and b.id_contenido = c.id_contenido "
        lsql = lsql + " And a.id = '" + lusuario + "'"
        lsql = lsql + " And b.nivel = '" + lnivel + "'"
        lsql = lsql + " and not exists "
        lsql = lsql + " (select d.id_contenido,d.id_pregunta from user_preguntas d"
        lsql = lsql + " where d.id_unidad = c.id_unidad "
        lsql = lsql + " and d.id_tema = c.id_tema "
        lsql = lsql + " and d.id_contenido = c.id_contenido "
        lsql = lsql + " And d.id_pregunta = c.id_pregunta"
        lsql = lsql + " And d.respuesta = 'S') order by c.id_unidad,c.id_tema,c.id_contenido LIMIT " + lcantidad.ToString + " ;"
        mycmd.CommandText = lsql

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        cont = 1

        Dim lid As Integer

        Do While myReader.Read()
            lid = myReader.GetInt32(0)
            VariablesGlobales.num(cont, 2) = lid
            cont = cont + 1
        Loop

        myReader.Close()
        mysqlConex.Close()

        Dim lvalor As Integer
        Dim ltemp As Integer = 0

        If cont > 1 Then

            For i = 1 To lcantidad

                For j = 1 To lcantidad - 1
                    If VariablesGlobales.num(j, 1) > VariablesGlobales.num(j + 1, 1) Then
                        ltemp = VariablesGlobales.num(j, 1)
                        lvalor = VariablesGlobales.num(j, 2)
                        VariablesGlobales.num(j, 1) = VariablesGlobales.num(j + 1, 1)
                        VariablesGlobales.num(j, 2) = VariablesGlobales.num(j + 1, 2)
                        VariablesGlobales.num(j + 1, 1) = ltemp
                        VariablesGlobales.num(j + 1, 2) = lvalor
                    End If
                Next
            Next

        End If

    End Sub

    Public Function IncrementCounter() As Integer
        Dim counter As Integer = 0
        counter += 1

        Return counter
    End Function

    Private Sub cargarPreguntas()

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String

        Dim lfila As Integer = 0

        lrow = Session("fila")
        If lrow = 0 Then
            lrow = 1
        End If


        Session("fila") = lrow
        Session("pregunta") = VariablesGlobales.num(lrow, 2)

        Dim lidPregunta = VariablesGlobales.num(lrow, 2)


        lsql = "select  c.* "
        lsql = lsql + "from tb_usuario a, tb_contenido b, tb_preguntas c "
        lsql = lsql + " where a.nivel = b.nivel "
        lsql = lsql + " and b.id_contenido = c.id_contenido "
        lsql = lsql + " And a.id = '" + lusuario + "'"
        lsql = lsql + " And b.nivel = '" + lnivel + "'"
        lsql = lsql + " And c.id_pregunta = " + lidPregunta.ToString + " LIMIT 1"

        mycmd.CommandText = lsql

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()


        Do While myReader.Read()
            Session("unidad") = myReader.GetString("id_unidad")
            Session("tema") = myReader.GetString("id_tema")
            Session("contenido") = myReader.GetString("id_contenido")
            Me.txtPregunta.Text = myReader.GetString("tx_nombre_pregunta")
            Me.rdbEleccion1.Text = myReader.GetString("tx_eleccion1")
            Me.lblResp1.Text = myReader.GetString("resp_correcta1")
            Me.rdbEleccion2.Text = myReader.GetString("tx_eleccion2")
            Me.lblResp2.Text = myReader.GetString("resp_correcta2")
            Me.rdbEleccion3.Text = myReader.GetString("tx_eleccion3")
            Me.lblResp3.Text = myReader.GetString("resp_correcta3")
            Me.rdbEleccion4.Text = myReader.GetString("tx_eleccion4")
            Me.lblResp4.Text = myReader.GetString("resp_correcta4")

        Loop

        myReader.Close()
        mysqlConex.Close()

    End Sub



    Protected Sub grabarRespuesta()

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String
        Dim lrespuesta As String
        Dim lintentos = fintentos()


        lrespuesta = ""
        If VariablesGlobales.lbdOk Then
            lrespuesta = "S"
        Else
            lrespuesta = "N"
        End If

        Dim lusuario As String = Session("usuario")
        Dim lunidad As String = Session("unidad")
        Dim ltema As String = Session("tema")
        Dim lcontenido As String = Session("contenido")
        Dim lpregunta As String = Session("pregunta")

        lsql = "INSERT INTO USER_PREGUNTAS VALUES ('"
        lsql = lsql & lusuario & "',"
        lsql = lsql & lunidad & ","
        lsql = lsql & ltema & ","
        lsql = lsql & lcontenido & ","
        lsql = lsql & lpregunta & ",'"
        lsql = lsql & lrespuesta & "',"
        lsql = lsql & lintentos & ")"

        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()

    End Sub

    Private Sub actualizaPerfil()

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()


        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        Dim lsql As String = ""
        lsql = "select id,valor from tb_parametro where parametro = 'PMM';"
        mycmd.CommandText = lsql

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()
        Dim lVPPR As Integer
        Dim lVPRC As Integer
        Dim lVPPR_POR As Double
        Dim lVPRC_POR As Double
        Dim lVBP As Integer
        Dim lPR As Integer


        lVPPR = 0
        lVPRC = 0
        lVBP = 0
        lPR = 0


        Do While myReader.Read()
            Select Case myReader.GetString("id").Trim
                Case "VPPR"
                    lVPPR = Int(myReader.GetString("VALOR"))
                Case "VPRC"
                    lVPRC = Int(myReader.GetString("VALOR"))
                Case "VBP"
                    lVBP = Int(myReader.GetString("VALOR"))
                Case "PR"
                    lPR = Int(myReader.GetString("VALOR"))
            End Select

        Loop

        myReader.Close()
        mysqlConex.Close()

        Dim lNTRXR As Integer = 0
        Dim lNTPXC As Integer = 0
        Dim lNTRR As Integer = 0
        Dim lNTPC As Integer = 0

        lNTRXR = fRecursosPorRevisar()
        lNTPXC = fPreguntasPorContestar()
        lNTRR = fRecursosRevisados()
        lNTPC = fPreguntasContestadas()

        Dim lFRR As Double = 0
        Dim lFPC As Double = 0

        If lNTRXR > 0 Then
            lFRR = lVBP / lNTRXR
        Else
            lFRR = 1
        End If

        If lNTPXC > 0 Then
            lFPC = lVBP / lNTPXC
        Else
            lFPC = 1
        End If

        Dim lPRR As Long = 0
        Dim lPPC As Long = 0

        lPRR = lNTRR * lFRR
        lPPC = lNTPC * lFPC

        Dim lPO As Long = 0
        lVPPR_POR = lVPPR / 100
        lVPRC_POR = lVPRC / 100

        lPO = (lVPPR_POR * lPRR) + (lVPRC_POR * lPPC)

        If lPO >= lPR Then
            actualizaAvance()
            actualizaAvanceDetalle()
            fActualizaNivel()

        End If


    End Sub

    Private Sub fActualizaNivel()


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()


        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand


        Dim lsql As String

        Dim lusuario As String = Session("usuario")
        Dim lunidad As String = Session("unidad")
        Dim ltema As String = Session("tema")
        Dim lcontenido As String = Session("contenido")
        Dim lnivel As String = Session("nivel")
        'revisa avance contenidos

        lsql = "Select count(*) from tb_avance_detalle "
        lsql = lsql + " where id_unidad = " + lunidad + ""
        lsql = lsql + " And id_tema = " + ltema + ""
        lsql = lsql + " And id_estudiante = '" + lusuario + "'"

        mycmd.CommandText = lsql



        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        Dim ldetalle As Integer = 0


        Do While myReader.Read()
            ldetalle = myReader.GetInt32(0)
        Loop

        myReader.Close()


        'revisa contenidos
        'Select Case count(*) from tb_contenido where id_unidad = 1 And id_tema = 1 And nivel='B';
        lsql = "Select count(*) from tb_contenido "
        lsql = lsql + " where id_unidad = " + lunidad + ""
        lsql = lsql + " And id_tema = " + ltema + ""
        lsql = lsql + " And nivel = '" + lnivel + "'"

        mycmd.CommandText = lsql

        myReader = mycmd.ExecuteReader()

        Dim lcontContenido As Integer = 0

        Do While myReader.Read()
            lcontContenido = myReader.GetInt32(0)
        Loop

        myReader.Close()
        mysqlConex.Close()

        Dim lNIVEL_SIGUIENTE As String = ""


        Select Case lnivel
            Case "B"
                lNIVEL_SIGUIENTE = "I"
            Case "I"
                lNIVEL_SIGUIENTE = "A"
            Case "A"
                lNIVEL_SIGUIENTE = "P"
        End Select

        If lcontContenido = ldetalle Then

            lsql = "UPDATE TB_USUARIO "
            lsql = lsql & "SET NIVEL = '" & lNIVEL_SIGUIENTE & "'"
            lsql = lsql & " WHERE ID = '" & lusuario & "'"

            mycmd.CommandText = lsql

            mycmd.ExecuteNonQuery()

            Session("nivel") = lNIVEL_SIGUIENTE

        End If


    End Sub
    Private Function fRecursosPorRevisar() As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")
        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim fid_unidad As String = Session("unidad")
        Dim fid_tema As String = Session("tema")
        Dim fid_contenido As String = Session("contenido")

        Dim lsql As String
        lsql = "select count(*) "
        lsql = lsql + "From tb_contenido_recurso a, tb_contenido c "
        lsql = lsql + " where a.id_unidad = c.id_unidad "
        lsql = lsql + " and a.id_tema = c.id_tema "
        lsql = lsql + " and a.id_contenido = c.id_contenido "
        lsql = lsql + " and a.id_unidad = " + fid_unidad.ToString + ""
        lsql = lsql + " and a.id_tema = " + fid_tema.ToString + ""
        lsql = lsql + " and a.id_contenido = " + fid_contenido.ToString + ""
        lsql = lsql + " and c.nivel = '" + lnivel + "' "
        lsql = lsql + "and a.tipo_recurso <> 7 "

        mycmd.CommandText = lsql

        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        fRecursosPorRevisar = 0

        Do While myReader.Read()
            fRecursosPorRevisar = myReader.GetInt32(0)
        Loop

        myReader.Close()
        mysqlConex.Close()


    End Function

    Private Function fRecursosRevisados() As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")
        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim fid_unidad As String = Session("unidad")
        Dim fid_tema As String = Session("tema")
        Dim fid_contenido As String = Session("contenido")

        Dim lsql As String
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
        lsql = lsql + " and a.tipo = 'R'"

        mycmd.CommandText = lsql

        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()


        fRecursosRevisados = 0

        Do While myReader.Read()
            fRecursosRevisados = myReader.GetInt32(0)
        Loop


        myReader.Close()
        mysqlConex.Close()


    End Function


    Private Function fPreguntasPorContestar() As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")
        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim fid_unidad As String = Session("unidad")
        Dim fid_tema As String = Session("tema")
        Dim fid_contenido As String = Session("contenido")

        Dim lsql As String
        lsql = "select count(*) "
        lsql = lsql + "from tb_contenido b, tb_preguntas c "
        lsql = lsql + "where b.nivel = '" + lnivel + "'"
        lsql = lsql + " and b.id_unidad = c.id_unidad "
        lsql = lsql + " and b.id_tema = c.id_tema "
        lsql = lsql + " and b.id_contenido = c.id_contenido "
        lsql = lsql + " and c.id_unidad = " + fid_unidad.ToString + ""
        lsql = lsql + " and c.id_tema = " + fid_tema.ToString + ""
        lsql = lsql + " and c.id_contenido = " + fid_contenido.ToString + ""

        mycmd.CommandText = lsql

        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        fPreguntasPorContestar = 0

        Do While myReader.Read()
            fPreguntasPorContestar = myReader.GetInt32(0)
        Loop

        myReader.Close()
        mysqlConex.Close()

    End Function

    Private Function fPreguntasContestadas() As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")
        Dim lsql As String


        Dim fid_unidad As String = Session("unidad")
        Dim fid_tema As String = Session("tema")
        Dim fid_contenido As String = Session("contenido")

        lsql = "Select count(*) "
        lsql = lsql + "From user_preguntas a, tb_preguntas b,"
        lsql = lsql + "tb_contenido c, tb_usuario d "
        lsql = lsql + "Where a.id_user = '" + lusuario + "' "
        lsql = lsql + " And c.nivel = '" + lnivel + "' "
        lsql = lsql + " and a.id_unidad = " + fid_unidad.ToString + ""
        lsql = lsql + " and a.id_tema = " + fid_tema.ToString + ""
        lsql = lsql + " and a.id_contenido = " + fid_contenido.ToString + ""
        lsql = lsql + " And a.id_unidad = b.id_unidad "
        lsql = lsql + " And a.id_tema = b.id_tema "
        lsql = lsql + " And a.id_contenido = b.id_contenido "
        lsql = lsql + " And a.id_pregunta = b.id_pregunta "
        lsql = lsql + " And a.id_user = d.id "
        lsql = lsql + " And a.id_contenido = b.id_contenido "
        lsql = lsql + " And a.id_pregunta = b.id_pregunta "
        lsql = lsql + " And a.respuesta = 'S' "
        lsql = lsql + " And a.id_contenido = c.id_contenido "
        lsql = lsql + " And c.nivel = d.nivel"

        mycmd.CommandText = lsql

        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        fPreguntasContestadas = 0

        Do While myReader.Read()
            fPreguntasContestadas = myReader.GetInt32(0)
        Loop

        myReader.Close()
        mysqlConex.Close()

    End Function




    Private Function fintentos() As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)



        Dim lusuario As String = Session("usuario")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        Dim lsql As String = ""
        lsql = "select max(intento) from user_intentos where usuario = '" + lusuario + "'"
        mycmd.CommandText = lsql

        Dim myReader As MySqlDataReader

        mysqlConex.Open()

        myReader = mycmd.ExecuteReader()

        fintentos = 0

        Do While myReader.Read()
            fintentos = myReader.GetInt32(0)
        Loop

        myReader.Close()
        mysqlConex.Close()




    End Function

    Private Function fCantidadPreguntas() As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        Dim lsql As String = ""
        lsql = "select valor from tb_parametro where parametro = 'preguntas'"
        mycmd.CommandText = lsql


        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        fCantidadPreguntas = 0

        Do While myReader.Read()
            fCantidadPreguntas = Int(myReader.GetString(0))
        Loop

        myReader.Close()
        mysqlConex.Close()
    End Function

    Protected Sub muestraDatosTema()

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        mycmd.CommandText = "SELECT * FROM TB_PARAMETRO where parametro = 'tema'"

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        Me.lblTema.Text = ""

        Do While myReader.Read()
            Me.lblTema.Text = "TEMA : " + myReader.GetString("valor")
        Loop

        myReader.Close()
        mysqlConex.Close()

    End Sub

End Class