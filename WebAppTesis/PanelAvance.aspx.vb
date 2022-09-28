Imports System.Data
Imports DevExpress.Web
Imports MySql.Data.MySqlClient
Public Class PanelAvance
    Inherits System.Web.UI.Page

    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")
    Public rutaContenido As String = System.Configuration.ConfigurationManager.AppSettings("rutaContenido")
    Public lsql As String

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

            Session("ruta") = System.Configuration.ConfigurationManager.AppSettings("rutaContenido")

            Call LlenaMenu()

            ASPxCmbUnidad.DataBind()
            If ASPxCmbUnidad.Items.Count > 0 Then
                ASPxCmbUnidad.SelectedIndex = 0
            End If
            ASPxCmbUnidad.Enabled = False

            ASPxCmbTema.DataBind()
            If ASPxCmbTema.Items.Count > 0 Then
                ASPxCmbTema.SelectedIndex = 0
            End If
            ASPxCmbTema.Enabled = False

            MuestraContenidosAprendidos()
            MuestraContenidosPorAprender()
            MuestraDatosEstudiante()
            MuestraDatosTema()
            'MuestraRecursosRevisados()
            'MuestraRecursosPorRevisar()

            'MostrarContenidos()


            ASPxCmbContenidos.DataBind()
            If ASPxCmbContenidos.Items.Count > 0 Then
                ASPxCmbContenidos.SelectedIndex = 0
            End If


            'lsql = "select id_recurso,id_contenido,tx_nombre_recurso,concat('" & rutaContenido & "',tx_nombre_recurso) as url,concat(id_recurso,'-',tx_nombre_recurso) as data_audi from tb_contenido_recurso where id_contenido=" & ASPxCmbContenidos.SelectedItem.Value
            'lsql = "select id_recurso,id_contenido,tx_nombre_recurso,(if(tipo_recurso<>7,concat('" & rutaContenido & "',tx_nombre_recurso),'')) as url,concat(id_recurso,'-',tx_nombre_recurso) as data_audi,(if(tipo_recurso=7,'Ejercicio','')) as ejercicio from tb_contenido_recurso where id_contenido=" & ASPxCmbContenidos.SelectedItem.Value

            'SqlDataRecursos.SelectCommand = lsql



            AspxGrigCont_Recurso.DataBind()

        End If

    End Sub

    Protected Sub MuestraDatosTema()

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
    Protected Sub MuestraDatosEstudiante()

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim lusuario As String = ""

        lusuario = Session("usuario")

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        mycmd.CommandText = "SELECT * FROM TB_USUARIO where id = '" & lusuario & "'"

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        Do While myReader.Read()
            Me.lblNombre.Text = "ESTUDIANTE : " + myReader.GetString("nombre")

            Select Case myReader.GetString("nivel")
                Case "B"
                    Me.lblNivel.Text = "NIVEL : BASICO"
                Case "I"
                    Me.lblNivel.Text = "NIVEL : INTERMEDIO"
                Case "A"
                    Me.lblNivel.Text = "NIVEL : AVANZADO"
            End Select

        Loop

        myReader.Close()
        mysqlConex.Close()

    End Sub
    Private Sub MuestraContenidosAprendidos()


        ''Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        ''Dim lusuario As String = Session("usuario")

        ''Dim mycmd As MySqlCommand
        ''mycmd = mysqlConex.CreateCommand
        ''mycmd.CommandText = "select tx_descripcion from user_contenido a, tb_contenido b where a.id_contenido = b.id_contenido and " &
        ''                    "a.id_user = '" + lusuario + "' and a.id_unidad=" & ASPxCmbUnidad.Value & " and a.id_tema=" & ASPxCmbTema.Value &
        ''                    " and a.id_unidad=b.id_unidad and a.id_tema=b.id_tema;"

        ''Dim mydataAdapter As New MySqlDataAdapter With {
        ''    .SelectCommand = mycmd
        ''}

        ''mysqlConex.Open()

        ''Dim myDS As New DataSet
        ''mydataAdapter.Fill(myDS, "Temario")


        ''lstAprendidos.DataTextField = "tx_descripcion"
        ''lstAprendidos.DataSource = myDS.Tables("Temario").DefaultView
        ''lstAprendidos.DataBind()

        ''mysqlConex.Close()

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")

        Dim mycmd As MySqlCommand

        Dim lsql As String
        lsql = "select concat(c.no_unidad,'-',d.no_tema,'-', b.tx_descripcion) as Contenido "
        lsql = lsql + "from user_contenido a, tb_contenido b, tb_unidad c, tb_tema d "
        lsql = lsql + " where a.id_unidad = b.id_unidad "
        lsql = lsql + " and a.id_tema = b.id_tema "
        lsql = lsql + " and a.id_unidad = c.id_unidad "
        lsql = lsql + " and a.id_tema = d.id_tema "
        lsql = lsql + " and a.id_contenido = b.id_contenido "
        lsql = lsql + " and a.id_user = '" + lusuario + "'"
        lsql = lsql + " and b.nivel = '" + lnivel + "'"
        lsql = lsql + " and a.id_unidad=" & ASPxCmbUnidad.Value + ""
        lsql = lsql + " and a.id_tema=" & ASPxCmbTema.Value + ""
        lsql = lsql + " And a.id_unidad=b.id_unidad And a.id_tema=b.id_tema;"

        mycmd = mysqlConex.CreateCommand
        mycmd.CommandText = lsql

        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myDS As New DataSet
        mydataAdapter.Fill(myDS, "Temario")

        lstAprendidos.DataTextField = "Contenido"
        lstAprendidos.DataSource = myDS.Tables("Temario").DefaultView
        lstAprendidos.DataBind()

        mysqlConex.Close()


    End Sub
    'Private Sub MuestraRecursosRevisados()


    '    'Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
    '    'Dim lusuario As String = Session("usuario")

    '    ''Dim mycmd As MySqlCommand
    '    ''mycmd = mysqlConex.CreateCommand
    '    ''mycmd.CommandText = "Select tx_nombre_recurso from user_contenido_recursos a, tb_contenido_recurso b " &
    '    ''                    "where a.id_contenido = b.id_contenido And a.id_recurso = b.id_recurso And a.id_user = '" + lusuario + "' and " &
    '    ''                    "a.id_unidad=" & ASPxCmbUnidad.Value & " and a.id_tema=" & ASPxCmbTema.Value & " and a.id_unidad=b.id_unidad and " &
    '    ''                    "a.id_tema=b.id_tema;"

    '    ''Dim mydataAdapter As New MySqlDataAdapter With {
    '    ''    .SelectCommand = mycmd
    '    ''}

    '    ''mysqlConex.Open()

    '    ''Dim myDS As New DataSet
    '    ''mydataAdapter.Fill(myDS, "Recursos")


    '    ''lstRecursosRev.DataTextField = "tx_nombre_recurso"
    '    ''lstRecursosRev.DataSource = myDS.Tables("Recursos").DefaultView
    '    ''lstRecursosRev.DataBind()
    '    ''mysqlConex.Close()

    '    Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

    '    Dim lusuario As String = Session("usuario")
    '    Dim lnivel As String = Session("nivel")

    '    Dim mycmd As MySqlCommand
    '    mycmd = mysqlConex.CreateCommand

    '    Dim lsql As String = ""

    '    lsql = "select b.tx_descripcion as contenidoRev,c.tx_nombre_recurso as recursoRev "
    '    lsql = lsql + " from user_contenido_recursos a, tb_contenido b, tb_contenido_recurso c, tb_unidad d,tb_tema e"
    '    lsql = lsql + " where a.id_unidad = c.id_unidad "
    '    lsql = lsql + " and a.id_tema = c.id_tema "
    '    lsql = lsql + " and a.id_contenido = c.id_contenido "
    '    lsql = lsql + " and a.id_recurso = c.id_recurso "
    '    lsql = lsql + " and a.id_user = '" + lusuario + "'"
    '    lsql = lsql + " and b.nivel = '" + lnivel & "'"
    '    lsql = lsql + " and a.id_unidad = d.id_unidad "
    '    lsql = lsql + " and a.id_tema = e.id_tema "
    '    lsql = lsql + " and a.id_contenido = b.id_contenido "
    '    lsql = lsql + " and a.id_unidad = " + ASPxCmbUnidad.Value + ""
    '    lsql = lsql + " and a.id_tema = " + ASPxCmbTema.Value + ""
    '    mycmd.CommandText = lsql

    '    Dim mydataAdapter As New MySqlDataAdapter

    '    mydataAdapter.SelectCommand = mycmd

    '    mysqlConex.Open()

    '    Dim myDS As New DataSet
    '    mydataAdapter.Fill(myDS, "Recursos")

    '    grvRecursosRevisados.DataSource = myDS
    '    grvRecursosRevisados.DataBind()

    '    mysqlConex.Close()

    'End Sub
    Private Sub MuestraContenidosPorAprender()


        'Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
        'Dim lusuario As String = Session("usuario")
        'Dim mycmd As MySqlCommand
        'mycmd = mysqlConex.CreateCommand
        'mycmd.CommandText = "select a.tx_descripcion from tb_contenido a where not exists " &
        '                    "(select b.id_contenido from user_contenido b where a.id_contenido = b.id_contenido and " &
        '                    "b.id_user = '" + lusuario + "' and b.id_unidad=" & ASPxCmbUnidad.Value & " and id_tema=" & ASPxCmbTema.Value & ");"

        'Dim mydataAdapter As New MySqlDataAdapter With {
        '    .SelectCommand = mycmd
        '}

        'mysqlConex.Open()

        'Dim myDS As New DataSet
        'mydataAdapter.Fill(myDS, "Temario")


        'lstPorAprender.DataTextField = "tx_descripcion"
        'lstPorAprender.DataSource = myDS.Tables("Temario").DefaultView
        'lstPorAprender.DataBind()


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")
        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String = ""

        lsql = "select concat(b.no_unidad,'-',c.no_tema,'-', a.tx_descripcion) as Contenido "
        lsql = lsql + "from tb_contenido a, tb_unidad b, tb_tema c "
        lsql = lsql + " where a.nivel = '" + lnivel + "'"
        lsql = lsql + " and a.id_unidad = b.id_unidad "
        lsql = lsql + " and a.id_unidad = c.id_unidad "
        lsql = lsql + " and a.id_tema = c.id_tema "
        lsql = lsql + " and Not exists(select b.id_contenido from user_contenido b "
        lsql = lsql + " where a.id_unidad = b.id_unidad "
        lsql = lsql + " and a.id_tema = b.id_tema "
        lsql = lsql + " and a.id_contenido = b.id_contenido "
        lsql = lsql + " and b.id_user = '" + lusuario + "')"
        lsql = lsql + " and a.id_unidad=" & ASPxCmbUnidad.Value + " "
        lsql = lsql + " and a.id_tema= " & ASPxCmbTema.Value + ";"

        mycmd.CommandText = lsql
        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myDS As New DataSet
        mydataAdapter.Fill(myDS, "Temario")


        lstPorAprender.DataTextField = "Contenido"
        lstPorAprender.DataSource = myDS.Tables("Temario").DefaultView
        lstPorAprender.DataBind()


    End Sub

    ''Private Sub MuestraRecursosPorRevisar()

    ''    Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
    ''    Dim lusuario As String = Session("usuario")
    ''    Dim lnivel As String = Session("nivel")

    ''    Dim mycmd As MySqlCommand
    ''    mycmd = mysqlConex.CreateCommand

    ''    Dim lsql As String = ""


    ''    lsql = "select c.tx_descripcion as contenido,a.tx_nombre_recurso as recurso "
    ''    lsql = lsql + "From tb_contenido_recurso a, tb_contenido c, tb_unidad d, tb_tema e "
    ''    lsql = lsql + "where a.id_unidad = c.id_unidad "
    ''    lsql = lsql + "and a.id_tema = c.id_tema "
    ''    lsql = lsql + "and a.id_contenido = c.id_contenido "
    ''    lsql = lsql + "and c.nivel = '" + lnivel + "' "
    ''    lsql = lsql + "and a.id_unidad = d.id_unidad "
    ''    lsql = lsql + "and a.id_tema = e.id_tema "
    ''    lsql = lsql + "and not exists (select a.id_recurso "
    ''    lsql = lsql + "from user_contenido_recursos b "
    ''    lsql = lsql + "where a.id_unidad = b.id_unidad "
    ''    lsql = lsql + "and a.id_tema = b.id_tema "
    ''    lsql = lsql + "and a.id_contenido = b.id_contenido "
    ''    lsql = lsql + "And a.id_recurso = b.id_recurso "
    ''    lsql = lsql + "and b.id_user = '" + lusuario + "')"
    ''    lsql = lsql + "and a.id_unidad = " + ASPxCmbUnidad.Value + " "
    ''    lsql = lsql + "and a.id_tema = " + ASPxCmbTema.Value & ""

    ''    mycmd.CommandText = lsql
    ''    Dim mydataAdapter As New MySqlDataAdapter

    ''    mydataAdapter.SelectCommand = mycmd

    ''    mysqlConex.Open()

    ''    Dim myDS As New DataSet
    ''    mydataAdapter.Fill(myDS, "Recurso")

    ''    grvRecursosPorRevisar.DataSource = myDS
    ''    grvRecursosPorRevisar.DataBind()

    ''    mysqlConex.Close()


    ''End Sub
    Protected Sub LnkPreguntas_Click()


        Dim lcont As Integer = 0

        lcont = FPreguntasPorContestar()


        If lcont > 0 Then
            Response.Redirect("EvaluacionEstudiante.aspx")
        Else
            'ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('No existen preguntas por contestar');", True)
            lblmessager.Text = "No existen preguntas por contestar"
            popupmensaje.ShowOnPageLoad = True
        End If


    End Sub
    Private Function FcantidadPreguntas() As Integer


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()


        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        Dim lsql As String = ""
        lsql = "select valor from tb_parametro where parametro = 'preguntas'"
        mycmd.CommandText = lsql

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        FcantidadPreguntas = 0

        Do While myReader.Read()
            FcantidadPreguntas = Int(myReader.GetString(0))
        Loop

        myReader.Close()
        mysqlConex.Close()

    End Function
    Private Function FPreguntasPorContestar() As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)
        Dim lusuario As String = Session("usuario")
        Dim lnivel As String = Session("nivel")
        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String
        lsql = "select count(*) "
        lsql = lsql + "from tb_contenido b, tb_preguntas c "
        lsql = lsql + "where b.nivel = '" + lnivel + "'"
        lsql = lsql + " and b.id_contenido = c.id_contenido and "
        lsql = lsql + " b.id_unidad=c.id_unidad and "
        lsql = lsql + " b.id_tema=c.id_tema and "
        lsql = lsql + " b.id_unidad=" + ASPxCmbUnidad.Value + " and "
        lsql = lsql + "b.id_tema=" + ASPxCmbTema.Value + ""

        mycmd.CommandText = lsql

        Dim mydataAdapter As New MySqlDataAdapter

        mydataAdapter.SelectCommand = mycmd

        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        FPreguntasPorContestar = 0

        Do While myReader.Read()
            FPreguntasPorContestar = myReader.GetInt32(0)
        Loop

        myReader.Close()
        mysqlConex.Close()

    End Function

    Private Sub MostrarContenidos()

        ''Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        ''mysqlConex.Open()

        ''Dim mycmd As MySqlCommand
        ''mycmd = mysqlConex.CreateCommand
        ''mycmd.CommandText = "SELECT secuencia,tx_descripcion FROM TB_contenido order by secuencia"

        ''Dim myreader As MySqlDataReader

        ''myreader = mycmd.ExecuteReader()
        ''Dim cont As Int16 = 0

        ''lstContenidos.Items.Clear()

        ''Do While myreader.Read()

        ''    cont = cont + 1

        ''    Dim lcontenido As String = ""
        ''    lcontenido = myreader.GetString(0).Trim + " - " + myreader.GetString(1).Trim
        ''    lstContenidos.Items.Add(lcontenido)

        ''Loop

        ''myreader.Close()
        ''mysqlConex.Close()
    End Sub


    Private Sub CargarRecursos()
        'Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        'mysqlConex.Open()

        'Dim lcontenido As String

        'lcontenido = lstContenidos.SelectedItem.Text.ToString()

        'Dim lidContenido As Int16 = Mid(lcontenido, 1, fposicion(lcontenido))

        'Dim mycmd As MySqlCommand
        'mycmd = mysqlConex.CreateCommand
        'mycmd.CommandText = "select tx_nombre_recurso from tb_contenido_recurso where id_contenido = " & lidContenido

        'Dim myreader As MySqlDataReader

        'myreader = mycmd.ExecuteReader()
        'Dim cont As Int16 = 0

        'Do While myreader.Read()

        '    Dim hpl As HyperLink = New HyperLink
        '    cont = cont + 1

        '    hpl.ID = "hpl" + CStr(cont)
        '    Dim lrecurso As String = ""
        '    lrecurso = myreader.GetString(0).Trim
        '    hpl.NavigateUrl = "Recurso/" + lrecurso
        '    hpl.Text = lrecurso
        '    EnsureChildControls()
        '    Me.panel.Controls.Add(hpl)

        '    Dim item = New HtmlGenericControl("div")
        '    Me.panel.Controls.Add(item)
        'Loop

        'myreader.Close()
        'mysqlConex.Close()

    End Sub

    Protected Function Fposicion(ltexto As String) As Int16

        Fposicion = 0

        Fposicion = InStr(1, ltexto, "-") - 2

        Return Fposicion

    End Function

    Protected Sub BtnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        ''lsql = "select id_recurso,id_contenido,tx_nombre_recurso,concat('" & rutaContenido & "',tx_nombre_recurso) as url,concat(id_recurso,'-',tx_nombre_recurso) as data_audi from tb_contenido_recurso where id_contenido=" & ASPxCmbContenidos.SelectedItem.Value
        'lsql = "select id_recurso,id_contenido,tx_nombre_recurso,(if(tipo_recurso<>7,concat('" & rutaContenido & "',tx_nombre_recurso),'')) as url,concat(id_recurso,'-',tx_nombre_recurso) as data_audi, (if(tipo_recurso=7,'Ejercicio','')) as ejercicio from tb_contenido_recurso where id_contenido=" & ASPxCmbContenidos.SelectedItem.Value

        'SqlDataRecursos.SelectCommand = lsql

        'AspxGrigCont_Recurso.DataBind()

        AspxGrigCont_Recurso.DataBind()

    End Sub

    Sub LlenaMenu()

        Dim menuitemX As New DevExpress.Web.MenuItem
        Dim menuitemCuest As New DevExpress.Web.MenuItem
        ASPxMenu1.Items.Clear()
        menuitemX.Text = "Salir"
        menuitemCuest.Text = "Realizar Cuestionario"

        menuitemX.ItemStyle.Font.Bold = True
        menuitemCuest.ItemStyle.Font.Bold = True

        menuitemX.ItemStyle.Font.Size = "8"
        menuitemCuest.ItemStyle.Font.Size = "8"

        menuitemX.Image.Url = "~/Imagenes/ico_salir.png"
        'menuitemX.NavigateUrl = "~/Login.aspx"

        menuitemCuest.Image.Url = "~/Imagenes/ico_cita_previa.png"
        'menuitemCuest.NavigateUrl = "~/EvaluacionEstudiante.aspx"


        ASPxMenu1.Items.Add(menuitemCuest)
        ASPxMenu1.Items.Add(menuitemX)


    End Sub

    Protected Sub ASPxMenu1_ItemClick(source As Object, e As DevExpress.Web.MenuItemEventArgs)
        Select Case e.Item.Index
            Case 0
                LnkPreguntas_Click()
            Case 1
                Response.Redirect("Login.aspx")

        End Select
    End Sub

    Protected Sub ASPxCallback1_Callback(ByVal sender As Object, ByVal e As CallbackEventArgs)


        Dim datos() As String = e.Parameter.Split("|")

        Dim id_unidad As Integer = 1
        Dim id_tema As Integer = 1

        lsql = "INSERT INTO user_contenido_recursos (id_user, id_unidad, id_tema, id_contenido, id_recurso, estado, tipo, respuestas) VALUES ('"
        lsql = lsql & Session("Usuario") & "',"
        lsql = lsql & ASPxCmbUnidad.Value & ","
        lsql = lsql & ASPxCmbTema.Value & ","
        lsql = lsql & datos(1) & ","
        lsql = lsql & datos(0) & ",'A','R','')"

        Dim ClDataCon As New ClDataCon
        ClDataCon.Eje_Sentenci_Mysql(lsql)
        'MsgBox(AspxGrigCont_Recurso.FocusedRowIndex)
    End Sub


    Protected Sub AspxBotOk_Click(sender As Object, e As EventArgs) Handles AspxBotOk.Click

        'MsgBox(AspxGrigCont_Recurso.FocusedRowIndex)

        'MsgBox(AspxGrigCont_Recurso.GetDataRow(AspxGrigCont_Recurso.FocusedRowIndex).Item("id_recurso"))

        'Dim id_unidad As Integer = 1
        'Dim id_tema As Integer = 1

        lsql = "INSERT INTO user_contenido_recursos (id_user, id_unidad, id_tema, id_contenido, id_recurso, estado, tipo, respuestas) VALUES ('"
        lsql = lsql & Session("Usuario") & "',"
        lsql = lsql & ASPxCmbUnidad.Value & ","
        lsql = lsql & ASPxCmbTema.Value & ","
        lsql = lsql & AspxGrigCont_Recurso.GetDataRow(AspxGrigCont_Recurso.FocusedRowIndex).Item("id_contenido") & ","
        lsql = lsql & AspxGrigCont_Recurso.GetDataRow(AspxGrigCont_Recurso.FocusedRowIndex).Item("id_recurso") & ",'A','E','" & ASPxMemoEjer.Text & "')"

        Dim ClDataCon As New ClDataCon
        ClDataCon.Eje_Sentenci_Mysql(lsql)


        popupejercicio.ShowOnPageLoad = False
    End Sub
End Class