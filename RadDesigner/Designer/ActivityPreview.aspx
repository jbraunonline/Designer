<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ActivityPreview.aspx.vb" Inherits="RadDesigner.ActivityPreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:Label>
&nbsp;&nbsp;
        <asp:Button ID="btnReturn" runat="server" BackColor="#DDEEFF" Text="Return to Top 20 Courses" Font-Bold="True" />

        <telerik:RadSplitter ID="Splitter1" runat="server" Width="1007px" Height="800px">
<telerik:RadPane ID="RadPane1" runat="server">

        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True" Skin="WebBlue" Width="500px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" >
                <Columns>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="thecount"  HeaderText="Scheduled" SortExpression="thecount" UniqueName="thecount" AllowFiltering="false"  AllowSorting="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="Course"  HeaderText="Assigned" SortExpression="Scheduled" UniqueName="TotalSections" AllowFiltering="false"   AllowSorting="false">
                        <ItemTemplate>
                            <asp:Label ID="TotalSections" runat="server" Text='<%# getTotal(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate>
                   </telerik:GridTemplateColumn>

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>


    </telerik:RadPane>
<telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Forward">
</telerik:RadSplitBar>
<telerik:RadPane ID="RadPane2" runat="server">



        <telerik:RadGrid ID="RadGrid2" runat="server" DataSourceID="SqlDataSource3" Width="200px" BorderColor="#C00000" BorderStyle="Solid" BorderWidth="1px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                <Columns>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="NOT Scheduled" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <HeaderStyle BackColor="Red" Font-Bold="True" ForeColor="White" />
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="Select Course from VC_VCData1.dbo.OL_MasterCourse
where ID_ID = @ID_ID and term = @Term
and course not in (select Distinct Course from VC_VCData.dbo.CMR where term =@Term)
Order By Course">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="ID_ID" SessionField="User_ID" />
                <asp:SessionParameter DefaultValue="2197" Name="Term" SessionField="NextTerm" />
            </SelectParameters>
        </asp:SqlDataSource>
    </telerik:RadPane>
</telerik:RadSplitter>
           <% =System.IO.Path.GetFileName(Request.Url.AbsolutePath) %><br />
            <% =System.IO.Path.GetFullPath(Request.Url.LocalPath) %><br />
    </form>
</body>
</html>
