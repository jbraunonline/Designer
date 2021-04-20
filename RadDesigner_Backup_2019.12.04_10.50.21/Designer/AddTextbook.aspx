<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddTextbook.aspx.vb" Inherits="RadDesigner.AddTextbook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 131px;
            background-color:lightsteelblue
        }
        .auto-style4 {
            height: 25px;
        }
        body {
    font-family: Arial, Helvetica, sans-serif;
}
        .auto-style5 {
            font-size: small;
        }
        .auto-style6 {
            width: 131px;
            background-color: lightsteelblue;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
        .auto-style10 {
            margin-right: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Add textbook for
        <asp:Label ID="lblMasterCourse" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Cancel / Return" BackColor="#DDEEFF" Font-Bold="True" />
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2"><strong>MasterCourse</strong></td>
                <td>
                    <asp:TextBox ID="txtMasterCourse" runat="server" Width="245px" BackColor="White"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Course</strong></td>
                <td>
                    <asp:TextBox ID="txtCourse" runat="server" Width="245px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Term</strong></td>
                <td>
                    <asp:TextBox ID="txtTerm" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Required</strong></td>
                <td class="auto-style4">
                    <asp:CheckBox ID="chkREQ" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Supplimental</strong></td>
                <td>
                    <asp:CheckBox ID="chkSUP" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Alternate</strong></td>
                <td>
                    <asp:CheckBox ID="chkALT" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Title</strong></td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" Height="82px" TextMode="MultiLine" Width="651px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6"><strong>ISBN</strong></td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtISBN" runat="server" Width="174px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Edition #</strong></td>
                <td>
                    <asp:TextBox ID="txtEdition" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Year Published</strong></td>
                <td>
                    <asp:TextBox ID="txtYrPub" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Author</strong></td>
                <td>
                    <asp:TextBox ID="txtAuthor" runat="server" Width="312px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Publisher</strong></td>
                <td>
                    <asp:TextBox ID="txtPublisher" runat="server" Width="323px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"><strong>Text Type</strong></td>
                <td>
                    <asp:TextBox ID="txtType" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Textbook" BackColor="#CCFF99" Font-Bold="True" CssClass="auto-style10" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>To Do<br />
                    <span class="auto-style5">Add Txt_Comments to db and form</span><br class="auto-style5" />
                    <span class="auto-style5">add DDL: textbook_Type to db and form</span><br class="auto-style5" />
                    <span class="auto-style5">Add constraints on alt, req, alternate</span><br class="auto-style5" />
                    <span class="auto-style5">Add bimd;e chk to db and form</span></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
