<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AsMenu.aspx.vb" Inherits="RadDesigner.AsMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <script "javascript">
var popupWindow = null;
function centeredPopup(url,winName,w,h,scroll){
LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
settings =
'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
popupWindow = window.open(url,winName,settings)
}
</script>
    <style type="text/css">
        .auto-style1 {
            width: 800px;
            background-color: #FFFFFF;
        }
        .auto-style3 {
            width: 395px;
        }
        .auto-style4 {
            width: 800px;
        }
        .auto-style6 {
            width: 397px;
        }
        .fieldset-auto-width {
         display: inline-block;
        }
        .auto-style9 {
            width: 380px;
        }
        .auto-style10 {
            width: 406px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
        <div>
            <fieldset  class="fieldset-auto-width">
                <legend><strong>Main Menu Headers</strong>    <asp:Literal ID="litHeaders" runat="server"></asp:Literal></legend>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:CheckBox ID="chkCourseInfo" runat="server" Text="Course Information " />
                    <br />
                    <asp:CheckBox ID="chkContent" runat="server" Text="Course Content " />
                    <br />
                    <asp:CheckBox ID="chkToolsResources" runat="server" Text="Tools and Resources" />
                    <br />
                    <asp:CheckBox ID="chkOtherHeaders" runat="server" Text="Other Menu Headers" AutoPostBack="True" />
                </td>
                <td class="auto-style3">
                    <telerik:RadTextBox ID="txtOtherHeader" Runat="server" BackColor="#D5F1FF" EmptyMessage="Enter Other Menu Headers Here" Height="74px" LabelWidth="156px" Resize="None" Visible="False" Width="392px">
                    </telerik:RadTextBox>
                </td>
            </tr>
            </table>
                </fieldset><br />
               <fieldset  class="fieldset-auto-width">
                <legend><strong>Main Menu</strong> </legend>
    <table class="auto-style4">
        <tr>
            <td class="auto-style6">
                <asp:CheckBox ID="chkSetupGuide" runat="server" Text="Faculty Setup Guide" /> <asp:Literal ID="litSetup" runat="server"></asp:Literal>
                <br />
                <asp:CheckBox ID="chkCalendar" runat="server" Text="Calendar" /><asp:Literal ID="litCalendar" runat="server"></asp:Literal>
                <br />
                <asp:CheckBox ID="chkCourseMessage" runat="server" Text="Course Messages" />
                <br />
                <asp:CheckBox ID="chkQAForum" runat="server" Text="QA Forum" />
                <br />
                <asp:CheckBox ID="chkBBResources" runat="server" Text="BB Resources" />
                <br />
                <asp:CheckBox ID="chkMygrades" runat="server" Text="My Grades" />
                <br />
                <asp:CheckBox ID="chkMDCResources" runat="server" Text="MDC Resources" />
                <br />
                <asp:CheckBox ID="chkCheckActivity" runat="server" Text="Check My Activity" />
                                    <br />
                    <asp:CheckBox ID="chkOtherMenu" runat="server" Text="Other Menu Items" AutoPostBack="True" />
            </td>
                        <td>
                            <telerik:RadTextBox ID="txtOtherMainMenu" Runat="server" BackColor="#D9F2FF" EmptyMessage="Enter Other Menu Items Here" Height="164px" LabelWidth="154px" Resize="None" Visible="False" Width="387px">
                            </telerik:RadTextBox>
            </td>
        </tr>
        </table>
                    </fieldset> <br />
                            <fieldset  class="fieldset-auto-width">
                <legend><strong>Syllabus</strong></legend>
                           <table class="auto-style1">
                  <tr>
                <td>


                                    <asp:CheckBox ID="chkSyllabusStd" runat="server" Text="Syllabus Standard Format" />
                  
                                    <br />
                  
                                    <asp:CheckBox ID="chkSyllabusAlign" runat="server" Text="Syllabus Grading Criteria Align" />
           
                        
                        </td>
        </tr>
        </table> 
            </fieldset><br />
            <fieldset  class="fieldset-auto-width">
                <legend><strong>Getting Started</strong></legend>
            <table class="auto-style9">
                <tr>
  
                    <td class="auto-style10">


                                            <asp:CheckBox ID="chkMenuGuide" runat="server" Text="Course Mnu Guide" />

                                            <br />

                                            <asp:CheckBox ID="chkIntroVC" runat="server" Text="Introduction to VC" />
          
                                            <br />
          
                                            <asp:CheckBox ID="chkStudOrient" runat="server" Text="VC Student Orientation" />


     
                    </td>
            </tr>
            </table>
            </fieldset>

                         <fieldset  class="fieldset-auto-width">
                <legend><strong>Proctored Assessments</strong></legend>
              <table class="auto-style9">
                <tr>
  
                    <td class="auto-style10">
                                            <asp:CheckBox ID="chkProcAssignMenu" runat="server" Text="Proctored Assessments Menu" />
       
                                            <br />
       
                                            <asp:CheckBox ID="chkProcScript" runat="server" Text="Proctored Assessments Script" />

                                            <br />

                                            <asp:CheckBox ID="chkProcExam" runat="server" Text="Proctored Exam Present" />


                    </td>

                </tr>
            </table>
                                </fieldset> 
</div>
        <asp:Button ID="btnSave" runat="server" Text="Save Data on this page." Visible="False" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdate" runat="server" Text="Update Page Data" Visible="False" />
&nbsp;&nbsp;
        <asp:Label ID="lblPageStatus" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000"></asp:Label>
        <p>
            MasterStatus =
            <asp:Label ID="lblMasterStatus" runat="server"></asp:Label>
        </p>
        </form> 
</body>
</html>


