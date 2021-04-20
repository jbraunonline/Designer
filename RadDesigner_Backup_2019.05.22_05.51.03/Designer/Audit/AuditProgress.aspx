<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AuditProgress.aspx.vb" Inherits="RadDesigner.AuditProogress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
<style>

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
    
     
            <strong>
    
     
            <asp:Label ID="lblProgress" runat="server" CssClass="auto-style1" style="font-size: x-large; font-family: Arial, Helvetica, sans-serif;"></asp:Label>
  
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Create New Audit" />
  
            <br />
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowFilteringByColumn="True" AllowSorting="True" Font-Names="Arial" Font-Size="Small">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="Audit_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Audit_ID" DataType="System.Int32" FilterControlAltText="Filter Audit_ID column" HeaderText="Audit_ID" ReadOnly="True" SortExpression="Audit_ID" UniqueName="Audit_ID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                        </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn HeaderText="IsPrimary" UniqueName="IsPrimary" AllowSorting="false"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='../../images/<%# Eval("IsPrimary") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="Auditor" FilterControlAltText="Filter Auditor column" HeaderText="Auditor" SortExpression="Auditor" UniqueName="Auditor">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="AuditCreated" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="AuditCreated" AllowFiltering = "False"></telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="AuditStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="AuditStart" AllowFiltering = "False"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="AuditStatus" FilterControlAltText="Filter AuditStatus column" HeaderText="AuditStatus" SortExpression="AuditStatus" UniqueName="AuditStatus">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="AuditComplete" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="AuditComplete" AllowFiltering = "False"></telerik:GridBoundColumn>
                        <telerik:GridHyperLinkColumn DataTextField="Audit_ID" HeaderText="Switch Auditor" UniqueName="Link" DataNavigateUrlFields="Audit_ID" DataNavigateUrlFormatString="ReassignAuditor.aspx?ID={0}" Text="Details" DataTextFormatString="ReAssign/Delete" AllowFiltering="false">
</telerik:GridHyperLinkColumn>
                    </Columns>
                </MasterTableView>
                     <GroupingSettings CaseSensitive="false" />
            </telerik:RadGrid>
  
            </strong>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Audit_ID], [MasterName], [Auditor], [AuditCreated], [AuditStart], [AuditStatus], [AuditComplete], [isPrimary] FROM [OL_MasterAudit] WHERE (([Designer_ID] = @Designer_ID) AND ([Term] = @Term)) ORDER BY [MasterName]" DeleteCommand="DELETE FROM [OL_MasterAudit] WHERE [Audit_ID] = @Audit_ID" InsertCommand="INSERT INTO [OL_MasterAudit] ([MasterName], [Auditor], [AuditCreated], [AuditStart], [AuditStatus], [AuditComplete], [isPrimary]) VALUES (@MasterName, @Auditor, @AuditCreated, @AuditStart, @AuditStatus, @AuditComplete, @isPrimary)" UpdateCommand="UPDATE [OL_MasterAudit] SET [MasterName] = @MasterName, [Auditor] = @Auditor, [AuditCreated] = @AuditCreated, [AuditStart] = @AuditStart, [AuditStatus] = @AuditStatus, [AuditComplete] = @AuditComplete, [isPrimary] = @isPrimary WHERE [Audit_ID] = @Audit_ID">
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
                <asp:Parameter Name="isPrimary" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="Designer_ID" SessionField="User_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="2185" Name="Term" SessionField="NextTerm" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MasterName" Type="String" />
                <asp:Parameter Name="Auditor" Type="String" />
                <asp:Parameter DbType="Date" Name="AuditCreated" />
                <asp:Parameter DbType="Date" Name="AuditStart" />
                <asp:Parameter Name="AuditStatus" Type="String" />
                <asp:Parameter DbType="Date" Name="AuditComplete" />
                <asp:Parameter Name="isPrimary" Type="Boolean" />
                <asp:Parameter Name="Audit_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </form>
        </body>
    </html>
