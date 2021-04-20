<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AuditNotes.aspx.vb" Inherits="RadDesigner.AuditNotes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        body {
            font-family: Arial, Helvetica, sans-serif;
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
    <div>
    
        <span class="auto-style1"><strong>Please place ALL Audit Notes Here.</strong></span><br />
        Please Save your notes when leaving this page.<br />
        When saved, today&#39;s date and your name will appear at the top of the message window.<br />
        </div>
        Notes for&nbsp; <asp:Label ID="lblAuditMasterName" runat="server" Font-Bold="True" ForeColor="#993333"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="SaveNotes" BackColor="Red" Font-Bold="True" ForeColor="White" />
        <telerik:RadEditor ID="RadEditor1" Runat="server" Width="500px" RenderMode="Lightweight" Skin="WebBlue">
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
        <p>
            <asp:Label ID="lblAuditStatusExists" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
