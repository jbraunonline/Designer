<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MyTasks.aspx.vb" Inherits="RadDesigner.MyTasks1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
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
        <span class="auto-style1"><strong>My Tasks</strong></span>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Task_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="Task_ID" FilterControlAltText="Filter Task_ID column" HeaderText="Task_ID" SortExpression="Task_ID" UniqueName="Task_ID" DataType="System.Int32" ReadOnly="True" Visible ="false" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Designer" FilterControlAltText="Filter Designer column" HeaderText="Designer" SortExpression="Designer" UniqueName="Designer">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RequestMade" FilterControlAltText="Filter RequestMade column" HeaderText="RequestMade" SortExpression="RequestMade" UniqueName="RequestMade" DataType="System.DateTime">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TaskSubject" FilterControlAltText="Filter TaskSubject column" HeaderText="TaskSubject" SortExpression="TaskSubject" UniqueName="TaskSubject">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Task" FilterControlAltText="Filter Task column" HeaderText="Task" SortExpression="Task" UniqueName="Task" Visible ="false" >
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Severity" FilterControlAltText="Filter Severity column" HeaderText="Severity" SortExpression="Severity" UniqueName="Severity">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TaskAccepted" DataType="System.DateTime" FilterControlAltText="Filter TaskAccepted column" HeaderText="TaskAccepted" SortExpression="TaskAccepted" UniqueName="TaskAccepted">
                    </telerik:GridBoundColumn>
                    <telerik:GridHyperLinkColumn DataTextField="ID" HeaderText="Details" UniqueName="Link1" DataNavigateUrlFields="Task_ID" DataNavigateUrlFormatString="PreviewTask.aspx?ID={0}" Text="View Task" DataTextFormatString="<b>Go to Audit</b>">
                         </telerik:GridHyperLinkColumn> 
                     <telerik:GridHyperLinkColumn DataTextField="ID" HeaderText="Mark Complete" UniqueName="Link" DataNavigateUrlFields="Task_ID" DataNavigateUrlFormatString="CompleteTask.aspx?ID={0}" Text="Mark Complete" DataTextFormatString="<b>Go to Audit</b>">
                         </telerik:GridHyperLinkColumn> 
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Task_ID], [MasterName], [Designer], [RequestMade], [TaskSubject], [Task], [Severity], [TaskAccepted], [IsComplete] FROM [OL_DesignerTasks] WHERE (([TaskAcceptedBy_ID] = @TaskAcceptedBy_ID) AND ([IsComplete] = @IsComplete))">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="10" Name="TaskAcceptedBy_ID" SessionField="User_ID" Type="Int32" />
                <asp:Parameter DefaultValue="False" Name="IsComplete" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
