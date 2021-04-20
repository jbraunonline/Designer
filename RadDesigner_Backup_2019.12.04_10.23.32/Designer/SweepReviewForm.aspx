<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SweepReviewForm.aspx.vb" Inherits="RadDesigner.SweepReviewForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
      <telerik:RadStyleSheetManager ID="RadStyleSheetManager2" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadAjaxManager ID="RadAjaxManager2" runat="server">
        </telerik:RadAjaxManager>
        <asp:Button ID="btnReturn" runat="server" BackColor="#CCFFCC" Font-Bold="True" Font-Names="Arial" Text="Return to List of Sweeps" Font-Size="XX-Small" />
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="BlackMetroTouch" SelectedIndex="0" Width="1200px" Align="Center">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Sweep1"  Visible="True" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Sweep2" visible="True" >
            </telerik:RadTab>

         </Tabs>
        </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1200px" Height="1200px"
                ContentUrl="Sweep/Sweep1.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1200px" Height="1200px"
                 ContentUrl="Sweep/Sweep2.aspx">
        </telerik:RadPageView>
  

    </telerik:RadMultiPage>
 
 
    </form>
    <h1>&nbsp;</h1>
</body>
</html>



