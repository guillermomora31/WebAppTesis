<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="SiteMenu.Master" CodeFile="Recursos_Ing.aspx.vb" Inherits="Recursos_Ing" %>


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
    <script type="text/javascript" >
        function checkOne(objRef)
        {
            var row = objRef.parentNode.parentNode;
            if (objRef.checked)
            {
                row.style.backgroundColor = "gray";
            }
            else
            {
                row.style.backgroundColor = "white";
            }
        }

    </script>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-weight: bold;
            font-size: x-large;
            color: white;
            background-color:#993300;
        }
        .auto-style2 {
            width: 100%;
            border:#993300 5px solid;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style10 {
            height: 55px;
        }
        .auto-style11 {
            text-align: right;
        }
        </style>
    <div>
    <table border="0" style="margin: 0 auto;border-collapse: separate; border-spacing: 2px; width:100%">
        <tr>
            <td align="center">
                <dx:ASPxLabel runat="server" Text="ASIGNACION RECURSOS PEDAGOGICOS (INGRESO)" Width="100%" BackColor="#993333" Font-Bold="True" ForeColor="White" ID="ASPxLabel1" Font-Size="18px">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table border="0" class="normal_letter" style="margin: 0 auto;border-collapse: separate; border-spacing: 2px;">
                    <tr>
                        <td align="right" >
                            Unidad:</td>
                        <td align="left">
                            <dx:ASPxComboBox ID="ASPxCmbUnidad" runat="server" class="normal_letter" ClientInstanceName="ASPxCmbUnidad" CssClass="nor" DataSourceID="SqlDataUnidad" TextField="no_unidad" ValueField="id_unidad" Width="200px">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataUnidad" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="SELECT id_unidad,no_unidad FROM TB_UNIDAD"></asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            Tema:</td>
                        <td align="left">
                            <dx:ASPxComboBox ID="ASPxCmbTema" runat="server" class="normal_letter" ClientInstanceName="ASPxCmbTema" DataSourceID="SqlDataTema" TextField="no_tema" ValueField="id_tema" Width="200px">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataTema" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" 
                                SelectCommand="SELECT id_tema,no_tema FROM TB_TEMA where id_unidad=@id_unidad">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ASPxCmbUnidad" Name="id_unidad" PropertyName="Value" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" >
                            Contenidos:</td>
                        <td align="left">
                            <dx:ASPxComboBox ID="ASPxCmbContenidos" class="normal_letter" runat="server" ClientInstanceName="ASPxCmbContenidos" CssClass="nor" DataSourceID="SqlDataContenido" TextField="tx_descripcion" ValueField="id_contenido" Width="200px">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataContenido" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="SELECT id_contenido,tx_descripcion FROM TB_contenido order by secuencia"></asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="right">
                            Recursos:</td>
                        <td align="left">
                            <dx:ASPxComboBox ID="ASPxCmbRecursos" class="normal_letter" runat="server" ClientInstanceName="ASPxCmbRecursos" DataSourceID="SqlDataRecursos" TextField="valor" ValueField="id" Width="200px">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataRecursos" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="SELECT id,valor FROM TB_CATALOGO WHERE id_catalogo = 'recursos' order by id"></asp:SqlDataSource>
                            </td>
                    </tr>
                    <tr>
                        <td align="right" >
                            Archivo:</td>
                        <td align="left" colspan="4">
                    <asp:FileUpload ID="fuplCargar" runat="server" Width="524px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" >
                            Observaciones:</td>
                        <td align="left" colspan="4">
                    <asp:TextBox ID="txtObservacion" runat="server" Height="72px" Width="536px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" >
                            &nbsp;</td>
                        <td align="left">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            &nbsp;</td>
                        <td align="left">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="5" >
                            <table style="margin: 0 auto;border-collapse: separate; border-spacing: 2px;">
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="ASPxBtnRegresar" BackColor="#993333" Font-Bold="True" ForeColor="White" Native="True" runat="server" ClientInstanceName="ASPxBtnRegresar" Text="Regresar">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="btnCargar" BackColor="#993333" Font-Bold="True" ForeColor="White" Native="True" runat="server" ClientInstanceName="btnCargar" Text="Guardar">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" >
                            &nbsp;</td>
                        <td align="left">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            &nbsp;</td>
                        <td align="left">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        </table>
        <dx:ASPxPopupControl ID="popupmensaje" runat="server" AllowDragging="True" ClientInstanceName="popupmensaje" CloseAction="None" HeaderText="Mensaje" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
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
                                    <dx:ASPxButton ID="AspxBotOk" runat="server" AutoPostBack="False" ClientInstanceName="AspxBotOk" BackColor="#993333" Font-Bold="True" ForeColor="White" Native="True" Text="Aceptar" >
                                        <ClientSideEvents Click="function(s, e) {
	                                    if (lblmessager.GetText()=='Grabacion Ok!'){
                                            document.location.href ='Recursos.aspx';
                                        } else{
                                            popupmensaje.Hide();
                                        }

                                        
                                    }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle CssClass="dialogHeaderPoPup" Font-Bold="True" ForeColor="White" BackColor="#993333" />
        </dx:ASPxPopupControl>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>

