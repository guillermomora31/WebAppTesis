Imports MySql.Data.MySqlClient
Public Class Recursos_Ing

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

            ASPxCmbRecursos.DataBind()
            If ASPxCmbRecursos.Items.Count > 0 Then
                ASPxCmbRecursos.SelectedIndex = 0
            End If


        End If
    End Sub

    'Private Sub mostrarContenidos()


    '    Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

    '    mysqlConex.Open()

    '    Dim mycmd As MySqlCommand
    '    mycmd = mysqlConex.CreateCommand
    '    mycmd.CommandText = "SELECT secuencia,tx_descripcion FROM TB_contenido order by secuencia"

    '    Dim myreader As MySqlDataReader

    '    myreader = mycmd.ExecuteReader()
    '    Dim cont As Int16 = 0

    '    lstContenidos.Items.Clear()

    '    Do While myreader.Read()

    '        cont = cont + 1

    '        Dim lcontenido As String = ""
    '        lcontenido = myreader.GetString(0).Trim + " - " + myreader.GetString(1).Trim
    '        lstContenidos.Items.Add(lcontenido)

    '    Loop

    '    myreader.Close()
    '    mysqlConex.Close()
    'End Sub

    'Private Sub mostrarRecursos()

    '    Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

    '    mysqlConex.Open()

    '    Dim mycmd As MySqlCommand
    '    mycmd = mysqlConex.CreateCommand
    '    mycmd.CommandText = "SELECT id,valor FROM TB_CATALOGO WHERE id_catalogo = 'recursos' order by id"

    '    Dim myreader As MySqlDataReader

    '    myreader = mycmd.ExecuteReader()
    '    Dim cont As Int16 = 0

    '    lstRecursos.Items.Clear()

    '    Do While myreader.Read()

    '        cont = cont + 1

    '        Dim lcontenido As String = ""
    '        lcontenido = myreader.GetString(0).Trim + " - " + myreader.GetString(1).Trim

    '        lstRecursos.Items.Add(lcontenido)

    '    Loop

    '    myreader.Close()
    '    mysqlConex.Close()

    'End Sub

    Protected Sub btnCargar_Click(sender As Object, e As EventArgs) Handles btnCargar.Click

        Dim lcontenido As String = ""
        Dim lrecurso As String

        Dim lunidad As String = ""
        Dim ltema As String = ""

        'lrecurso = lstRecursos.SelectedItem.Text.ToString()
        lrecurso = ASPxCmbRecursos.Value

        'lcontenido = lstContenidos.SelectedItem.Text.ToString()
        lcontenido = ASPxCmbContenidos.Value

        lunidad = ASPxCmbUnidad.Value

        ltema = ASPxCmbTema.Value

        Dim lruta As String = RUTA_DATOS()

        If Me.fuplCargar.HasFile Then

            Dim ext As String = System.IO.Path.GetExtension(fuplCargar.FileName)

            Dim tamanoNombre As Integer = Len(fuplCargar.FileName)

            Dim ltamano As Long = fTamanoFile()

            Dim ltamano_mega = ltamano / 1024

            If tamanoNombre > 256 Then

                'ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Nombre del archivo demasiado grande ...');", True)
                lblmessager.Text = "Nombre del archivo demasiado grande ..."
                popupmensaje.ShowOnPageLoad = True
                Exit Sub
            End If

            ext = ext.ToLower()

            Dim tamano As Long

            tamano = (fuplCargar.PostedFile.ContentLength) / 1024

            Dim lmensaje As String = ""

            lmensaje = "alert('Tamano del archivo mayor a " + ltamano_mega.ToString + " MB...');"

            If tamano > ltamano Then
                'ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", lmensaje, True)
                lblmessager.Text = lmensaje
                popupmensaje.ShowOnPageLoad = True
                Exit Sub
            End If

            fuplCargar.SaveAs(Server.MapPath(lruta + fuplCargar.FileName))

        Else

            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Seleccione un archivo para cargar ...');", True)
            lblmessager.Text = "Seleccione un archivo para cargar ..."
            popupmensaje.ShowOnPageLoad = True
            Exit Sub

        End If

        Dim lsql As String


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        lsql = "INSERT INTO TB_CONTENIDO_RECURSO VALUES (0,"
        lsql = lsql & lunidad & ","
        lsql = lsql & ltema & ","
        lsql = lsql & lcontenido & ","
        lsql = lsql & lrecurso & ",'"
        lsql = lsql & fuplCargar.FileName & "','"
        lsql = lsql & Me.txtObservacion.Text.Trim & "')"
        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()

        'mostrarContenidosRecursos()

        'ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Registro grabado con exito...');", True)
        lblmessager.Text = "Grabacion Ok!"
        popupmensaje.ShowOnPageLoad = True
    End Sub

    Protected Function fposicion(ltexto As String) As Int16

        fposicion = 0

        fposicion = InStr(1, ltexto, "-") - 2

        Return fposicion

    End Function

    Public Sub mostrarLista()

        Dim lpath As String

        'grvRecursos.Items.Clear()

        lpath = RUTA_DATOS()

        For Each foundFile As String In My.Computer.FileSystem.GetFiles(lpath)
            '   lstfiles.Items.Add(foundFile)
        Next

    End Sub

    Private Function RUTA_DATOS() As String


        Dim lvalor As String = System.Configuration.ConfigurationManager.AppSettings("rutaContenido")

        Return lvalor

    End Function

    Private Function fTamanoFile() As Long

        'Create a Command object.
        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        Dim mycmd As MySqlCommand 'Create a Command object.
        mycmd = mysqlConex.CreateCommand
        mycmd.CommandText = "SELECT VALOR FROM TB_PARAMETRO where PARAMETRO = 'TAMANO_ARCHIVO'"

        'Open the connection.
        mysqlConex.Open()

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        Dim ltamano As Long

        Do While myReader.Read()

            ltamano = CLng(myReader.GetString(0))
        Loop

        myReader.Close()
        mysqlConex.Close()

        Return ltamano

    End Function

    Protected Function mostrarTemario()


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

        Return ltema

    End Function


    ''Protected Sub mostrarContenidosRecursos()

    ''    Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)


    ''    Dim lsql As String

    ''    Dim mycmd As MySqlCommand
    ''    mycmd = mysqlConex.CreateCommand

    ''    lsql = "select a.id_contenido as idContenido,b.tx_descripcion as Contenido,a.id_recurso as idRecurso,"
    ''    lsql = lsql + "a.tx_nombre_recurso as Recurso "
    ''    lsql = lsql + " from tb_contenido_recurso a , tb_contenido b "
    ''    lsql = lsql + " where a.id_contenido = b.id_contenido;"
    ''    mycmd.CommandText = lsql

    ''    Dim mydataAdapter As New MySqlDataAdapter

    ''    mydataAdapter.SelectCommand = mycmd

    ''    mysqlConex.Open()

    ''    Dim myDS As New Data.DataSet
    ''    mydataAdapter.Fill(myDS, "Temario")

    ''    grvRecursos.DataSource = myDS
    ''    grvRecursos.DataBind()


    ''End Sub

    ''Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click

    ''    For Each grv As GridViewRow In grvRecursos.Rows
    ''        If DirectCast(grv.FindControl("CheckBox2"), CheckBox).Checked Then
    ''            Call eliminaContenidoRecurso(grv.Cells(1).Text, grv.Cells(3).Text)
    ''            Call eliminaArchivo(grv.Cells(4).Text)
    ''        End If
    ''    Next

    ''    mostrarContenidosRecursos()
    ''    ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Recurso Eliminado OK');", True)

    ''End Sub

    ''Protected Sub eliminaContenidoRecurso(idContenido As String, idRecurso As String)

    ''    Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

    ''    mysqlConex.Open()

    ''    Dim mycmd As MySqlCommand
    ''    mycmd = mysqlConex.CreateCommand

    ''    Dim lsql As String

    ''    lsql = "DELETE FROM TB_CONTENIDO_RECURSO"
    ''    lsql = lsql + " where ID_CONTENIDO = " + idContenido + ""
    ''    lsql = lsql + " and ID_recurso = " + idRecurso + ""

    ''    mycmd.CommandText = lsql
    ''    mycmd.ExecuteNonQuery()



    ''End Sub

    ''Protected Sub eliminaArchivo(larchivo As String)

    ''    Dim lruta As String = RUTA_DATOS()
    ''    Dim lpath As String

    ''    lpath = Server.MapPath(lruta + larchivo)

    ''    System.IO.File.Delete(lpath)

    ''End Sub

    Protected Sub ASPxBtnRegresar_Click(sender As Object, e As EventArgs) Handles ASPxBtnRegresar.Click
        Response.Redirect("Recursos.aspx")
    End Sub


End Class