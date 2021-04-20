<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Sweep2.aspx.vb" Inherits="RadDesigner.Sweep2" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
body {
  font-family: Helvetica Neue,Helvetica,Arial,sans-serif;
}
        .auto-style1 {
            width: 612px;
        }
        .auto-style2 {
            color: #CC0000;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server" >
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
                <legend><strong>New Master Content</strong></legend>
                                    <table class="auto-style1">
                                        <tr>
                                            <td class="RadInputRTL">Current Master Course</td>
                                            <td>
                                    <strong>
                                    <asp:Label ID="lblCurrentMaster" runat="server"></asp:Label>
                                    </strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="RadInputRTL">New Master Course:
                                    </td>
                                            <td><strong>
                                    <asp:Label ID="lblNewMasterCourse" runat="server" CssClass="auto-style2"></asp:Label>
                                    </strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="RadInputRTL">Content Source for the New Course</td>
                                            <td>
                                    <strong>
                                    <asp:Label ID="lblNewContent" runat="server" CssClass="auto-style2"></asp:Label>
                                    </strong>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:CheckBox ID="chkIsAlt" runat="server" AutoPostBack="True" Text="I want to use another course as the content source" />
                                    <br />
                                    <telerik:RadTextBox ID="txtAltSource" Runat="server" BackColor="#C6ECFF" EmptyMessage="Enter Alternate Source Here. Please explain below." ForeColor="Black" Height="34px" LabelWidth="64px" Resize="None" Visible="False" Width="496px">
                                    </telerik:RadTextBox>
                            <br />
                                    <br />
                                    <strong>Please list all special details for creating the new master course.</strong>.<br />
                            </fieldset> 

        </div>
        <telerik:RadEditor ID="txtAltNotes" Runat="server" BackColor="#C6ECFF" Width="1200px" Height="274px" Skin="WebBlue" ToolbarMode="Floating">
        </telerik:RadEditor>
        <asp:Button ID="btnSave" runat="server" Text="Release the course for copying." Visible="False" BackColor="#CCFFCC" Font-Bold="True" Width="230px" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdate" runat="server" Text="Update Data on this page" Visible="False" Width="178px" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnMistake" runat="server" Text="Cancel! Not ready for copying " Width="228px" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:Label ID="lblPageStatus" runat="server" Font-Bold="True" Font-Names="Arial Black" ForeColor="#CC0000"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblUpdate" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000" Text="Updated!" Visible="False"></asp:Label>
    </form>
</body>
</html>
