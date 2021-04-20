<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AsModules.aspx.vb" Inherits="RadDesigner.AsModules" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
       .indie  {
  height: 200px;
  width: 800px;
  background-color: white;
}

        .auto-style1 {
            text-decoration: underline;
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
        <div class ="indie">
            <fieldset>
                <legend><strong>Modules/Lessons</strong></legend>
                <asp:CheckBox ID="chkAssessPreview" runat="server" Text="All Assessment Preview" />
                <br />
                <asp:CheckBox ID="chkAssessNewWindow" runat="server" Text="All Assessment - Test Options - Open in new window set to NO" />
                <br />
                <asp:CheckBox ID="chkAssessAvail" runat="server" Text="All Assessment - Test Options -&quot;make test available&quot; set to YES" />
                <br />
                <br />
                <strong>Log into the course as a student (e.g. Susie.Blackboard) and review the content below as an <span class="auto-style1">actual student</span></strong>. NOT in student preview.<br />
                <asp:CheckBox ID="chkAllVideos" runat="server" Text="All Videos Preview" />
                <br />
                <asp:CheckBox ID="chkAllImages" runat="server" Text="All Images Viewable" />
                <br />
                <asp:CheckBox ID="chkAllLinks" runat="server" Text="All Links Work" />
                <br />
                                </fieldset>
            </div>
                <br />
                <strong>Please list all content problems in the NOTES (page right).:--&gt;<br />
                </strong>
                <telerik:RadEditor ID="RadEditor1" Runat="server" BackColor="#99CCFF" Width="900px" ToolbarMode="Floating" Height="38px" Visible="False">
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
                <asp:Button ID="btnSave" runat="server" Text="Save Data on this page." Visible="False" />
&nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update data on thie Page" Visible="False" />
                &nbsp;
                <asp:Label ID="lblPageStatus" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblUpdate" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000" Text="Updated!" Visible="False"></asp:Label>
                <br />
                <br />
                MasterStatus =
            <asp:Label ID="lblMasterStatus" runat="server"></asp:Label>
                <br />


    </form>
</body>
