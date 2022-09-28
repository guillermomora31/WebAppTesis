<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarClave.aspx.vb" Inherits="WebApplication1.CambiarClave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
           font-size: xx-large;
            font-weight: bold;
            text-align: center;
            color: white;
            background-color:#993300;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 449px;
        }
        .auto-style4 {
            width: 449px;
            text-align: right;
        }
        .auto-style5 {
            width: 499px;
        }
         footer {
              text-align: center;
              padding: 3px;
              background-color: #993300;
              color: white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <br />
            Tutor Inteligente - Cambiar Clave</div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Usuario</strong></td>
                <td class="auto-style5">
                        <asp:TextBox ID="txtUsuario" runat="server" Width="271px"></asp:TextBox>
                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Clave Anterior</strong></td>
                <td class="auto-style5">
                        <asp:TextBox ID="txtClaveAnterior" runat="server" Width="276px" TextMode="Password"></asp:TextBox>
                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Clave Actual</strong></td>
                <td class="auto-style5">
                        <asp:TextBox ID="txtClaveActual" runat="server" Width="276px" TextMode="Password"></asp:TextBox>
                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" />
                </td>
                <td>
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </form>
     <footer>
        <p>Sistema Tutor Inteligente<br>
           Derechos reservados <br>
           Contacto:admin@hotmail.com <br>         
        </p>
    </footer>
</body>
</html>
