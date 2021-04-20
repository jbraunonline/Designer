<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CreateMasterCourseByTerm.aspx.vb" Inherits="RadDesigner.CreateMasterCourseByTerm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            This form will create new master courses for the term in the textbox.</p>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp; 2187, 2193 etc.<br />
&nbsp;<asp:Button ID="Button1" runat="server" Text="Button" />
        <br />
        <br />
        Initially this form will update a new table imported from the courses table and add the term and the MC course 2185_ACG1101_MC_VC<br />
        It needs to be modified to loop through the course table and add the new term master corses to the MasterCourse table.<br />
        The MasterCourse table should be deleted and recreated from<br />
        <br />
        USE [Design] GO CREATE TABLE [dbo].[MasterCourse]( ID int IDENTITY (1, 1) NOT NULL, CourseID int, CourseNo varchar(50), MasterCourse varchar(50), Term int, Title varchar(50), Top_20_CRS bit DEFAULT 0, Phase varchar(25), LastCopyTerm int, Developer_SME varchar(50), Co_Developer_SME varchar(50), Instructional_Designer varchar(50), Subject_Area varchar(50), Term_Offering varchar(50), Credits varchar(50), Course_Level varchar(50) ) GO<br />
        <br />
        Started with<br />
        Use VC_VCData1 Go SELECT * INTO dbo.MasterCourse FROM Course WHERE Status = &#39;Active&#39;<br />
        Then I add two fields to the MasterCourse table: Term bit and MasterCourse varchar(25)<br />
        Then I loop through that table and add term and MasterCourse<p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            NOTE: Add LastCopyTerm and CopyStatus (1 2 3 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --</p>
    </form>
</body>
</html>
