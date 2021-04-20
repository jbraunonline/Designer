<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="_AddMasterExamDates.aspx.vb" Inherits="RadDesigner.AddMasterExamDates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style1">Add Master Exam Dates to vc_vcdata MasterExamDates for setting up proctored exam export</span></strong><br />
            This uploads full sprad of dates for each course:&nbsp; 16 wk Mid/Fin&nbsp; Session A mid/final&nbsp; session B mid/final<br />
            from ../data/2203 MasterExamDates.aspx<br />
            ACG2001,0,1/1/2019,1/1/2019,1,12/9/2019,12/11/2019,9/23/2019,9/25/2019,10/15/2019,10/17/2019,11/25/2019,11/27/2019,12/17/2019,12/19/2019 ACG2001L,0,1/1/2019,1/1/2019,0,1/1/2019,1/1/2019,9/23/2019,9/25/2019,10/15/2019,10/17/2019,11/25/2019,11/27/2019,12/17/2019,12/19/2019<br />
            After running this, then input passwords with AddExamPasswords.aspx<br />
            <br />
            Term:
            <asp:TextBox ID="txtTerm" runat="server"></asp:TextBox>
            <br />
        </div>
        <asp:Button ID="Button1" runat="server" Text="Add Data" />
    </form>
</body>
</html>
