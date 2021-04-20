<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AsStatus.aspx.vb" Inherits="RadDesigner.AsStatus" %>

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
                            <asp:Label ID="lblDirections" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Fix the problems noted in the textbox NOTE your changes in the textbox and Update the record." Visible="False"></asp:Label>
                            <br />
                            <asp:CheckBox ID="chkCertify" runat="server" Text="I certify that this audit is complete. Notes and recommendates have been placed and saved in the note form." AutoPostBack="True" Visible="False" />

                            <br />
                            <asp:CheckBox ID="chkProblems" runat="server" AutoPostBack="True" Text="Check this box to indicate that this audit HAS PROBLEMS. Note problems in the notes form." Visible="False" />

                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblMustCheck" runat="server" BackColor="#FFFF99" Font-Bold="True" ForeColor="#CC0000" Text="You MUST check a checkbox!" Visible="False"></asp:Label>

                            <br />

                            <br />
&nbsp;Current Status of this audit: <asp:Label ID="lblStatus" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                            <br />
                            Please remember to save any notes for this audit before leaving this audit.<br />

                            <asp:Label ID="lblAuditStatusExists" runat="server"></asp:Label>
&nbsp;<asp:Label ID="lblNoteResults" runat="server" Text="Notes were updated" Visible="False"></asp:Label>
                            <br />
                            <br />
                            <br />
                            <asp:Button ID="btnSave" runat="server" Text="Save Data and Complete the Audit" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnUpdate" runat="server" Text="Update the Status of this Audit" Visible="False" />
&nbsp;
                            <asp:Label ID="lblPageStatus" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000">pgstatus</asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblUpdate" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000" Text="Updated!" Visible="False"></asp:Label>
                            &nbsp;
                            <asp:Label ID="lblIsSweep" runat="server"></asp:Label>
                            <br />
                            &nbsp;
                            <asp:Label ID="lblPushBack" runat="server" Visible="False"></asp:Label>
                            &nbsp;<br />
&nbsp;<asp:Button ID="btnPushBack" runat="server" BackColor="#CC0000" Font-Bold="True" Font-Names="Arial" ForeColor="White" Text="Push Back To Associate" Visible="False" />
                            <asp:Button ID="btnSweep" runat="server" BackColor="#99FF99" Font-Bold="True" Text="Mark Complete &amp; Release for Sweep" Visible="False" />
                            &nbsp;
                            <br />
                            </fieldset> 
        </div>
        <asp:Label ID="lblPushBackStatus" runat="server"></asp:Label>
        &nbsp;&nbsp;
        <asp:Label ID="lblIsPrimary" runat="server"></asp:Label>
&nbsp;
        <p>
            MasterAuditStatus = <asp:Label ID="lblMasterStatus" runat="server"></asp:Label>
        &nbsp;
            <asp:Label ID="lblCase" runat="server" Visible="False"></asp:Label>
        </p>
    </form>
</body>
</html>


