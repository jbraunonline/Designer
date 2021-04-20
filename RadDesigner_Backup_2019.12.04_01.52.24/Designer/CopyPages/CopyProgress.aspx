<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CopyProgress.aspx.vb" Inherits="RadDesigner.CopyProgress" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI.Gantt" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
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
        <span class="auto-style1"><strong>Release New Master to Course Delivery Team</strong></span>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" CellSpacing="-1" GridLines="Both" AllowFilteringByColumn="True" AllowSorting="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Release_ID">
                <Columns>
                    <telerik:GridBoundColumn DataField="Release_ID" DataType="System.Int32" FilterControlAltText="Filter Release_ID column" HeaderText="Release_ID" ReadOnly="True" SortExpression="Release_ID" UniqueName="Release_ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Newmastername" FilterControlAltText="Filter Newmastername column" HeaderText="NEWmastername" SortExpression="Newmastername" UniqueName="Newmastername" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CopySource" FilterControlAltText="Filter CopySource column" HeaderText="CopySource" SortExpression="CopySource" UniqueName="CopySource" AllowFiltering="false">
                    </telerik:GridBoundColumn>

                                <telerik:GridDateTimeColumn  DataField="Datecreated" HeaderText="Datecreated" SortExpression="Datecreated" UniqueName="Datecreated"  DataFormatString="{0:d}" AllowFiltering="false">
            </telerik:GridDateTimeColumn>
                    <telerik:GridBoundColumn DataField="ID_ID" DataType="System.Int32" FilterControlAltText="Filter ID_ID column" HeaderText="ID_ID" SortExpression="ID_ID" UniqueName="ID_ID" Visible="false">
                    </telerik:GridBoundColumn>

                      <telerik:GridTemplateColumn HeaderText="isReleased" UniqueName="isReleased" SortExpression="isReleased"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='../<%# Eval("isReleased") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                                <telerik:GridDateTimeColumn  DataField="DateRelease" HeaderText="Date Rekeased" SortExpression="DateRelease" UniqueName="DateRelease"  DataFormatString="{0:d}" AllowFiltering="false">
            </telerik:GridDateTimeColumn>
                    <telerik:GridHyperLinkColumn DataTextField="Release_ID" HeaderText="Release Form" UniqueName="Link" DataNavigateUrlFields="Release_ID" DataNavigateUrlFormatString="ReleaseForm.aspx?ID={0}" Text="Release" DataTextFormatString="Release" AllowFiltering="false">
</telerik:GridHyperLinkColumn>
                </Columns>
            </MasterTableView>
              <GroupingSettings CaseSensitive="false" />
        </telerik:RadGrid>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Release_ID], [MasterName], [Newmastername], [CopySource], [Datecreated], [Daterelease], [isReleased], [ID_ID] FROM [OL_MasterRelease] WHERE (([ID_ID] = @ID_ID) AND ([Term] = @Term))">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="124" Name="ID_ID" SessionField="User_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="2193" Name="Term" SessionField="NextTerm" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
