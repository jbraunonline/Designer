<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Modules.aspx.vb" Inherits="RadDesigner.Modules" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
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
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
        <div>
            <fieldset>
                <legend><strong>Modules/Lessons</strong></legend>
                <asp:CheckBox ID="chkAssessPreview" runat="server" Text="All Assessment Preview" />
                <br />
                <asp:CheckBox ID="chkAssessNewWindow" runat="server" Text="All Assessment - Test Options - Open in new window set to NO" />
                <br />
                <asp:CheckBox ID="chkAssessAvail" runat="server" Text="All Assessment - Test Options -&quot;make test available&quot; set to YES" />
                <br />
                <asp:CheckBox ID="chkAllVideos" runat="server" Text="All Videos Preview" />
                <br />
                <asp:CheckBox ID="chkAllImages" runat="server" Text="All Images Viewable" />
                <br />
                <asp:CheckBox ID="chkAllLinks" runat="server" Text="All Links Work" />
                <br />
                Please list all content problems:<br />
                <br />
                <telerik:RadEditor ID="RadEditor1" Runat="server" BackColor="#D5F1FF" Width="1200px">
                </telerik:RadEditor>
                <br />
                <br />
                <br />
                </fieldset>
        </div>
    </form>
</body>
</html>
