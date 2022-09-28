<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="SitePanelAvance.Master" CodeFile="PanelAvance.aspx.vb" Inherits="PanelAvance" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StyleTesis.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .normal_letter {
            text-align: center;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script language="javascript" type="text/javascript">
    function OnGetValores(values) {
        //alert(values[4]);
        if (values[4] == '') {
            Callback1.PerformCallback(values[0] + '|' + values[1] + '|' + values[2] + '|' + values[3] + '|' + values[4]);
            var height = 620;
            var width = 750;
            var winl = (screen.width - height) / 2;
            var wint = (screen.height - width) / 2;
            winprops = 'height=' + height + ',width=' + width + ',top=' + wint + ',left=' + winl + ',scrollbars=yes,resizable=yes,status=no'
            //win = window.open('D7_Imp.aspx?co_revi=' + values[0] + '&nu_revi=' + values[1] + '&nu_placa=' + values[2], 'Prueba', winprops)
            win = window.open(values[3])
            win.window.focus();
        }
        else {
            lbldes_ejercicio.SetText(values[2]);
            ASPxMemoEjer.SetText('');
            ASPxHyperFile.SetText(values[2])
            ASPxHyperFile.SetNavigateUrl(values[3])
            popupejercicio.Show();
            //alert(values[4]);
        }
    }
</script>
    <div >

        <table border="0" border="0" class="normal_letter" style="border-collapse: separate; border-spacing: 1px; width: 100%">
            <tr>
                <td class="auto-style2">
                    <strong>
                    <asp:Label ID="lblTema" runat="server" Text="Tema"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td align="left" >
                            <dx:ASPxMenu ID="ASPxMenu1" runat="server" AutoPostBack="true" OnItemClick="ASPxMenu1_ItemClick">
                                <Items>
                                    <dx:MenuItem Text="Realizar Cuestionario" Name="Realizar_Cuestionario">
                                    </dx:MenuItem>
                                    <dx:MenuItem Text="Salir" Name="Salir">
                                    </dx:MenuItem>
                                </Items>
                            </dx:ASPxMenu>
                </td>
            </tr>
            <tr>
                <td align="left" >
                    <table border="0" class="normal_letter" style="border-collapse: separate; border-spacing: 1px;">
                        <tr>
                            <td colspan="2" align="left">
                                <dx:ASPxLabel ID="lblNombre" runat="server" ClientInstanceName="lblNombre" Text="Nombre">
                                </dx:ASPxLabel>
                            </td>
                            <td colspan="2" align="left">
                                <dx:ASPxLabel ID="lblNivel" runat="server" ClientInstanceName="lblNivel" Text="Nivel">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td class="normal_letter" align="right">Unidad:</td>
                            <td>
                                <dx:ASPxComboBox ID="ASPxCmbUnidad" runat="server" ClientInstanceName="ASPxCmbUnidad" Width="200px" DataSourceID="SqlDataUnidad" TextField="no_unidad" ValueField="id_unidad">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataUnidad" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="SELECT id_unidad,no_unidad FROM tb_unidad where estado='A'"></asp:SqlDataSource>
                            </td>
                            <td class="normal_letter" align="right">Tema:</td>
                            <td>
                                <dx:ASPxComboBox ID="ASPxCmbTema" runat="server" ClientInstanceName="ASPxCmbTema" Width="200px" DataSourceID="SqlDataTema" TextField="no_tema" ValueField="id_tema">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataTema" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="select id_tema, no_tema from tb_tema where id_unidad=@id_unidad">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ASPxCmbUnidad" Name="id_unidad" PropertyName="Value" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left" >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="PageControl" EnableTheming="True" Theme="Office2010Silver" Width="100%" Height="500px">
                        <TabPages>
                            <dx:TabPage Name="SSTabProgreso" Text="Progreso" ToolTip="Progreso">
                                <TabStyle BackColor="#993333" Font-Bold="True" ForeColor="White">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <table style="width:100%;">
                                            <tr>
                                                <td width="50%">&nbsp;</td>
                                                <td width="50%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="50%">
                                                    <dxcharts:WebChartControl ID="WebChartControl1" runat="server" AppearanceNameSerializable="Light" CrosshairEnabled="True" DataSourceID="SqlDataGraf_General" Height="450px" Width="700px">
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
                                                            <dxcharts:Series ArgumentDataMember="nombre" Name="Serie1" ValueDataMembersSerializable="puntaje_total">
                                                            </dxcharts:Series>
                                                        </SeriesSerializable>
                                                        <Titles>
                                                            <dxcharts:ChartTitle Text="General" />
                                                        </Titles>
                                                    </dxcharts:WebChartControl>
                                                    <asp:SqlDataSource ID="SqlDataGraf_General" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="select puntaje_total,nombre from tb_avance inner join tb_usuario on tb_avance.id_estudiante = tb_usuario.id and tb_usuario.id = @usuario and tb_avance.id_unidad=@id_unidad and tb_avance.id_tema=@id_tema">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="usuario" SessionField="usuario" Type="String" />
                                                            <asp:ControlParameter ControlID="ASPxCmbUnidad" Name="id_unidad" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ASPxCmbTema" Name="id_tema" PropertyName="Value" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                                <td width="50%">
                                                    <dxcharts:WebChartControl ID="WebChartControl2" runat="server" AppearanceNameSerializable="Light" CrosshairEnabled="True" DataSourceID="SqlDataGraf_Detalle" Height="450px" Width="700px">
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
                                                    <asp:SqlDataSource ID="SqlDataGraf_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="select a.progreso,b.tx_descripcion
from tb_avance_detalle a,tb_contenido b,tb_usuario c
where a.id_estudiante = c.id
And c.id=@usuario
And a.id_contenido = b.id_contenido
And a.id_unidad = b.id_unidad
And a.id_tema = b.id_tema 
And a.id_unidad = @id_unidad
And a.id_tema = @id_tema 
group by 1,2">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="usuario" SessionField="usuario" Type="String" />
                                                            <asp:ControlParameter ControlID="ASPxCmbUnidad" Name="id_unidad" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ASPxCmbTema" Name="id_tema" PropertyName="Value" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="50%">&nbsp;</td>
                                                <td width="50%">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Name="SSTabContenidos" Text="Contenidos" ToolTip="Contenidos">
                                <TabStyle BackColor="#993333" Font-Bold="true" ForeColor="White" Border-BorderWidth="2px" />
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <table border ="1" style="width:100%;">
                                            <tr>
                                                <td width="50%" align="center">
                                                    <dx:ASPxLabel ID="ASPxLabelC1" runat="server" 
                                                        text="Aprendidos"  CssClass="normal_letter" Font-Bold="True" ForeColor="White" BackColor="#009933" Font-Size="18px" Width="100%" />
                                                </td>
                                                <td width="50%" align="center">
                                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" 
                                                        text="Por Aprender"  CssClass="normal_letter" Font-Bold="True" ForeColor="White" BackColor="#FF3300" Font-Size="18px" Width="100%" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="50%">
                                                    <asp:BulletedList ID="lstAprendidos" runat="server" >
                                                    </asp:BulletedList>
                                                </td>
                                                <td width="50%">
                                                    <asp:BulletedList ID="lstPorAprender" runat="server">
                                                    </asp:BulletedList>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Name="SSTabRecursos" Text="Recursos" ToolTip="Recursos">
                                <TabStyle BackColor="#993333" Font-Bold="true" ForeColor="White" Border-BorderWidth="2px" />
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <br />
                                        <table border="1" style="width:100%;">
                                            <tr>
                                                <td width="50%" align="center">
                                                    <dx:ASPxLabel ID="ASPxLblRevisado" runat="server"
                                                        text="Revisados"  CssClass="normal_letter" Font-Bold="True" ForeColor="White" BackColor="#009933" Font-Size="18px" Width="100%" />
                                                </td>
                                                <td width="50%" align="center">
                                                    <dx:ASPxLabel ID="ASPxXRevisado" runat="server" 
                                                        text="Por Revisar"  CssClass="normal_letter" Font-Bold="True" ForeColor="White" BackColor="#FF3300" Font-Size="18px" Width="100%" />

                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="50%">
                                                    <dx:ASPxGridView ID="AspxGrigRevisado" runat="server" AutoGenerateColumns="False" ClientInstanceName="AspxGrigRevisado" DataSourceID="SqlDataRevisados" EnableRowsCache="False" KeyFieldName="clave" Theme="Office2010Silver" Width="100%">
                                                        <SettingsPager PageSize="100">
                                                            <Summary Text="Pág.: {0} de {1} ({2} items)" />
                                                        </SettingsPager>
                                                        <SettingsEditing Mode="PopupEditForm">
                                                        </SettingsEditing>
                                                        <Settings ShowTitlePanel="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
                                                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
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
                                                            <dx:GridViewDataTextColumn Caption="Contenido" FieldName="contenidoRev" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                <HeaderStyle Font-Bold="True" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Recurso" FieldName="recursoRev" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <HeaderStyle Font-Bold="True" />
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
                                                    </dx:ASPxGridView>
                                                    <asp:SqlDataSource ID="SqlDataRevisados" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="select concat(a.id_recurso,'-',c.id_contenido) as clave, b.tx_descripcion as contenidoRev,c.tx_nombre_recurso as recursoRev
from user_contenido_recursos a, tb_contenido b, tb_contenido_recurso c, tb_unidad d,tb_tema e
where a.id_unidad = c.id_unidad
and a.id_tema = c.id_tema
and a.id_contenido = c.id_contenido
and a.id_recurso = c.id_recurso
and a.id_user = @usuario
and b.nivel = @nivel
and a.id_unidad = d.id_unidad
and a.id_tema = e.id_tema
and a.id_contenido = b.id_contenido
and a.id_unidad = @id_unidad
and a.id_tema = @id_tema">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="usuario" SessionField="usuario" Type="String" />
                                                            <asp:SessionParameter Name="nivel" SessionField="nivel" Type="String" />
                                                            <asp:ControlParameter ControlID="ASPxCmbUnidad" Name="id_unidad" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ASPxCmbTema" Name="id_tema" PropertyName="Value" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <br />
                                                </td>
                                                <td width="50%">
                                                    <dx:ASPxGridView ID="AspxGrigXRevisar" runat="server" AutoGenerateColumns="False" ClientInstanceName="AspxGrigXRevisar" DataSourceID="SqlDataXrevisar" EnableRowsCache="False" KeyFieldName="clave" Theme="Office2010Silver" Width="100%">
                                                        <SettingsPager PageSize="100">
                                                            <Summary Text="Pág.: {0} de {1} ({2} items)" />
                                                        </SettingsPager>
                                                        <SettingsEditing Mode="PopupEditForm">
                                                        </SettingsEditing>
                                                        <Settings ShowFilterRow="false" ShowTitlePanel="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
                                                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
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
                                                            <dx:GridViewDataTextColumn Caption="Contenido" FieldName="contenido" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                <HeaderStyle Font-Bold="True" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Recurso" FieldName="recurso" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <HeaderStyle Font-Bold="True" />
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
                                                    </dx:ASPxGridView>
                                                    <asp:SqlDataSource ID="SqlDataXrevisar" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="select concat(a.id_recurso,'-',c.id_contenido) as clave, c.tx_descripcion as contenido,a.tx_nombre_recurso as recurso
From tb_contenido_recurso a, tb_contenido c, tb_unidad d, tb_tema e
where a.id_unidad = c.id_unidad
and a.id_tema = c.id_tema
and a.id_contenido = c.id_contenido
and c.nivel = @nivel
and a.id_unidad = d.id_unidad
and a.id_tema = e.id_tema
and not exists (select a.id_recurso
from user_contenido_recursos b
where a.id_unidad = b.id_unidad
and a.id_tema = b.id_tema
and a.id_contenido = b.id_contenido
And a.id_recurso = b.id_recurso
and b.id_user = @usuario)
and a.id_unidad = @id_unidad
and a.id_tema = @id_tema">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="nivel" SessionField="nivel" Type="String" />
                                                            <asp:SessionParameter Name="usuario" SessionField="usuario" Type="String" />
                                                            <asp:ControlParameter ControlID="ASPxCmbUnidad" Name="id_unidad" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ASPxCmbTema" Name="id_tema" PropertyName="Value" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Name="SSTabDescarga" Text="Descargar Recursos / Ejercicios" ToolTip="Descargar Recursos / Ejercicios">
                                <TabStyle BackColor="#993333" Font-Bold="True" ForeColor="White">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <table>
                                            <tr>
                                                <td>
                                                    <dx:ASPxComboBox ID="ASPxCmbContenidos" ClientInstanceName="ASPxCmbContenidos"  runat="server" DataSourceID="SqlDataContenidos" TextField="tx_descripcion" ValueField="secuencia" Width="350px">
                                                    </dx:ASPxComboBox>
                                                    <asp:SqlDataSource ID="SqlDataContenidos" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="SELECT secuencia,tx_descripcion FROM TB_contenido order by secuencia"></asp:SqlDataSource>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                        <dx:ASPxGridView ID="AspxGrigCont_Recurso" 
                                            runat="server" AutoGenerateColumns="False" 
                                            ClientInstanceName="AspxGrigCont_Recurso" DataSourceID="SqlDataRecursos" KeyFieldName="id_recurso" 
                                            Theme="Office2010Silver" Width="100%" EnableRowsCache="False">
                                            <ClientSideEvents RowDblClick="function(s, e) {
	//s.GetRowValues(s.GetFocusedRowIndex(),'id_recurso,id_contenido,tx_nombre_recurso',OnGetValores);                        
    s.GetRowValues(s.GetFocusedRowIndex(),'id_recurso;id_contenido;tx_nombre_recurso;url;ejercicio',OnGetValores);                        
}" />
                                            <SettingsPager PageSize="100">
                                                <Summary Text="Pág.: {0} de {1} ({2} items)" />
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm">
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" ShowTitlePanel="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
                                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="true" />
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
                                                <dx:GridViewDataTextColumn Caption="Sec." FieldName="id_recurso" ShowInCustomizationForm="True" VisibleIndex="0" Width="35px" Visible="False">
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Nombre Recurso/Ejercicio" FieldName="tx_nombre_recurso" ShowInCustomizationForm="True" VisibleIndex="1" >
                                                    <HeaderStyle Font-Bold="True" />
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataHyperLinkColumn  FieldName="url" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nombre Recurso" Visible="false">
                                                    <DataItemTemplate>
                                                        <dx:ASPxHyperLink Target="_blank" ID="ASPxHyp" ClientInstanceName="ASPxHyp" runat="server" value='<%#Eval("data_audi") %>' Text='<%#Eval("tx_nombre_recurso") %>' NavigateUrl='<%#Eval("url") %>' >
                                                        </dx:ASPxHyperLink>
                                                    </DataItemTemplate>

                                                    <HeaderStyle Font-Bold="True" />
                                                   
                                                </dx:GridViewDataHyperLinkColumn>
                                                <dx:GridViewDataTextColumn Caption="id_contenido" FieldName="id_contenido" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Ejercicio" FieldName="ejercicio" ShowInCustomizationForm="True" VisibleIndex="4" Visible="false">
                                                    <HeaderStyle Font-Bold="True" />
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
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataRecursos" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" 
                                            ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" 
                                            SelectCommand="select id_recurso,id_contenido,tx_nombre_recurso,(if(tipo_recurso&lt;&gt;7,
concat(@ruta,tx_nombre_recurso),concat(@ruta,tx_nombre_recurso))) as url,concat(id_recurso,'-',tx_nombre_recurso) as data_audi,
(if(tipo_recurso=7,'Ejercicio','')) as ejercicio from tb_contenido_recurso where id_contenido=@id_contenido and id_unidad=@id_unidad and id_tema=@id_tema">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="ruta" SessionField="ruta" Type="String" />
                                                <asp:ControlParameter ControlID="ASPxCmbContenidos" Name="id_contenido" PropertyName="Value" Type="String" />
                                                <asp:ControlParameter ControlID="ASPxCmbUnidad" Name="id_unidad" PropertyName="Value" Type="String" />
                                                <asp:ControlParameter ControlID="ASPxCmbTema" Name="id_tema" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback1" OnCallback="ASPxCallback1_Callback">
                                        </dx:ASPxCallback>
                                        <dx:ASPxPopupControl ID="popupmensaje" runat="server" AllowDragging="True" ClientInstanceName="popupmensaje" CloseAction="None" HeaderText="Mensaje" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                                            <HeaderStyle BackColor="#993333" CssClass="dialogHeaderPoPup" Font-Bold="True" ForeColor="White" />
                                            <ContentCollection>
                                                <dx:PopupControlContentControl runat="server">
                                                    <div style="text-align: center">
                                                        <table class="normal_letter" style="border-collapse:separate; border-spacing: 2px; width: 100%">
                                                            <tr>
                                                                <td>
                                                                    <dx:ASPxLabel ID="lblmessager" runat="server" ClientInstanceName="lblmessager">
                                                                    </dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    <dx:ASPxButton ID="AspxBotOk0" runat="server" AutoPostBack="False" BackColor="#993333" ClientInstanceName="AspxBotOk" Font-Bold="True" ForeColor="White" Native="True" Text="Aceptar">
                                                                        <ClientSideEvents Click="function(s, e) {
                                            popupmensaje.Hide();
                                    }" />
                                                                    </dx:ASPxButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </dx:PopupControlContentControl>
                                            </ContentCollection>
                                        </dx:ASPxPopupControl>
                                        <dx:ASPxPopupControl ID="popupejercicio" runat="server" AllowDragging="True" ClientInstanceName="popupejercicio" CloseAction="None" HeaderText="Ejercicio" Font-Size="18px" Modal="True" 
                                            CloseOnEscape="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="600px">
                                            <ClientSideEvents CloseButtonClick="function(s, e) {
	//lbldes_ejercicio.SetText('');
	//ASPxMemoEjer.SetText('');
    //alert('X');
    popupejercicio.Hide();
}" />
                                            <HeaderStyle BackColor="#993333" CssClass="dialogHeaderPoPup" Font-Bold="True" ForeColor="White" />
                                            <ContentCollection>
                                                <dx:PopupControlContentControl runat="server">
                                                    <div style="text-align: center">
                                                        <table class="normal_letter" style="border-collapse:separate; border-spacing: 2px; width: 100%">
                                                            <tr>
                                                                <td>
                                                                    <dx:ASPxLabel ID="lbldes_ejercicio" runat="server" Font-Bold="true" Font-Size="16px"  ClientInstanceName="lbldes_ejercicio" Width="100%">
                                                                    </dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <dx:ASPxHyperLink ID="ASPxHyperFile" runat="server" ClientInstanceName="ASPxHyperFile" Target="_blank" Text="ASPxHyperLink">
                                                                    </dx:ASPxHyperLink>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <dx:ASPxMemo ID="ASPxMemoEjer" runat="server" ClientInstanceName="ASPxMemoEjer" MaxLength="1000" Height="150px" Width="100%">
                                                                    </dx:ASPxMemo>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    <dx:ASPxButton ID="AspxBotOk" runat="server" AutoPostBack="False" BackColor="#993333" ClientInstanceName="AspxBotOk" Font-Bold="True" ForeColor="White" Native="True" Text="Aceptar">
                                                                        <ClientSideEvents Click="function(s, e) {
	                                    //if (lblmessager.GetText()=='Grabacion Ok!'){
                                        //    document.location.href ='Recursos.aspx';
                                        //} else{
                                        //    popupmensaje.Hide();
                                        //}

                                        
                                    }" />
                                                                    </dx:ASPxButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </dx:PopupControlContentControl>
                                            </ContentCollection>
                                        </dx:ASPxPopupControl>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>



