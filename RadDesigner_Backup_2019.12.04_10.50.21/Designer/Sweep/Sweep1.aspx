<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Sweep1.aspx.vb" Inherits="RadDesigner.Sweep1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 430px;
            background-color: #FFFFFF;
        }
        .auto-style2 {
            width: 121px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
        .auto-style3 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
        .auto-style4 {
            width: 121px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            color: #CC0000;
        }
        .fieldset-auto-width {
         display: inline-block;
    }
        .auto-style7 {
            width: 121px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            height: 33px;
        }
        .auto-style8 {
            height: 33px;
        }
        .auto-style9 {
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
        .auto-style10 {
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            height: 25px;
        }
        .auto-style12 {
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
                <div align="center">
                        <fieldset  class="fieldset-auto-width">
                <legend><strong>Master Course to Sweep</strong></legend>
            <table class="auto-style1" align="center">
                <tr>
                    <td class="auto-style2"><strong>Course</strong></td>
                    <td><strong>
                        <asp:Label ID="lblMasterCourse" runat="server" CssClass="auto-style3"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style4">Auditor</td>
                    <td>
                        <asp:Label ID="lblAuditor" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Audit Status</td>
                    <td>
                        <asp:Label ID="lblAuditStatus" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Sweep Status</td>
                    <td>
                        <asp:Label ID="lblSweepStatus" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style8">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10" colspan="2">
                        <asp:CheckBox ID="chkTextbook" runat="server" Text="Textbook Info Updated" />
                    &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblWarn" runat="server" BackColor="#FFFF99" ForeColor="#CC0000" Text="You must select all checkboxes!" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2">
                        <asp:CheckBox ID="chkGradebook" runat="server" Text="Grade Center Aligns with Syllabus" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2">
                        <asp:CheckBox ID="chkExam" runat="server" Text="Confirm Testing Dates" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="2">
                        <asp:Button ID="btnStart" runat="server" Text="Do Checks and Start Sweep" BackColor="#CCFFFF" Visible="False" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnUpdate" runat="server" Text="Update Data" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblContinue" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000" Text="Continue with Sweep" Visible="False"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblUpdate" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
            </fieldset> 

                </div>
    </form>
</body>
</html>
