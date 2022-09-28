Imports System.Data
Imports System.Data.SqlClient
Imports MySql.Data.MySqlClient

Public Class Menu
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


        ''Dim node As New TreeNode

        '''Create a Command object.

        ''Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

        ''mysqlConex.Open()


        ''Dim mycmd As MySqlCommand
        ''mycmd = mysqlConex.CreateCommand


        ''Dim myReader As MySqlDataReader

        ''Dim cont As Integer
        ''Dim lnombreMenu As String
        ''Dim lpadreMenu As String
        ''lnombreMenu = ""

        ''Dim lrol = Session("rol")

        ''cont = 0

        ''If TrvMenu.Nodes.Count > 0 Then Exit Sub

        ''TrvMenu.Nodes.Clear()

        '''mycmd.CommandText = "SELECT idMenu,nombreMenu,padreMenu FROM TB_MENU where perfil = '" + VariablesGlobales.rol + "' order by idMenu"
        ''mycmd.CommandText = "SELECT idMenu,nombreMenu,padreMenu FROM TB_MENU where perfil = '" + lrol + "' order by idMenu"

        ''myReader = mycmd.ExecuteReader()

        ''Do While myReader.Read()

        ''    Dim lidMenu As String

        ''    lidMenu = myReader.GetString(0).Trim
        ''    lnombreMenu = myReader.GetString(1).Trim
        ''    lpadreMenu = myReader.GetString(2).Trim


        ''    If lpadreMenu = "" Then
        ''        TrvMenu.Nodes.Add(New TreeNode(lnombreMenu, lidMenu))
        ''    Else
        ''        Dim Node1 As TreeNode = GetChildByValue(lpadreMenu, TrvMenu.Nodes)
        ''        If Not Node1 Is Nothing Then
        ''            Node1.ChildNodes.Add(New TreeNode(lnombreMenu, lidMenu))
        ''        End If
        ''    End If

        ''    cont = cont + 1

        ''Loop

        ''myReader.Close()
        ''mysqlConex.Close()

    End Sub

    ''Private Function GetChildByValue(ByVal ID1 As String, ByVal NodeCollection1 As TreeNodeCollection) As TreeNode
    ''    ''For Each TreeNode1 As TreeNode In NodeCollection1
    ''    ''    If TreeNode1.Value = ID1 Then
    ''    ''        Return TreeNode1
    ''    ''    Else
    ''    ''        Dim TreeNode2 As TreeNode = GetChildByValue(ID1, TreeNode1.ChildNodes)

    ''    ''        If Not TreeNode2 Is Nothing Then
    ''    ''            Return TreeNode2
    ''    ''        End If
    ''    ''    End If
    ''    ''Next

    ''    ''Return Nothing
    ''End Function

    ''Protected Sub TrvMenu_SelectedNodeChanged(sender As Object, e As EventArgs) Handles TrvMenu.SelectedNodeChanged


    ''    ''Dim mysqlConex As MySqlConnection = New MySqlConnection(conexionbase)

    ''    ''mysqlConex.Open()


    ''    ''Dim mycmd As MySqlCommand
    ''    ''mycmd = mysqlConex.CreateCommand
    ''    ''mycmd.CommandText = "SELECT forma FROM TB_MENU where nombreMenu = '" & TrvMenu.SelectedNode.Text & "'"

    ''    '''Open the connection.


    ''    ''Dim myReader As MySqlDataReader

    ''    ''myReader = myCmd.ExecuteReader()

    ''    ''Dim lforma As String

    ''    ''lforma = ""
    ''    ''Do While myReader.Read()
    ''    ''    lforma = myReader.GetString(0).Trim
    ''    ''Loop

    ''    ''myReader.Close()
    ''    ''mysqlConex.Close()

    ''    '''Display results.
    ''    ''If Len(lforma) > 0 Then
    ''    ''    Response.Redirect(lforma + ".aspx")
    ''    ''End If

    ''End Sub

    'Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
    '    'Response.Redirect("Login.aspx")
    'End Sub
End Class