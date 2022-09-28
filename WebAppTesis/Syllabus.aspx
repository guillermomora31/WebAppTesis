<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="SiteMenu.Master" CodeFile="Syllabus.aspx.vb" Inherits="Syllabus" %>


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

    <dx:ASPxGridViewExporter ID="Export_AspxGrid" runat="server" GridViewID="AspxGrigWeRegistro">
    </dx:ASPxGridViewExporter>

    <dx:ASPxGridView ID="AspxGrigWeRegistro" runat="server" autogeneratecolumns="False" ClientInstanceName="AspxGrigWeRegistro" datasourceid="SqlWebRegistro" KeyFieldName="id_contenido" OnToolbarItemClick="AspxGrigWeRegistro_ToolbarItemClick" Theme="Office2010Silver" width="100%">
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
            <dx:GridViewDataTextColumn FieldName="id_contenido" VisibleIndex="1" Caption="Código">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nivel" VisibleIndex="4" Visible="False">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Estado" Visible="false" FieldName="estado" VisibleIndex="6">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="puntaje" VisibleIndex="7" Caption="Puntaje">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="secuencia" Visible="false" VisibleIndex="5" Caption="secuencia">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="tx_descripcion" VisibleIndex="2" Caption="Contenido">
                <Settings AllowAutoFilter="true" />
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nivel" FieldName="ds_nivel" VisibleIndex="3">
                <Settings AllowAutoFilter="true" />
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="id_unidad" Visible="False" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="id_tema" Visible="False" VisibleIndex="9">
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
                Gestion Base de Conocimiento
            </TitlePanel>
            <EditForm>
                <table id="Web2_1" border="0" class="normal_letter" style="border-collapse: separate; border-spacing: 1px; width: 100%">
                    <tr>
                        <td class="normal_letter" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">Unidad:</td>
                        <td style="text-align:left">
                            <dx:ASPxComboBox ID="ASPxCmbUnidad" runat="server" OnLoad="ASPxCmbUnidad_OnLoad"  class="normal_letter" ClientInstanceName="ASPxCmbUnidad" CssClass="nor" DataSourceID="SqlDataUnidad" TextField="no_unidad" ValueField="id_unidad" Width="200px">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataUnidad" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="SELECT id_unidad,no_unidad FROM TB_UNIDAD"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">Tema:</td>
                        <td style="text-align:left">
                            <dx:ASPxComboBox ID="ASPxCmbTema" OnLoad="ASPxCmbTema_OnLoad" runat="server" class="normal_letter" ClientInstanceName="ASPxCmbTema" DataSourceID="SqlDataTema" TextField="no_tema" ValueField="id_tema" Width="200px">
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
                            <dx:ASPxTextBox ID="AspxTxtDescripcion" runat="server" ClientInstanceName="AspxTxtDescripcion" CssClass="normal_letter" MaxLength="100" Text='<%#Bind("tx_descripcion")%>' Theme="Office2010Silver">
                                <ClientSideEvents Validation="function(s, e) {
                                                var AspxTxtDescripcion = e.value;
                                                if (AspxTxtDescripcion == null)
                                                    {
                                                        e.isValid = false;
                                                        return;
                                                    }
                                                if (AspxTxtDescripcion.length == 0)
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
                                    <RequiredField ErrorText="Ingrese Contenido." IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink">
                                </InvalidStyle>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">*Nivel:</td>
                        <td style="text-align:left">
                            <dx:ASPxComboBox ID="AspxCmbNivel" runat="server" ClientInstanceName="AspxCmbNivel" CssClass="normal_letter" OnLoad="AspxCmbNivel_OnLoad" SelectedIndex="0" Theme="Office2010Silver">
                                <Items>
                                    <dx:ListEditItem Selected="True" Text="Básico" Value="B" />
                                    <dx:ListEditItem Text="Intermedio" Value="I" />
                                    <dx:ListEditItem Text="Avanzado" Value="A" />
                                </Items>
                                <ValidationSettings CausesValidation="True" Display="Dynamic" SetFocusOnError="True">
                                    <RequiredField ErrorText="Seleccione Entidad" IsRequired="True" />
                                    <ErrorImage Height="16px" Url="imagenes/ico_advertencia.png" Width="16px" />
                                    <ErrorFrameStyle Font-Bold="true" ForeColor="Red">
                                        <Paddings Padding="0px" PaddingLeft="0px" />
                                        <ErrorTextPaddings PaddingRight="3px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">*Secuencia:</td>
                        <td style="text-align:left">
                            <dx:ASPxSpinEdit ID="ASPxSpSecuencia" runat="server" ClientInstanceName="ASPxSpSecuencia" MaxLength="2" MaxValue="99" MinValue="1" Number='<%#Bind("secuencia")%>' NumberType="Integer" Width="50px">
                                <ValidationSettings CausesValidation="True" Display="Dynamic" SetFocusOnError="True">
                                    <ErrorImage Height="16px" Url="Imagenes/ico_advertencia.png" Width="16px">
                                    </ErrorImage>
                                    <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                        <ErrorTextPaddings PaddingRight="3px" />
                                        <Paddings Padding="0px" PaddingLeft="0px" />
                                    </ErrorFrameStyle>
                                    <RequiredField ErrorText="Ingrese Secuencia." IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink">
                                </InvalidStyle>
                            </dx:ASPxSpinEdit>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">*Puntaje:</td>
                        <td style="text-align:left">
                            <dx:ASPxSpinEdit ID="ASPxSpPuntaje" runat="server" ClientInstanceName="ASPxSpPuntaje" MaxLength="3" MaxValue="100" MinValue="1" Number='<%#Bind("puntaje")%>' NumberType="Integer" Width="50px">
                                <ValidationSettings CausesValidation="True" Display="Dynamic" SetFocusOnError="True">
                                    <ErrorImage Height="16px" Url="Imagenes/ico_advertencia.png" Width="16px">
                                    </ErrorImage>
                                    <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                        <ErrorTextPaddings PaddingRight="3px" />
                                        <Paddings Padding="0px" PaddingLeft="0px" />
                                    </ErrorFrameStyle>
                                    <RequiredField ErrorText="Ingrese Puntaje." IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink">
                                </InvalidStyle>
                            </dx:ASPxSpinEdit>
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
	                                                Grabar(AspxGrigWeRegistro,'Web2_1');
                                                }" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="AspxBtnCancel" runat="server" AutoPostBack="False" CssClass="normal_letter" Font-Bold="True" Text="Cancelar" Theme="Office2010Silver">
                                            <ClientSideEvents Click="function(s, e) {
Cancel(AspxGrigWeRegistro);
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
    <asp:SqlDataSource ID="SqlWebRegistro" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" 
        DeleteCommand="DELETE FROM TB_contenido WHERE id_contenido = @id_contenido" 
        InsertCommand="INSERT INTO TB_contenido (id_contenido,tx_descripcion,nivel, secuencia, estado, puntaje, id_unidad, id_tema) VALUES (@id_contenido, @tx_descripcion, @nivel, @secuencia, @estado, @puntaje, @id_unidad, @id_tema)" 
        SelectCommand="SELECT id_contenido,tx_descripcion,nivel, secuencia, estado, puntaje,
(CASE nivel
  WHEN 'B' THEN 'Basico'
  WHEN 'I' THEN 'Intermedio'
  WHEN 'A' THEN 'Avanzado'
  ELSE ''
 END) as ds_nivel,id_unidad,id_tema
 FROM TB_contenido order by secuencia" 
        UpdateCommand="UPDATE TB_contenido SET tx_descripcion = @tx_descripcion, nivel = @nivel, secuencia=@secuencia, puntaje=@puntaje, id_unidad = @id_unidad, id_tema = @id_tema WHERE id_contenido = @id_contenido">
        <InsertParameters>
            <asp:Parameter Name="id_contenido" Type="String" />
            <asp:Parameter Name="tx_descripcion" Type="String" />
            <asp:Parameter Name="nivel" Type="String" />
            <asp:Parameter Name="secuencia" Type="String" />
            <asp:Parameter Name="estado" Type="String" />
            <asp:Parameter Name="puntaje" Type="String" />
            <asp:Parameter Name="id_unidad" Type="String" />
            <asp:Parameter Name="id_tema" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tx_descripcion" Type="String" />
            <asp:Parameter Name="nivel" Type="String" />
            <asp:Parameter Name="secuencia" Type="String" />
            <asp:Parameter Name="puntaje" Type="String" />
            <asp:Parameter Name="id_unidad" Type="String" />
            <asp:Parameter Name="id_tema" Type="String" />
            <asp:Parameter Name="id_contenido" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="id_contenido" Type="String" />
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
        AjustarGrid(AspxGrigWeRegistro, 250, document.documentElement.clientHeight, document.documentElement.clientWidth);

    </script>   
</asp:Content>

