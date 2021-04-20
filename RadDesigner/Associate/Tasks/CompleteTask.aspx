<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CompleteTask.aspx.vb" Inherits="RadDesigner.CompleteTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        table, td, th {
    border: 0px solid silver;
}

table {
    border-collapse: collapse;
    width: 800px;
}

th {
    text-align: left;
}
        .newStyle1 {
            background-color: #808080;
            font-family: Arial;
            color: #FFFFFF;
            font-weight: bold;
        }
        .newStyle2 {
            background-color: #E0E7ED;
        }
        .newStyle3 {
            border-style: none;
            border-color: #FFFFFF;
        }
        .auto-style4 {
            background-color: #E0E7ED;
            height: 38px;
        }
        .auto-style5 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .newStyle4 {
            font-size: medium;
        }
        .newStyle5 {
            font-size: large;
            color: #FFFFFF;
            font-weight: bold;
            font-family: Arial;
        }
        .newStyle6 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            color: #FFFFFF;
        }
        .newStyle7 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            color: #FFFFFF;
            float: right;
        }
        .newStyle8 {
            width: 200px;
        }
        .newStyle9 {
            background-color: #FFFFFF;
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

            <table style="width:1000px;text-align:left;background-color:silver;" class="newStyle3" align="center">
            <tr class="newStyle9">
                <td colspan="2">
                    <h1 class="auto-style5">Complete Task&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnReturn" runat="server" BackColor="#99FFCC" Font-Bold="True" Text="Return to MyTask List" />
                    </h1>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Course</td>
                <td class="newStyle2" >
                    <asp:Label ID="lblCourse" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Date Posted</td>
                <td class="newStyle2">
                    <asp:Label ID="lblDatePosted" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Designer</td>
                <td class="newStyle2">
                    <asp:Label ID="lblDesigner" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Severity</td>
                <td class="newStyle2">
                    <asp:Label ID="lblSeverity" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Task Title</td>
                <td class="auto-style4">
                    <asp:Label ID="lblSummary" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Task</td>
               <td  style="text-align: left;" class="newStyle2" >
                    <telerik:RadEditor ID="RadEditor1" Runat="server" Skin="WebBlue" Height="200px">
                            <Tools>
        <telerik:EditorToolGroup>
            <telerik:EditorTool Name="Cut"/>
            <telerik:EditorTool Name="Copy"/>
            <telerik:EditorTool Name="Paste"/>
        </telerik:EditorToolGroup>
    </Tools>

                    </telerik:RadEditor>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">Comments/Notes</td>
               <td  style="text-align: left;" class="newStyle2" >
                    <telerik:RadEditor ID="RadEditor2" Runat="server" EmptyMessage="Enter notes and comments" Skin="Black">
                    </telerik:RadEditor>
                </td>
            </tr>
            <tr class="newStyle9">
                <td class="newStyle8" >
        <asp:Button ID="Button1" runat="server" BackColor="#CC0000" Font-Bold="True" Font-Size="Large" ForeColor="White" Text="Mark Complete" />
                </td>
                <td "></td>
            </tr>
        </table>
        </form>
    </body>
    </html>
