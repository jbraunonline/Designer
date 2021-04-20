<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Consultant.aspx.vb" Inherits="RadDesigner.Consultant" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
    <style type="text/css">
        .auto-style1 {
            width: 1900px;
            height: 100px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: x-large;
        }
        .auto-style4 {
            margin-left: 0px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
    <script type="text/javascript">
        //Put your JavaScript code here.
    </script>
    <div class="auto-style2">
                <br />
        <img alt="menu header" class="auto-style1" src= "BlankOnline100x1900.png" /><br />
                <br />
                <span class="auto-style3">Consultant Access</span><br />
                <br />
                <asp:TextBox ID="txtUserName" runat="server" BackColor="#B9DCFF" Width="155px"></asp:TextBox>
&nbsp; Username<br />
                <br />
                <asp:TextBox ID="txtPassword" runat="server" BackColor="#B9DCFF" Width="154px" TextMode="Password"></asp:TextBox>
                &nbsp; Password<br />
   
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Incorrect login attempt. Re-enter and try again." Visible="False"></asp:Label>
        <br />
                <br />
        <asp:Button ID="Button1" runat="server" Text="Login" BackColor="#A6E2FF" Font-Bold="True" />
                <br />

        </div>
    <p class="auto-style2">
        <asp:Button ID="Button2" runat="server" BorderColor="Red" Text="Change Cunsultant Password" />
        </p>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <div class="auto-style2">
                <asp:TextBox ID="Username" runat="server" BackColor="#CCFF99" CssClass="auto-style4" Width="195px"></asp:TextBox>
                &nbsp;UserName<br />
                <asp:TextBox ID="CurrentPassword" runat="server" BackColor="#CCFF99" Width="155px"></asp:TextBox>
                &nbsp;Current Password<br />
                <asp:TextBox ID="NewPassword" runat="server" BackColor="#CCFF99" Width="166px"></asp:TextBox>
                &nbsp; New Password
                <br />
                <asp:Button ID="Button3" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="Change Password" />
            </div>
        </asp:Panel>

    </form>
    </body>
</html>

