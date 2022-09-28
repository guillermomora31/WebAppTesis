<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="SiteLogon.Master" CodeFile="Login.aspx.vb" Inherits="Login" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/StyleRtv.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .normal_letter {
            text-align: center;
        }
        .auto-style1 {
            height: 18px;
        }
        .auto-style2 {
            height: 17px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link href="Styles/StyleTesis.css" rel="stylesheet" type="text/css" />
        <div align="center">
            <table border="0" style="width:100%;">
                <tr>
                    <td align="center">
                        <dx:ASPxRoundPanel ID="ASPxRPanelLogon" Width="25%"  runat="server" ShowCollapseButton="false" ClientInstanceName="ASPxRPanelLogon" HeaderText="">
                            <HeaderStyle Font-Bold="True" />
                            <HeaderTemplate>
                                <table style="width:100%;">
                                    <tr>
                                        <td rowspan="2">
                                            <dx:ASPxImage ID="ASPxImgCandado" runat="server" ClientInstanceName="ASPxImgCandado" Height="32px" ImageUrl="~/imagenes/ico_candado_transparente.png" ShowLoadingImage="True" Width="50px">
                                            </dx:ASPxImage>
                                        </td>
                                        <td><strong>INGRESO AL SISTEMA</strong>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table border="0" style="margin: 0 auto;border-collapse: separate; border-spacing: 1px; width:100%">
                                        <tr>
                                            <td class="normal_letter" colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><strong>Usuario</strong></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dx:ASPxTextBox ID="TxtUsuario" runat="server" ClientInstanceName="ASPxTxtUsuario" CssClass="normal_letter" MaxLength="25" Width="100%" Theme="Office2010Silver">
                                                    <ClientSideEvents Validation="function(s, e) {
                                                                var ASPxTxtUsuario = e.value;
                                                                if (ASPxTxtUsuario == null)
                                                                    {
                                                                        e.isValid = false;
                                                                        return;
                                                                    }
                                                                if (ASPxTxtUsuario.length == 0)
                                                                    {
                                                                        e.isValid = false;
                                                                        return;
                                                                    }
                                                            }" />
                                                    <ValidationSettings CausesValidation="True" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Acceso">
                                                        <ErrorImage Height="16px" Url="~/Imagenes/ico_advertencia.png" Width="16px" />
                                                        <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                                            <ErrorTextPaddings PaddingRight="3px" />
                                                            <Paddings Padding="0px" PaddingLeft="0px" />
                                                        </ErrorFrameStyle>
                                                        <RequiredField ErrorText="Ingrese Usuario" IsRequired="True" />
                                                    </ValidationSettings>
                                        
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1" colspan="2"><strong>Clave</strong></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dx:ASPxTextBox ID="txtClave" runat="server" ClientInstanceName="ASPxTxtPass" CssClass="normal_letter" MaxLength="25" Password="True" Width="100%" Theme="Office2010Silver">
                                                    <ClientSideEvents Validation="function(s, e) {
                                                                var ASPxTxtPass = e.value;
                                                                if (ASPxTxtPass == null)
                                                                    {
                                                                        e.isValid = false;
                                                                        return;
                                                                    }
                                                                if (ASPxTxtPass.length == 0)
                                                                    {
                                                                        e.isValid = false;
                                                                        return;
                                                                    }
                                                            }" />
                                                    <ValidationSettings CausesValidation="True" Display="Dynamic" ValidationGroup="Acceso">
                                                        <ErrorImage Height="16px" Url="~/Imagenes/ico_advertencia.png" Width="16px" />
                                                        <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                                            <ErrorTextPaddings PaddingRight="3px" />
                                                            <Paddings Padding="0px" PaddingLeft="0px" />
                                                        </ErrorFrameStyle>
                                                        <RequiredField ErrorText="Ingrese Clave" IsRequired="True" />
                                                    </ValidationSettings>
                                        
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="align-content:center; text-align:center" colspan="2">
                                                <dx:ASPxLabel ID="ASPxLblMensaje" runat="server" ClientInstanceName="ASPxLblMensaje" CssClass="normal_letter" Font-Bold="True" ForeColor="Red" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="text-align: center; align-content:center">
                                                &nbsp;</td>
                                            <td style="text-align: center; align-content:center">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="text-align: center; align-content:center" colspan="2">
                                                <table border="0" align="center" >
                                                    <tr>
                                                        <td>
                                                            <dx:ASPxButton ID="ASPxBtnIng" runat="server" AutoPostBack="False" BackColor="#993333" ClientInstanceName="ASPxBtnIng" Font-Bold="True" ForeColor="White" Native="True" Text="Ingresar" ValidationGroup="Acceso">
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <dx:ASPxButton ID="ASPxBtnCambio" runat="server" AutoPostBack="False" BackColor="#993333" ClientInstanceName="ASPxBtnCambio" Font-Bold="True" ForeColor="White" Native="True" Text="Cambiar Clave">
                                                                <ClientSideEvents Click="function(s, e) {
	            TxtCa_Usua.SetText('');
                txtClave_Ant.SetText('');
	            txtClave_Act.SetText('');
                            AspxPpUserdata.Show();
            }" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="align-content:center;text-align:center" colspan="2" >
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                </tr>
                </table>
            <dx:ASPxPopupControl ID="AspxPpUserdata" runat="server" AllowDragging="True" ClientInstanceName="AspxPpUserdata" CloseOnEscape="True" EnableHotTrack="False" HeaderText="Cambiar Clave" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto" Width="500px">
                <CloseButtonImage Height="12px" Width="13px">
                </CloseButtonImage>
                <SizeGripImage Height="16px" Width="16px">
                </SizeGripImage>
                <ClientSideEvents Closing="function(s, e) {
	TxtCa_Usua.SetIsValid(true);
    txtClave_Ant.SetIsValid(true);
    txtClave_Act.SetIsValid(true);
}" />
                <HeaderStyle BackColor="#993333" Font-Bold="True" ForeColor="White">
                <Paddings PaddingRight="6px" />
                </HeaderStyle>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <div style="text-align:center">
                            <table width="100%">
                                <tr>
                                    <td align="right"><strong>Usuario:</strong></td>
                                    <td>
                                        <dx:ASPxTextBox ID="TxtCa_Usua" runat="server" ClientInstanceName="TxtCa_Usua" CssClass="normal_letter" MaxLength="25" Theme="Office2010Silver" Width="100%">
                                            <ClientSideEvents Validation="function(s, e) {
                                                    var TxtCa_Usua = e.value;
                                                    if (TxtCa_Usua == null)
                                                        {
                                                            e.isValid = false;
                                                            return;
                                                        }
                                                    if (TxtCa_Usua.length == 0)
                                                        {
                                                            e.isValid = false;
                                                            return;
                                                        }
                                                }" />
                                            <ValidationSettings CausesValidation="True" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Cambio">
                                                <ErrorImage Height="16px" Url="~/Imagenes/ico_advertencia.png" Width="16px">
                                                </ErrorImage>
                                                <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                                    <ErrorTextPaddings PaddingRight="3px" />
                                                    <Paddings Padding="0px" PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                                <RequiredField ErrorText="Ingrese Usuario" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right"><strong>Clave Anterior:</strong></td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtClave_Ant" runat="server" ClientInstanceName="txtClave_Ant" CssClass="normal_letter" MaxLength="25" Password="True" Theme="Office2010Silver" Width="100%">
                                            <ClientSideEvents Validation="function(s, e) {
                                                    var txtClave_Ant = e.value;
                                                    if (txtClave_Ant == null)
                                                        {
                                                            e.isValid = false;
                                                            return;
                                                        }
                                                    if (txtClave_Ant.length == 0)
                                                        {
                                                            e.isValid = false;
                                                            return;
                                                        }
                                                }" />
                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ValidationGroup="Cambio">
                                                <ErrorImage Height="16px" Url="~/Imagenes/ico_advertencia.png" Width="16px">
                                                </ErrorImage>
                                                <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                                    <ErrorTextPaddings PaddingRight="3px" />
                                                    <Paddings Padding="0px" PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                                <RequiredField ErrorText="Ingrese Clave" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right"><strong>Clave Actual:</strong></td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtClave_Act" runat="server" ClientInstanceName="txtClave_Act" CssClass="normal_letter" MaxLength="25" Password="True" Theme="Office2010Silver" Width="100%">
                                            <ClientSideEvents Validation="function(s, e) {
                                                    var txtClave_Act = e.value;
                                                    if (txtClave_Act == null)
                                                        {
                                                            e.isValid = false;
                                                            return;
                                                        }
                                                    if (txtClave_Act.length == 0)
                                                        {
                                                            e.isValid = false;
                                                            return;
                                                        }
                                                }" />
                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ValidationGroup="Cambio">
                                                <ErrorImage Height="16px" Url="~/Imagenes/ico_advertencia.png" Width="16px">
                                                </ErrorImage>
                                                <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                                    <ErrorTextPaddings PaddingRight="3px" />
                                                    <Paddings Padding="0px" PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                                <RequiredField ErrorText="Ingrese Clave Actual" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <dx:ASPxLabel ID="ASPxLblMsg_Cambio" runat="server" ClientInstanceName="ASPxLblMsg_Cambio" CssClass="normal_letter" Font-Bold="True" ForeColor="Red">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <dx:ASPxButton ID="ASPxBtnCambiar" runat="server" AutoPostBack="False" BackColor="#993333" ClientInstanceName="ASPxBtnCambiar" Font-Bold="True" ForeColor="White" Native="True" Text="Cambiar" ValidationGroup="Cambio">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <dx:ASPxPopupControl ID="AspxPpGraf" runat="server" AllowDragging="True" ClientInstanceName="AspxPpGraf" CloseOnEscape="True" EnableHotTrack="False" HeaderText="Avance de Contenidos" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto" Width="500px">
                <CloseButtonImage Height="12px" Width="13px">
                </CloseButtonImage>
                <SizeGripImage Height="16px" Width="16px">
                </SizeGripImage>
                <ClientSideEvents Closing="function(s, e) {
                    window.open('Panelavance.aspx','_self')
}" />
                <HeaderStyle BackColor="#993333" Font-Bold="True" ForeColor="White">
                <Paddings PaddingRight="6px" />
                </HeaderStyle>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <div style="text-align:center">
                            <table width="100%">
                                <tr>
                                    <td align="center" colspan="2">
                                        <dxcharts:WebChartControl ID="WebChartControl2" runat="server" AppearanceNameSerializable="Light" CrosshairEnabled="True" DataSourceID="SqlDataGraf_Detalle" Height="400px" Width="400px">
                                            <DiagramSerializable>
                                                <dxcharts:XYDiagram>
                                                    <AxisX VisibleInPanesSerializable="-1">
                                                    </AxisX>
                                                    <AxisY VisibleInPanesSerializable="-1">
                                                    </AxisY>
                                                </dxcharts:XYDiagram>
                                            </DiagramSerializable>
                                            <Legend Name="Default Legend" Visibility="False"></Legend>
                                            <SeriesSerializable>
                                                <dxcharts:Series ArgumentDataMember="tx_descripcion" Name="Serie1" ValueDataMembersSerializable="progreso">
                                                </dxcharts:Series>
                                            </SeriesSerializable>
                                            <Titles>
                                                <dxcharts:ChartTitle Text="Detalle" />
                                            </Titles>
                                        </dxcharts:WebChartControl>
                                        <asp:SqlDataSource ID="SqlDataGraf_Detalle" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" 
                                            ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" 
                                            SelectCommand="select a.progreso,b.tx_descripcion from tb_avance_detalle a,tb_contenido b,tb_usuario c where a.id_estudiante = c.id and c.id=? and a.id_contenido=b.id_contenido and a.id_unidad = b.id_unidad and a.id_tema = b.id_tema group by 1,2">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="?" SessionField="usuario" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <dx:ASPxLabel ID="ASPxLblMsgR" runat="server" ClientInstanceName="ASPxLblMsg" CssClass="normal_letter" Font-Bold="True" ForeColor="Red" Text="% Recursos Revisados: ">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <dx:ASPxLabel ID="ASPxLblMsgE" runat="server" ClientInstanceName="ASPxLblMsgE" CssClass="normal_letter" Font-Bold="True" ForeColor="Red" Text="% Ejercicios Resueltos: ">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" colspan="2">
                                        <dx:ASPxLabel ID="lblinformacion" runat="server" ClientInstanceName="lblinformacion" CssClass="normal_letter" Font-Bold="True" ForeColor="Red">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <dx:ASPxButton ID="ASPxBtnAceptar" runat="server" AutoPostBack="False" BackColor="#993333" ClientInstanceName="ASPxBtnCambiar" Font-Bold="True" ForeColor="White" Native="True" Text="Aceptar" ValidationGroup="Cambio">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <br />
        </div>
</asp:Content>


