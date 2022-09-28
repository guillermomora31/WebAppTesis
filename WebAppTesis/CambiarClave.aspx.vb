Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient

Public Class CambiarClave
    Inherits System.Web.UI.Page

    Public conexionbase As String = System.Configuration.ConfigurationManager.AppSettings("Conexionbase")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click


        Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        mysqlConex.Open()

        Dim mycmd As MySqlCommand
        mycmd = mysqlConex.CreateCommand


        'Create a Command object.

        mycmd.CommandText = "SELECT nombre,clave FROM TB_USUARIO where id = '" & Me.txtUsuario.Text & "'"

        'Open the connection.

        Dim myReader As MySqlDataReader

        If Trim(txtUsuario.Text) = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Ingrese Usuario ...');", True)

            Exit Sub
        End If

        If Trim(txtClaveActual.Text) = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Ingrese Clave actual ...');", True)
            Exit Sub
        End If

        If Trim(txtClaveAnterior.Text) = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Ingrese Clave Anterior ...');", True)

            Exit Sub
        End If

        myReader = myCmd.ExecuteReader()

        Dim cont As Integer
        Dim lusuario As String
        Dim lclave As String

        lusuario = ""
        lclave = ""


        cont = 0

        Do While myReader.Read()
            cont = cont + 1
            lusuario = myReader.GetString(0).Trim
            lclave = myReader.GetString(1).Trim
        Loop

        myReader.Close()
        mysqlConex.Close()

        'Display results.
        If lusuario = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Usuario No existe ...');", True)
            Exit Sub

        End If

        If lclave <> Me.txtClaveAnterior.Text Then

            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Clave Incorrecta ...');", True)
            Exit Sub
        End If


        'Create a Command object.

        Dim lsql As String

        lsql = "UPDATE TB_USUARIO "
        lsql = lsql & "SET CLAVE = '" & Me.txtClaveActual.Text.Trim & "'"
        lsql = lsql & " WHERE id = '" & Me.txtUsuario.Text.Trim & "'"

        mycmd.CommandText = lsql
        myCmd.ExecuteNonQuery()


        ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Clave actualizada con exito ...');", True)

    End Sub

End Class