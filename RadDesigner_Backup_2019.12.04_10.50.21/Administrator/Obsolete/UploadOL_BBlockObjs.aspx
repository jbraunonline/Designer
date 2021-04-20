<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UploadOL_BBlockObjs.aspx.vb" Inherits="RadDesigner.UploadOL_BBlockObjs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:TextBox ID="TextBox1" runat="server" Width="230px">~/Administrator/Data/BBobjects.csv</asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Import" />
    </form>
</body>
</html>
