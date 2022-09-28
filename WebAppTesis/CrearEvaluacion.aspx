<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CrearEvaluacion.aspx.vb" Inherits="WebApplication1.CrearEvaluacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
            font-weight: bold;
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 336px;
        }
        .auto-style4 {
            width: 336px;
            font-weight: bold;
            font-size: large;
        }
        .auto-style5 {
            width: 336px;
            height: 33px;
        }
        .auto-style6 {
            height: 33px;
        }
        .auto-style7 {            
            font-weight: bold;
            text-align: center;
            font-size: x-large;
            color: white;
            background-color:#993300;
        }
        .auto-style8 {
            width: 336px;
            font-weight: bold;
            font-size: medium;
        }
        .auto-style9 {
            width: 336px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <p class="auto-style7">
            CREAR EVALUACION</p>
        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style9">Modulo</td>
                <td>
                    <asp:TextBox ID="txtModulo" runat="server" Width="465px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">Temario</td>
                <td>
                    <asp:TextBox ID="txtTemario" runat="server" Width="467px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">Contenido</td>
                <td>
                    <asp:DropDownList ID="dplContenido" runat="server" Width="482px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">Nombre de la Pregunta</td>
                <td>
                    <asp:TextBox ID="txtNombrePregunta" runat="server" Width="489px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">Enunciado de la Pregunta</td>
                <td>
                    <asp:TextBox ID="txtEnunciadoPregunta" runat="server" Height="161px" TextMode="MultiLine" Width="606px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">Puntuacion</td>
                <td>
                    <asp:TextBox ID="txtPuntuacion" runat="server" Width="79px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Respuestas</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Eleccion 1</td>
                <td>
                    <asp:TextBox ID="txtEleccion1" runat="server" Height="24px" Width="615px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Respuesta Correcta</td>
                <td>
                    <asp:RadioButton ID="rbSi" runat="server" Text="Si" />
                    <asp:RadioButton ID="rbNo" runat="server" Text="No" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">Eleccion 2</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TxtEleccion2" runat="server" Width="610px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Respuesta correcta</td>
                <td>
                    <asp:RadioButton ID="rb1Si" runat="server" Text="Si" />
                    <asp:RadioButton ID="rb1No" runat="server" Text="No" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Eleccion 3</td>
                <td class="auto-style">
                    <asp:TextBox ID="TxtEleccion3" runat="server" Width="607px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Respuesta Correcta</td>
                <td class="auto-styl2">
                    <asp:RadioButton ID="rb2Si" runat="server" Text="Si" />
                    <asp:RadioButton ID="rb2No" runat="server" Text="No" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Eleccion 4</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtEleccion4" runat="server" Width="604px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Respuesta Correcta</td>
                <td class="auto-style2">
                    <asp:RadioButton ID="rb3Si" runat="server" Text="Si" />
                    <asp:RadioButton ID="rb3No" runat="server" Text="No" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="btnAgregar" runat="server" Text="Guardar" />
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
