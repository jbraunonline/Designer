<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewTask.aspx.vb" Inherits="RadDesigner.NewTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        table, td, th {
    border: 0px solid silver;
}

table {
    border-collapse: collapse;
    width: 800px;
}

th {
    text-align: left;
}
        .newStyle1 {
            background-color: #808080;
            font-family: Arial;
            color: #FFFFFF;
            font-weight: bold;
        }
        .newStyle2 {
            background-color: #E0E7ED;
        }
        .newStyle3 {
            border-style: none;
            border-color: #FFFFFF;
        }
        .auto-style4 {
            background-color: #E0E7ED;
            height: 38px;
        }
        .newStyle4 {
            font-size: medium;
        }
        .newStyle5 {
            font-size: large;
            color: #FFFFFF;
            font-weight: bold;
            font-family: Arial;
        }
        .newStyle6 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            color: #FFFFFF;
        }
        .newStyle7 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            color: #FFFFFF;
            float: right;
        }
        .newStyle8 {
            width: 200px;
        }
        .newStyle9 {
            background-color: #FFFFFF;
        }
        body {
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
            <table style="width:1000px;text-align:left;background-color:silver;" class="newStyle3" align="center">
            <tr class="newStyle9">
                <td colspan="2">
                    <h2>Add New Task&nbsp;&nbsp;
                        <asp:Label ID="lblNavigate" runat="server" Font-Size="Medium" ForeColor="#CC0000" Text="Use Tabs Above to Navigate" Visible="False"></asp:Label>
                    &nbsp;</h2>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Course</td>
                <td class="newStyle2" >
                    <asp:DropDownList ID="ddlCourses" runat="server" DataSourceID="SqlDataSource1" DataTextField="MasterName" DataValueField="Master_ID" Font-Size="Medium">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Date</td>
                <td class="newStyle2">
                    <asp:TextBox ID="txtDate" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Designer</td>
                <td class="newStyle2">
                    <asp:TextBox ID="txtDesigner" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Severity</td>
                <td class="newStyle2">
                    <asp:DropDownList ID="ddlSeverity" runat="server" DataSourceID="SeveritydataSource" DataTextField="Text" DataValueField="Text" Font-Size="Medium">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Task Title</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtSummary" runat="server" Rows="2" TextMode="MultiLine" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Task</td>
                <td class="auto-style4">
                    <telerik:RadEditor ID="RadEditor1" Runat="server" Skin="WebBlue" Height="278px" ToolbarMode="Floating" Width="773px">
                    </telerik:RadEditor>
                </td>
            </tr>
            <tr class="newStyle9">
                <td >
        <asp:Button ID="Button1" runat="server" BackColor="#CC0000" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="Add Task" />
                &nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Cancel" />
                </td>
                <td "></td>
            </tr>
        </table>
        <asp:SqlDataSource ID="CourseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [MasterCourse] FROM [MasterCourse] WHERE ([Instructional_Designer] = @Instructional_Designer)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SeveritydataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Text], [Value] FROM [OL_DropdownItems] WHERE ([Item] = @Item)">
            <SelectParameters>
                <asp:Parameter DefaultValue="Severity" Name="Item" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
        </table>
        </form>
        </form>
        </form>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [MasterName], [Master_ID] FROM [OL_MasterCourse] WHERE ([ID_ID] = @ID_ID)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="ID_ID" SessionField="User_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</body>
</html>
