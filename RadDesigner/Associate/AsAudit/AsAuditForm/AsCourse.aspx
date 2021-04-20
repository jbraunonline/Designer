<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AsCourse.aspx.vb" Inherits="RadDesigner.AsCourse" %>

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
        .auto-style5 {
            width: 121px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            color: #CC0000;
            height: 22px;
        }
        .auto-style6 {
            height: 22px;
        }
        .auto-style7 {
            color: #999999;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

                        <fieldset  class="fieldset-auto-width">
                <legend><strong>Master Course to Audit</strong></legend>
            <table class="auto-style1" >
                <tr>
                    <td class="auto-style2"><strong>Course</strong></td>
                    <td><strong>
                        <asp:Label ID="lblMasterCourse" runat="server" CssClass="auto-style3"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style5">Title</td>
                    <td class="auto-style6">
                        <asp:Label ID="lblTitle" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Designer</td>
                    <td>
                        <asp:Label ID="lblDesigner" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Developer</td>
                    <td>
                        <asp:Label ID="lblDeveloper" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Co-Developer</td>
                    <td>
                        <asp:Label ID="lblCodeveloper" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Course Status</td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Phase</td>
                    <td>
                        <asp:Label ID="lblPhase" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        &nbsp;</td>
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
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Label ID="lblRole" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Start Audit" BackColor="#CCFFFF" Visible="False" />
                        <asp:Label ID="lblContinue" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000" Text="Continue with Audit" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            </fieldset> 

    
                <p>
            <asp:Label ID="lblMasterStatus" runat="server" Visible="False"></asp:Label>
                </p>
    </form>
    <p class="auto-style7">
        ~/Associate/AsAudit/AsAuditForm/AsCourse.aspx</p>
</body>
</html>