<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AsManagement.aspx.vb" Inherits="RadDesigner.AsManagement" %>

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
        <div class ="indie">
                                <fieldset>
                <legend><strong>Content Collection</strong></legend>
                            Course Size (mb)
                            <asp:TextBox ID="txtSize" runat="server" BackColor="#D2F0FF"></asp:TextBox>
                            &nbsp;MB<br />
                            <asp:CheckBox ID="chkSpaces" runat="server" Text="In Content Collection - No Spaces in Titles" />
                            <br />
                            <br />
                            <strong>Date Manager:</strong><br />
                            Run Date Manager in course (tools). 
                                    <br />
                                    Please copy and paste 
                                    from the Date Manager all dates that are not in the upcoming term..<br />
                            </fieldset> 

        </div>
        <telerik:RadEditor ID="txtDateManager" Runat="server" BackColor="#C6ECFF" Width="900px" ToolbarMode="Floating" StripFormattingOptions="NoneSupressCleanMessage" Height="353px" StripFormattingOnPaste="NoneSupressCleanMessage">
            <Tools>
                <telerik:EditorToolGroup Tag="MainToolbar">
                    <telerik:EditorTool Name="Print" ShortCut="CTRL+P / CMD+P" />
                    <telerik:EditorTool Name="SelectAll" ShortCut="CTRL+A / CMD+A" />
                    <telerik:EditorTool Name="Cut" ShortCut="CTRL+X / CMD+X" />
                    <telerik:EditorTool Name="Copy" ShortCut="CTRL+C / CMD+C" />
                    <telerik:EditorTool Name="Paste" ShortCut="CTRL+V / CMD+V" />
                    <telerik:EditorToolStrip Name="PasteStrip">
                    </telerik:EditorToolStrip>
                    <telerik:EditorSeparator />
                    <telerik:EditorSplitButton Name="Undo">
                    </telerik:EditorSplitButton>
                    <telerik:EditorSplitButton Name="Redo">
                    </telerik:EditorSplitButton>
                </telerik:EditorToolGroup>
                <telerik:EditorToolGroup>
                    <telerik:EditorTool Name="Bold" ShortCut="CTRL+B / CMD+B" />
                    <telerik:EditorTool Name="Italic" ShortCut="CTRL+I / CMD+I" />
                    <telerik:EditorTool Name="Underline" ShortCut="CTRL+U / CMD+U" />
                    <telerik:EditorTool Name="XhtmlValidator" />
                </telerik:EditorToolGroup>
                <telerik:EditorToolGroup>
                    <telerik:EditorSplitButton Name="ForeColor">
                    </telerik:EditorSplitButton>
                    <telerik:EditorSplitButton Name="BackColor">
                    </telerik:EditorSplitButton>
                    <telerik:EditorDropDown Name="ApplyClass">
                    </telerik:EditorDropDown>
                    <telerik:EditorToolStrip Name="FormatStripper">
                    </telerik:EditorToolStrip>
                </telerik:EditorToolGroup>
            </Tools>
            <Content>
</Content>

<TrackChangesSettings CanAcceptTrackChanges="False"></TrackChangesSettings>
        </telerik:RadEditor>
        <br />
        <br />
        <asp:Button ID="btnSave" runat="server" Text="Save Data on this page" Visible="False" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdate" runat="server" Text="Update Data on this page" Visible="False" />
&nbsp;<asp:Label ID="lblPageStatus" runat="server" Font-Bold="True" Font-Names="Arial Black" ForeColor="#CC0000"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblUpdate" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="#CC0000" Text="Updated!" Visible="False"></asp:Label>
        <p>
            MasterStatus =
            <asp:Label ID="lblMasterStatus" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnPreview" runat="server" Text="Preview" Visible="False" />
        </p>
        <p>
            <asp:Label ID="lblPreview" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
