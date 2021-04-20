<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="_ImportNextTermCourses.aspx.vb" Inherits="RadDesigner.ImportNextTermCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <p>
            This form will create new master courses for the term in the textbox.</p>
        <br />
        <asp:TextBox ID="txtOldMasterTerm" runat="server">2183</asp:TextBox>
&nbsp; Term of past terms Master<br />
        <asp:TextBox ID="txtOldTerm" runat="server">2185</asp:TextBox>
&nbsp;&nbsp; Past Term 2187, 2193 etc.<br />
        <asp:TextBox ID="txtNewTerm" runat="server">2187</asp:TextBox>
&nbsp;&nbsp; New Term<br />
        <br />
&nbsp;<asp:Button ID="Button1" runat="server" Text="Button" />
    </form>
</body>
</html>
