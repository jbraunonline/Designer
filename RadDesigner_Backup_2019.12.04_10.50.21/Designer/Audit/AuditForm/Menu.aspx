<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Menu.aspx.vb" Inherits="RadDesigner.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 800px;
            background-color: #FFFFFF;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            width: 395px;
        }
        .auto-style4 {
            width: 800px;
        }
        .auto-style5 {
            height: 23px;
            width: 397px;
        }
        .auto-style6 {
            width: 397px;
        }
        .auto-style7 {
            margin-top: 0px;
        }
        .auto-style8 {
            width: 100%;
        }
        .auto-style9 {
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

            <fieldset>
                <legend><strong>Main Menu Headers</strong></legend>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:CheckBox ID="ckCourseInfo" runat="server" Text="Course Information (Y/N)" />
                </td>
                <td class="auto-style3" rowspan="5">
                    <asp:TextBox ID="txtOther" runat="server" Height="117px" Width="382px" TextMode="MultiLine" BackColor="#D5F1FF">List other main menu headers here</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkContent" runat="server" Text="Course Content (Y/N)" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:CheckBox ID="chkToolsResources" runat="server" Text="Tools and Resources (Y/N)" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkOther" runat="server" Text="Other? (Y/N) Please list in textbox." />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
                </fieldset>
               <fieldset>
                <legend><strong>Main Menu</strong></legend>
    <table class="auto-style4">
        <tr>
            <td class="auto-style5">
                <asp:CheckBox ID="chkSetupGuide" runat="server" Text="Faculty Setup Guide" />
            </td>
                        <td rowspan="8">
                <asp:TextBox ID="txtOtherMainMenu" runat="server" CssClass="auto-style7" Height="185px" TextMode="MultiLine" Width="392px" BackColor="#CEE3F7">List other main menu items here</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:CheckBox ID="chkCalendar" runat="server" Text="Calendar" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:CheckBox ID="chkCourseMessage" runat="server" Text="Course Messages" />
            </td>

        </tr>
        <tr>
            <td class="auto-style5">
                <asp:CheckBox ID="chkQAForum" runat="server" Text="QA Forum" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:CheckBox ID="chkBBResources" runat="server" Text="BB Resources" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:CheckBox ID="chkMygrades" runat="server" Text="My Grades" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:CheckBox ID="chkMDCResources" runat="server" Text="MDC Resources" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:CheckBox ID="chkCheckActivigy" runat="server" Text="Check My Activity" />
            </td>
        </tr>
        </table>
                   </fieldset> 
                    <fieldset>
                <legend><strong>Syllabus</strong></legend>
                        <table class="auto-style8">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkSyllabusStd" runat="server" Text="Syllabus Standard Format" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkSyllabusAlign" runat="server" Text="Syllabus Grading Criteria Align" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </fieldset> 
                            <fieldset>
                <legend><strong>Getting Started</strong></legend>
                                <table class="auto-style8">
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chkMenuGuide" runat="server" Text="Course Mnu Guide" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style9">
                                            <asp:CheckBox ID="chkIntroVC" runat="server" Text="Introduction to VC" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chkVCOrientation" runat="server" Text="VC Student Orientation" />
                                        </td>
                                    </tr>
                                </table>
                                </fieldset> 
                            <fieldset>
                <legend><strong>Proctored Assessments</strong></legend>
                                <table class="auto-style8">
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chkProcMenu" runat="server" Text="Proctored Assessments Menu" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chkProcScript" runat="server" Text="Proctored Assessments Script" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chkProcPresent" runat="server" Text="Proctored Exam Present" />
                                        </td>
                                    </tr>
                                </table>
        </form> 
</body>
</html>
