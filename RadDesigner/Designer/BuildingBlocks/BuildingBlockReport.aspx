<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BuildingBlockReport.aspx.vb" Inherits="RadDesigner.BuildingBlockReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

body {
    font-family: Arial, Helvetica, sans-serif;
}

        .auto-style1 {
            text-align: left;
        }

        .auto-style2 {
            color: #0099FF;
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
        <h3 class="auto-style1">
            <asp:Label ID="lblPageTitle" runat="server"></asp:Label>
        </h3>
        <div class="auto-style1">
&nbsp;To <strong>Add/Delete Existing Building Blocks</strong> --&gt;.<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" BackColor="#A6E2FF" DataTextField="Publisher" DataValueField="Pub_ID" Font-Bold="True">
        </asp:DropDownList>
        &nbsp; ||&nbsp;
            <asp:Button ID="btnAddPub" runat="server" BackColor="#DFDFDF" Font-Bold="True" Text="Add New Publisher/New Blocks" BorderColor="#0066CC" BorderWidth="3px" />
            <br />
        <br />

        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" Skin="WebBlue" ShowGroupPanel="True" GridLines="Both" CellPadding="0" Font-Size="Small" Width="800px" HorizontalAlign="Left">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <AlternatingItemStyle Font-Size="Small" />
            <GroupHeaderItemStyle ForeColor="Black" />
            <MasterTableView DataSourceID="SqlDataSource1" AllowNaturalSort="False">
      <GroupByExpressions>
      <telerik:GridGroupByExpression>
                  <SelectFields>
          <telerik:GridGroupByField FieldName="Publisher" HeaderText="Publisher" />
        </SelectFields>

        <GroupByFields>
          <telerik:GridGroupByField FieldName="Publisher" SortOrder ="Ascending"  />
        </GroupByFields>
      </telerik:GridGroupByExpression>
    </GroupByExpressions>

                <Columns>
                    <telerik:GridBoundColumn DataField="Obj_ID" DataType="System.Int32" FilterControlAltText="Filter Obj_ID column" HeaderText="Obj_ID" ReadOnly="True" SortExpression="Obj_ID" UniqueName="Obj_ID"  Visible="false">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="Publisher" FilterControlAltText="Filter Publisher column" HeaderText="Publisher" SortExpression="Publisher" UniqueName="Publisher" AllowSorting="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BBName" FilterControlAltText="Filter BBName column" HeaderText="Building Block" SortExpression="BBName" UniqueName="BBName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Pub_ID" DataType="System.Int32" FilterControlAltText="Filter Pub_ID column" HeaderText="Pub_ID" ReadOnly="True" SortExpression="Pub_ID" UniqueName="Pub_ID"  Visible="false">
                    </telerik:GridBoundColumn>

                </Columns>
            </MasterTableView>
            <ItemStyle Font-Size="Small" />
        </telerik:RadGrid>
 
            <br />
 
        <br />
    
        </div>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT OL_BBlock_Objects.Obj_ID, OL_BBlock_Objects.BBName, OL_BBlock_Publisher.Pub_ID, OL_BBlock_Publisher.Publisher FROM OL_BBlock_Data LEFT OUTER JOIN OL_BBlock_Objects ON OL_BBlock_Data.Obj_ID = OL_BBlock_Objects.Obj_ID LEFT OUTER JOIN OL_BBlock_Publisher ON OL_BBlock_Data.Pub_ID = OL_BBlock_Publisher.Pub_ID WHERE (OL_BBlock_Data.MasterName = @MasterName) order by OL_BBlock_Publisher.Publisher asc">
                         <SelectParameters>
                <asp:SessionParameter DefaultValue="2193_AMH2010_MC_VC" Name="MasterName" SessionField="MasterCourse" Type="String" />
            </SelectParameters>

        </asp:SqlDataSource>
        <div class="auto-style1">
            <br />
        </div>
    
        <p>
        <asp:Label ID="lblMyarray" runat="server"></asp:Label>
    
            <strong>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblStatus" runat="server" CssClass="auto-style2" ForeColor="Red" Text="..."></asp:Label>
&nbsp;
        <asp:Button ID="btnVerify" runat="server" BackColor="#00FF99" Text="Verify Building Blocks For This Master" Visible="False" />
            </strong>
        </p>
    
    </form>
</body>
</html>
