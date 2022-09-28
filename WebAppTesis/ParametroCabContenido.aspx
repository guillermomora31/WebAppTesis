<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="SiteMenu.Master" CodeFile="ParametroCabContenido.aspx.vb" Inherits="ParametroCabContenido" %>

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
            /*if (e.item.name == 'Nuevo') {
                e.
                win = window.open('ParametroContenido.aspx','_self')
                return;
            }*/

            if(IsExportToolbarCommand(e.item.name)){
                e.processOnServer=true;
                e.usePostBack=true;
            }
        }
        function IsExportToolbarCommand(command) {
            return command == "ExportToPDF" || command == "ExportToXLSX" || command == "ExportToXLS";
        }
    </script>
    <dx:ASPxGridViewExporter ID="Export_AspxGrid" runat="server" GridViewID="AspxGrigWeParametroCab">
    </dx:ASPxGridViewExporter>

    <dx:ASPxGridView ID="AspxGrigWeParametroCab" runat="server" autogeneratecolumns="False" ClientInstanceName="AspxGrigWeParametroCab" datasourceid="SqlWebParametro" KeyFieldName="id_param" OnToolbarItemClick="AspxGrigWeParametroCab_ToolbarItemClick" Theme="Office2010Silver" width="100%">
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
                    <dx:GridViewToolbarItem Command="New" Name="Nuevo" Image-Url="~/Imagenes/ico_nuevo.png" Image-UrlDisabled="~/Imagenes/ico_nuevo.png" Text="Nuevo">
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
            <DeleteButton Image-Url="Imagenes/icon_delete.png" Text="Eliminar">
                <Image Url="imagenes/icon_delete.png">
                </Image>
            </DeleteButton>
        </SettingsCommandButton>
        <Columns>
            <dx:GridViewCommandColumn ButtonRenderMode="Image" Caption=" " ShowDeleteButton="true" ShowEditButton="true" VisibleIndex="0" Width="60px" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="idUnidad" VisibleIndex="1" Caption="Cod. Unidad">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Unidad" FieldName="NoUnidad" VisibleIndex="2">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cod. Tema" FieldName="idTema" VisibleIndex="3">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nombre Tema" FieldName="noTema" VisibleIndex="4">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cod. Contenido" FieldName="idContenido" VisibleIndex="5">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Contenido" FieldName="NoContendido" VisibleIndex="6">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cod. Parametro" FieldName="id_param" VisibleIndex="7">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Identificador" FieldName="identificador" VisibleIndex="8">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Valor" FieldName="valor" VisibleIndex="9">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="Descripcion" VisibleIndex="10">
                <HeaderStyle Font-Bold="True" />
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
                Parametros Contenido
            </TitlePanel>
            <EditForm>
                <table id="Web2_1" border="0" class="normal_letter" style="border-collapse: separate; border-spacing: 1px; width: 100%">
                    <tr>
                        <td class="normal_letter" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">Unidad:</td>
                        <td style="text-align:left">
                            <dx:ASPxComboBox ID="ASPxCmbUnidad" runat="server" class="normal_letter" ClientInstanceName="ASPxCmbUnidad" CssClass="nor" DataSourceID="SqlDataUnidad" OnLoad="ASPxCmbUnidad_OnLoad" TextField="no_unidad" ValueField="id_unidad" Width="200px">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataUnidad" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="SELECT id_unidad,no_unidad FROM TB_UNIDAD"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">Tema:</td>
                        <td style="text-align:left">
                            <dx:ASPxComboBox ID="ASPxCmbTema" runat="server" class="normal_letter" ClientInstanceName="ASPxCmbTema" DataSourceID="SqlDataTema" OnLoad="ASPxCmbTema_OnLoad" TextField="no_tema" ValueField="id_tema" Width="200px">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataTema" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="SELECT id_tema,no_tema FROM TB_TEMA where id_unidad = @id_unidad">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ASPxCmbUnidad" Name="id_unidad" PropertyName="Value" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">*Contenido:</td>
                        <td style="text-align:left">
                            <dx:ASPxComboBox ID="ASPxCmbContenidos" OnLoad="ASPxCmbContenidos_OnLoad" runat="server" class="normal_letter" ClientInstanceName="ASPxCmbContenidos" CssClass="nor" DataSourceID="SqlDataContenido" TextField="tx_descripcion" ValueField="id_contenido" Width="200px">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataContenido" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" 
                                SelectCommand="SELECT id_contenido,tx_descripcion FROM TB_contenido where id_tema=@id_tema and id_unidad=@id_unidad order by secuencia">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ASPxCmbTema" Name="id_tema" PropertyName="Value" Type="String" />
                                    <asp:ControlParameter ControlID="ASPxCmbUnidad" Name="id_unidad" PropertyName="Value" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">*Identificador:</td>
                        <td style="text-align:left">
                            <dx:ASPxTextBox ID="AspxTxtIdentificador" runat="server" ClientInstanceName="AspxTxtIdentificador" CssClass="normal_letter" MaxLength="100" Text='<%#Bind("identificador")%>' Theme="Office2010Silver">
                                <ClientSideEvents Validation="function(s, e) {
                                                var AspxTxtIdentificador = e.value;
                                                if (AspxTxtIdentificador == null)
                                                    {
                                                        e.isValid = false;
                                                        return;
                                                    }
                                                if (AspxTxtIdentificador.length == 0)
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
                                    <RequiredField ErrorText="Ingrese Identificador." IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink">
                                </InvalidStyle>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">*Valor:</td>
                        <td style="text-align:left">
                            <dx:ASPxSpinEdit ID="ASPxSpValor" runat="server" ClientInstanceName="ASPxSpValor" MaxLength="3" MaxValue="100" MinValue="1" Number='<%#Bind("valor")%>' NumberType="Integer" Width="50px">
                                <ValidationSettings CausesValidation="True" Display="Dynamic" SetFocusOnError="True">
                                    <ErrorImage Height="16px" Url="Imagenes/ico_advertencia.png" Width="16px">
                                    </ErrorImage>
                                    <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                        <ErrorTextPaddings PaddingRight="3px" />
                                        <Paddings Padding="0px" PaddingLeft="0px" />
                                    </ErrorFrameStyle>
                                    <RequiredField ErrorText="Ingrese Valor." IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink">
                                </InvalidStyle>
                            </dx:ASPxSpinEdit>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">*Descripcion:</td>
                        <td style="text-align:left">
                            <dx:ASPxMemo ID="ASPxMemoDesc" runat="server" ClientInstanceName="ASPxMemoDesc" Text='<%#Bind("Descripcion")%>' Height="71px" MaxLength="250" Width="100%">
                                <ValidationSettings CausesValidation="True" Display="Dynamic" SetFocusOnError="True">
                                    <ErrorImage Height="16px" Url="Imagenes/ico_advertencia.png" Width="16px">
                                    </ErrorImage>
                                    <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                        <ErrorTextPaddings PaddingRight="3px" />
                                        <Paddings Padding="0px" PaddingLeft="0px" />
                                    </ErrorFrameStyle>
                                    <RequiredField ErrorText="Ingrese Descripcion." IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink">
                                </InvalidStyle>
                            </dx:ASPxMemo>
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
	                                                Grabar(AspxGrigWeParametroCab,'Web2_1');
                                                }" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="AspxBtnCancel" runat="server" AutoPostBack="False" CssClass="normal_letter" Font-Bold="True" Text="Cancelar" Theme="Office2010Silver">
                                            <ClientSideEvents Click="function(s, e) {
Cancel(AspxGrigWeParametroCab);
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
    <asp:SqlDataSource ID="SqlWebParametro" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" 
        DeleteCommand="DELETE FROM TB_PARAM_CONTENIDO WHERE id_parama = @id_param "
        InsertCommand="INSERT INTO tb_param_contenido (id_unidad, id_tema, id_contenido, identificador, valor, txt_descripcion) VALUES (@idUnidad, @idTema, @idContenido, @identificador, @valor, @txt_descripcion)" 
        SelectCommand="select a.id_unidad as idUnidad,a.no_unidad as NoUnidad,b.id_tema as idTema,b.no_tema as noTema,c.id_contenido as idContenido, 
      c.tx_descripcion as NoContendido,d.id_param as id_param,d.identificador as identificador,d.valor as valor,d.txt_descripcion as Descripcion
from tb_unidad a, tb_tema b,tb_contenido c, tb_param_contenido d
where a.id_unidad = d.id_unidad
and b.id_tema = d.id_tema
and c.id_contenido = d.id_contenido" 
        UpdateCommand="UPDATE TB_PARAM_CONTENIDO SET valor = @valor, identificador=@identificador, txt_descripcion = @txt_descripcion WHERE id_param = @id_param">
        <InsertParameters>
            <asp:Parameter Name="idUnidad" Type="String" />
            <asp:Parameter Name="idTema" Type="String" />
            <asp:Parameter Name="idContenido" Type="String" />
            <asp:Parameter Name="identificador" Type="String" />
            <asp:Parameter Name="valor" Type="String" />
            <asp:Parameter Name="txt_descripcion" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="valor" Type="String" />
            <asp:Parameter Name="identificador" Type="String" />
            <asp:Parameter Name="txt_descripcion" Type="String" />
            <asp:Parameter Name="id_param" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="parametro" Type="String" />
            <asp:Parameter Name="id" Type="String" />
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
        AjustarGrid(AspxGrigWeParametroCab, 250, document.documentElement.clientHeight, document.documentElement.clientWidth);

    </script>   
</asp:Content>





