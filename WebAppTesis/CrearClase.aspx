<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CrearClase.aspx.vb" Inherits="WebApplication1.CrearClase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 584px;
        }
        .auto-style3 {
            width: 491px;
        }
        .auto-style4 {
            text-align: right;
        }
        .auto-style5 {
            width: 491px;
            text-align: right;
        }
        .auto-style6 {
            width: 584px;
            font-weight: bold;
            font-size: x-large;
        }
        .auto-style7 {
            font-size: medium;
            color: #000080;
            font-weight: bold;
            width: 328px;
            text-align: right;
        }
        .auto-style8 {
            width: 328px;
        }
        .auto-style9 {
            width: 328px;
            font-size: medium;
            color: #000080;
            text-align: right;
        }
        .auto-style10 {
            width: 517px;
        }
        .auto-style11 {
            width: 517px;
            font-weight: bold;
            color: #009933;
        }
        .auto-style12 {
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6">Tutor Inteligente</td>
                    <td class="auto-style5">
                        <asp:Button ID="btnInicio" runat="server" Text="Inicio" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnSalir" runat="server" Text="Salir" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style7">Materia</td>
                <td class="auto-style11">&nbsp;&nbsp; Lenguaje de Programacion</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Nombre de la Clase</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtClase" runat="server" Width="281px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9"><strong>Detalle de la Clase</strong></td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtDetalleClase" runat="server" Height="93px" TextMode="MultiLine" Width="502px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Nivel</td>
                <td class="auto-style10">
                    <asp:DropDownList ID="lstNivel" runat="server" Height="25px" Width="259px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnGenerar" runat="server" Text="Generar Codigo Clase" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Codigo</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="auto-style12" Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style10">
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" />
                </td>
                <td>
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
