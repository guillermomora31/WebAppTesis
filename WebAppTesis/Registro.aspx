<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="SiteMenu.Master" CodeFile="Registro.aspx.vb" Inherits="Registro" %>


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

    <dx:ASPxGridViewExporter ID="Export_AspxGrid" runat="server" GridViewID="AspxGrigWeb2_1">
    </dx:ASPxGridViewExporter>

    <dx:ASPxGridView ID="AspxGrigWeb2_1" runat="server" autogeneratecolumns="False" ClientInstanceName="AspxGrigWeb2_1" datasourceid="SqlWeb2_1" KeyFieldName="sec" OnToolbarItemClick="AspxGrigWeb2_1_ToolbarItemClick" Theme="Office2010Silver" width="100%">
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
            <dx:GridViewDataTextColumn FieldName="sec" VisibleIndex="1">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Clave" FieldName="clave" VisibleIndex="4" Visible="false">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Id" FieldName="id" VisibleIndex="3">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="correo" VisibleIndex="6" Caption="Correo">
                <Settings AllowAutoFilter="True" />
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="rol" VisibleIndex="7" Visible="False">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="clase" VisibleIndex="9" Caption="Clase">
                <Settings AllowAutoFilter="False" />
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nivel" VisibleIndex="11" Visible="False">
                <HeaderStyle Font-Bold="True" />
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nombre" VisibleIndex="5" Caption="Nombre">
                <Settings AllowAutoFilter="True" />
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Rol" FieldName="ds_rol" VisibleIndex="2">
                <HeaderStyle Font-Bold="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nivel" FieldName="ds_nivel" ShowInCustomizationForm="True" VisibleIndex="12">
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
                Registro de Usuario(s)
            </TitlePanel>
            <EditForm>
                <table id="Web2_1" border="0" class="normal_letter" style="border-collapse: separate; border-spacing: 1px; width: 100%">
                    <tr>
                        <td class="normal_letter" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">*Nombres:</td>
                        <td style="text-align:left">
                            <dx:ASPxTextBox ID="AspxTxtNombre" runat="server" ClientInstanceName="AspxTxtNombre" CssClass="normal_letter" MaxLength="100" Text='<%#Bind("nombre")%>' Theme="Office2010Silver">
                                <ClientSideEvents Validation="function(s, e) {
                                                var AspxTxtNombre = e.value;
                                                if (AspxTxtNombre == null)
                                                    {
                                                        e.isValid = false;
                                                        return;
                                                    }
                                                if (AspxTxtNombre.length == 0)
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
                                    <RequiredField ErrorText="Ingrese Nombres." IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink">
                                </InvalidStyle>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">*Correo:</td>
                        <td style="text-align:left">
                            <dx:ASPxTextBox ID="ASPxTxtCorreo" runat="server" MaxLength="100" ClientInstanceName="ASPxTxtCorreo" CssClass="normal_letter" Text='<%#Bind("correo") %>' Theme="Office2010Silver" Width="100%">
                                <ClientSideEvents Validation="function(s, e) {
                                var ASPxTxtemail = e.value;
                                if (ASPxTxtemail == null)
                                    {
                                        e.isValid = false;
                                        return;
                                    }
                                if (ASPxTxtemail.length == 0)
                                    {
                                        e.isValid = false;
                                        return;
                                    }
}" />
                                <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorText="Ingrese Correo">
                                    <ErrorImage Height="16px" Url="Imagenes/ico_advertencia.png" Width="16px">
                                    </ErrorImage>
                                    <ErrorFrameStyle Font-Bold="True" ForeColor="Red">
                                        <ErrorTextPaddings PaddingRight="3px" />
                                        <Paddings Padding="0px" PaddingLeft="0px" />
                                    </ErrorFrameStyle>
                                    <RegularExpression ErrorText="Ingrese Correo Valido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                    <RequiredField ErrorText="Ingrese Correo." IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink">
                                </InvalidStyle>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">* Rol:</td>
                        <td style="text-align:left">
                            <dx:ASPxComboBox ID="AspxCmbRol" runat="server" ClientInstanceName="AspxCmbRol" CssClass="normal_letter" OnLoad="AspxCmbRol_OnLoad" SelectedIndex="0" Theme="Office2010Silver">
                                <Items>
                                    <dx:ListEditItem Selected="True" Text="Estudiante" Value="E" />
                                    <dx:ListEditItem Text="Tutor" Value="T" />
                                    <dx:ListEditItem Text="Administrador" Value="A" />
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
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
                                                if (s.GetValue() == 'E')
                                                {
                                                    AspxCmbNivel.SetEnabled(true);
                                                    AspxCmbNivel.SetSelectedIndex(0);
                                                }
                                                else
                                                {   
                                                    AspxCmbNivel.SetEnabled(false);
                                                    AspxCmbNivel.SetSelectedIndex(-1);
                                                }
                                            }" Validation="function(s, e) {
                                                var AspxCmbRol = e.value;
                                                if (AspxCmbRol == null)
                                                    {
                                                        e.isValid = false;
                                                        return;
                                                    }
                                                if (AspxCmbRol.length == 0)
                                                    {
                                                        e.isValid = false;
                                                        return;
                                                    }
                                            }" />
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">* Clase:</td>
                        <td style="text-align:left">
                            <dx:ASPxTextBox ID="AspxtxtClase" runat="server" ClientInstanceName="AspxtxtClase" CssClass="normal_letter" MaxLength="15" Text='<%#Bind("clase")%>' Theme="Office2010Silver">
                                <ClientSideEvents Validation="function(s, e) {
                                                var AspxtxtClase = e.value;
                                                if (AspxtxtClase == null)
                                                    {
                                                        e.isValid = false;
                                                        return;
                                                    }
                                                if (AspxtxtClase.length == 0)
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
                                    <RequiredField ErrorText="Ingrese Clase." IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink">
                                </InvalidStyle>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">* Nivel:</td>
                        <td style="text-align:left">
                            <dx:ASPxComboBox ID="AspxCmbNivel" runat="server" ClientInstanceName="AspxCmbNivel" CssClass="normal_letter" OnLoad="AspxCmbNivel_OnLoad" SelectedIndex="0" Theme="Office2010Silver">
                                <Items>
                                    <dx:ListEditItem Selected="True" Text="Básico" Value="B" />
                                    <dx:ListEditItem Text="Intermedio" Value="Intermedio" />
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
                        <td class="normal_letter" style="text-align:right">* Usuario:</td>
                        <td style="text-align:left">
                            <dx:ASPxTextBox ID="AspxTxtUsuario" runat="server" ClientInstanceName="AspxTxtUsuario" 
                                CssClass="normal_letter"
                                MaxLength="25" OnLoad="Aspxtxtusuario_OnLoad" 
                                OnValidation="Aspxtxtusuario_Validation" Text='<%#Bind("id")%>' Theme="Office2010Silver" 
                                ValidationSettings-CausesValidation="true" Width="150px">
                                <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                    <RequiredField ErrorText="Ingrese Usuario." IsRequired="True" />
                                    <ErrorImage Height="16px" Url="imagenes/ico_advertencia.png" Width="16px" />
                                    <ErrorFrameStyle Font-Bold="true" ForeColor="Red">
                                        <ErrorTextPaddings PaddingRight="3px" />
                                        <Paddings Padding="0px" PaddingLeft="0px" />
                                    </ErrorFrameStyle>
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink" />
                                <ClientSideEvents Validation="function(s, e) {
                                                var Aspxtxtusuario = e.value;
                                                if (Aspxtxtusuario == null)
                                                    {
                                                        e.isValid = false;
                                                        return;
                                                    }
                                                if (Aspxtxtusuario.length == 0)
                                                    {
                                                        e.isValid = false;
                                                        return;
                                                    }
                                            }" />
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">
                            <dx:ASPxLabel ID="ASpxlblpass" runat="server" Text="* Clave:">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align:left">
                            <dx:ASPxTextBox ID="ASPxTxtpwd_usua" runat="server" ClientInstanceName="Aspxtxtpwd_usua" MaxLength="5" OnLoad="ASPxTxtpwd_usua_OnLoad" Password="True" Text="" Theme="Office2010Silver" Width="115px">
                                <ValidationSettings CausesValidation="True" Display="Dynamic" SetFocusOnError="True">
                                    <ErrorImage Height="16px" Url="imagenes/ico_advertencia.png" Width="16px" />
                                    <ErrorFrameStyle Font-Bold="true" ForeColor="Red">
                                        <ErrorTextPaddings PaddingRight="3px" />
                                        <Paddings Padding="0px" PaddingLeft="0px" />
                                    </ErrorFrameStyle>
                                    <RequiredField ErrorText="Ingrese Clave" IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink" />
                                <ClientSideEvents Validation="function(s, e) {
                                        var ASPxTxtpwd_usua = e.value;
                                        if (ASPxTxtpwd_usua == null)
                                            {
                                                e.isValid = false;
                                                return;
                                            }
                                        if (ASPxTxtpwd_usua.length == 0)
                                            {
                                                e.isValid = false;
                                                return;
                                            }
                                    }" />
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal_letter" style="text-align:right">
                            <dx:ASPxLabel ID="AspxlblpassR" runat="server" Text="* Repetir Clave:">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align:left">
                            <dx:ASPxTextBox ID="ASPxTxtpwd_usuaR" runat="server" ClientInstanceName="ASPxTxtpwd_usuaR" MaxLength="5" Password="True" Text='<%# Bind("clave") %>' Theme="Office2010Silver" Width="115px">
                                <ValidationSettings CausesValidation="True" Display="Dynamic" SetFocusOnError="True">
                                    <ErrorImage Height="16px" Url="imagenes/ico_advertencia.png" Width="16px" />
                                    <ErrorFrameStyle Font-Bold="true" ForeColor="Red">
                                        <ErrorTextPaddings PaddingRight="3px" />
                                        <Paddings Padding="0px" PaddingLeft="0px" />
                                    </ErrorFrameStyle>
                                    <RequiredField ErrorText="Ingrese Repetir Clave" IsRequired="True" />
                                </ValidationSettings>
                                <InvalidStyle BackColor="LightPink" />
                                <ClientSideEvents Validation="function(s, e) {
                                        var ASPxTxtpwd_usuaR = e.value;
                                        if (ASPxTxtpwd_usuaR == null)
                                            {
                                                e.isValid = false;
                                                return;
                                            }
                                        if (ASPxTxtpwd_usuaR.length == 0)
                                            {
                                                e.isValid = false;
                                                return;
                                            }
                                    }" />
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
	                                                Grabar(AspxGrigWeb2_1,'Web2_1');
                                                }" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="AspxBtnCancel" runat="server" AutoPostBack="False" CssClass="normal_letter" Font-Bold="True" Text="Cancelar" Theme="Office2010Silver">
                                            <ClientSideEvents Click="function(s, e) {
Cancel(AspxGrigWeb2_1);
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
    <asp:SqlDataSource ID="SqlWeb2_1" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" 
        DeleteCommand="DELETE FROM TB_USUARIO WHERE sec = @sec" 
        InsertCommand="INSERT INTO TB_USUARIO (id, clave, nombre, correo, rol, clase, nivel) VALUES (@id, @clave, @nombre, @correo, @rol, @clase, @nivel)" 
        SelectCommand="select sec, id, clave, nombre, correo, rol, clase, nivel,
(CASE rol
  WHEN 'T' THEN 'Tutor'
  WHEN 'E' THEN 'Estudiante'
  ELSE 'Administrador'
 END) as ds_rol,
(CASE nivel
  WHEN 'B' THEN 'Basico'
  WHEN 'I' THEN 'Intermedio'
  WHEN 'A' THEN 'Avanzado'
  ELSE ''
 END) as ds_nivel
from TB_USUARIO" 
        UpdateCommand="UPDATE TB_USUARIO SET nombre = @nombre, correo = @correo, rol = @rol, clase=@clase, nivel=@nivel WHERE sec = @sec">
        <InsertParameters>
            <asp:Parameter Name="id" Type="String" />
            <asp:Parameter Name="clave" Type="String" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="correo" Type="String" />
            <asp:Parameter Name="rol" Type="String" />
            <asp:Parameter Name="clase" Type="String" />
            <asp:Parameter Name="nivel" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="correo" Type="String" />
            <asp:Parameter Name="rol" Type="String" />
            <asp:Parameter Name="clase" Type="String" />
            <asp:Parameter Name="nivel" Type="String" />
            <asp:Parameter Name="sec" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="sec" Type="String" />
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
        AjustarGrid(AspxGrigWeb2_1, 250, document.documentElement.clientHeight, document.documentElement.clientWidth);

    </script>   
</asp:Content>

