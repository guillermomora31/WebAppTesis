<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="SiteMenu.Master" CodeFile="Seguimiento.aspx.vb" Inherits="Seguimiento" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StyleTesis.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .normal_letter {
            text-align: center;
        }
        .auto-style1 {
            height: 18px;
        }
        .auto-style23 {
            height: 23px;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Styles/StyleTesis.css" rel="stylesheet" type="text/css" />
    <div align="center">
        <table border="0" style="margin: 0 auto;border-collapse: separate; border-spacing: 2px; width:100%">
            <tr>
                <td align="center" colspan="2">
                    <dx:ASPxLabel runat="server" Text="VISUALIZACION PROGRESO DE LOS ESTUDIANTES" Width="100%" BackColor="#993333" Font-Bold="True" ForeColor="White" ID="ASPxLabel1" Font-Size="18px">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <table border="0" style="margin: 0 auto;border-collapse: separate; border-spacing: 1px;">
                        <tr>
                            <td align="right" class="normal_letter">Estudiante:</td>
                            <td align="left" class="normal_letter">
                                <dx:ASPxComboBox ID="dplEstudiante" ClientInstanceName="dplEstudiante" runat="server" DataSourceID="SqlDataEstudiantes" TextField="nombre" ValueField="id_estudiante">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="select id_estudiante,nombre from tb_avance inner join tb_usuario on tb_avance.id_estudiante = tb_usuario.id" ID="SqlDataEstudiantes"></asp:SqlDataSource>
                            </td>
                            <td class="normal_letter">
                                &nbsp;</td>
                            <td align="left" class="normal_letter">
                                <table align="center">
                                    <tr>
                                        <td class="normal_letter">
                                            <dx:ASPxButton ID="btnConsultar" Font-Bold="True" ForeColor="White" BackColor="#993333" Native="True" ClientInstanceName="btnConsultar" runat="server" Text="Por Estudiante">
                                            </dx:ASPxButton>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td class="normal_letter">
                                            <dx:ASPxButton ID="btnTodos" Font-Bold="True" ForeColor="White" BackColor="#993333" Native="True" runat="server" Text="Todos">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <dxcharts:WebChartControl ID="WebChartControl1" runat="server" AppearanceNameSerializable="Light" CrosshairEnabled="True" DataSourceID="SqlDataGraf_Est" Height="450px" Width="700px">
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
                    </dxcharts:WebChartControl>
                    <asp:SqlDataSource ID="SqlDataGraf_Est" runat="server" ConnectionString="<%$ ConnectionStrings:dbtutorConnectionString %>" ProviderName="<%$ ConnectionStrings:dbtutorConnectionString.ProviderName %>" SelectCommand="select puntaje_total,nombre from tb_avance inner join tb_usuario on tb_avance.id_estudiante = tb_usuario.id"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


