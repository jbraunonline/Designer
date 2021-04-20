<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="popup.aspx.vb" Inherits="RadDesigner.popup1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" BorderColor="#CC0000" BorderWidth="2px" Text="Close Help Window" />
    
    </div>
        <h3>
            <asp:Label ID="lblHelp" runat="server"></asp:Label>
        </h3>
        <asp:Label ID="lblDetails" runat="server"></asp:Label>
    </form>
    </body>
</html>
