<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProctoredExams.aspx.vb" Inherits="RadDesigner.ProctoredExams" %>

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
            width: 154px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
        .auto-style3 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
        .auto-style4 {
            width: 154px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            color: #CC0000;
        }
        .fieldset-auto-width {
         display: inline-block;
    }
        .auto-style5 {
            width: 154px;
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
            width: 154px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            color: #CC0000;
            height: 23px;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style9 {
            width: 154px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style10 {
            width: 154px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            height: 23px;
        }
        body {
    font-family: Arial, Helvetica, sans-serif;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
                <div align="center">
                        <fieldset  class="fieldset-auto-width">
                <legend><strong>Master Course Proctored Exams </strong></legend>
            <table class="auto-style1" align="center">
                <tr>
                    <td class="auto-style2"><strong>Course</strong></td>
                    <td><strong>
                        <asp:Label ID="lblMasterCourse" runat="server" CssClass="auto-style3"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Has MidTerm</td>
                    <td>
                        <asp:RadioButtonList ID="radioMid" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Mid&nbsp; Start</td>
                    <td>
                        <asp:TextBox ID="txtMidStart" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Mid End</td>
                    <td>
                        <asp:TextBox ID="txtMidEnd" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style8">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Has Final</td>
                    <td>
                        <asp:RadioButtonList ID="radioFinal" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">Final Start</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtFinStart" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Final End</td>
                    <td>
                        <asp:TextBox ID="txtFinEnd" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">Exans Verified by Designer</td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblVerify" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style8">
                    </td>
                </tr>
            </table>
            </fieldset> 

                </div>
                <asp:Label ID="lblOL_MasterProctor" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblIsMid" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="lblIsfin" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
