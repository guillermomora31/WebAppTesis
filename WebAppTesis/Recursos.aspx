<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="SiteMenu.Master" CodeFile="Recursos.aspx.vb" Inherits="Recursos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StyleTesis.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .normal_letter {
            text-align: center;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="js/JavaFunction.js"></script>
    <script type="text/javascript">
        function OnToolbarItemClick(s, e) {
            //alert(e.item.name)
            if (e.item.name == 'Nuevo') {
                e.
                win = window.open('Recursos_Ing.aspx','_self')
                return;
            }

            if(IsExportToolbarCommand(e.item.name)){
                e.processOnServer=true;
                e.usePostBack=true;
            }
        }
        function IsExportToolbarCommand(command) {
            return command == "ExportToPDF" || command == "ExportToXLSX" || command == "ExportToXLS";
        }
    </script>
    <dx:ASPxGridViewExporter ID="Export_AspxGrid" runat="server" GridViewID="AspxGrigWeRecurso">
    </dx:ASPxGridViewExporter>

    <dx:ASPxGridView ID="AspxGrigWeRecurso" runat="server" autogeneratecolumns="False" ClientInstanceName="AspxGrigWeRecurso" datasourceid="SqlWebRecurso" KeyFieldName="idRecurso" OnToolbarItemClick="AspxGrigWeRecurso_ToolbarItemClick" Theme="Office2010Silver" width="100%">
        <Settings ShowTitlePanel="true" ShowFilterRow="True" ShowGroupPanel="True" />
        <Styles>
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
            <LoadingPanel ImageSpacing="10px">
            </LoadingPanel>
            <TitlePanel Font-Bold="true" Font-Size="20px" HorizontalAlign="center" />
        </Styles>
        <Toolbars>
            <dx:GridViewToolbar ItemAlign="Right">
                <Items>
                    <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Image-Url="~/Imagenes/ico_nuevo.png" Image-UrlDisabled="~/Imagenes/ico_nuevo.png" Text="Nuevo">
                        <Image Url="~/Imagenes/ico_nuevo.png">
                        </Image>
                    </dx:GridViewToolbarItem>
                    <dx:GridViewToolbarItem Command="ClearFilter" Image-Url="~/Imagenes/ico_sinfiltro.png" Image-UrlDisabled="~/Imagenes/ico_sinfiltro.png" Text="Limpiar Filtro">
                        <Image Url="~/Imagenes/ico_sinfiltro.png" UrlDisabled="~/Imagenes/ico_sinfiltro.png">
                        </Image>
                    </dx:GridViewToolbarItem>
                    <dx:GridViewToolbarItem BeginGroup="true" Command="Refresh" Image-Url="~/Imagenes/ico_refres.png" Text="Refrescar">
                        <Image Url="~/Imagenes/ico_refres.png">
                        </Image>
                    </dx:GridViewToolbarItem>
                    <dx:GridViewToolbarItem BeginGroup="true" Image-Url="~/Imagenes/ico_exportar.png" Text="Exportar">
                        <Items>
                            <dx:GridViewToolbarItem Image-IconID="export_exporttopdf_16x16office2013" Name="ExportToPDF" Text="PDF">
                                <Image IconID="export_exporttopdf_16x16office2013">
                                </Image>
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Image-IconID="export_exporttoxlsx_16x16office2013" Name="ExportToXLSX" Text="XLSX">
                                <Image IconID="export_exporttoxlsx_16x16office2013">
                                </Image>
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Image-IconID="export_exporttoxls_16x16office2013" Name="ExportToXLS" Text="XLS">
                                <Image IconID="export_exporttoxls_16x16office2013">
                                </Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                        <Image Url="imagenes/ico_exportar.png">
                        </Image>
                    </dx:GridViewToolbarItem>
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>
        <SettingsCommandButton>
            <DeleteButton Image-Url="Imagenes/icon_delete.png" Text="Eliminar">
                <Image Url="imagenes/icon_delete.png">
                </Image>
            </DeleteButton>
        </SettingsCommandButton>
        <Columns>
            <dx:GridViewCommandColumn ButtonRenderMode="Image" Caption=" " ShowDeleteButton="true" ShowEditButton="true" VisibleIndex="0" Width="60px" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="idContenido" VisibleIndex="1" Caption="Cod. Contenido">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cod. Recursos" FieldName="idRecurso" VisibleIndex="4">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Contenido" VisibleIndex="2" Caption="Contenido">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn  FieldName="url" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Recurso">
                <PropertiesHyperLinkEdit Target="_blank" Text="Recurso" TextField="Recurso" >
                </PropertiesHyperLinkEdit>
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
        <Settings ShowFilterRow="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
        <Styles>
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
            <LoadingPanel ImageSpacing="10px">
            </LoadingPanel>
        </Styles>
        <SettingsResizing ColumnResizeMode="Control" />
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager pagesize="100">
            <Summary Text="Pág.: {0} de {1} ({2} items)" />
        </SettingsPager>
        <SettingsLoadingPanel ImagePosition="Right" Mode="ShowOnStatusBar" Text="Buscando&amp;hellip;" />
        <SettingsText ConfirmDelete="Desea Eliminar?" EmptyDataRow="No Tiene Datos" />
        <StylesEditors>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
        <SettingsPopup EditForm-HorizontalAlign="WindowCenter" EditForm-Modal="true" EditForm-VerticalAlign="WindowCenter" EditForm-Width="500px">
            <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="500px" />
        </SettingsPopup>
        <SettingsEditing Mode="PopupEditForm" />
        <Templates>
            <TitlePanel>
                Asignación Recursos Pedagógicos
            </TitlePanel>
        </Templates>
        <ClientSideEvents ToolbarItemClick="OnToolbarItemClick" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlWebRecurso" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" 
        DeleteCommand="delete from tb_contenido_recurso WHERE id_contenido = @id_contenido and id_recurso=@id_recurso" 
        SelectCommand="select a.id_contenido as idContenido,b.tx_descripcion as Contenido,a.id_recurso as idRecurso,
a.tx_nombre_recurso as Recurso, concat(?,a.tx_nombre_recurso) as url
from tb_contenido_recurso a , tb_contenido b
where a.id_contenido = b.id_contenido" >
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="ruta" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="id_contenido" Type="String" />
            <asp:Parameter Name="id_recurso" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <script type="text/javascript">

        function ValidateDigitsAndDot(e) {
            debugger;
            var key;
            var evt;
            if (window.event) {
                key = window.event.keyCode;
                evt = window.event;
            }
            else if (e) {
                key = e.htmlEvent.charCode;
                evt = e.htmlEvent;
            }
            if (((key > 47) && (key < 58))) {
                window.event.returnValue = true;
            }
            else {
                window.event.returnValue = false;
            }
        }

        function AjustarGrid(Grid, valor, h, w) {
            var height = Math.max(0, h);
            var width = Math.max(0, w);

            Grid.SetHeight(height - valor);

        };
        AjustarGrid(AspxGrigWeRecurso, 250, document.documentElement.clientHeight, document.documentElement.clientWidth);

    </script>   
</asp:Content>





