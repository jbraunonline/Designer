<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="VerifyExams.aspx.vb" Inherits="RadDesigner.VerifyExams" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }


body {
    font-family: Arial, Helvetica, sans-serif;
}
</style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <h2 class="auto-style1">Verify Exams</h2>
        <div class="auto-style1">
            <asp:Label ID="lblVerify" runat="server" Font-Bold="True" ForeColor="#993333" Text="The exams for this course have been verified."></asp:Label>
            <br />
            <asp:Button ID="btnVerify" runat="server" BackColor="#99FF99" Font-Bold="True" Text="Verify Exams for This Course" Visible="False" />
        </div>
    
    </div>
    </form>
</body>
</html>
