<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="default.aspx.vb" Inherits="RadDesigner._default5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            .auto-style6 {
                font-size: small;
                text-decoration: underline;
            }
            .auto-style7 {
                width: 25px;
                height: 22px;
            }
            .auto-style8 {
                width: 25px;
                height: 22px;
                color: #FF0000;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    
    
        <span class="auto-style6">Use top menu to exit Reports</span> 
        <img alt="up arrow" class="auto-style7" src="../images/Up.png" /><span class="auto-style1"><br />
        Reports</span> <em>(Links&nbsp;open in new window</em>.)<br />
        <br />
        <strong>Copy Release Progress Report</strong> for upcoming term. <a href="ProgressReport.aspx" target="_blank">Progress Report</a><br />
        <br />
                <strong>Courses <span class="auto-style8">NOT RELEASED</span> for upcoming term</strong>.&nbsp; <a href="ViewNotReleased.aspx" target="_blank">Not Released Report</a><br />
        <br />
        <strong>Top 20 Progres</strong>s Report&nbsp; <a href="../Administrator/Admin/Top20Progress.aspx"" target="_blank">Top 20 Progress Report</a><br />
        <br />
        <strong>All Courses Progress</strong> Report&nbsp;&nbsp; <a href="../Administrator/Admin/AllCourseProgress.aspx" target="_blank">All Courses Progress Report</a><br />
        <br />
        <strong>Master Audit Report</strong>&nbsp;&nbsp; <a href="MasterAuditReport.aspx" target="_blank">MasterAudit Repor</a>t<br />
        <br />
        <strong>Phase Report</strong> (<span class="auto-style2"><strong>Caution:</strong></span> live editable data)&nbsp; <a href="PhaseReport.aspx" target="_blank">Phase Report</a><br />
        <br />
        <strong>Proctored Exam Report</strong>&nbsp;&nbsp; <a href="ProctoredExamReport.aspx">ExamDateReport</a><br />
        <br />
        <br />
    
    </div>

</asp:Content>
