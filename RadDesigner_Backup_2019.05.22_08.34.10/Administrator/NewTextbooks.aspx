<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewTextbooks.aspx.vb" Inherits="RadDesigner.NewTextbooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:TextBox ID="txtOldTerm" runat="server"></asp:TextBox>
&nbsp;Old Term<br />
        <asp:TextBox ID="txtNewTerm" runat="server"></asp:TextBox>
&nbsp;New Term<br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </form>
</body>
</html>
