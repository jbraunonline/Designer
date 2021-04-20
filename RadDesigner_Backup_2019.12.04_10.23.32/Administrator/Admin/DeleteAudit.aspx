<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DeleteAudit.aspx.vb" Inherits="RadDesigner.DeleteAudit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

body {
    font-family: Arial, Helvetica, sans-serif;

    background-color: lightblue;
}
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
    <div class="auto-style1">
    
        Delete Audits&nbsp;
        <asp:Button ID="Button1" runat="server" BackColor="Lime" Font-Bold="True" Text="Return to Index" />
        </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="Audit_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="Audit_ID" DataType="System.Int32" FilterControlAltText="Filter Audit_ID column" HeaderText="Audit_ID" ReadOnly="True" SortExpression="Audit_ID" UniqueName="Audit_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term" DataType="System.Int32" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Designer" FilterControlAltText="Filter Designer column" HeaderText="Designer" SortExpression="Designer" UniqueName="Designer">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Auditor" FilterControlAltText="Filter Auditor column" HeaderText="Auditor" SortExpression="Auditor" UniqueName="Auditor">
                    </telerik:GridBoundColumn>
                    <telerik:GridHyperLinkColumn DataTextField="MasterName" HeaderText="Delete" UniqueName="Delete" DataNavigateUrlFields="MasterName" DataNavigateUrlFormatString="AuditDelete.aspx?ID={0}" Text="Delete" DataTextFormatString="Delete">
</telerik:GridHyperLinkColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Audit_ID], [MasterName], [Term], [Designer], [Auditor] FROM [OL_MasterAudit] WHERE ([Term] = @Term)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="2193" Name="Term" SessionField="NextTerm" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
