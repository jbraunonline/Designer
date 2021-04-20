<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AllStaff.aspx.vb" Inherits="RadDesigner.AllStaff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

body {
    font-family: Arial, Helvetica, sans-serif;

    background-color: #f0ffff;
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
    <div>
    
        <span class="auto-style1"><strong>Manage Users </strong></span>&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="43px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" BackColor="Red" Font-Bold="True" Font-Names="Arial" ForeColor="White" Text="DeleteID" />
&nbsp;&nbsp; This buton deletes a user by ID#&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" BackColor="#00CC00" Font-Bold="True" Font-Names="Arial" ForeColor="White" Text="Back To INDEX" />
    
    </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="User_ID" DataSourceID="SqlDataSource1"  CommandItemDisplay="Top">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_Users] WHERE [User_ID] = @User_ID" InsertCommand="INSERT INTO [OL_Users] ([UserName], [Abbr], [FirstName], [LastName], [Role], [Email]) VALUES (@UserName, @Abbr, @FirstName, @LastName, @Role, @Email)" SelectCommand="SELECT [User_ID], [UserName], [Abbr], [FirstName], [LastName], [Role], [Email] FROM [OL_Users] WHERE ([Role] &lt; @Role) ORDER BY [LastName]" UpdateCommand="UPDATE [OL_Users] SET [UserName] = @UserName, [Abbr] = @Abbr, [FirstName] = @FirstName, [LastName] = @LastName, [Role] = @Role, [Email] = @Email WHERE [User_ID] = @User_ID">
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
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="Role" Type="Int32" />
            </SelectParameters>
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
