<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="getSIS.aspx.vb" Inherits="RadDesigner.getSIS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        This gets BB SIS integration files between the date specified (e.g. 2/23/2018) amd that date plus one day.</div>
        <asp:Button ID="Button1" runat="server" Text="getSIS" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </form>
</body>
</html>
