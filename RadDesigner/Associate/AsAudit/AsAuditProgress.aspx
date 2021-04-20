<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AsAuditProgress.aspx.vb" Inherits="RadDesigner.As_AuditProgress" %>

<!<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
        }
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
    <div class="auto-style1">
    
        <strong>My Audit Assignments</strong></div>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" CellSpacing="-1" GridLines="Both" AllowFilteringByColumn="True" AllowSorting="True" Width="1200px" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Audit_ID">
                <Columns>
                     <telerik:GridBoundColumn DataField="Audit_ID" DataType="System.Int32" FilterControlAltText="Filter Audit_ID column" HeaderText="Audit_ID" ReadOnly="True" SortExpression="Audit_ID" UniqueName="Audit_ID" Visible ="false" >
                         </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName" HeaderStyle-Width="150">
                     <HeaderStyle Width="100px" /> 
                    </telerik:GridBoundColumn>

                       <telerik:GridTemplateColumn DataField="Course"  HeaderText="Top 20" AllowFiltering="false" AllowSorting="false" HeaderStyle-Width="100">
                        <ItemTemplate>
                            <img src='<%# IsTop(Eval("Course")) %>' alt='No''>
                        </ItemTemplate>
     </telerik:GridTemplateColumn>

            <telerik:GridDateTimeColumn  DataField="AuditCreated" HeaderText="Created" SortExpression="AuditCreated" UniqueName="AuditCreated"  DataFormatString="{0:d}" AllowFiltering="false">
            <HeaderStyle Width="100px" /> 
                 </telerik:GridDateTimeColumn>

                     <telerik:GridBoundColumn DataField="AuditStatus" FilterControlAltText="Filter AuditStatus column" HeaderText="AuditStatus" SortExpression="AuditStatus" UniqueName="AuditStatus" HeaderStyle-Width="150">
                     <HeaderStyle Width="100px" /> 
                    </telerik:GridBoundColumn>
                          <telerik:GridHyperLinkColumn DataTextField="Audit_ID" HeaderText="Do Audit" UniqueName="Link" DataNavigateUrlFields="Audit_ID"   DataNavigateUrlFormatString ="AsAuditSession.aspx?ID={0}" Text="Details" DataTextFormatString="<b>Go to Audit</b>" AllowFiltering="false">
                     <HeaderStyle Width="150px" /> 
                      </telerik:GridHyperLinkColumn>                                    
                    <telerik:GridBoundColumn DataField="Term" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term" DataType="System.Int32" visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Designer" FilterControlAltText="Filter Designer column" HeaderText="Designer" SortExpression="Designer" UniqueName="Designer" FilterControlWidth="150" HeaderStyle-Width="200" Resizable="False" ItemStyle-Width="150">
                    <HeaderStyle Width="200px" /> 
                         </telerik:GridBoundColumn>

            <telerik:GridDateTimeColumn  DataField="AuditStart" HeaderText="AuditStart" SortExpression="AuditStart" UniqueName="AuditStart"  DataFormatString="{0:d}" AllowFiltering="false">
             <HeaderStyle Width="100px" /> 
            </telerik:GridDateTimeColumn>




            <telerik:GridDateTimeColumn  DataField="AuditComplete" HeaderText="AuditComplete" SortExpression="AuditComplete" UniqueName="AuditComplete"  DataFormatString="{0:d}" AllowFiltering="false">
            <HeaderStyle Width="100px" /> 
                 </telerik:GridDateTimeColumn>


                    
                </Columns>
            </MasterTableView>
            <GroupingSettings CaseSensitive="false" />
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [MasterName], [Course], [Term], [Designer], [AuditCreated], [AuditStart], [AuditStatus], [AuditComplete], [Audit_ID] FROM [OL_MasterAudit] WHERE (([Term] = @Term) AND ([Auditor_ID] = @Auditor_ID))  Order By AuditStatus desc, mastername" >
            <SelectParameters>
                <asp:SessionParameter DefaultValue="2213" Name="Term" SessionField="NextTerm" Type="Int32" />
                <asp:SessionParameter DefaultValue="183" Name="Auditor_ID" SessionField="User_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>


