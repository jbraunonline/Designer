<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Supervisor.aspx.vb" Inherits="RadDesigner.Supervisor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager2" runat="server">
</telerik:RadStyleSheetManager>
        </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table >
 <tr><td style="vertical-align:top; width: 200px;"  >
         <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="Glow" Orientation="VerticalLeft" SelectedIndex="0" Width="200px">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Progress-Data"  Visible="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Progress-Graphic" visible="True" >
                </telerik:RadTab>
         </Tabs>
        </telerik:RadTabStrip>    
      &nbsp;&nbsp;    
      &nbsp;&nbsp;
 </td>
            <td style =vertical-align:top; width: 1600px;">
<telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1600px" Height="1200px"
                ContentUrl="Pages/ProgressData.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="Pages/ProgressGraphic.aspx">
        </telerik:RadPageView>
    
    </telerik:RadMultiPage>
      &nbsp;&nbsp;
            </td>
        </tr>
    </table>
,</table>

</asp:Content>
