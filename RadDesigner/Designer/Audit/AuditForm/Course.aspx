<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Course.aspx.vb" Inherits="RadDesigner.Course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 800px;
            background-color: #CCCCCC;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2"><strong>Course</strong></td>
                    <td><strong>
                        <asp:Label ID="lblMasterCourse" runat="server" CssClass="auto-style3"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">Title</td>
                    <td>
                        <asp:Label ID="lblTitle" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Designer</td>
                    <td>
                        <asp:Label ID="lblDesigner" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Developer</td>
                    <td>
                        <asp:Label ID="lblDeveloper" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Co-Developer</td>
                    <td>
                        <asp:Label ID="lblCodeveloper" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">New Course</td>
                    <td>
                        <asp:Label ID="lblIsNewCourse" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Phase</td>
                    <td>
                        <asp:Label ID="lblPhase" runat="server" CssClass="auto-style3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Auditor</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Audit Status</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Audit Complete</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            Course</div>
    </form>
</body>
</html>
