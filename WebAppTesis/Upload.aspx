<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Upload.aspx.vb" Inherits="WebApplication1.WebFrmUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-weight: bold;
            font-size: large;
            color: #000080;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 416px;
        }
        .auto-style4 {
            font-size: x-large;
        }
        .auto-style5 {
            width: 416px;
            font-weight: bold;
            color: #000080;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <span class="auto-style4">
            <br />
            Tutor Inteligente - Cargar Recursos<br />
            </span>
            <br />
        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style5">
                    Tipo de Recurso</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:FileUpload ID="fuplCargar" runat="server" Width="524px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="btnCargar" runat="server" Text="Cargar Archivo" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>Recursos</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:ListBox ID="lstfiles" runat="server"></asp:ListBox>
    </form>
</body>
</html>
