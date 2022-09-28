Imports System.Data
Imports DevExpress.Web
Imports MySql.Data.MySqlClient
Public Class ResumenRespuestas
    Inherits System.Web.UI.Page

    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")
    Public rutaContenido As String = System.Configuration.ConfigurationManager.AppSettings("rutaContenido")

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
            Session("ruta") = rutaContenido
            'Call llenaGrid()
            muestraDatosTema()
            LlenaMenu()
            ApplyLayoud(0)

            Dim lcont As Integer = fRecursos()
            If lcont > 0 Then
                Me.lblMensaje.Visible = True
                Me.lblMensaje.Text = "Se recomiendo revisar los siguientes recursos en observaciones"
                'Call llenaMensajes()
            End If


        End If

    End Sub

    Private Sub llenaGrid()

        ''Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        ''Dim mycmd As MySqlCommand
        ''mycmd = mysqlConex.CreateCommand

        Dim lusuario As String = Session("usuario")
        Dim lsql As String

        lsql = "SELECT concat(a.id_pregunta,'-',b.intento) as clave,a.id_pregunta as Pregunta,a.tx_nombre_pregunta as Detalle,b.respuesta as Correcta,b.intento as Intentos,a.tx_feed_back as Retroalimentacion  "
        lsql = lsql + "FROM TB_preguntas a, user_preguntas b  "
        lsql = lsql + "where a.id_contenido = b.id_contenido "
        lsql = lsql + " and a.id_pregunta = b.id_pregunta "
        lsql = lsql + " and b.id_user = '" + lusuario + "'"



        SqlDataResumen.SelectCommand = lsql

        AspxGrigCont_Recurso.DataBind()


        ''mycmd.CommandText = lsql

        ''Dim mydataAdapter As New MySqlDataAdapter

        ''mydataAdapter.SelectCommand = mycmd

        ''mysqlConex.Open()

        ''Dim myDS As New DataSet
        ''mydataAdapter.Fill(myDS, "Respuestas")

        ''grdRespuestas.DataSource = myDS
        ''grdRespuestas.DataBind()
    End Sub

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

    Sub LlenaMenu()

        Dim menuitemX As New DevExpress.Web.MenuItem

        ASPxMenu1.Items.Clear()
        menuitemX.Text = "Panel Principal Estudiante"

        menuitemX.ItemStyle.Font.Bold = True

        menuitemX.ItemStyle.Font.Size = "8"

        menuitemX.Image.Url = "~/Imagenes/ico_cita_previa.png"
        menuitemX.NavigateUrl = "~/PanelAvance.aspx"

        ASPxMenu1.Items.Add(menuitemX)


    End Sub

    Private Sub ApplyLayoud(ByVal layoudIndex As Integer)
        AspxGrigCont_Recurso.BeginUpdate()
        Try
            AspxGrigCont_Recurso.ClearSort()
            Select Case layoudIndex
                Case 0
                    AspxGrigCont_Recurso.GroupBy(CType(AspxGrigCont_Recurso.Columns("Intentos"), GridViewDataColumn))
            End Select
        Finally

            AspxGrigCont_Recurso.EndUpdate()
        End Try
    End Sub


    Private Function fRecursos() As Integer

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lusuario As String = Session("usuario")
        Dim lsql As String

        lsql = " select count(distinct a.tx_nombre_recurso)  "
        lsql = lsql + "from tb_contenido_recurso a, user_preguntas b "
        lsql = lsql + " where a.id_contenido = b.id_contenido "
        lsql = lsql + " and b.respuesta = 'N' "
        lsql = lsql + " and b.id_user = '" + lusuario + "'"

        mycmd.CommandText = lsql

        mycmd.CommandText = lsql
        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        fRecursos = 0

        Do While myReader.Read()

            fRecursos = myReader.GetInt32(0)

        Loop

        myReader.Close()
        mysqlConex.Close()


    End Function

    Private Sub llenaMensajes()
        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lusuario As String = Session("usuario")
        Dim lsql As String

        lsql = " select distinct id_recurso, a.tx_nombre_recurso as Recurso, concat('" & rutaContenido & "',tx_nombre_recurso) as url "
        lsql = lsql + "from tb_contenido_recurso a, user_preguntas b "
        lsql = lsql + " where a.id_contenido = b.id_contenido "
        lsql = lsql + " and b.respuesta = 'N' "
        lsql = lsql + " and b.id_user = '" + lusuario + "'"



        SqlDataObser.SelectCommand = lsql

        AspxGrigRecurso.DataBind()

        ''mycmd.CommandText = lsql

        ''Dim mydataAdapter As New MySqlDataAdapter

        ''mydataAdapter.SelectCommand = mycmd

        ''mysqlConex.Open()

        ''Dim myDS As New DataSet
        ''mydataAdapter.Fill(myDS, "Recursos")


        'grvRecursos.DataSource = myDS
        'grvRecursos.DataBind()
    End Sub


End Class