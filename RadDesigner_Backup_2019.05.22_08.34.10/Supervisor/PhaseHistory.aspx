<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PhaseHistory.aspx.vb" Inherits="RadDesigner.PhaseHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #CC0000;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #FFFF99;
        }
    </style>
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
        <h3>
    <a href="#" onclick = "javascript:window.open('', '_parent', '').close();"><strong><span class="auto-style1">Close Window</span></strong></a></h3>
&nbsp;</div>
        <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="Large"></asp:Label>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" Width="800px" Font-Bold="True" Font-Names="Arial">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="term" FilterControlAltText="Filter term column" HeaderText="term" SortExpression="term" UniqueName="term">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterCourse" FilterControlAltText="Filter MasterCourse column" HeaderText="MasterCourse" SortExpression="MasterCourse" UniqueName="MasterCourse">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Phase" FilterControlAltText="Filter Phase column" HeaderText="Phase" SortExpression="Phase" UniqueName="Phase">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [term], [MasterCourse], [Phase] FROM [OL_PhaseHistory] WHERE ([Course] = @Course)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="ACG2001" Name="Course" SessionField="Course" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
