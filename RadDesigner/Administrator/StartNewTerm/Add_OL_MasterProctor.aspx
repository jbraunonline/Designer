<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Add_OL_MasterProctor.aspx.vb" Inherits="RadDesigner.Add_OL_MasterProctor" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            background-color: #FFFFCC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="auto-style1">Add OL_MasterProctor Dates to Designer DB for UPCOMING term.</span><br />
    
        <br />
        Note: change the add sql statement to the correct MasterCourseNaame term.&nbsp; &quot;VALUES (&#39;<span class="auto-style2">2215_</span>&quot; &amp; strTextField0 &amp; &quot;_MC_VC&quot; &amp; &#39;MasterCourse<br />
&nbsp;and change the name of the data file 2215MasterExamDates.txt to the file name with the correct data. Preview to verify before selecting Run.<br />
        <br />
    
        Put Proctor Dates into term:
        <asp:TextBox ID="txtTerm" runat="server">2215</asp:TextBox>
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">Preview</asp:ListItem>
            <asp:ListItem>Run</asp:ListItem>
        </asp:RadioButtonList>
        <br />
    
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
        <br />
    
    </div>
    </form>
</body>
</html>

