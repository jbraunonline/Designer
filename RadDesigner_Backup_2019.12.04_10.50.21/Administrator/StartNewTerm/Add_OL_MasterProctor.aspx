<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Add_OL_MasterProctor.aspx.vb" Inherits="RadDesigner.Add_OL_MasterProctor" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Add OL_MasterProctor Dates to Designer DB for UPCOMING term.<br />
    
        Put Proctor Dates into term:
        <asp:TextBox ID="txtTerm" runat="server">2203</asp:TextBox>
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">Preview</asp:ListItem>
            <asp:ListItem>Run</asp:ListItem>
        </asp:RadioButtonList>
        <br />
    
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
        <br />
    
    </div>
    </form>
</body>
</html>

