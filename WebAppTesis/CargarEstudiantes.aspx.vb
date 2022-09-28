Imports System.IO
Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient

Imports ClosedXML.Excel
Imports System.Data

Public Class CargarEstudiantes
    Inherits System.Web.UI.Page

    Dim lbtn As LinkButton = New LinkButton
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

    Protected Sub btnCargar_Click(sender As Object, e As EventArgs) Handles btnCargar.Click

        Dim lvalor As String = System.Configuration.ConfigurationManager.AppSettings("rutaContenido")

        Dim filePath As String = lvalor + Path.GetFileName(fuplCargar.PostedFile.FileName)

        fuplCargar.SaveAs(Server.MapPath(filePath + fuplCargar.FileName))

        Dim dt As New DataTable()

        Dim cont As Integer
        cont = 0

        Using workBook As New XLWorkbook(filePath)


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

        Dim lid As String
        Dim lnombre As String
        Dim lcorreo As String
        Dim lclase As String
        Dim lnivel As String

        LstNovedades.Items.Clear()

        For Each row As DataRow In dt.Rows

            lid = ""
            lnombre = ""
            lcorreo = ""
            lclase = ""

            If Not IsDBNull(row("id")) Then
                lid = CStr(row("id"))
            End If

            If Not IsDBNull(row("nombre")) Then
                lnombre = CStr(row("nombre"))
            End If

            If Not IsDBNull(row("correo")) Then
                lcorreo = CStr(row("correo"))
            End If

            If Not IsDBNull(row("clase")) Then
                lclase = CStr(row("clase"))
            End If

            If Not IsDBNull(row("nivel")) Then
                lnivel = CStr(row("nivel"))
            End If

            Dim lnovedad As String
            Dim lvalida As Boolean

            lnovedad = ""

            If lid <> "" And lnombre <> "" Then
                lvalida = VerificaEstudiante(lid)
                If lvalida = False Then

                    lnovedad = GrabaEstudiante(lid, lnombre, lcorreo, lclase, lnivel)
                Else
                    lnovedad = "Usuario " + lid + " Ya existe"
                End If

            End If

            If lnovedad <> "" Then
                LstNovedades.Items.Add(lnovedad)
            End If

        Next
        ASPxLblMensaje.Text = "Carga exitosa ..."

    End Sub
    Private Function VerificaEstudiante(lfid As String) As Boolean

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand
        mycmd.CommandText = "SELECT nombre FROM TB_USUARIO where id = '" & lfid & "'"

        Dim myReader As MySqlDataReader

        myReader = mycmd.ExecuteReader()

        Dim lnombre As String

        lnombre = ""

        VerificaEstudiante = False

        Do While myReader.Read()
            VerificaEstudiante = True
        Loop

        myReader.Close()
        mysqlConex.Close()

        Return VerificaEstudiante

    End Function


    Private Function GrabaEstudiante(lfid As String, lfnombre As String, lfcorreo As String, lfclase As String, lfnivel As String) As String

        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand

        Dim lsql As String


        lsql = "INSERT INTO TB_USUARIO VALUES (0,'"
        lsql = lsql & lfid & "','123','"
        lsql = lsql & lfnombre & "','"
        lsql = lsql & lfcorreo & "','E','"
        lsql = lsql & lfclase & "','"
        lsql = lsql & lfnivel & "')"

        mycmd.CommandText = lsql

        mycmd.ExecuteNonQuery()

        GrabaEstudiante = "Usuario " + lfid + " se grabo correctamente"

    End Function


End Class