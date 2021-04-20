<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="ProgressReport.aspx.vb" Inherits="RadDesigner.ProgressReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .auto-style2 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-large;
            color: #FF0066;
        }
        auto-style3 {
            font-family: Arial, Helvetica, sans-serif;
             font-size: small;
            color: #FF0066;
        }
            .newStyle1 {
                font-family: Arial, Helvetica, sans-serif;
                font-size: small;
                color: #FF0000;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <span class="auto-style2"><strong>Progress Report <asp:Label ID="lblTerm" runat="server"></asp:Label><br />
&nbsp; </strong></span>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT OL_MasterCourse.MasterName, OL_MasterCourse.Developer_SME, OL_MasterCourse.Instructional_Designer, OL_MasterCourse.Phase, OL_MasterAudit.AuditComplete, OL_MasterSweep.SweepComplete, OL_MasterRelease.Datecreated, OL_MasterRelease.Daterelease FROM OL_MasterCourse LEFT OUTER JOIN OL_MasterRelease ON OL_MasterCourse.MasterName = OL_MasterRelease.MasterName LEFT OUTER JOIN OL_MasterSweep ON OL_MasterCourse.MasterName = OL_MasterSweep.MasterName LEFT OUTER JOIN OL_MasterAudit ON OL_MasterCourse.MasterName = OL_MasterAudit.MasterName WHERE (OL_MasterCourse.Term = @Term) and OL_MasterCourse.Status='Active'
Order by OL_MasterCourse.Course" DeleteCommand="DELETE FROM [Workflow] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Workflow] ([CourseID], [Instructional_Designer], [Textbook], [Exam], [Audit], [Sweep], [Copy], [Release]) VALUES (@CourseID, @Instructional_Designer, @Textbook, @Exam, @Audit, @Sweep, @Copy, @Release)" UpdateCommand="UPDATE [Workflow] SET [CourseID] = @CourseID, [Instructional_Designer] = @Instructional_Designer,  [CourseInit] = @CourseInit,, [Textbook] = @Textbook, [Exam] = @Exam, [Audit] = @Audit, [Sweep] = @Sweep, [Copy] = @Copy, [Release] = @Release WHERE [ID] = @ID">
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
              <asp:SessionParameter DefaultValue="2187" Name="Term" SessionField="NextTerm" />
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
      
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Text], [Value] FROM [DropdownItems] WHERE ([Item] = @Item)">
        <SelectParameters>
            <asp:Parameter DefaultValue="TF" Name="Item" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
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
                <telerik:GridBoundColumn DataField="Phase" FilterControlAltText="Filter Phase column" HeaderText="Phase" SortExpression="Phase" UniqueName="Phase">
                </telerik:GridBoundColumn>

<telerik:GridHyperLinkColumn DataTextField="MasterName" HeaderText="Details" UniqueName="Link" DataNavigateUrlFields="MasterName"  DataNavigateUrlFormatString="PhaseHistory.aspx?ID={0}" Text="Details" DataTextFormatString="history"  AllowFiltering="false"  Target="_blank"  ItemStyle-CssClass="newStyle1">
</telerik:GridHyperLinkColumn>


                <telerik:GridDateTimeColumn  DataField="AuditComplete" HeaderText="AuditComplete"  UniqueName="AuditComplete"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>

                <telerik:GridDateTimeColumn  DataField="SweepComplete" HeaderText="SweepComplete"  UniqueName="SweepComplete"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>


                <telerik:GridDateTimeColumn  DataField="Datecreated" HeaderText="NewMasterCopied"  UniqueName="Datecreated"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>


                <telerik:GridDateTimeColumn  DataField="Daterelease" HeaderText="Date Released"  UniqueName="Daterelease"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>

            </Columns>
        </MasterTableView>
          <GroupingSettings CaseSensitive="false" />
    </telerik:RadGrid>
      <span class="newStyle1">&nbsp;this</span>
</asp:Content>
