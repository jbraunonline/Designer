<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Datalist.aspx.vb" Inherits="RadDesigner.Datalist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#66CCFF" />
            <ItemTemplate>
                Term87:
                <asp:Label ID="Term87Label" runat="server" Text='<%# Eval("Term87") %>' BackColor="#FFFFFF" />
                <br />
                Term93:
                <asp:Label ID="Term93Label" runat="server" Text='<%# Eval("Term93") %>' />
                <br />
                Term97:
                <asp:Label ID="Term97Label" runat="server" Text='<%# Eval("Term97") %>' />
                <br />
                Term03:
                <asp:Label ID="Term03Label" runat="server" Text='<%# Eval("Term03") %>' />
                <br />
                Term05:
                <asp:Label ID="Term05Label" runat="server" Text='<%# Eval("Term05") %>' />
                <br />
                Term07:
                <asp:Label ID="Term07Label" runat="server" Text='<%# Eval("Term07") %>' />
                <br />
<br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Term87], [Term93], [Term97], [Term03], [Term05], [Term07] FROM [OL_MasterPhase] WHERE ([Course] = @Course)">
            <SelectParameters>
                <asp:Parameter DefaultValue="CGS1060C" Name="Course" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
