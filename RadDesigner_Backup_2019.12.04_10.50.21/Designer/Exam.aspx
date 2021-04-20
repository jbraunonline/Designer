<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Exam.aspx.vb" Inherits="RadDesigner.Exam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
&nbsp;<telerik:RadStyleSheetManager ID="RadStyleSheetManager2" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadAjaxManager ID="RadAjaxManager2" runat="server">
        </telerik:RadAjaxManager>

             <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="Default" Orientation="HorizontalTop" SelectedIndex="0" Width="1200px" Align="Center">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Proctored Exam"  Visible="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="MidTerm Settings" visible="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Final Settings" Visible="True" Selected="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Verify Exams" Visible="True" Selected="True" >
            </telerik:RadTab>
         </Tabs>
        </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1100px" Height="800px"
                ContentUrl="ProctorExam/ProctoredExams.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1100px" Height="800px"
                 ContentUrl="ProctorExam/MidSettings.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" Width="1100px" Height="800px"
                ContentUrl="ProctorExam/FinSettings.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server" Width="1100px" Height="800px"
                ContentUrl="ProctorExam/VerifyExams.aspx">
        </telerik:RadPageView>


    </telerik:RadMultiPage>
 
 
    </form>
    <h1>&nbsp;</h1>
</body>
</html>
