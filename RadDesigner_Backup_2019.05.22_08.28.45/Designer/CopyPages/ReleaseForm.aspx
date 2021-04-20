<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReleaseForm.aspx.vb" Inherits="RadDesigner.ReleaseForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 530px;
            background-color: #FFFFFF;
        }
        .auto-style2 {
            width: 200px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
        .auto-style3 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
        .auto-style4 {
            width: 200px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
        .fieldset-auto-width {
         display: inline-block;
    }
        .auto-style7 {
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            height: 33px;
        }
        .auto-style9 {
            
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
        .auto-style10 {
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            height: 25px;
        }
        .auto-style12 {
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
        .auto-style14 {
            text-align: left;
        }
        .auto-style15 {
            width: 200px;
            text-align: right;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            height: 23px;
        }
        .auto-style16 {
            text-align: left;
            height: 23px;
        }
        .auto-style17 {
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style18 {
            font-size: small;
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
                <div align="center">
                    <span class="auto-style17"><strong>Release Master Course to Design Team<br />
                    <asp:Button ID="btnReturn" runat="server" BackColor="#99CCFF" Font-Bold="True" Text="Return to Release Progress List" />
                    </strong></span>&nbsp;<table class="auto-style1" align="center">
                <tr>
                    <td class="auto-style15"><strong>Course</strong></td>
                    <td class="auto-style16"><strong>
                        <asp:Label ID="lblMasterName" runat="server" CssClass="auto-style3"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">New Master Course</td>
                    <td class="auto-style14">
                        <asp:Label ID="lblNewMasterCourse" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Content Source</td>
                    <td class="auto-style14">
                        <asp:Label ID="lblContent" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Is Released</td>
                    <td class="auto-style14">
                        <asp:Label ID="lblIsreleased" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Date Released</td>
                    <td class="auto-style14">
                        <asp:Label ID="lblDateReleased" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7" colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10" colspan="2">
                        <asp:CheckBox ID="chkDisable" runat="server" Text="Disable Developer from the Master Course" />
                        &nbsp;<asp:Label ID="lbldisablewarn" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#CC0000" Text="This must be checked to release" Visible="False"></asp:Label>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style18">Please contact the course developer before releasing this course to the Delivery Team</span></td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2">
                        <asp:CheckBox ID="chkContent" runat="server" Text="Review Course (QA)" />
                    &nbsp;<asp:Label ID="lblQAwarn" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#CC0000" Text="This must be checked to release" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2">
                        <telerik:RadEditor ID="RadEditor1" Runat="server" BackColor="#99CCFF" ToolbarMode="Floating" Height="200px" EmptyMessage="Add notes">
                            <Tools>
                                <telerik:EditorToolGroup Tag="MainToolbar">
                                    <telerik:EditorTool Name="FindAndReplace" />
                                    <telerik:EditorSeparator />
                                    <telerik:EditorSplitButton Name="Undo">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSplitButton Name="Redo">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSeparator />
                                    <telerik:EditorTool Name="Cut" />
                                    <telerik:EditorTool Name="Copy" />
                                    <telerik:EditorTool Name="Paste" ShortCut="CTRL+V / CMD+V" />
                                </telerik:EditorToolGroup>
                                <telerik:EditorToolGroup Tag="Formatting">
                                    <telerik:EditorTool Name="Bold" />
                                    <telerik:EditorTool Name="Italic" />
                                    <telerik:EditorTool Name="Underline" />
                                    <telerik:EditorSeparator />
                                    <telerik:EditorSplitButton Name="ForeColor">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSplitButton Name="BackColor">
                                    </telerik:EditorSplitButton>
                                    <telerik:EditorSeparator />
                                    <telerik:EditorDropDown Name="FontName">
                                    </telerik:EditorDropDown>
                                    <telerik:EditorDropDown Name="RealFontSize">
                                    </telerik:EditorDropDown>
                                </telerik:EditorToolGroup>
                            </Tools>
                            <Content>
</Content>

<TrackChangesSettings CanAcceptTrackChanges="False"></TrackChangesSettings>
                        </telerik:RadEditor>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="2">
                        <br />
                        <asp:Label ID="lblReleased" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="This course has been released." Visible="False"></asp:Label>
                        &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="btnUpdateNotes" runat="server" Font-Bold="True" Text="Update Notes" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="2">
                        <asp:Button ID="btnRelease" runat="server" Text="Release Course to Delivery Team" BackColor="#99FFCC" Font-Bold="True" />
                        </td>
                </tr>
            </table>


                </div>
    </form>
</body>
</html>
