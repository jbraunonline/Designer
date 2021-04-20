<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Default1.aspx.vb" Inherits="RadDesigner._Default" %>

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
                <asp:TextBox ID="txtPassword" runat="server" BackColor="#B9DCFF" Width="154px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter a password!" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="Select">Select a User</asp:ListItem>
            <asp:ListItem Value="mrios4">M Rios</asp:ListItem>
            <asp:ListItem Value="mjames3">M James</asp:ListItem>
            <asp:ListItem Value="tmitche1">T Mitchell</asp:ListItem>
            <asp:ListItem Value="aalphons">A Alphonse-Prescott</asp:ListItem>
            <asp:ListItem Value="slomena">S Lomena</asp:ListItem>
            <asp:ListItem Value="mstefan1">M Stefanos</asp:ListItem>
              <asp:ListItem Value="mjordan">M Jordan</asp:ListItem>
            <asp:ListItem Value="nada">_______Auditors________</asp:ListItem>
            <asp:ListItem Value="althea-audit">Althea-Audit</asp:ListItem>
            <asp:ListItem Value="mrios-audit">Melisa-Audit</asp:ListItem>
            <asp:ListItem Value="michelle-audit">Michelle-Audit</asp:ListItem>
            <asp:ListItem Value="toshiba-audit">Toshiba-Audit</asp:ListItem>
            <asp:ListItem Value="mstefan1-audit">MichelleS - Audit</asp:ListItem>
            <asp:ListItem Value="slomena-audit">Sandra - Audit</asp:ListItem>
            <asp:ListItem Value="mjordan-audit">MJordan- Audit</asp:ListItem>

            <asp:ListItem Value="hnorieg1">Hector</asp:ListItem>
            <asp:ListItem Value="eburt">E Burt</asp:ListItem>
            <asp:ListItem Value="dsherida">Debra S</asp:ListItem>
            <asp:ListItem Value="smaarouf">S Maarouf</asp:ListItem>
            <asp:ListItem Value="djenning">D Jennings</asp:ListItem>

            <asp:ListItem>Helpdesk</asp:ListItem>
            <asp:ListItem Value="aboxley1">Alex Boxley</asp:ListItem>
             <asp:ListItem Value="aacosta">A Acosta</asp:ListItem>
            <asp:ListItem Value="jtang">J Tang</asp:ListItem>
        </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Select a user!" InitialValue="Select" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="Incorrect password. Re-enter and try again." Visible="False"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Login" />
                <br />
                <br />
                <span class="auto-style3"><strong>UPDATE:</strong> I added a new tab on the Designer page:&nbsp; Priority Progress</span><br class="auto-style3" />
                <span class="auto-style3">This lists progress for your Pilot and Top 20 Courses.</span></div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
