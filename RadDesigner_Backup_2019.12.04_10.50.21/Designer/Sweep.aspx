<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Sweep.aspx.vb" Inherits="RadDesigner.Sweep" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
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
    <asp:Label ID="lblTitle" runat="server" Text="Label" Font-Size="X-Large" Font-Bold="True" Font-Names="Arial"></asp:Label><br />
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowFilteringByColumn="True" AllowSorting="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="Sweep_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Sweep_ID" DataType="System.Int32" FilterControlAltText="Filter Sweep_ID column" HeaderText="Sweep_ID" ReadOnly="True" SortExpression="Sweep_ID" UniqueName="Sweep_ID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Designer" FilterControlAltText="Filter Designer column" HeaderText="Designer" SortExpression="Designer" UniqueName="Designer" Visible="false">
                        </telerik:GridBoundColumn>

            <telerik:GridDateTimeColumn  DataField="SweepCreated" HeaderText="SweepCreated" SortExpression="SweepCreated" UniqueName="SweepCreated"  DataFormatString="{0:d}">
            </telerik:GridDateTimeColumn>


            <telerik:GridDateTimeColumn  DataField="SweepStart" HeaderText="SweepStart" SortExpression="SweepStart" UniqueName="SweepStart"  DataFormatString="{0:d}">
            </telerik:GridDateTimeColumn>


                        <telerik:GridBoundColumn DataField="SweepStatus" FilterControlAltText="Filter SweepStatus column" HeaderText="SweepStatus" SortExpression="SweepStatus" UniqueName="SweepStatus">
                        </telerik:GridBoundColumn>

            <telerik:GridDateTimeColumn  DataField="SweepComplete" HeaderText="SweepComplete" SortExpression="SweepComplete" UniqueName="SweepComplete"  DataFormatString="{0:d}">
            </telerik:GridDateTimeColumn>


                    <telerik:GridTemplateColumn HeaderText="Mark for Copy" UniqueName="ImageName" SortExpression="CopyMark"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("CopyMark") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="CopyComplete" UniqueName="ImageName1" SortExpression="CopyComplete"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("CopyComplete") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                        
                        <telerik:GridHyperLinkColumn DataTextField="Sweep_ID" HeaderText="Go To Sweep" UniqueName="Link" DataNavigateUrlFields="Sweep_ID" DataNavigateUrlFormatString="SweepReviewForm.aspx?ID={0}" AllowFiltering="false" Text="Details" DataTextFormatString="<b>Go to Sweep</b>" >
                    </telerik:GridHyperLinkColumn>

                    </Columns>
                </MasterTableView>
                  <GroupingSettings CaseSensitive="false" />
            </telerik:RadGrid>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Sweep_ID], [MasterName], [Designer], [SweepCreated], [SweepStart], [SweepStatus], [SweepComplete], [CopyMark], [CopyComplete] FROM [OL_MasterSweep] WHERE (([Designer_ID] = @Designer_ID) AND ([Term] = @Term)) ORDER BY [MasterName]">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="Designer_ID" SessionField="User_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="2193" Name="Term" SessionField="NextTerm" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    </body>
</html>