<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Authenticate.aspx.vb" Inherits="RadDesigner.Authenticate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
.box{
    float:left;
    margin-right:20px;
}
.clear{
    clear:both;
}
body {
    font-family: Arial, Helvetica, sans-serif;
      margin: 0;
  padding: 0;
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <img src="BlankOnline100x1900.png" />
    <div>
    
        &nbsp; &nbsp;<asp:Label ID="lblNotAuthorized" runat="server" Text="   You are not authorized to access this site." Visible="False"></asp:Label>
    
    </div>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <div class="auto-style1">
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblMyName" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="Blue"></asp:Label>
                <span class="auto-style2"><strong>
                <br />
                &nbsp;&nbsp; You have multiple roles. Please select a role:</strong></span><br />
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnDesigner" runat="server" Text="Designer" />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnAudit" runat="server" Text="Audit" />
                <br />
                <br />
                &nbsp;&nbsp;
                <asp:Label ID="lblDesigner" runat="server"></asp:Label>
                &nbsp;=Designer Username<br /> &nbsp;&nbsp;
                <asp:Label ID="lblAudit" runat="server"></asp:Label>
                &nbsp; = Audit Username<br />
            </div>
        </asp:Panel>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblUserName" runat="server" Text="UserName"></asp:Label>
        &nbsp; </form>
</body>
</html>
