<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Progreso.aspx.vb" Inherits="Progreso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-weight: bold;
            font-size: x-large;
            color: white;
            background-color:#993300;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style6 {
            width: 291px;
        }
        .auto-style7 {
            text-align: center;
            width: 291px;
        }
        .auto-style8 {
            text-align: left;
            width: 291px;
        }
        .auto-style9 {
            width: 380px;
        }
        .auto-style10 {
            text-align: center;
            width: 380px;
        }
        .auto-style11 {
            text-align: left;
            width: 380px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p class="auto-style1">
        INFORMACION DEL ESTUDIANTE</p>
        <table class="auto-style2">
            <tr>
                <td class="auto-style9">
                    <asp:Button ID="btnGeneral" runat="server" Text="General" Width="134px" Visible="False" />
                    <asp:Button ID="btnDetalle" runat="server" Text="Detalle" Visible="False" />
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style7">
                    <strong>AVANCE DE CONTENIDOS</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style7">
                    <asp:Chart ID="Grafica" runat="server">
                        <Series>
                            <asp:Series Name="Series1" YValuesPerPoint="2">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label3" runat="server" Text="% Recursos Revisados"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtRecursos" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style7">
                    <asp:Label ID="lblinformacion" runat="server" Text="Informacion"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
