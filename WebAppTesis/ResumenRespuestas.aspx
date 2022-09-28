<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="SiteEvaluacion.Master" CodeFile="ResumenRespuestas.aspx.vb" Inherits="ResumenRespuestas" %>

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
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">
                    <strong>
                        <asp:Label ID="lblTema" runat="server" Text="Tema"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                    <dx:ASPxMenu ID="ASPxMenu1" runat="server">
                        <Items>
                            <dx:MenuItem Text="Realizar Cuestionario" Name="Realizar_Cuestionario">
                            </dx:MenuItem>
                            <dx:MenuItem Text="Salir" Name="Salir">
                            </dx:MenuItem>
                        </Items>
                    </dx:ASPxMenu>
                            </td>
                            <td>&nbsp;</td>
                            <td>
                    <asp:Label ID="lblMensaje" runat="server" Visible="False" Font-Bold="True" ForeColor="#993333"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="PageControl" EnableTheming="True" Theme="Office2010Silver" Width="100%" Height="500px">
                        <TabPages>
                            <dx:TabPage Name="SSTabResumen" Text="Resumen" ToolTip="Resumen">
                                <TabStyle BackColor="#993333" Font-Bold="true" ForeColor="White" Border-BorderWidth="2px" />
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="AspxGrigCont_Recurso" runat="server" AutoGenerateColumns="False" ClientInstanceName="AspxGrigCont_Recurso" DataSourceID="SqlDataResumen" KeyFieldName="clave" Theme="Office2010Silver" Width="100%">
                                            <Templates>
                                                <TitlePanel>
                                                    RESPUESTA(S)
                                                </TitlePanel>
                                            </Templates>
                                            <SettingsPager PageSize="100">
                                                <Summary Text="Pág.: {0} de {1} ({2} items)" />
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm">
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowTitlePanel="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <SettingsResizing ColumnResizeMode="Control" />
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <SettingsPopup>
                                                <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="500px" />
                                            </SettingsPopup>
                                            <SettingsLoadingPanel ImagePosition="Right" Mode="ShowOnStatusBar" Text="Buscando&amp;hellip;" />
                                            <SettingsText EmptyDataRow="No Tiene Datos" />
                                            <StylesEditors>
                                                <ProgressBar Height="25px">
                                                </ProgressBar>
                                            </StylesEditors>
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="clave" FieldName="clave" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" Width="35px">
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pregunta No." FieldName="Pregunta" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Descripción" FieldName="Detalle" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Correcta" FieldName="Correcta" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Intentos" FieldName="Intentos" ShowInCustomizationForm="True" VisibleIndex="4">
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Retroalimentacion" FieldName="Retroalimentacion" ShowInCustomizationForm="True" VisibleIndex="5">
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="si" FieldName="psi" ShowInCustomizationForm="True" Visible="true" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="no" FieldName="pno" ShowInCustomizationForm="True" Visible="true" VisibleIndex="7">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Styles>
                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                </Header>
                                                <LoadingPanel ImageSpacing="10px">
                                                </LoadingPanel>
                                                <TitlePanel Font-Bold="True" Font-Size="20px" HorizontalAlign="Center">
                                                </TitlePanel>
                                            </Styles>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="Intentos" DisplayFormat="Total: {0}" ShowInColumn="Intentos" SummaryType="Count" />
                                                <dx:ASPxSummaryItem FieldName="psi" DisplayFormat="Correctas: {0}" ShowInColumn="Intentos" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem FieldName="pno" DisplayFormat="Incorrectas: {0}" ShowInColumn="Intentos" SummaryType="Sum" />
                                            </GroupSummary>
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Name="SSTabObservacion" Text="Observaciones" ToolTip="Observaciones">
                                <TabStyle BackColor="#993333" Font-Bold="true" ForeColor="White" />
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="AspxGrigRecurso" runat="server" AutoGenerateColumns="False" ClientInstanceName="AspxGrigRecurso" DataSourceID="SqlDataObser" KeyFieldName="id_recurso" Theme="Office2010Silver" Width="100%">
                                            <ClientSideEvents ToolbarItemClick="OnToolbarItemClick" />
                                            <SettingsPager PageSize="100">
                                                <Summary Text="Pág.: {0} de {1} ({2} items)" />
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm">
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" ShowTitlePanel="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <SettingsResizing ColumnResizeMode="Control" />
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <SettingsPopup>
                                                <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="500px" />
                                            </SettingsPopup>
                                            <SettingsLoadingPanel ImagePosition="Right" Mode="ShowOnStatusBar" Text="Buscando&amp;hellip;" />
                                            <SettingsText EmptyDataRow="No Tiene Datos" />
                                            <StylesEditors>
                                                <ProgressBar Height="25px">
                                                </ProgressBar>
                                            </StylesEditors>
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Sec." FieldName="id_recurso" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" Width="35px">
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Nombre Recurso" FieldName="Recurso" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1" Width="100px">
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataHyperLinkColumn Caption="Nombre Recurso" FieldName="url" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    <PropertiesHyperLinkEdit Target="_blank" Text="Recurso" TextField="Recurso">
                                                    </PropertiesHyperLinkEdit>
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataHyperLinkColumn>
                                            </Columns>
                                            <Styles>
                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                </Header>
                                                <LoadingPanel ImageSpacing="10px">
                                                </LoadingPanel>
                                                <TitlePanel Font-Bold="True" Font-Size="20px" HorizontalAlign="Center">
                                                </TitlePanel>
                                            </Styles>
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                    <asp:SqlDataSource ID="SqlDataResumen" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="SELECT concat(a.id_pregunta,'-',b.intento) as clave,
a.id_pregunta as Pregunta,a.tx_nombre_pregunta as Detalle,
b.respuesta as Correcta, b.intento As Intentos, a.tx_feed_back As Retroalimentacion,
(if(b.respuesta='S',1,0)) as psi,
(if(b.respuesta='N',1,0)) as pno
FROM TB_preguntas a, user_preguntas b
where a.id_unidad = b.id_unidad
and a.id_tema = b.id_tema
and a.id_contenido = b.id_contenido
And a.id_pregunta = b.id_pregunta
and b.id_user = @usuario" >
                        <SelectParameters>
                            <asp:SessionParameter Name="usuario" SessionField="usuario" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataObser" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="select distinct a.id_recurso, a.tx_nombre_recurso as Recurso, concat(@ruta,tx_nombre_recurso) as url
from tb_contenido_recurso a, user_preguntas b, tb_preguntas c
where a.id_unidad = b.id_unidad
and a.id_tema = b.id_tema
and a.id_contenido = b.id_contenido
and b.respuesta = 'N'
and a.tipo_recurso &lt;&gt; 7
and b.id_user = @usuario
and a.id_unidad = c.id_unidad
and a.id_tema = c.id_tema
and a.id_contenido = c.id_contenido
and a.id_recurso = c.id_recurso
and b.id_unidad = c.id_unidad
and b.id_tema = c.id_tema
and b.id_contenido = c.id_contenido
and b.id_pregunta = c.id_pregunta" >
                        <SelectParameters>
                            <asp:SessionParameter Name="ruta" SessionField="ruta" Type="String" />
                            <asp:SessionParameter Name="usuario" SessionField="usuario" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
