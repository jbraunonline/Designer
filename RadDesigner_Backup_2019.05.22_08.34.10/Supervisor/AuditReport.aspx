<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AuditReport.aspx.vb" Inherits="RadDesigner.AuditReport" %>

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
    <div class="auto-style1">
    
        <strong>Audit &amp; Sweep Report</strong></div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True" DataSourceID="SqlDataSource1" ShowGroupPanel="True" Skin="WebBlue" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowDragToGroup="True">
            </ClientSettings>
             <MasterTableView AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" EnableGroupsExpandAll="true" GroupsDefaultExpanded="false"  CommandItemDisplay="Top" HierarchyDefaultExpanded="True"  >
            <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
                <Columns>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter Course column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Designer" FilterControlAltText="Filter Designer column" HeaderText="Designer" SortExpression="Designer" UniqueName="Designer">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Auditor" FilterControlAltText="Filter Auditor column" HeaderText="Auditor" SortExpression="Auditor" UniqueName="Auditor">
                    </telerik:GridBoundColumn>

                                <telerik:GridDateTimeColumn  DataField="AuditCreated" HeaderText="AuditCreated" SortExpression="AuditCreated" UniqueName="AuditCreated"  DataFormatString="{0:d}">
            </telerik:GridDateTimeColumn>




                                <telerik:GridDateTimeColumn  DataField="AuditStart" HeaderText="AuditStart" SortExpression="AuditStart" UniqueName="AuditStart"  DataFormatString="{0:d}">
            </telerik:GridDateTimeColumn>


                    <telerik:GridBoundColumn DataField="AuditStatus" FilterControlAltText="Filter AuditStatus column" HeaderText="AuditStatus" SortExpression="AuditStatus" UniqueName="AuditStatus">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SweepStatus" FilterControlAltText="Filter SweepStatus column" HeaderText="SweepStatus" SortExpression="SweepStatus" UniqueName="SweepStatus">
                    </telerik:GridBoundColumn>

                                <telerik:GridDateTimeColumn  DataField="SweepComplete" HeaderText="SweepComplete" SortExpression="SweepComplete" UniqueName="SweepComplete"  DataFormatString="{0:d}">
            </telerik:GridDateTimeColumn>


                           <telerik:GridTemplateColumn HeaderText="Sweep Complete" UniqueName="CopyMark" SortExpression="CopyMark"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='Images/<%# Eval("CopyMark") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>



                           <telerik:GridTemplateColumn HeaderText="CopyComplete" UniqueName="CopyComplete" SortExpression="CopyComplete"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='Images/<%# Eval("CopyComplete") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="Term" DataType="System.Int32" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term" Visible="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>

              <GroupingSettings CaseSensitive="false" />
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT     dbo.OL_MasterAudit.MasterName, dbo.OL_MasterAudit.Designer, dbo.OL_MasterAudit.Auditor, dbo.OL_MasterAudit.AuditCreated, dbo.OL_MasterAudit.AuditStart, dbo.OL_MasterAudit.AuditStatus, 
                     dbo.OL_MasterSweep.SweepStatus, dbo.OL_MasterSweep.SweepComplete, dbo.OL_MasterSweep.CopyMark, 
                      dbo.OL_MasterSweep.CopyComplete, dbo.OL_MasterAudit.Term
FROM         dbo.OL_MasterAudit LEFT OUTER JOIN
                      dbo.OL_MasterSweep ON dbo.OL_MasterAudit.MasterName = dbo.OL_MasterSweep.MasterName
WHERE     (dbo.OL_MasterAudit.Term = 2185)"></asp:SqlDataSource>
    </form>
</body>
</html>
