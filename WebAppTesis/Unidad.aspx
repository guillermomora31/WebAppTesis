<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="SiteMenu.Master" CodeFile="Unidad.aspx.vb" Inherits="Unidad" %>


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
        function OnToolbarItemClick(s,e) {
            if(IsExportToolbarCommand(e.item.name)){
                e.processOnServer=true;
                e.usePostBack=true;
            }
        }
        function IsExportToolbarCommand(command){
            return command == "ExportToPDF" || command == "ExportToXLSX" || command == "ExportToXLS" ;
        }
    </script>

    <dx:ASPxGridViewExporter ID="Export_AspxGrid" runat="server" GridViewID="AspxGrigWeUnidad">
    </dx:ASPxGridViewExporter>

    <dx:ASPxGridView ID="AspxGrigWeUnidad" runat="server" autogeneratecolumns="False" ClientInstanceName="AspxGrigWeUnidad" datasourceid="SqlWebUnidad" KeyFieldName="id_unidad" OnToolbarItemClick="AspxGrigWeUnidad_ToolbarItemClick" Theme="Office2010Silver" width="100%">
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
                    <dx:GridViewToolbarItem Command="New" Image-Url="~/Imagenes/ico_nuevo.png" Image-UrlDisabled="~/Imagenes/ico_nuevo.png" Text="Nuevo">
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
            <EditButton Image-Url="~/Imagenes/icon_modificar.png" Text="Modificar">
                <Image Url="~/Imagenes/icon_modificar.png">
                </Image>
            </EditButton>
            <DeleteButton Image-Url="~/Imagenes/icon_delete.png" Text="Eliminar">
                <Image Url="~/Imagenes/icon_delete.png">
                </Image>
            </DeleteButton>
        </SettingsCommandButton>
        <Columns>
            <dx:GridViewCommandColumn ButtonRenderMode="Image" Caption=" " ShowDeleteButton="true" ShowEditButton="true" VisibleIndex="0" Width="60px" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="id_unidad" VisibleIndex="1" Caption="Cod. Unidad">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Unidad" FieldName="no_unidad" VisibleIndex="2">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            
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
                Unidad
            </TitlePanel>
            <EditForm>
                <table id="Web2_1" border="0" class="normal_letter" style="border-collapse: separate; border-spacing: 1px; width: 100%">
                    <tr>
                        <td class="normal_letter" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">*Unidad:</td>
                        <td style="text-align:left">
                            <dx:ASPxTextBox ID="AspxTxtUnidad"  runat="server" ClientInstanceName="AspxTxtUnidad" CssClass="normal_letter" MaxLength="50" Text='<%#Bind("no_unidad")%>' Theme="Office2010Silver">
                                <ClientSideEvents Validation="function(s, e) {
                                                var AspxTxtUnidad = e.value;
                                                if (AspxTxtUnidad == null)
                                                    {
                                                        e.isValid = false;
                                                        return;
                                                    }
                                                if (AspxTxtUnidad.length == 0)
                                                    {
                                                        e.isValid = false;
                                                        return;
                                                    }
                                            }" />
                                <ValidationSettings CausesValidation="True" Display="Dynamic" SetFocusOnError="True">
                                    <ErrorImage Height="16px" Url="imagenes/ico_advertencia.png" Width="16px">
                                    </ErrorImage>
                                    <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                        <ErrorTextPaddings PaddingRight="3px" />
                                        <Paddings Padding="0px" PaddingLeft="0px" />
                                    </ErrorFrameStyle>
                                    <RequiredField ErrorText="Ingrese Unidad." IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink">
                                </InvalidStyle>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2"><strong class="normal_letter">(*) Obligatorios</strong></td>
                    </tr>
                    <tr>
                        <td class="normal_letter" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;align-content:center">
                            <table border="0" class="normal_letter" style="border-collapse:separate; border-spacing: 1px">
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="AspxBtnAccept" runat="server" AutoPostBack="False" CssClass="normal_letter" Font-Bold="True" Text="Aceptar" Theme="Office2010Silver">
                                            <ClientSideEvents Click="function(s, e) {
	                                                Grabar(AspxGrigWeUnidad,'Web2_1');
                                                }" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="AspxBtnCancel" runat="server" AutoPostBack="False" CssClass="normal_letter" Font-Bold="True" Text="Cancelar" Theme="Office2010Silver">
                                            <ClientSideEvents Click="function(s, e) {
Cancel(AspxGrigWeUnidad);
}" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </EditForm>
        </Templates>
        <ClientSideEvents ToolbarItemClick="OnToolbarItemClick" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlWebUnidad" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" 
        DeleteCommand="DELETE FROM TB_UNIDAD WHERE id_unidad = @id_unidad"
        InsertCommand="INSERT INTO TB_UNIDAD (no_unidad,estado) VALUES (@no_unidad,@estado)" 
        SelectCommand="SELECT id_unidad,no_unidad FROM TB_UNIDAD " 
        UpdateCommand="UPDATE TB_UNIDAD SET NO_UNIDAD = @no_unidad WHERE id_unidad = @id_unidad">
        <InsertParameters>          
            <asp:Parameter Name="no_unidad" Type="String" />
            <asp:Parameter Name="estado" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="no_unidad" Type="String" />         
            <asp:Parameter Name="id_unidad" Type="String" />         
        </UpdateParameters>
        <DeleteParameters>           
            <asp:Parameter Name="id_unidad" Type="String" />
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
        AjustarGrid(AspxGrigWeUnidad, 250, document.documentElement.clientHeight, document.documentElement.clientWidth);

    </script>   
</asp:Content>
