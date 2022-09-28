<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="SiteEvaluacion.Master" CodeFile="EvaluacionEstudiante.aspx.vb" Inherits="EvaluacionEstudiante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StyleTesis.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .normal_letter {
            text-align: center;
        }
        .dxrpControl,
        .dxrpControlGB
        {
	        font: 12px Tahoma, Geneva, sans-serif;
	        color: #000000;
        }
        .auto-style23 {
            width: 53px;
        }
        .auto-style24 {
            height: 38px;
        }
        .auto-style25 {
            width: 53px;
            height: 38px;
        }
        .btm {
          padding: 3px 3px 3px 25px;
          border: none;
          color:#FFFFFF;
          text-decoration:none;
          background: #993333 url(imagenes/ico_flecha_der_transparente.png) no-repeat scroll 5px center;
          border-bottom:1px solid #666;
          border-right:1px solid #666;
          cursor:pointer;
        }
        .btm1 {
          padding: 3px 3px 3px 25px;
          border: none;
          color:#FFFFFF;
          text-decoration:none;
          background: #993333 no-repeat scroll 5px center;
          border-bottom:1px solid #666;
          border-right:1px solid #666;
          cursor:pointer;
        }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width:100%;" border="0">
            <tr>
                <td class="auto-style2" colspan="3">
                    <strong>
                        <asp:Label ID="lblTema" runat="server" Text="Tema"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <strong>
                        &nbsp;
                    </strong>
                </td>
            </tr>
            <tr>
                <td align="center">
                        <dx:ASPxRoundPanel ID="ASPxRPanelLogon" runat="server" ShowCollapseButton="false" ClientInstanceName="ASPxRPanelLogon" HeaderText="" Width="100%">
                            <HeaderStyle Font-Bold="True" />
                            <HeaderTemplate>
                                <table style="width:100%;">
                                    <tr>
                                        <td align="center">PREGUNTA</td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table width="100%">
                                        <tr>
                                            <td colspan="3" align="center" >
                                                <asp:TextBox ID="txtPregunta" runat="server" CssClass="auto-style9" Height="61px" Width="100%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td height="50px">
                                                <asp:RadioButton ID="rdbEleccion1" runat="server" GroupName="grnEleccion" />
                                            </td>
                                            <td height="50px">
                                                <asp:Label ID="lblResp1" runat="server" Text="lbResp1" Visible="False"></asp:Label>
                                            </td>
                                            <td height="50px"></td>
                                        </tr>
                                        <tr>
                                            <td height="50px">
                                                <asp:RadioButton ID="rdbEleccion2" runat="server" GroupName="grnEleccion" />
                                            </td>
                                            <td height="50px">
                                                <asp:Label ID="lblResp2" runat="server" Text="lblResp2" Visible="False"></asp:Label>
                                                <br />
                                            </td>
                                            <td height="50px"></td>
                                        </tr>
                                        <tr>
                                            <td height="50px">
                                                <asp:RadioButton ID="rdbEleccion3" runat="server" GroupName="grnEleccion" />
                                            </td>
                                            <td height="50px">
                                                <asp:Label ID="lblResp3" runat="server" Text="lblResp3" Visible="False"></asp:Label>
                                            </td>
                                            <td height="50px"></td>
                                        </tr>
                                        <tr>
                                            <td height="50px">
                                                <asp:RadioButton ID="rdbEleccion4" runat="server" GroupName="grnEleccion" />
                                            </td>
                                            <td height="50px">
                                                <asp:Label ID="lblResp4" runat="server" Text="lblResp4" Visible="False"></asp:Label>
                                            </td>
                                            <td height="50px"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <dx:ASPxButton ID="btnSiguiente_" Native="true" BackColor="#993333" ForeColor="White" ClientInstanceName="btnSiguiente_" AutoPostBack="true" runat="server" Text="Siguiente"  ImagePosition="Right"  >
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>


