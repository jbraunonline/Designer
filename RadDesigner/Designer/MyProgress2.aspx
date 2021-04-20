<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MyProgress2.aspx.vb" Inherits="RadDesigner.MyProgress2" %>

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
    
        <h2>Top 20 Courses&nbsp;
            <asp:Button ID="btnPreview" runat="server" BackColor="#D5EAFF" Text="Next Term FORCAST of Sections" Font-Bold="True" />
        </h2>
    
    </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowSorting="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Master_ID">
                <Columns>
                    <telerik:GridBoundColumn DataField="Master_ID" FilterControlAltText="Filter Master_ID column" HeaderText="Master_ID" SortExpression="Master_ID" UniqueName="Master_ID" DataType="System.Int32" ReadOnly="True" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ID_ID" FilterControlAltText="Filter ID_ID column" HeaderText="ID_ID" SortExpression="ID_ID" UniqueName="ID_ID" DataType="System.Int32" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName" Visible="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term" DataType="System.Int32" Visible="false">
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="Status" UniqueName="Status">
                    </telerik:GridBoundColumn>

                      <telerik:GridTemplateColumn HeaderText="Top_20_CRS" UniqueName="Top_20_CRS2" SortExpression="Top_20_CRS"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("Top_20_CRS") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>



                    <telerik:GridBoundColumn DataField="Instructional_Designer" FilterControlAltText="Filter Instructional_Designer column" HeaderText="Instructional_Designer" SortExpression="Instructional_Designer" UniqueName="Instructional_Designer">
                    </telerik:GridBoundColumn>

                        <telerik:GridDateTimeColumn  DataField="AuditComplete" HeaderText="AuditComplete"  UniqueName="AuditComplete"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>

 
                        <telerik:GridDateTimeColumn  DataField="SweepComplete" HeaderText="SweepComplete"  UniqueName="SweepComplete"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>

 
                        <telerik:GridDateTimeColumn  DataField="CopyDate" HeaderText="CopyDate"  UniqueName="CopyDate"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>


                        <telerik:GridDateTimeColumn  DataField="Daterelease" HeaderText="DateRelease"  UniqueName="Daterelease"  DataFormatString="{0:d}" AllowFiltering="false"></telerik:GridDateTimeColumn>







                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT     dbo.OL_MasterCourse.Master_ID, dbo.OL_MasterCourse.ID_ID, dbo.OL_MasterCourse.Term, dbo.OL_MasterCourse.Status, dbo.OL_MasterCourse.Top_20_CRS, 
                      dbo.OL_MasterCourse.MasterName, dbo.OL_MasterCourse.Instructional_Designer, dbo.OL_MasterAudit.AuditComplete, dbo.OL_MasterSweep.SweepComplete, 
                      dbo.OL_MasterRelease.Daterelease,dbo.OL_MasterSweep.CopyDate
FROM         dbo.OL_MasterCourse LEFT OUTER JOIN
                      dbo.OL_MasterRelease ON dbo.OL_MasterCourse.MasterName = dbo.OL_MasterRelease.MasterName LEFT OUTER JOIN
                      dbo.OL_MasterSweep ON dbo.OL_MasterCourse.MasterName = dbo.OL_MasterSweep.MasterName LEFT OUTER JOIN
                      dbo.OL_MasterAudit ON dbo.OL_MasterCourse.MasterName = dbo.OL_MasterAudit.MasterName
WHERE     (dbo.OL_MasterCourse.Term = @Term) AND (dbo.OL_MasterCourse.ID_ID = @User_ID) AND (dbo.OL_MasterCourse.Status = 'Pilot') AND (dbo.OL_MasterCourse.Term = 2187) OR
                      (dbo.OL_MasterCourse.Term = @Term) AND (dbo.OL_MasterCourse.ID_ID =@User_ID) AND (dbo.OL_MasterCourse.Top_20_CRS = 1)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="2193" Name="Term" SessionField="NextTerm" Type="Int32" />
                <asp:SessionParameter DefaultValue="194" Name="User_ID" SessionField="User_ID" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <br />
        <br />
           <% =System.IO.Path.GetFileName(Request.Url.AbsolutePath) %>
    </form>
</body>
</html>
