<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Status.aspx.vb" Inherits="RadDesigner.Status" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <div>
                        <fieldset>
                <legend><strong>Audit Release</strong></legend>
                            <asp:CheckBox ID="chkDevRelease" runat="server" Text="Developer Release" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtDevRelDate" runat="server"></asp:TextBox>
                            <br />
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Designer Release" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtDesignRelDate" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <strong>Audit Notes and Recommendations:</strong><br />
                            <telerik:RadEditor ID="RadEditor1" Runat="server" BackColor="#CCEEFF" Height="600px" Width="1200px">
                            </telerik:RadEditor>
                            <br />
                            <br />
                            </fieldset> 
        </div>
    </form>
</body>
</html>
