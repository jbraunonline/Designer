<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UploadChildCourses.aspx.vb" Inherits="RadDesigner.UploadChildCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Upload Child Courses to BBC<br />
        CSV structire:&nbsp; ChildCourse, ParentCourse<br />
&nbsp;&nbsp;&nbsp;&nbsp; 2187-12345,2187-12344<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; child,parent<br />
        <br />
        vc_vcdata<br />
        bbcourses<br />
        Update BBcourses<br />
        set isChild = 1, parent=&#39;parent&#39; where BBCourses.Course_ID = &#39;child&#39;<br />
        Data location:
        <asp:TextBox ID="txtPath" runat="server" BorderColor="#CEE7FF" Width="274px">~/Administrator/Data/2183ParentChild.csv</asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
    </div>
    </form>
</body>
</html>
