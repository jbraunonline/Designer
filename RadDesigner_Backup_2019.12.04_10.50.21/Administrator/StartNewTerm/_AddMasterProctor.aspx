<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="_AddMasterProctor.aspx.vb" Inherits="RadDesigner.AddMasterProctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong><span class="auto-style1">Add isMid, isFin, and exam dates to OL_MasterProctor</span></strong><br />
        <br />
        <br />
    
        Put Proctor Dates into term:
        <asp:TextBox ID="txtTerm" runat="server">2203</asp:TextBox>
        <br />
        <asp:RadioButtonList ID="RadioRun" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">Preview</asp:ListItem>
            <asp:ListItem>Run</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
    
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
        <br />
    
    </div>
    </form>
</body>
</html>
