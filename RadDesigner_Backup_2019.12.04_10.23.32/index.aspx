<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="RadDesigner.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
            width: 102px;
            height: 46px;
        }
        body {
    font-family: Arial, Helvetica, sans-serif;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
          <img alt="menu header" class="auto-style1" src="menuheader1.png" /><br />
                <br />

          <br />
          <asp:Button ID="Button1" runat="server" Text="Temp Login" Visible="False" />
          <br />
          <br />
          <a href='https://login.mymdc.net/login.asp?DestinationURL=http://virtual.mdc.edu/designer/authenticate.aspx'>
    <img src="images/key.jpg" border="0" class="auto-style4" /></a><br> <br>
    <span class="style3">&nbsp; You must login using the prefix<strong> 
    <span class="style6">mdcc</span></span><span class="style6"><span 
        class="style7">\</span></span><span class="style3">username</span></strong><br 
        class="style3"> <span class="style3">&nbsp; Example: </span><span class="style4">mdcc\jrodriq2</span><span 
        class="style3"><br />
    <br />
</span>
    </div>
    </form>
</body>
</html>
