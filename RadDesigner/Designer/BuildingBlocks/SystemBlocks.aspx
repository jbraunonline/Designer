<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SystemBlocks.aspx.vb" Inherits="RadDesigner.SystemBlocks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
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
            <strong><span class="auto-style1">Publisher and Building Blocks in the System</span></strong><br />
            To sourt by Publisher, please drag the Publisher column heade into the grouping bar (top). Then click the arrow icon on the left side of the publisher name to expand the list.<br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT     dbo.OL_BBlock_Publisher.Publisher, dbo.OL_BBlock_Objects.BBName,dbo.OL_BBlock_Objects.BBObjVis
FROM         dbo.OL_BBlock_Publisher LEFT OUTER JOIN
                      dbo.OL_BBlock_Objects ON dbo.OL_BBlock_Publisher.Pub_ID = dbo.OL_BBlock_Objects.Pub_ID
ORDER BY dbo.OL_BBlock_Publisher.Publisher"></asp:SqlDataSource>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" ShowGroupPanel="True" Skin="WebBlue" Width="750px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowDragToGroup="True">
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GroupsDefaultExpanded="False">
                <Columns>
                    <telerik:GridBoundColumn DataField="Publisher" FilterControlAltText="Filter Publisher column" HeaderText="Publisher" SortExpression="Publisher" UniqueName="Publisher">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BBName" FilterControlAltText="Filter BBName column" HeaderText="BBName" SortExpression="BBName" UniqueName="BBName">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="BBObjVis" DataType="System.Boolean" FilterControlAltText="Filter BBObjVis column" HeaderText="BBObjVis" SortExpression="BBObjVis" UniqueName="BBObjVis">
                    </telerik:GridCheckBoxColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
