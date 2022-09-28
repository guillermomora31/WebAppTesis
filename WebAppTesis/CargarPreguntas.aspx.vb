Imports System.IO
Imports MySql.Data.MySqlClient
Imports ClosedXML.Excel
Imports System.Data

Public Class CargarPreguntas
    Inherits System.Web.UI.Page

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
            ASPxLblMensaje.Text = ""
        End If

    End Sub

    Protected Sub btnGrabar_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnCargar_Click(sender As Object, e As EventArgs) Handles btnCargar.Click
        Dim lvalor As String = System.Configuration.ConfigurationManager.AppSettings("rutaContenido")

        Dim filePath As String = lvalor + Path.GetFileName(fuplCargar.PostedFile.FileName)



        fuplCargar.SaveAs(Server.MapPath(filePath))

        Dim dt As New DataTable()

        Dim cont As Integer
        cont = 0

        Using workBook As New XLWorkbook(Server.MapPath(filePath))


            Dim workSheet As IXLWorksheet = workBook.Worksheet(1)

            'Create a new DataTable.


            'Loop through the Worksheet rows.
            Dim firstRow As Boolean = True
            For Each row As IXLRow In workSheet.Rows()
                'Use the first row to add columns to DataTable.
                If firstRow Then
                    For Each cell As IXLCell In row.Cells()
                        dt.Columns.Add(cell.Value.ToString())
                    Next
                    firstRow = False
                Else
                    'Add rows to DataTable.
                    dt.Rows.Add()
                    Dim i As Integer = 0
                    For Each cell As IXLCell In row.Cells()
                        dt.Rows(dt.Rows.Count - 1)(i) = cell.Value.ToString()
                        i += 1
                    Next
                End If

                cont += 1

            Next
        End Using

        Dim lunidad As Integer
        Dim ltema As Integer
        Dim lid_contenido As Integer
        Dim lid_recurso As Integer
        Dim lpregunta As String
        Dim lopcion1 As String
        Dim lcorrecta1 As String
        Dim lopcion2 As String
        Dim lcorrecta2 As String
        Dim lopcion3 As String
        Dim lcorrecta3 As String
        Dim lopcion4 As String
        Dim lcorrecta4 As String
        Dim lfeed_back As String


        LstNovedades.Items.Clear()

        Dim lcont As Integer = 0

        For Each row As DataRow In dt.Rows

            lunidad = 0
            ltema = 0
            lid_contenido = 0
            lpregunta = ""
            lid_recurso = 0
            lopcion1 = ""
            lcorrecta1 = ""
            lopcion2 = ""
            lcorrecta2 = ""
            lopcion3 = ""
            lcorrecta3 = ""
            lopcion4 = ""
            lcorrecta4 = ""
            lfeed_back = ""

            If Not IsDBNull(row("id_unidad")) Then
                lunidad = CStr(row("id_unidad"))
            End If

            If Not IsDBNull(row("id_tema")) Then
                ltema = CStr(row("id_tema"))
            End If

            If Not IsDBNull(row("id_contenido")) Then
                lid_contenido = CStr(row("id_contenido"))
            End If

            If Not IsDBNull(row("id_recurso")) Then
                lid_recurso = CStr(row("id_recurso"))
            End If

            If Not IsDBNull(row("Pregunta")) Then
                lpregunta = CStr(row("Pregunta"))
            End If

            If Not IsDBNull(row("opcion_1")) Then
                lopcion1 = CStr(row("opcion_1"))
            End If

            If Not IsDBNull(row("es_correcta1")) Then
                lcorrecta1 = CStr(row("es_correcta1"))
            End If

            If Not IsDBNull(row("opcion_2")) Then
                lopcion2 = CStr(row("opcion_2"))
            End If

            If Not IsDBNull(row("es_correcta2")) Then
                lcorrecta2 = CStr(row("es_correcta2"))
            End If

            If Not IsDBNull(row("opcion_3")) Then
                lopcion3 = CStr(row("opcion_3"))
            End If

            If Not IsDBNull(row("es_correcta3")) Then
                lcorrecta3 = CStr(row("es_correcta3"))
            End If

            If Not IsDBNull(row("opcion_4")) Then
                lopcion4 = CStr(row("opcion_4"))
            End If

            If Not IsDBNull(row("es_correcta4")) Then
                lcorrecta4 = CStr(row("es_correcta4"))
            End If

            If Not IsDBNull(row("feed_back")) Then
                lfeed_back = CStr(row("feed_back"))
            End If

            Dim lnovedad As String


            lnovedad = ""

            If lid_contenido <> 0 And lpregunta.Trim <> "" Then
                lcont = lcont + 1
                lnovedad = GrabaPregunta(lunidad, ltema, lid_recurso, lid_contenido, lpregunta, lopcion1, lcorrecta1, lopcion2, lcorrecta2, lopcion3, lcorrecta3, lopcion4, lcorrecta4, lfeed_back)
            End If

            If lnovedad <> "" Then
                LstNovedades.Items.Add(lnovedad)
            End If


        Next

        ASPxLblMensaje.Text = "Carga exitosa ..."

    End Sub

    Private Function GrabaPregunta(funidad, ftema, frecurso, fid_contenido, fpregunta, fopcion1, fcorrecta1, fopcion2, fcorrecta2, fopcion3, fcorrecta3, fopcion4, fcorrecta4, ffeed_back) As String

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String

        lsql = "INSERT INTO TB_PREGUNTAS VALUES ("
        lsql = lsql & funidad & ","
        lsql = lsql & ftema & ","
        lsql = lsql & fid_contenido & ",0,'"
        lsql = lsql & fpregunta & "',"
        lsql = lsql & frecurso & ",'"
        lsql = lsql & fopcion1 & "','"
        lsql = lsql & fcorrecta1 & "','"
        lsql = lsql & fopcion2 & "','"
        lsql = lsql & fcorrecta2 & "','"
        lsql = lsql & fopcion3 & "','"
        lsql = lsql & fcorrecta3 & "','"
        lsql = lsql & fopcion4 & "','"
        lsql = lsql & fcorrecta4 & "','A','"
        lsql = lsql & ffeed_back & "')"

        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()

        GrabaPregunta = "Pregunta " + fpregunta + " se grabo correctamente"

    End Function


End Class