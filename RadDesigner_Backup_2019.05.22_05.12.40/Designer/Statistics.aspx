<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Statistics.aspx.vb" Inherits="RadDesigner.Statistics" %>

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
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term" DataType="System.Int32" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CourseCount" DataType="System.Int32" FilterControlAltText="Filter CourseCount column" HeaderText="# Sections" SortExpression="CourseCount" UniqueName="CourseCount">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Enrolls" DataType="System.Int32" FilterControlAltText="Filter Enrolls column" HeaderText="Enrollments" SortExpression="Enrolls" UniqueName="Enrolls">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Logins" DataType="System.Int32" FilterControlAltText="Filter Logins column" HeaderText="Av. Student Logins" SortExpression="Logins" UniqueName="Logins">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FacultyLogins" DataType="System.Int32" FilterControlAltText="Filter FacultyLogins column" HeaderText="Av. FacultyLogins" SortExpression="FacultyLogins" UniqueName="FacultyLogins">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Grade" DataType="System.Int32" FilterControlAltText="Filter Grade column" HeaderText="Av FinalGrade" SortExpression="Grade" UniqueName="Grade">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Completion" DataType="System.Int32" FilterControlAltText="Filter Completion column" HeaderText="% Completion Rate" SortExpression="Completion" UniqueName="Completion">
                    </telerik:GridBoundColumn>

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT * FROM [Performance] WHERE ([Course] = @Course)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="ACG2001" Name="Course" SessionField="Course" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
