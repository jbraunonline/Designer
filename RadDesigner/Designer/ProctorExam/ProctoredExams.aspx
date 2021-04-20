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
        .body {
    font-family: Arial, Helvetica, sans-serif;
}
        .auto-style12 {
            height: 23px;
            font-size: small;
        }
        .auto-style13 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }



body {
    font-family: Arial, Helvetica, sans-serif;
}

        .auto-style14 {
            font-size: x-small;
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
                        </strong><br /><span class="auto-style14">Data from Dr. Burt;s exam schedule.</span></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="lblNoRecord" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Red" Text="No Record! Contact Administrator." Visible="False"></asp:Label>
                    </td>
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
                        <asp:TextBox ID="txtMidStart" runat="server">1/1/1900</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Mid End</td>
                    <td>
                        <asp:TextBox ID="txtMidEnd" runat="server">1/1/1900</asp:TextBox>
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
                        <asp:TextBox ID="txtFinStart" runat="server">1/1/1900</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Final End</td>
                    <td>
                        <asp:TextBox ID="txtFinEnd" runat="server">1/1/1900</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style13">
                        Leave Date 1/1/1900 for No Exams</td>
                </tr>
                <tr>
                    <td class="auto-style9">Exans Verified by Designer</td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblVerify" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Button ID="Button1" runat="server" BackColor="#99FF66" Font-Bold="True" Text="Update Dates" />
                    </td>
                    <td class="auto-style12">
                        Use 1/1/2000 for no exam/no date</td>
                </tr>
            </table>
            </fieldset> 

                </div>
                <asp:Label ID="lblOL_MasterProctor" runat="server"></asp:Label>
                &nbsp; ~/Designer/ProctorExam/ProctoredExams.aspx<br />
                <asp:Label ID="lblIsMid" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="lblIsfin" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
