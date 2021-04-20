<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProgressReport.aspx.vb" Inherits="RadDesigner.ProgressReport1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
           <script "javascript">
var popupWindow = null;
function centeredPopup(url,winName,w,h,scroll){
LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
settings =
'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
popupWindow = window.open(url,winName,settings)
}
</script>
    <style type="text/css">
        .auto-style2 {
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
            color: #990033;
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
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT OL_MasterCourse.MasterName, OL_MasterCourse.Developer_SME, OL_MasterCourse.Instructional_Designer, OL_MasterCourse.Phase, OL_MasterAudit.AuditComplete, OL_MasterSweep.SweepComplete, OL_MasterRelease.Datecreated, OL_MasterRelease.Daterelease, OL_MasterCourse.Course FROM OL_MasterCourse LEFT OUTER JOIN OL_MasterRelease ON OL_MasterCourse.MasterName = OL_MasterRelease.MasterName LEFT OUTER JOIN OL_MasterSweep ON OL_MasterCourse.MasterName = OL_MasterSweep.MasterName LEFT OUTER JOIN OL_MasterAudit ON OL_MasterCourse.MasterName = OL_MasterAudit.MasterName WHERE (OL_MasterCourse.Term = @Term) AND (OL_MasterCourse.Status = 'Active') AND (OL_MasterAudit.isPrimary = 1)
ORDER BY OL_MasterCourse.Course" DeleteCommand="DELETE FROM [Workflow] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Workflow] ([CourseID], [Instructional_Designer], [Textbook], [Exam], [Audit], [Sweep], [Copy], [Release]) VALUES (@CourseID, @Instructional_Designer, @Textbook, @Exam, @Audit, @Sweep, @Copy, @Release)" UpdateCommand="UPDATE [Workflow] SET [CourseID] = @CourseID, [Instructional_Designer] = @Instructional_Designer,  [CourseInit] = @CourseInit,, [Textbook] = @Textbook, [Exam] = @Exam, [Audit] = @Audit, [Sweep] = @Sweep, [Copy] = @Copy, [Release] = @Release WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CourseID" Type="String" />
            <asp:Parameter Name="Instructional_Designer" Type="String" />
            <asp:Parameter Name="Textbook" Type="Boolean" />
            <asp:Parameter Name="Exam" Type="Boolean" />
            <asp:Parameter Name="Audit" Type="Boolean" />
            <asp:Parameter Name="Sweep" Type="Boolean" />
            <asp:Parameter Name="Copy" Type="Boolean" />
            <asp:Parameter Name="Release" Type="Boolean" />
        </InsertParameters>
          <SelectParameters>
              <asp:SessionParameter DefaultValue="2195" Name="Term" SessionField="NextTerm" />
          </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseID" Type="String" />
            <asp:Parameter Name="Instructional_Designer" Type="String" />
            <asp:Parameter Name="CourseInit" />
            <asp:Parameter Name="Textbook" Type="Boolean" />
            <asp:Parameter Name="Exam" Type="Boolean" />
            <asp:Parameter Name="Audit" Type="Boolean" />
            <asp:Parameter Name="Sweep" Type="Boolean" />
            <asp:Parameter Name="Copy" Type="Boolean" />
            <asp:Parameter Name="Release" Type="Boolean" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <span class="auto-style2"><strong>Copy Progress for Term
        </strong></span><strong>
        <asp:Label ID="lblTerm" runat="server" CssClass="auto-style2"></asp:Label>
        &nbsp;
        </strong>
        <asp:Button ID="Button1" runat="server" BorderColor="#CC0000" BorderWidth="2px" Text="Close Window" BackColor="Yellow" />
        &nbsp;
        <asp:Button ID="btnAllSections" runat="server" Text="All Sections" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnOpenSections" runat="server" Text="Open Sections" />
&nbsp;
        <asp:Label ID="lblSectionStatus" runat="server" Font-Names="Arial" Text="Section Count = All CMR sections not cancelled"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblSelect" runat="server" Text="All" Visible="False"></asp:Label>
&nbsp;<telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True" DataSourceID="SqlDataSource1" ShowGroupPanel="True" Skin="WebBlue" AutoGenerateHierarchy="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" Font-Bold="True" Font-Names="Arial"  OnItemDataBound="RadGrid1_ItemDataBound">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings ExportOnlyData="True">
        </ExportSettings>
        <ClientSettings AllowDragToGroup="True">
        </ClientSettings>
        <MasterTableView DataSourceID="SqlDataSource1"  EnableGroupsExpandAll="true"  CommandItemDisplay="Top" HierarchyDefaultExpanded="false" GroupsDefaultExpanded="False">
             <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
            <Columns>

                <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="Row" AllowFiltering="false">
                         <ItemTemplate>
                           <asp:Label ID="numberLabel" runat="server" Width="90px" />
                     </ItemTemplate>
                         <HeaderStyle Width="40px" />
                 </telerik:GridTemplateColumn>



                <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Developer_SME" FilterControlAltText="Filter Developer_SME column" HeaderText="Developer_SME" SortExpression="Developer_SME" UniqueName="Developer_SME">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Instructional_Designer" FilterControlAltText="Filter Instructional_Designer column" HeaderText="Instructional_Designer" SortExpression="Instructional_Designer" UniqueName="Instructional_Designer">
                </telerik:GridBoundColumn>


                <telerik:GridTemplateColumn DataField="Phase" FilterControlAltText="Filter Phase column" HeaderText="Phase" SortExpression="Phase" UniqueName="Phase">
                        <ItemTemplate>
                            <asp:Label ID="Instructor_LastNameLabel" runat="server" Text='<%# getphase(Eval("MasterName"))%>'></asp:Label>
                        </ItemTemplate></telerik:GridTemplateColumn>

      
    
                             <telerik:GridTemplateColumn AllowFiltering="false" DataField="Phase" FilterControlAltText="Filter Phase column" HeaderText="Phase History" ReadOnly="true" SortExpression="Phase" UniqueName="alertflag">
                             <ItemTemplate>
                            <asp:Label ID="alertLink" runat="server" Text='<%# getPopUp(Eval("MasterName"))%>'></asp:Label>
                            </ItemTemplate>
                            
                    </telerik:GridTemplateColumn>


                <telerik:GridDateTimeColumn  DataField="AuditComplete" HeaderText="AuditComplete"  UniqueName="AuditComplete"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>

                <telerik:GridDateTimeColumn  DataField="SweepComplete" HeaderText="SweepComplete"  UniqueName="SweepComplete"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>


                <telerik:GridDateTimeColumn  DataField="Datecreated" HeaderText="NewMasterCopied"  UniqueName="Datecreated"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>


                <telerik:GridDateTimeColumn  DataField="Daterelease" HeaderText="Date Released"  UniqueName="Daterelease"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>
                                <telerik:GridTemplateColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Sections" SortExpression="Course"  AllowFiltering="false" UniqueName="Sections">
                        <ItemTemplate>
                            <asp:Label ID="nosectionsLabel" runat="server" Text='<%# getcount(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate></telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="InBB" SortExpression="Course" AllowSorting="False"  AllowFiltering="false" UniqueName="Sections">
                        <ItemTemplate>
                            <asp:Label ID="inBBLabel" runat="server" Text='<%# getBB(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate></telerik:GridTemplateColumn>
            </Columns>
        </MasterTableView>
          <GroupingSettings CaseSensitive="false" />
    </telerik:RadGrid>
    </form>
</body>
</html>
