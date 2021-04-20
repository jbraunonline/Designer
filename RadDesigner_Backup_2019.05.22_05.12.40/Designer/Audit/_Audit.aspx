<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="_Audit.aspx.vb" Inherits="RadDesigner.Audit" %>

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

             <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="WebBlue" SelectedIndex="0" Width="1600px" Align="Center" Font-Size="Small" Height="32px" Font-Names="Arial">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Audit Progress"  Visible="True" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Create Audit" visible="True" >
            </telerik:RadTab>

         </Tabs>
        </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1600px" Height="1200px"
                ContentUrl="AuditProgress.aspx" Font-Bold="True" Font-Names="Arial">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="CreateAudit.aspx">
        </telerik:RadPageView>


    </telerik:RadMultiPage>
 
 
    </form>
    <h1>&nbsp;</h1>
</body>
</html>
