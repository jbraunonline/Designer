<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddProgressData.aspx.vb" Inherits="RadDesigner.AddProgressData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        Progress Records will be created for next term.<br />
        <br />
        <asp:TextBox ID="txtLastTerm" runat="server">2213</asp:TextBox>
&nbsp;Last Term<br />
        <asp:TextBox ID="txtNextTerm" runat="server">2215</asp:TextBox>
&nbsp;Next Term<br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Create Progress Records for above term." />
        <br />
        <asp:RadioButtonList ID="radioProcess" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">Preview</asp:ListItem>
            <asp:ListItem>Run</asp:ListItem>
        </asp:RadioButtonList>
    </form>
</body>
</html>
