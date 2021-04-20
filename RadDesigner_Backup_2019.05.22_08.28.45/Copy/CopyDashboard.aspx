<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CopyDashboard.aspx.vb" Inherits="RadDesigner.CopyDashboard" %>

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
    
    </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True" DataSourceID="SqlDataSource1" ShowGroupPanel="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="Reference" FilterControlAltText="Filter Reference column" HeaderText="Reference" SortExpression="Reference" UniqueName="Reference">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course_Name" FilterControlAltText="Filter Course_Name column" HeaderText="Course_Name" SortExpression="Course_Name" UniqueName="Course_Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course_ID" FilterControlAltText="Filter Course_ID column" HeaderText="Course_ID" SortExpression="Course_ID" UniqueName="Course_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [BBCourses] WHERE [ID] = @ID" InsertCommand="INSERT INTO [BBCourses] ([Reference], [Course_Name], [Course_ID], [Course]) VALUES (@Reference, @Course_Name, @Course_ID, @Course)" SelectCommand="SELECT [Reference], [Course_Name], [Course_ID], [Course], [ID] FROM [BBCourses] WHERE ([TERM_KEY] = @TERM_KEY)" UpdateCommand="UPDATE [BBCourses] SET [Reference] = @Reference, [Course_Name] = @Course_Name, [Course_ID] = @Course_ID, [Course] = @Course WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Reference" Type="String" />
                <asp:Parameter Name="Course_Name" Type="String" />
                <asp:Parameter Name="Course_ID" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="2183" Name="TERM_KEY" SessionField="Term_Key" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Reference" Type="String" />
                <asp:Parameter Name="Course_Name" Type="String" />
                <asp:Parameter Name="Course_ID" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
