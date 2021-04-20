<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MasterAuditReport.aspx.vb" Inherits="RadDesigner.MasterAuditReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">
        div.RadGrid
        {
            margin-left: auto !important;
            margin-right: auto !important;
        }
            .auto-style1 {
                text-align: left;
            }
            .auto-style2 {
                text-align: center;
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
    <div class="auto-style2">
    
     
            <strong>
    
     
            <asp:Label ID="lblProgress" runat="server" CssClass="auto-style1" style="font-size: x-large; font-family: Arial, Helvetica, sans-serif;"></asp:Label>
  
            &nbsp;&nbsp;&nbsp;
              
            <asp:Button ID="Button1" runat="server" BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="2px" Text="Close Window" />
              
            <br />
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowFilteringByColumn="True" AllowSorting="True" Font-Names="Arial" Font-Size="Small" GroupPanel-Enabled="true"  ShowGroupPanel="True" Width="1000px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings AllowDragToGroup="True">
                </ClientSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="Audit_ID" DataSourceID="SqlDataSource1" GroupsDefaultExpanded="False"  EnableGroupsExpandAll="true" >
                    <Columns>
                        <telerik:GridBoundColumn DataField="Audit_ID" DataType="System.Int32" FilterControlAltText="Filter Audit_ID column" HeaderText="Audit_ID" ReadOnly="True" SortExpression="Audit_ID" UniqueName="Audit_ID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Auditor" FilterControlAltText="Filter Auditor column" HeaderText="Auditor" SortExpression="Auditor" UniqueName="Auditor">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="AuditCreated" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="AuditCreated" AllowFiltering = "False"></telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="AuditStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="AuditStart" AllowFiltering = "False"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="AuditStatus" FilterControlAltText="Filter AuditStatus column" HeaderText="AuditStatus" SortExpression="AuditStatus" UniqueName="AuditStatus">
                        </telerik:GridBoundColumn>


                    </Columns>
                </MasterTableView>
                     <GroupingSettings CaseSensitive="false" />
            </telerik:RadGrid>
  
            </strong>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Audit_ID], [MasterName], [Auditor], [AuditCreated], [AuditStart], [AuditStatus], [AuditComplete] FROM [OL_MasterAudit] WHERE  ([Term] = @Term) ORDER BY [MasterName]" DeleteCommand="DELETE FROM [OL_MasterAudit] WHERE [Audit_ID] = @Audit_ID" InsertCommand="INSERT INTO [OL_MasterAudit] ([MasterName], [Auditor], [AuditCreated], [AuditStart], [AuditStatus], [AuditComplete]) VALUES (@MasterName, @Auditor, @AuditCreated, @AuditStart, @AuditStatus, @AuditComplete)" UpdateCommand="UPDATE [OL_MasterAudit] SET [MasterName] = @MasterName, [Auditor] = @Auditor, [AuditCreated] = @AuditCreated, [AuditStart] = @AuditStart, [AuditStatus] = @AuditStatus, [AuditComplete] = @AuditComplete WHERE [Audit_ID] = @Audit_ID">
            <DeleteParameters>
                <asp:Parameter Name="Audit_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MasterName" Type="String" />
                <asp:Parameter Name="Auditor" Type="String" />
                <asp:Parameter DbType="Date" Name="AuditCreated" />
                <asp:Parameter DbType="Date" Name="AuditStart" />
                <asp:Parameter Name="AuditStatus" Type="String" />
                <asp:Parameter DbType="Date" Name="AuditComplete" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="2193" Name="Term" SessionField="NextTerm" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MasterName" Type="String" />
                <asp:Parameter Name="Auditor" Type="String" />
                <asp:Parameter DbType="Date" Name="AuditCreated" />
                <asp:Parameter DbType="Date" Name="AuditStart" />
                <asp:Parameter Name="AuditStatus" Type="String" />
                <asp:Parameter DbType="Date" Name="AuditComplete" />
                <asp:Parameter Name="Audit_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
