<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ASAuditForm1.aspx.vb" Inherits="RadDesigner.ASAuditForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <style type="text/css">
    #wrapper div, iframe {
    float: left;
}
                </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="btnReturn" runat="server" Text="Return to Audit List" Visible="False" />
&nbsp;<div class="box"><iframe src="ASAuditform.aspx"  frameborder="0" scrolling="no" width="60%" height="1200" align="left"> </iframe> </div>

<div class="box">    <iframe src="ASAuditform/auditnotes.aspx" frameborder="0" scrolling="no" width="40%" height="1200" align="right">
    </iframe>

         
    </form>

</body>
</html>