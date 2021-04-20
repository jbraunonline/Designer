<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProgressData.aspx.vb" Inherits="RadDesigner.ProgressData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <style type="text/css">
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-large;
            color: #FF0066;
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
    <span class="auto-style2"><strong>Progress Report</strong></span><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [ID], [CourseID], [Instructional_Designer], [CourseInit], [Textbook], [Exam], [Audit], [Sweep], [Copy], [Release] FROM [Workflow] WHERE ([Term] = @Term)" DeleteCommand="DELETE FROM [Workflow] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Workflow] ([CourseID], [Instructional_Designer], [Textbook], [Exam], [Audit], [Sweep], [Copy], [Release]) VALUES (@CourseID, @Instructional_Designer, @Textbook, @Exam, @Audit, @Sweep, @Copy, @Release)" UpdateCommand="UPDATE [Workflow] SET [CourseID] = @CourseID, [Instructional_Designer] = @Instructional_Designer,  [CourseInit] = @CourseInit,, [Textbook] = @Textbook, [Exam] = @Exam, [Audit] = @Audit, [Sweep] = @Sweep, [Copy] = @Copy, [Release] = @Release WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CourseID" Type="String" />
            <asp:Parameter Name="Instructional_Designer" Type="String" />
            <asp:Parameter Name="Textbook" Type="Boolean" />
            <asp:Parameter Name="Exam" Type="Boolean" />
            <asp:Parameter Name="Audit" Type="Boolean" />
            <asp:Parameter Name="Sweep" Type="Boolean" />
            <asp:Parameter Name="Copy" Type="Boolean" />
            <asp:Parameter Name="Release" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="2187" Name="Term" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseID" Type="String" />
            <asp:Parameter Name="Instructional_Designer" Type="String" />
            <asp:Parameter Name="CourseInit" />
            <asp:Parameter Name="Textbook" Type="Boolean" />
            <asp:Parameter Name="Exam" Type="Boolean" />
            <asp:Parameter Name="Audit" Type="Boolean" />
            <asp:Parameter Name="Sweep" Type="Boolean" />
            <asp:Parameter Name="Copy" Type="Boolean" />
            <asp:Parameter Name="Release" Type="Boolean" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Text], [Value] FROM [DropdownItems] WHERE ([Item] = @Item)">
        <SelectParameters>
            <asp:Parameter DefaultValue="TF" Name="Item" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True" DataSourceID="SqlDataSource1" ShowGroupPanel="True" Skin="WebBlue" AutoGenerateHierarchy="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" AutoGenerateEditColumn="True" Font-Bold="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings ExportOnlyData="True">
        </ExportSettings>
        <ClientSettings AllowDragToGroup="True">
        </ClientSettings>
        <MasterTableView DataSourceID="SqlDataSource1"  EnableGroupsExpandAll="true"  CommandItemDisplay="Top" HierarchyDefaultExpanded="false" GroupsDefaultExpanded="False">
             <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
            <Columns>
                <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CourseID" FilterControlAltText="Filter CourseID column" HeaderText="CourseID" SortExpression="CourseID" UniqueName="CourseID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Instructional_Designer" FilterControlAltText="Filter Instructional_Designer column" HeaderText="Instructional_Designer" SortExpression="Instructional_Designer" UniqueName="Instructional_Designer">
                </telerik:GridBoundColumn>
              

                        <telerik:GridCheckBoxColumn DataField="CourseInit" DataType="System.Boolean" FilterControlAltText="Filter CourseInit column" HeaderText="CourseInit" SortExpression="CourseInit" UniqueName="CourseInit">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="Textbook" DataType="System.Boolean" FilterControlAltText="Filter Textbook column" HeaderText="Textbook" SortExpression="Textbook" UniqueName="Textbook">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="Exam" DataType="System.Boolean" FilterControlAltText="Filter Exam column" HeaderText="Exam" SortExpression="Exam" UniqueName="Exam">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="Audit" DataType="System.Boolean" FilterControlAltText="Filter Audit column" HeaderText="Audit" SortExpression="Audit" UniqueName="Audit">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="Sweep" DataType="System.Boolean" FilterControlAltText="Filter Sweep column" HeaderText="Sweep" SortExpression="Sweep" UniqueName="Sweep">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="Copy" DataType="System.Boolean" FilterControlAltText="Filter Copy column" HeaderText="Copy" SortExpression="Copy" UniqueName="Copy">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="Release" DataType="System.Boolean" FilterControlAltText="Filter Release column" HeaderText="Release" SortExpression="Release" UniqueName="Release">
                </telerik:GridCheckBoxColumn>


            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
