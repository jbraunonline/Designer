<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Administrator.aspx.vb" Inherits="RadDesigner.Administrator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
        .auto-style2 {
            color: #CC0000;
        }
        body {
    font-family: Arial, Helvetica, sans-serif;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="auto-style1">All links open in NEW WINDOW.</span><br />
        <br />
    
        Prior to allowing Designers to access the application for the next term, the <strong>DesignModule.vb</strong> file in the root of the application must be modiifed in Visual Studio<br />
&nbsp;&nbsp; That file sets the global variables for Session values:
        <br />
&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1">ThisTerm</span> = the current term that students are now using<br />
&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1">NextTerm</span> = the Next term---The term that the designers are working on. I.e the master courses for the next term.<br />
&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1">NewMasterTerm</span> = the term for which copies of the NextTerm masters will be created to validate the copy process as part of the Master Release process of the designers.<br />
        <br />
        <br />
        <span class="auto-style2"><strong>WARNING</strong></span>: You are working with live data here.<span class="auto-style1">Please create Backups</span> for the following DB tables before upgrading the DB for the next term..<br />
&nbsp;&nbsp;&nbsp; OL_Catalog<br />
&nbsp;&nbsp;&nbsp; OL_MasterCourse<br />
&nbsp;&nbsp;&nbsp; OL_Textbooks<br />
&nbsp;&nbsp;&nbsp; OL_MasterExams<br />
&nbsp;&nbsp;&nbsp; OL_buildingBlocks<br />
        <br />
        <strong>To upgrade the database for the next term</strong>, please review th SQLscripts.txt file <a href="StartNewTerm/SQLscripts.txt" target="_blank">HERE</a>&nbsp;&nbsp; (opens in new window)<br />
&nbsp;&nbsp;&nbsp; You will need to modify the scripts for each of the Databases listed above. The OL_Catalog table only needs to be backed up. It has no term or changable data in it/<br />
&nbsp;&nbsp;&nbsp;&nbsp; Manually run the scripts in the MS SQL Server Management Studio.<br />
        <br />
        To run a script that will cr<strong>eate new Progress records for the term</strong> (after upgrading the DB as above) run this file&nbsp; <a href="StartNewTerm/AddProgressData.aspx" target="_blank">AddProgressData.aspx</a><br />
        <br />
        <strong>NEW COURSES</strong><br />
        <strong>First, create a catalog entry for the course/course</strong>s. You can do that HERE: <a href="NewCourse/Step1_CreateCatalogEntry.aspx" target="_blank">NewCourse/Step1_CreateCatalogEntry.aspx</a><br />
&nbsp;&nbsp;&nbsp;&nbsp; You can add one datalog entry or a series of new entries from a CSV file.&nbsp; Sanple of last run file: <a href="Data/NewCatalog.csv" target="_blank">Data/NewCatalog.csv</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The CSV file NewCatalog.csv is located in the Administrator/Data folder. The file must be in that folder. Either modify it in the Visual Studio application or replace the file in the server files.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You can run the aspx file from either location.<br />
        <br />
        <strong>Second, create the new courses, exam records, and progress data</strong> by using this file: <a href="NewCourse/Step2_AddOL_MasterRecords.aspx" target="_blank">NewCourse/Step2_AddOL_MasterRecords.aspx</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You can add one new course or a series of courses from a CSV file. Sample of last run file:&nbsp; <a href="Data/NewOL_MasterCourse.csv" target="_blank">Data/New_OLMasterCourse.csv</a><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The CSV file New_OLMasterCourse.csv is located in the Administrator/Data folder. The file must be in that folder. Either modify it in the Visual Studio application or replace the file in the server files.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You can run the aspx file from either location.&nbsp; This file creates the OL_MasterCourse, the OL_MasterExam, and the OL_Progress records for the courses in the CSV file.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The ASPX file details that data structor of the csv file.<br />
        <br />
        <strong>DESIGNER DATABASE APPLICTION USERS</strong><br />
        You can manage the users <a href="AdminUsers.aspx" target="_blank">HERE.</a></div>
    </form>
</body>
</html>
