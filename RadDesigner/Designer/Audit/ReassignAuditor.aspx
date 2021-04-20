<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReassignAuditor.aspx.vb" Inherits="RadDesigner.ReassignAuditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>

body {
    font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" BackColor="#99FF99" Font-Bold="True" Text="Exit / Return to Audit List" />
&nbsp; Do NOT use the tabs above to leave this page!<br />
        <h2>Change Auditor</h2>
    
    </div>
        <h3>Current course settings:</h3>
        <p>
            <asp:Label ID="lblMasterCourse" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblAuditor" runat="server"></asp:Label>
        </p>
        <h3>Select a New Auditor</h3>
        <p>
            <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="Abbr" DataValueField="User_ID">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Button ID="btnSwitch" runat="server" BackColor="#0099CC" Font-Bold="True" ForeColor="White" Text="Switch Auditor to the Selected User" Visible="False" />
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="DELETE This Audit" Visible="False" Width="335px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnDelete" runat="server" BackColor="#993333" Font-Bold="True" ForeColor="Yellow" Text="Yes, Delete it!" Visible="False" />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="The auditor has been changed. Use the Exit Button above to return to audit list." Visible="False"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnReturn" runat="server" Text="Return to list. Not NOT use the tab above to return." Visible="False" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="btnMasterDelete" runat="server" BorderColor="Red" BorderWidth="3px" Text="MasterDelete" />
&nbsp; This will force delete all audit records for this course,
        </p>
        <p>
            Multiple audits: <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">False</asp:ListItem>
                <asp:ListItem>True</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="lblNumber" runat="server"></asp:Label>
&nbsp;#</p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
