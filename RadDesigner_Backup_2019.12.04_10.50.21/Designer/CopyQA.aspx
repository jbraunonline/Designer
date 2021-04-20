<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CopyQA.aspx.vb" Inherits="RadDesigner.CopyQA" %>

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
&nbsp;<telerik:RadStyleSheetManager ID="RadStyleSheetManager2" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadAjaxManager ID="RadAjaxManager2" runat="server">
        </telerik:RadAjaxManager>

             <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="WebBlue" SelectedIndex="0" Width="1400px" Align="Center">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Copy - QA Progress"  Visible="True" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Request New Master" visible="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="QA Audit" Visible="True" >
            </telerik:RadTab>
         </Tabs>
        </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1400px" Height="800px"
                ContentUrl="~/Designer/CopyPages/CopyProgress.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1400px" Height="900px"
                 ContentUrl="~/pages/page1.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" Width="1400px" Height="900px"
                ContentUrl="~/pages/Page1.aspx">
        </telerik:RadPageView>

    </telerik:RadMultiPage>
 
 
    </form>
    <h1>&nbsp;</h1>
</body>
</html>

