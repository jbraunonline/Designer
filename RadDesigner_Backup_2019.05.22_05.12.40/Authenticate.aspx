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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblNotAuthorized" runat="server" Text="You are not authorized to access this site." Visible="False"></asp:Label>
    
    </div>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <div class="auto-style1">
                <asp:Label ID="lblMyName" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="Blue"></asp:Label>
                <span class="auto-style2"><strong>
                <br />
                You have multiple roles. Please select a role:</strong></span><br />
                <br />
                <asp:Button ID="btnDesigner" runat="server" Text="Designer" />
                <br />
                <br />
                <asp:Button ID="btnAudit" runat="server" Text="Audit" />
                <br />
                <br />
                <asp:Label ID="lblDesigner" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="lblAudit" runat="server" Visible="False"></asp:Label>
                <br />
            </div>
        </asp:Panel>
    </form>
</body>
</html>
