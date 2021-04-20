<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AuditReview.aspx.vb" Inherits="RadDesigner.AuditReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
     body{
    margin-top: 0px; 
    margin-bottom: 0px; 
    margin-left: 0px; 
    margin-right: 0px;
    font-family: Arial, Helvetica, sans-serif;
}
        .auto-style1 {
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" EnableStyleSheetCombine="False">
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
    
     
            <asp:Label ID="lblProgress" runat="server" CssClass="auto-style1"></asp:Label>
  
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnRefresh" runat="server" BackColor="#CCFFCC" Font-Size="XX-Small" Text="Refresh Data After Preview" Visible="False" />
  
            <br />
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowFilteringByColumn="True" AllowSorting="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="Audit_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Audit_ID" DataType="System.Int32" FilterControlAltText="Filter Audit_ID column" HeaderText="Audit_ID" ReadOnly="True" SortExpression="Audit_ID" UniqueName="Audit_ID" Visible="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Auditor" FilterControlAltText="Filter Auditor column" HeaderText="Auditor" SortExpression="Auditor" UniqueName="Auditor">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AuditCreated" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="Audit Created"  AllowFiltering="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AuditStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="Audit Start" AllowFiltering="false" ></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AuditStatus" FilterControlAltText="Filter AuditStatus column" HeaderText="AuditStatus" SortExpression="AuditStatus" UniqueName="AuditStatus">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="AuditComplete" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="Audit Complete"  AllowFiltering="false"></telerik:GridBoundColumn>




                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
  
            </strong>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Audit_ID], [MasterName], [Auditor], [AuditCreated], [AuditStart], [AuditStatus], [AuditComplete] FROM [OL_MasterAudit] WHERE (([Designer_ID] = @Designer_ID) AND ([Term] = @Term))">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="Designer_ID" SessionField="User_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="2185" Name="Term" SessionField="NextTerm" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </form>
        </body>
    </html>