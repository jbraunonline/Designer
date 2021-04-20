<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="RadDesigner._default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            color: #CC0000;
        }
        body {
    font-family: Arial, Helvetica, sans-serif;
}
        .auto-style3 {
            font-size: medium;
            color: #CC0000;
        }
        .auto-style5 {
            font-family: "Wingdings 3";
        }
        .auto-style6 {
            font-size: medium;
            color: #003366;
        }
        .auto-style7 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="auto-style6">Use top menu to exit reports</span><span class="auto-style3"><span class="auto-style5"> <strong>#</strong></span></span><span class="auto-style1"><br />
        Reports</span> <em>(Links&nbsp;open in new window</em>.)<br />
        <br />
        <strong>Copy Release Progress Report</strong> for upcoming term. <a href="ProgressReport.aspx" target="_blank">Progress Report</a><br />
        <br />
        <strong>Courses <span class="auto-style7">NOT RELEASED</span> for upcoming term</strong>.&nbsp; <a href="NotReleasedReport.aspx" target="_blank">Not Released Report</a><br />
        <br />
        <strong>Top 20 Progres</strong>s Report&nbsp; <a href="../Administrator/Admin/Top20Progress.aspx"" target="_blank">Top 20 Progress Report</a><br />
        <br />
        <strong>All Courses Progress</strong> Report&nbsp;&nbsp; <a href="../Administrator/Admin/AllCourseProgress.aspx" target="_blank">All Courses Progress Report</a><br />
        <br />
        <strong>Master Audit Report</strong>&nbsp;&nbsp; <a href="MasterAuditReport.aspx" target="_blank">MasterAudit Repor</a>t<br />
        <br />
        <strong>Phase Report</strong> (<span class="auto-style2"><strong>Caution:</strong></span> live editable data)&nbsp; <a href="PhaseReport.aspx" target="_blank">Phase Report</a><br />
        <br />
        <strong>Proctored Exam Report</strong>&nbsp;&nbsp; <a href="ProctoredExamReport.aspx" target="_blank">ExamDateReport</a><br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
