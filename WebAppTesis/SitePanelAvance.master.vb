
Partial Class SitePanelAvance
    Inherits System.Web.UI.MasterPage

    Private Sub SitePanelAvance_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Call LlenaMenu()
        End If
    End Sub

    'Sub LlenaMenu()

    '    Dim menuitemX As New DevExpress.Web.MenuItem
    '    ASPxMenu1.Items.Clear()
    '    menuitemX.Text = "Salir"

    '    menuitemX.ItemStyle.Font.Bold = True

    '    menuitemX.ItemStyle.Font.Size = "8"

    '    menuitemX.Image.Url = "~/Imagenes/ico_salir.png"
    '    menuitemX.NavigateUrl = "~/Login.aspx"

    '    ASPxMenu1.Items.Add(menuitemX)

    'End Sub
End Class

