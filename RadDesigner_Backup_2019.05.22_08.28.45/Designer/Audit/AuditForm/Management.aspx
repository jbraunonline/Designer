<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Management.aspx.vb" Inherits="RadDesigner.Management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
        .auto-style2 {
            color: #CC0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                                <fieldset>
                <legend><strong>Content Collection</strong></legend>
                            Course Size (mb)
                            <asp:TextBox ID="TextBox1" runat="server" BackColor="#D2F0FF"></asp:TextBox>
                            <br />
                            <asp:CheckBox ID="chkSpaces" runat="server" Text="In Content Collection - No Spaces in Titles" />
                            <br />
                            <br />
                            <strong>Date Manager:</strong><br />
                            Run Date Manager in course (tools). 
                                    <br />
                                    <span class="auto-style2"><strong>Option 1</strong></span><br />
                                    Run the Date Manager Save the output and upload a file listing <span class="auto-style1">ONLY </span>ALL DATES NOT IN THIS TERM.<br />
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                    <br />
                                    <asp:Button ID="Button1" runat="server" Text="Upload" />
                                    <br />
                                    <br />
                                    <span class="auto-style2"><strong>Option 2</strong></span><br />
                                    Please copy and paste all dates that are not in this term.<br />
                            <asp:TextBox ID="TextBox2" runat="server" BackColor="#CEEFFF" Height="412px" TextMode="MultiLine" Width="807px"></asp:TextBox>
                            </fieldset> 

        </div>
    </form>
</body>
</html>
