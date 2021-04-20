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
        .auto-style2 {
            font-size: small;
            text-align: center;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <h2 class="auto-style1">Verify Exams&nbsp; <asp:Button ID="btnRefresh" runat="server" Font-Size="XX-Small" Text="Refresh this page" />
        </h2>
        <div class="auto-style1">
            <asp:Label ID="lblWarn" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
            <br />
            <asp:Label ID="lblVerify" runat="server" Font-Bold="True" ForeColor="#993333" Text="The exams for this course have been verified."></asp:Label>
            <br />
            <asp:Button ID="btnVerify" runat="server" BackColor="#99FF99" Font-Bold="True" Text="Verify Exams for This Course" Visible="False" />
            <br />
        <asp:Button ID="btnOverride" runat="server" Text="Verify No Proctored Exam" OnClick="btnOverride_Click" OnClientClick="return confirm('You verify that this course does not have a proctored exam.')" Visible="False" BackColor="#6600FF" Font-Bold="True" ForeColor="White" />
        </div>
    
    </div>
    </form>
    <p class="auto-style2">
        Use the refresh button if you have gone back and made changes to the exam details.</p>
</body>
</html>
