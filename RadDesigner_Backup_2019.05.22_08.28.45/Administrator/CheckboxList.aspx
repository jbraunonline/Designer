<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CheckboxList.aspx.vb" Inherits="RadDesigner.CheckboxList" %>

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
        <telerik:RadCheckBoxList ID="RadCheckBoxList1" Runat="server" DataSourceID="SqlDataSource1">
            <DataBindings DataTextField="Item" DataValueField="Value" />
        </telerik:RadCheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Value], [Item] FROM [OL_DropdownItems]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Width="595px"></asp:TextBox>
        <br />
        <br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataTextField="BBName" DataValueField="BB_ID">
        </asp:CheckBoxList>
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <br />
        <asp:ListBox ID="ListBox1" runat="server" Height="155px" Width="118px"></asp:ListBox>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Width="576px"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" Width="571px"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" Width="571px" BackColor="#FFFF66"></asp:TextBox>
    </form>
</body>
</html>
