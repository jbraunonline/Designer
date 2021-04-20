﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MyTaskProgress.aspx.vb" Inherits="RadDesigner.MyTaskProgress" %>

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
    
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" AllowAutomaticDeletes="True" AutoGenerateEditColumn="True" AutoGenerateDeleteColumn="True" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Task_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="Task_ID" DataType="System.Int32" FilterControlAltText="Filter Task_ID column" HeaderText="Task_ID" ReadOnly="True" SortExpression="Task_ID" UniqueName="Task_ID" Visible ="false" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Designer" FilterControlAltText="Filter Designer column" HeaderText="Designer" SortExpression="Designer" UniqueName="Designer" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RequestMade" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="Date Added" ></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TaskSubject" FilterControlAltText="Filter TaskSubject column" HeaderText="TaskSubject" SortExpression="TaskSubject" UniqueName="TaskSubject">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Task" FilterControlAltText="Filter Task column" HeaderText="Task" SortExpression="Task" UniqueName="Task">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Severity" FilterControlAltText="Filter Severity column" HeaderText="Severity" SortExpression="Severity" UniqueName="Severity">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DatePosted" DataType="System.DateTime" FilterControlAltText="Filter DatePosted column" HeaderText="DatePosted" SortExpression="DatePosted" UniqueName="DatePosted">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TaskAcceptedBy" FilterControlAltText="Filter TaskAcceptedBy column" HeaderText="TaskAcceptedBy" SortExpression="TaskAcceptedBy" UniqueName="TaskAcceptedBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="IsComplete" DataType="System.Boolean" FilterControlAltText="Filter IsComplete column" HeaderText="IsComplete" SortExpression="IsComplete" UniqueName="IsComplete">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="TaskAccepted" DataType="System.DateTime" FilterControlAltText="Filter TaskAccepted column" HeaderText="TaskAccepted" SortExpression="TaskAccepted" UniqueName="TaskAccepted">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Task_ID], [MasterName], [Designer], [RequestMade], [TaskSubject], [Task], [Severity], [DatePosted], [TaskAcceptedBy], [IsComplete], [TaskAccepted] FROM [OL_DesignerTasks] WHERE ([Designer_ID] = @Designer_ID)" DeleteCommand="DELETE FROM [OL_DesignerTasks] WHERE [Task_ID] = @Task_ID" InsertCommand="INSERT INTO [OL_DesignerTasks] ([MasterName], [Designer], [RequestMade], [TaskSubject], [Task], [Severity], [DatePosted], [TaskAcceptedBy], [IsComplete], [TaskAccepted]) VALUES (@MasterName, @Designer, @RequestMade, @TaskSubject, @Task, @Severity, @DatePosted, @TaskAcceptedBy, @IsComplete, @TaskAccepted)" UpdateCommand="UPDATE [OL_DesignerTasks] SET [MasterName] = @MasterName, [Designer] = @Designer, [RequestMade] = @RequestMade, [TaskSubject] = @TaskSubject, [Task] = @Task, [Severity] = @Severity, [DatePosted] = @DatePosted, [TaskAcceptedBy] = @TaskAcceptedBy, [IsComplete] = @IsComplete, [TaskAccepted] = @TaskAccepted WHERE [Task_ID] = @Task_ID">
            <DeleteParameters>
                <asp:Parameter Name="Task_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MasterName" Type="String" />
                <asp:Parameter Name="Designer" Type="String" />
                <asp:Parameter DbType="Date" Name="RequestMade" />
                <asp:Parameter Name="TaskSubject" Type="String" />
                <asp:Parameter Name="Task" Type="String" />
                <asp:Parameter Name="Severity" Type="String" />
                <asp:Parameter DbType="Date" Name="DatePosted" />
                <asp:Parameter Name="TaskAcceptedBy" Type="String" />
                <asp:Parameter Name="IsComplete" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="TaskAccepted" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="Designer_ID" SessionField="User_ID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MasterName" Type="String" />
                <asp:Parameter Name="Designer" Type="String" />
                <asp:Parameter DbType="Date" Name="RequestMade" />
                <asp:Parameter Name="TaskSubject" Type="String" />
                <asp:Parameter Name="Task" Type="String" />
                <asp:Parameter Name="Severity" Type="String" />
                <asp:Parameter DbType="Date" Name="DatePosted" />
                <asp:Parameter Name="TaskAcceptedBy" Type="String" />
                <asp:Parameter Name="IsComplete" Type="Boolean" />
                <asp:Parameter Name="TaskAccepted" DbType="Date" />
                <asp:Parameter Name="Task_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SeverityDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Text] FROM [OL_DropdownItems] WHERE ([Item] = @Item)">
            <SelectParameters>
                <asp:Parameter DefaultValue="Severity" Name="Item" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="MasterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [MasterName], [Master_ID] FROM [OL_MasterCourse] WHERE ([ID_ID] = @ID_ID)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="ID_ID" SessionField="User_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
