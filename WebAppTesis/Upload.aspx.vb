Imports System.Data.SqlClient
Public Class WebFrmUpload
    Inherits System.Web.UI.Page

    Public rutaFile As String = System.Configuration.ConfigurationManager.AppSettings("rutaContenido")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Call mostrarLista()

    End Sub

    Protected Sub btnCargar_Click(sender As Object, e As EventArgs) Handles btnCargar.Click


        If Me.fuplCargar.HasFile Then

            Dim ext As String = System.IO.Path.GetExtension(fuplCargar.FileName)

            Dim tamanoNombre As Integer = Len(fuplCargar.FileName)

            If tamanoNombre > 256 Then

                ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Nombre del archivo demasiado grande ...');", True)
                Exit Sub
            End If

            ext = ext.ToLower()

            Dim tamano As Long

            tamano = (fuplCargar.PostedFile.ContentLength) / 1024

            If tamano > fTamanoFile() Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Tamano del archivo mayor a 200 MB ...');", True)

                Exit Sub
            End If

            'fuplCargar.SaveAs(Server.MapPath(lruta + fuplCargar.FileName))

            fuplCargar.SaveAs(rutaFile + fuplCargar.FileName)

            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Aechivo cargado con exito ...');", True)


        Else

            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Seleccione un archivo para cargar ...');", True)
            Exit Sub
        End If

        Call mostrarLista()


    End Sub

    Public Sub mostrarLista()

        Dim lpath As String

        lstfiles.Items.Clear()

        lpath = rutaFile

        For Each foundFile As String In My.Computer.FileSystem.GetFiles(lpath)
            lstfiles.Items.Add(foundFile)
        Next

    End Sub

    Private Function fTamanoFile() As Long

        Dim myConn As SqlConnection
        Dim myCmd As SqlCommand

        myConn = New SqlConnection("Initial Catalog=DBTutor;Data Source=localhost;Integrated Security=SSPI;")

        'Create a Command object.
        myCmd = myConn.CreateCommand
        myCmd.CommandText = "SELECT VALOR FROM TB_PARAMETRO where PARAMETRO = 'TAMANO_ARCHIVO'"

        'Open the connection.
        myConn.Open()

        Dim myReader As SqlDataReader

        myReader = myCmd.ExecuteReader()

        Dim ltamano As Long

        Do While myReader.Read()

            ltamano = CLng(myReader.GetString(0))
        Loop

        myReader.Close()


        Return ltamano

    End Function
End Class