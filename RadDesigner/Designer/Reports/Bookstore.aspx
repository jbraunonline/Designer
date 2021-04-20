<%@ Page Language="vb" Debug="true" AutoEventWireup="false" CodeBehind="Bookstore.aspx.vb" Inherits="RadDesigner.Bookstore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            font-size: small;
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
    
        <strong>Bookstore Report For Term
        <asp:Label ID="lblTerm" runat="server"></asp:Label>
        &nbsp;&nbsp;
        <asp:Label ID="lblName" runat="server" CssClass="auto-style2"></asp:Label>
        &nbsp; <span class="auto-style3">Select Term </span>
        <asp:DropDownList ID="ddlTerm" runat="server" CausesValidation="True">
            <asp:ListItem Selected="True">2205</asp:ListItem>
            <asp:ListItem>2203</asp:ListItem>
        </asp:DropDownList>
        </strong></div>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" ShowGroupPanel="True" AllowFilteringByColumn="True"  OnItemDataBound="RadGrid1_ItemDataBound" AllowSorting="True" AutoGenerateColumns="False" Skin="WebBlue" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ExportSettings>
                <Excel Format="Xlsx" />
            </ExportSettings>
            <ClientSettings AllowDragToGroup="True">
            </ClientSettings>
            <MasterTableView DataSourceID="SqlDataSource1"   CommandItemDisplay="Top" >
                 <CommandItemSettings ShowExportToExcelButton="false" ShowAddNewRecordButton="false" ShowExportToCsvButton="true" ShowRefreshButton="true" />
                <Columns>
              <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="#" AllowFiltering="false">
                <ItemTemplate>
                    <asp:Label ID="numberLabel" runat="server" Width="40px" />
                </ItemTemplate>
                <HeaderStyle Width="80px" />
                  </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterCourse" FilterControlAltText="Filter MasterCourse column" HeaderText="MasterCourse" SortExpression="MasterCourse" UniqueName="MasterCourse" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="REQ" DataType="System.Boolean" FilterControlAltText="Filter REQ column" HeaderText="REQ" SortExpression="REQ" UniqueName="REQ" AllowFiltering="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="SUP" DataType="System.Boolean" FilterControlAltText="Filter SUP column" HeaderText="SUP" SortExpression="SUP" UniqueName="SUP"  AllowFiltering="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="ALT" DataType="System.Boolean" FilterControlAltText="Filter ALT column" HeaderText="ALT" SortExpression="ALT" UniqueName="ALT" AllowFiltering="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="Text_Title" FilterControlAltText="Filter Text_Title column" HeaderText="Text_Title" SortExpression="Text_Title" UniqueName="Text_Title" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Txt_ISBN" FilterControlAltText="Filter Txt_ISBN column" HeaderText="Txt_ISBN" SortExpression="Txt_ISBN" UniqueName="Txt_ISBN" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PUB_YYYY" FilterControlAltText="Filter PUB_YYYY column" HeaderText="PUB_YYYY" SortExpression="PUB_YYYY" UniqueName="PUB_YYYY" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditionNo" FilterControlAltText="Filter EditionNo column" HeaderText="EditionNo" SortExpression="EditionNo" UniqueName="EditionNo" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Txt_Author" FilterControlAltText="Filter Txt_Author column" HeaderText="Txt_Author" SortExpression="Txt_Author" UniqueName="Txt_Author" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Txt_Publisher" FilterControlAltText="Filter Txt_Publisher column" HeaderText="Txt_Publisher" SortExpression="Txt_Publisher" UniqueName="Txt_Publisher">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Txt_Type" FilterControlAltText="Filter Txt_Type column" HeaderText="Txt_Type" SortExpression="Txt_Type" UniqueName="Txt_Type" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT OL_MasterCourse.Course, OL_Textbooks.MasterCourse, OL_Textbooks.REQ, OL_Textbooks.SUP, OL_Textbooks.ALT, OL_Textbooks.Text_Title, OL_Textbooks.Txt_ISBN, OL_Textbooks.PUB_YYYY, OL_Textbooks.EditionNo, OL_Textbooks.Txt_Author, OL_Textbooks.Txt_Publisher, OL_Textbooks.Txt_Type FROM OL_MasterCourse INNER JOIN OL_Textbooks ON OL_MasterCourse.MasterName = OL_Textbooks.MasterCourse WHERE (OL_Textbooks.Term = @Term) ORDER BY OL_Textbooks.MasterCourse">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="2205" Name="Term" SessionField="NextTerm"  Type="Int32"  />
            </SelectParameters>
        </asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
