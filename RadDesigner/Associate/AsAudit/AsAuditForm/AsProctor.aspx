﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AsProctor.aspx.vb" Inherits="RadDesigner.AsProctor1" %>

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
    width: 700px;
    font-size: medium;
}

td {
    vertical-align: top;
}
    .auto-style1 {
        font-size: medium;
    }
    .auto-style2 {
        text-decoration: underline;
    }
    .auto-style3 {
        font-size: medium;
    }
    .auto-style4 {
        font-size: medium;
    }
    .auto-style5 {
        font-size: x-large;
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
        <strong><span class="auto-style5">Proctored Exams for course </span> <asp:Label ID="lblCourse" runat="server" CssClass="auto-style5"></asp:Label>
        <br />
        </strong><span class="auto-style1"><span class="auto-style2">Note:</span> Whether or not an exam exists is set by the designers. Changing &quot;Exists&quot; or &quot;No Final&quot; settings will not save.</span><br />
        <div>
            <table class="auto-style3">
                <tr>
                    <td style="vertical-align:top" class="auto-style4">
                                      
                        <fieldset  class="fieldset-auto-width">
                <legend class="auto-style4"><strong>Mid Term Local</strong></legend>
                            <asp:RadioButtonList ID="radioMidExists" runat="server" RepeatDirection="Horizontal" Width="300px" Font-Size="Medium">
                                <asp:ListItem>MidTerm Exists</asp:ListItem>
                                <asp:ListItem>No Midterm</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Label ID="lblMidStart" runat="server" >--</asp:Label>
                            <span class="auto-style4">&nbsp;-
                            </span>
                            <asp:Label ID="lblMidEnd" runat="server" CssClass="auto-style4">--</asp:Label>
                            <br class="auto-style4" />
                            <br class="auto-style4" />
                        <asp:CheckBox ID="chkMidAvail" runat="server" Text="Availability set to Yes" CssClass="auto-style4" Font-Size="Medium" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkMIDLCLIP" runat="server" Text="LCL Location IP set to Testing Centers" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkMidDate" runat="server" Text="Display After and Unit Dates are Correct" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkMidDateClear" runat="server" Text="Due Date is Clear" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkMidCalendar" runat="server" Text="Tesing Window noted in Course Calendar" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            </fieldset><span class="auto-style4"> </span>
                                      
                    </td>
                    <td style="vertical-align:top" class="auto-style4">
                        <fieldset  class="fieldset-auto-width">
                <legend class="auto-style4"><strong>Final Local</strong></legend>
                           <asp:RadioButtonList ID="radioFinExists" runat="server" RepeatDirection="Horizontal" Width="300px">
                                <asp:ListItem>Final Exists</asp:ListItem>
                                <asp:ListItem>No Final</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Label ID="lblFinStart" runat="server" Font-Size="Small" Text="--" CssClass="auto-style4"></asp:Label>
                            <span class="auto-style4">&nbsp;-
                            </span>
                            <asp:Label ID="lblFinEnd" runat="server" Font-Size="Small" Text="--" CssClass="auto-style4"></asp:Label>
                            <br class="auto-style4" />
                            <br class="auto-style4" />
                        <asp:CheckBox ID="chkFINAvail" runat="server" Text="Availability set to Yes" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkFINLCLIP" runat="server" Text="LCL Location IP set to Testing Centers" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkFinDate" runat="server" Text="Display After and Unit Dates are Correct" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkFinDateClear" runat="server" Text="Due Date is Clear" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkFinCalendar" runat="server" Text="Tesing Window noted in Course Calendar" CssClass="auto-style4" />
                            </fieldset><span class="auto-style4"> </span>
                    </td>
                </tr>
  <tr>
                    <td style="vertical-align:top" class="auto-style4">
                                        <div  >
                        <fieldset  class="fieldset-auto-width">
                <legend class="auto-style4"><strong>Mid Term Remote</strong></legend>

                            <br class="auto-style4" />
                            <br class="auto-style4" />
                        <asp:CheckBox ID="chkMidAvailR" runat="server" Text="Availability set to Yes" CssClass="auto-style4" />
                            <br class="auto-style4" />
                              <asp:CheckBox ID="chkMIDRMTIPR" runat="server" Text="RMT Location IP set to No Restrictions" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkMidDateR" runat="server" Text="Display After and Unit Dates are Correct" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkMidDateClearR" runat="server" Text="Due Date is Clear" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkMidCalendarR" runat="server" Text="Tesing Window noted in Course Calendar" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            </fieldset><span class="auto-style4"> </span>
                                      
                    </td>
                    <td style="vertical-align:top" class="auto-style4">
                        <fieldset  class="fieldset-auto-width">
                <legend class="auto-style4"><strong>Final Remote</strong></legend>

                            <br class="auto-style4" />
                            <br class="auto-style4" />
                        <asp:CheckBox ID="chkFINAvailR" runat="server" Text="Availability set to Yes" CssClass="auto-style4" />
                            <br class="auto-style4" />
                             <asp:CheckBox ID="chkFINRMTIPR" runat="server" Text="RMT Location IP set to No Restrictions" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkFinDateR" runat="server" Text="Display After and Unit Dates are Correct" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkFinDateClearR" runat="server" Text="Due Date is Clear" CssClass="auto-style4" />
                            <br class="auto-style4" />
                            <asp:CheckBox ID="chkFinCalendarR" runat="server" Text="Tesing Window noted in Course Calendar" CssClass="auto-style4" />
                            </fieldset><span class="auto-style4"> </span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Width="63px" Visible="False" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" />
&nbsp;&nbsp;&nbsp;
                        &nbsp;
                        <asp:Label ID="lblPageStatus" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                    &nbsp;
                        <asp:Label ID="lblDateEntered" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <p>
            MasterStatus =
            <asp:Label ID="lblMasterStatus" runat="server"></asp:Label>
        </p>
    </form>
    <p >
        ~/Associate/AsAudit/AsAuditForm/AsProctor.aspx</p>
</body>
</html>