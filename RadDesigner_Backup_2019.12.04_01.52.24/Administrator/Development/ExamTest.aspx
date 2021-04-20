<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExamTest.aspx.vb" Inherits="RadDesigner.ExamTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:TextBox ID="TextBox1" runat="server" Width="225px"></asp:TextBox>
&nbsp;Course<br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" /><br />
        <asp:Button ID="Button2" runat="server" Text="Verify No Proctored Exam" OnClick="Button2_Click" OnClientClick="return confirm('You verify that this course does not have a proctored exam.')" Visible="False" BackColor="#6600FF" Font-Bold="True" ForeColor="White" />
    </form>
</body>
</html>
