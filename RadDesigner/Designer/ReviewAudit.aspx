<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="ReviewAudit.aspx.vb" Inherits="RadDesigner.ReviewAudit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: large;
        }
        .auto-style2 {
            color: #999999;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    
     
            <div class="auto-style3">
    
     
            <strong>
    
     
            <asp:Label ID="lblProgress" runat="server" CssClass="auto-style1" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:Label>
  
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1"><span class="auto-style2">Use Top Menu to Exit Audit Reviews</span> </span>
  
            <br />
            </div>
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowFilteringByColumn="True" AllowSorting="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="Audit_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Audit_ID" DataType="System.Int32" FilterControlAltText="Filter Audit_ID column" HeaderText="Audit_ID" ReadOnly="True" SortExpression="Audit_ID" UniqueName="Audit_ID" Visible ="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                        </telerik:GridBoundColumn>
                         <telerik:GridHyperLinkColumn DataTextField="Audit_ID" HeaderText="Review Audit" UniqueName="Link" AllowFiltering="false" DataNavigateUrlFields="Audit_ID" DataNavigateUrlFormatString="ReleaseAudit.aspx?ID={0}" Text="Details" DataTextFormatString="<b>Go to Audit</b>" >
                    </telerik:GridHyperLinkColumn>
 
                        <telerik:GridCheckBoxColumn DataField="IsPrimary" DataType="System.Boolean" FilterControlAltText="Filter REQ column" HeaderText="Primary Audit" SortExpression="IsPrimary" UniqueName="IsPrimary" AllowFiltering="false">
                    </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="Auditor" FilterControlAltText="Filter Auditor column" HeaderText="Auditor" SortExpression="Auditor" UniqueName="Auditor">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AuditCreated" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" FilterControlAltText="Filter AuditCreated column" HeaderText="AuditCreated"  AllowFiltering="false"></telerik:GridBoundColumn>
       
                            <telerik:GridBoundColumn DataField="AuditStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" FilterControlAltText="Filter AuditStart column" HeaderText="AuditStart"  AllowFiltering="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AuditStatus" FilterControlAltText="Filter AuditStatus column" HeaderText="AuditStatus" SortExpression="AuditStatus" UniqueName="AuditStatus">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="AuditComplete" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" FilterControlAltText="Filter AuditComplete column" HeaderText="AuditComplete" AllowFiltering="false" ></telerik:GridBoundColumn>

  
                           <telerik:GridTemplateColumn HeaderText="IsSweep" UniqueName="IsSweep" SortExpression="IsSweep"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("IsSweep") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
                 <GroupingSettings CaseSensitive="false" />
            </telerik:RadGrid>
  
 
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Audit_ID], [MasterName], [Auditor], [AuditCreated], [AuditStart], [AuditStatus], [AuditComplete], [IsSweep],[IsPrimary] FROM [OL_MasterAudit] WHERE (([Designer_ID] = @Designer_ID) AND ([Term] = @Term)) order by MasterName">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="Designer_ID" SessionField="User_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="2185" Name="Term" SessionField="NextTerm" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>




        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />




        <% =System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath) %>
</asp:Content>
