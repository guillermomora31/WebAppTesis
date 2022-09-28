<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="SiteMenu.Master" CodeFile="CargarPreguntas.aspx.vb" Inherits="CargarPreguntas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StyleTesis.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .normal_letter {
            text-align: center;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table border="0" style="margin: 0 auto;border-collapse: separate; border-spacing: 2px; width:100%">
        <tr>
            <td align="center">
                <dx:ASPxLabel runat="server" Text="CARGAR INFORMACION DE PREGUNTAS" Width="100%" BackColor="#993333" Font-Bold="True" ForeColor="White" ID="ASPxLabel1" Font-Size="18px">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table border="0" class="normal_letter" >
                    <tr>
                        <td>
                            Archivo:</td>
                        <td>
                            <asp:FileUpload CssClass="normal_letter" ID="fuplCargar" Font-Bold="True" runat="server"  />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <dx:ASPxButton ID="btnCargar" BackColor="#993333" Font-Bold="True" ForeColor="White" Native="True" ClientInstanceName="btnCargar" runat="server" Text="Cargar">
                            </dx:ASPxButton>
                            
                         </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <dx:ASPxLabel runat="server" Text="" Width="100%" BackColor="#993333" Font-Bold="True" ForeColor="White" ID="ASPxLblMensaje" CssClass="normal_letter" >
                            </dx:ASPxLabel>
                         </td>
                    </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <dx:ASPxLabel runat="server" Text="NOVEDAD" Width="100%" BackColor="#993333" Font-Bold="True" ForeColor="White" ID="ASPxLabel2" Font-Size="16px">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:ListBox ID="LstNovedades" runat="server" Width="90%" Height="430px"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;</td>
        </tr>
    </table>




    </asp:Content>
