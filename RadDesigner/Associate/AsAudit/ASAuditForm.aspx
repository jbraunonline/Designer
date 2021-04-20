<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ASAuditForm.aspx.vb" Inherits="RadDesigner.ASAuditForm" %>

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
<telerik:RadStyleSheetManager ID="RadStyleSheetManager2" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadAjaxManager ID="RadAjaxManager2" runat="server">
        </telerik:RadAjaxManager>

        ;<asp:Button ID="btnReturn" runat="server" BackColor="#336699" Font-Bold="True" Font-Names="Arial" ForeColor="White" Text="Return to Audit List" Visible="False" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblMaster" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"></asp:Label>
<telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="Office2010Black" SelectedIndex="0" Width="1000px">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Course Info"  Visible="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Main Menu" visible="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Learning Modules" Visible="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Proctored Exams" Visible="True" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Course Management" Visible="True" Selected="True" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Audit Status" Visible="True" >
            </telerik:RadTab>                       
                         

                        
                                </Tabs>
        </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1400px" Height="1000px"
                ContentUrl="AsAuditForm/AsCourse.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1400px" Height="900px"
                ContentUrl="AsAuditForm/AsMenu.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" Width="1400px" Height="900px"
                ContentUrl="AsAuditForm/AsModules.aspx">
        </telerik:RadPageView>
         <telerik:RadPageView ID="RadPageView4" runat="server" Width="1400px" Height="900px"
                ContentUrl="AsAuditForm/AsProctor.aspx">
        </telerik:RadPageView>
               <telerik:RadPageView ID="RadPageView5" runat="server" Width="1400px" Height="900px"
                 ContentUrl="AsAuditForm/AsManagement.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView6" runat="server" Width="1400px" Height="900px"
                ContentUrl="AsAuditForm/AsStatus.aspx">
        </telerik:RadPageView>






    </telerik:RadMultiPage>
 
 
    </form>
    <h1>&nbsp;</h1>
</body>
</html>

