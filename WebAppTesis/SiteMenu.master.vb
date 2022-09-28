
Imports System.Data

Partial Class SiteMenu
    Inherits System.Web.UI.MasterPage

    Private Sub SitePanelAvance_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Call LlenaMenu()
            ASPxLblNom_usua.Text = "Usuario: " & Session("nombre")
        End If
    End Sub

    Sub LlenaMenu()
        Dim lsql As String
        Dim DataSet As New DataSet
        DataSet = Nothing

        Dim ClDataCon = New ClDataCon

        ASPxMenu1.Items.Clear()

        Try

            Dim lrol = Session("rol")

            lsql = "SELECT idMenu,nombreMenu,padreMenu FROM TB_MENU where perfil = '" + lrol + "' and padremenu='' order by idMenu;" &
                   "SELECT idMenu,nombreMenu,padreMenu,forma FROM TB_MENU where perfil = '" + lrol + "' and padremenu<>'' order by idMenu;"

            ClDataCon.ConsultaDB(lsql, DataSet)

            Dim rowDataNodo As DataRow
            Dim DtableConsulNodo As Data.DataTable = DataSet.Tables(0)
            Dim currentRowsNodo() As DataRow = DtableConsulNodo.Select(Nothing, Nothing, DataViewRowState.CurrentRows)
            Dim lwindice As Integer = 0

            Dim cont As Integer
            Dim lnombreMenu As String
            Dim lpadreMenu As String
            lnombreMenu = ""


            For Each rowDataNodo In currentRowsNodo
                Dim lidMenu As String

                lidMenu = rowDataNodo(0)
                lnombreMenu = rowDataNodo(1).ToString
                lpadreMenu = rowDataNodo(2).ToString


                Dim menuitem As New DevExpress.Web.MenuItem With {
                    .Text = lnombreMenu
                }
                menuitem.ItemStyle.Font.Bold = True
                menuitem.ItemStyle.Font.Size = "8"
                If lrol = "A" Then
                    menuitem.Image.Url = "~/Imagenes/ico_gestion_operativa.png"
                Else
                    menuitem.Image.Url = "~/Imagenes/ico_instructivo.png"
                End If


                Dim DtableConsulItem As Data.DataTable = DataSet.Tables(1)
                'Dim currentRowsItem() As DataRow = DtableConsulItem.Select("dep_funcion = " & rowDataNodo("cod_funcion"), Nothing, DataViewRowState.CurrentRows)
                Dim currentRowsItem() As DataRow = DtableConsulItem.Select(Nothing, Nothing, DataViewRowState.CurrentRows)

                Dim rowDataItem As DataRow
                For Each rowDataItem In currentRowsItem
                    lwindice = lwindice + 1
                    Dim menuitem1 As New DevExpress.Web.MenuItem With {
                        .Text = rowDataItem(1),
                        .NavigateUrl = ResolveUrl(rowDataItem(3).ToString & ".aspx")
                    }
                    menuitem.Items.Add(menuitem1)
                Next


                ASPxMenu1.Items.Add(menuitem)
            Next

            Dim menuitemX As New DevExpress.Web.MenuItem With {
                .Text = "Salir"
            }

            menuitemX.ItemStyle.Font.Bold = True

            menuitemX.ItemStyle.Font.Size = "8"

            menuitemX.Image.Url = "~/Imagenes/ico_salir.png"
            menuitemX.NavigateUrl = "~/Login.aspx"

            ASPxMenu1.Items.Add(menuitemX)


        Catch ex As Exception

        End Try

    End Sub

    Private Sub SiteMenu_Init(sender As Object, e As EventArgs) Handles Me.Init
        If String.IsNullOrEmpty(Session("Usuario")) Then
            Me.Response.Redirect("Login.aspx", True)
        End If
    End Sub
End Class

