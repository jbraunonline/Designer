﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AdminUsers.aspx.vb" Inherits="RadDesigner.AdminUsers" %>

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
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowFilteringByColumn="True" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateDeleteColumn="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" CommandItemDisplay="Top" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="User_ID" DataSourceID="SqlDataSource1" CommandItemDisplay="Top">
                <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="true" ShowRefreshButton="false" />
                <Columns>
                    <telerik:GridBoundColumn DataField="User_ID" DataType="System.Int32" FilterControlAltText="Filter User_ID column" HeaderText="User_ID" ReadOnly="True" SortExpression="User_ID" UniqueName="User_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="UserName" SortExpression="UserName" UniqueName="UserName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Abbr" FilterControlAltText="Filter Abbr column" HeaderText="Abbr" SortExpression="Abbr" UniqueName="Abbr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column" HeaderText="FirstName" SortExpression="FirstName" UniqueName="FirstName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column" HeaderText="LastName" SortExpression="LastName" UniqueName="LastName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Role" DataType="System.Int32" FilterControlAltText="Filter Role column" HeaderText="Role" SortExpression="Role" UniqueName="Role">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Email" FilterControlAltText="Filter Email column" HeaderText="Email" SortExpression="Email" UniqueName="Email">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_Users] WHERE [User_ID] = @User_ID" InsertCommand="INSERT INTO [OL_Users] ([UserName], [Abbr], [FirstName], [LastName], [Role], [Email]) VALUES (@UserName, @Abbr, @FirstName, @LastName, @Role, @Email)" SelectCommand="SELECT [User_ID], [UserName], [Abbr], [FirstName], [LastName], [Role], [Email] FROM [OL_Users]" UpdateCommand="UPDATE [OL_Users] SET [UserName] = @UserName, [Abbr] = @Abbr, [FirstName] = @FirstName, [LastName] = @LastName, [Role] = @Role, [Email] = @Email WHERE [User_ID] = @User_ID">
            <DeleteParameters>
                <asp:Parameter Name="User_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Abbr" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Role" Type="Int32" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Abbr" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Role" Type="Int32" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="User_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>