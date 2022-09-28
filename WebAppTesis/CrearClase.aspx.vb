Imports System.Data.SqlClient
Public Class CrearClase
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.lstNivel.Items.Clear()
        Me.lstNivel.Items.Add("Basico")
        Me.lstNivel.Items.Add("Intermedio")
        Me.lstNivel.Items.Add("Avanzado")

    End Sub

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click

        Dim myConn As SqlConnection
        Dim myCmd As SqlCommand

        myConn = New SqlConnection("Initial Catalog=DBTutor;Data Source=localhost;Integrated Security=SSPI;")

        myConn.Open()

        If Me.txtClase.Text.Trim = "" Then

            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Ingrese Clase');", True)
            Exit Sub
        End If

        If Me.txtDetalleClase.Text.Trim = "" Then

            ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Ingrese Detalle Clase ...');", True)
            Exit Sub
        End If

        'Create a Command object.
        myCmd = myConn.CreateCommand
        myCmd.Connection = myConn

        Dim lsql As String

        lsql = "INSERT INTO TB_CLASE VALUES ('"
        lsql = lsql & Me.txtClase.Text & "','"
        lsql = lsql & Me.txtDetalleClase.Text & "','"
        lsql = lsql & Mid(Me.lstNivel.SelectedValue.Trim, 1, 1) & "')"

        myCmd.CommandText = lsql

        myCmd.ExecuteNonQuery()


        ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "alert('Registro exitoso ...');", True)


    End Sub

    Protected Sub btnInicio_Click(sender As Object, e As EventArgs) Handles btnInicio.Click
        Response.Redirect("Menu.aspx")
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click
        Dispose()
    End Sub

    Protected Sub btnGenerar_Click(sender As Object, e As EventArgs) Handles btnGenerar.Click

    End Sub
End Class