<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MyProgress.aspx.vb" Inherits="RadDesigner.MyProgress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

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
    
        <h2>My Overall Progress for Term
            <asp:Label ID="lblTerm" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </h2>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowFilteringByColumn="True" AllowSorting="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Term" DataType="System.Int32" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term" Visible="false">
                    </telerik:GridBoundColumn>

                     <telerik:GridTemplateColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText=" # Sections" SortExpression="Course"  AllowFiltering="false" UniqueName="Sections">
                        <ItemTemplate>
                            <asp:Label ID="nosectionsLabel" runat="server" Text='<%# getcount(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate>

                     </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText=" # Open" SortExpression="Course"  AllowFiltering="false" UniqueName="Sections">
                        <ItemTemplate>
                            <asp:Label ID="nosectionsLabel" runat="server" Text='<%# getActivecount(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate>

                     </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="Status" UniqueName="Status">
                    </telerik:GridBoundColumn>
                      <telerik:GridTemplateColumn HeaderText="Top_20_CRS" UniqueName="Top_20_CRS2" SortExpression="Top_20_CRS"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("Top_20_CRS") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>


                        <telerik:GridDateTimeColumn  DataField="AuditComplete" HeaderText="AuditComplete"  UniqueName="AuditComplete"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>

 
                        <telerik:GridDateTimeColumn  DataField="SweepComplete" HeaderText="SweepComplete"  UniqueName="SweepComplete"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>

 
                        <telerik:GridDateTimeColumn  DataField="CopyDate" HeaderText="CopyDate"  UniqueName="CopyDate"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>


                        <telerik:GridDateTimeColumn  DataField="Daterelease" HeaderText="DateRelease"  UniqueName="Daterelease"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>

                    <telerik:GridBoundColumn DataField="Instructional_Designer" FilterControlAltText="Filter Instructional_Designer column" HeaderText="Instructional_Designer" SortExpression="Instructional_Designer" UniqueName="Instructional_Designer" Visible="false">
                    </telerik:GridBoundColumn>




                </Columns>
            </MasterTableView>
            <GroupingSettings CaseSensitive="false" />
        </telerik:RadGrid>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT OL_MasterCourse.MasterName, OL_MasterCourse.Term, OL_MasterCourse.Status, OL_MasterCourse.Course, OL_MasterCourse.Top_20_CRS, OL_MasterAudit.AuditComplete, OL_MasterSweep.SweepComplete, OL_MasterRelease.Daterelease, OL_MasterRelease.isReleased, OL_MasterCourse.Instructional_Designer, OL_MasterSweep.CopyDate FROM OL_MasterCourse LEFT OUTER JOIN OL_MasterRelease ON OL_MasterCourse.MasterName = OL_MasterRelease.MasterName LEFT OUTER JOIN OL_MasterSweep ON OL_MasterCourse.MasterName = OL_MasterSweep.MasterName LEFT OUTER JOIN OL_MasterAudit ON OL_MasterCourse.MasterName = OL_MasterAudit.MasterName WHERE (OL_MasterCourse.Term = @Term) AND (OL_MasterCourse.ID_ID = @Designer_ID) ORDER BY OL_MasterCourse.Status,OL_MasterCourse.MasterName">
                    <SelectParameters>
                <asp:SessionParameter DefaultValue="2197" Name="Term" SessionField="NextTerm" Type="Int32" />
                <asp:SessionParameter DefaultValue="194" Name="Designer_ID" SessionField="User_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    <p>
        NOtE: make this editable so status can be changed to inactive and display can show all or active.</p>
</body>
</html>
