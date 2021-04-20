<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BuildingBlocks.aspx.vb" Inherits="RadDesigner.BuildingBlocks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
    body{
    margin-top: 0px; 
    margin-bottom: 0px; 
    margin-left: 0px; 
    margin-right: 0px;
    font-family: Arial, Helvetica, sans-serif;
}
table, td, th {

}

table {
    border-collapse: collapse;
    width: 400px;
}

td {
    vertical-align: top;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
        <strong><span class="auto-style1">Building Blocks for course </span> <asp:Label ID="Label1" runat="server" Text="Label" CssClass="auto-style1"></asp:Label>
        <br />
        </strong><br />
        <div>
            <table class="auto-style2">
                <tr>
                    <td style="vertical-align:top" class="auto-style4">
                                        <div  >
                        <fieldset  class="fieldset-auto-width">
                <legend><strong>LTI Building Blocks</strong></legend>
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataTextField="BBName" DataValueField="BB_ID">
                        </asp:CheckBoxList>
                            </fieldset>
                                      
                    </td>
                    <td style="vertical-align:top" class="auto-style4">
                        <fieldset  class="fieldset-auto-width">
                <legend><strong>External Link Building Blocks</strong></legend>
                        <asp:CheckBoxList ID="CheckBoxList2" runat="server" DataTextField="BBName" DataValueField="BB_ID">
                        </asp:CheckBoxList>
                            </fieldset>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Width="63px" Visible="False" />
                        <asp:Button ID="Button1" runat="server" Text="Load Saved" Visible="False" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="False" />
&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnNoBlocks" runat="server" BackColor="#CCFFCC" Text="Click to Confirm No Building Blocks for this Course." Visible="False" Width="368px" />
&nbsp;
                        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                    &nbsp;
                        <asp:Label ID="lblDateEntered" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:TextBox ID="TextBox4" runat="server" Width="686px" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox5" runat="server" BackColor="#FFFFCC" Width="684px" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox6" runat="server" BackColor="Yellow" Visible="False" Width="679px"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Visible="False" Wrap="False"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" Visible="False" Wrap="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox7" runat="server" Visible="False" Wrap="False"></asp:TextBox>
        <asp:TextBox ID="TextBox8" runat="server" Visible="False" Wrap="False"></asp:TextBox>
    </form>
</body>
</html>
