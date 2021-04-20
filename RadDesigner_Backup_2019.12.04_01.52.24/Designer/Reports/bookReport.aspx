<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="bookReport.aspx.vb"  MaintainScrollPositionOnPostback="true" Inherits="RadDesigner.bookReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
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
    
        &nbsp;&nbsp;<h3><span class="auto-style1">Textbook Report for </span>
            <asp:Label ID="lblUsername" runat="server" CssClass="auto-style1"></asp:Label>
            <span class="auto-style1">&nbsp; Term </span>
            <asp:Label ID="lblTerm" runat="server" CssClass="auto-style1"></asp:Label>
        </h3>
    
    </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticUpdates="True" AutoGenerateColumns="False" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Skin="WebBlue" ShowGroupPanel="True" AllowFilteringByColumn="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowDragToGroup="True">
            </ClientSettings>
            <MasterTableView DataKeyNames="ID"   DataSourceID="SqlDataSource1"  CommandItemDisplay="Top">
                <CommandItemSettings ShowExportToExcelButton="false" ShowExportToCsvButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
                <Columns>
                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term" DataType="System.Int32" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" DataType="System.Int32" FilterControlAltText="Filter CRS column" HeaderText="CRS" SortExpression="CRS" UniqueName="CRS">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="REQ" DataType="System.Boolean" FilterControlAltText="Filter REQ column" HeaderText="REQ" SortExpression="REQ" UniqueName="REQ" AllowFiltering="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="SUP" DataType="System.Boolean" FilterControlAltText="Filter SUP column" HeaderText="SUP" SortExpression="SUP" UniqueName="SUP" AllowFiltering="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="ALT" DataType="System.Boolean" FilterControlAltText="Filter ALT column" HeaderText="ALT" SortExpression="ALT" UniqueName="ALT" AllowFiltering="false">
                    </telerik:GridCheckBoxColumn>
                                        <telerik:GridTemplateColumn HeaderText="Text_Title" ItemStyle-Width="300px" Visible="true" AllowFiltering="false">
                      <ItemTemplate>
                             <%#DataBinder.Eval(Container.DataItem, "Text_Title")%>
                      </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Text_Title") %>' width="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>
                         </EditItemTemplate>

                       </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="Txt_ISBN" FilterControlAltText="Filter Txt_ISBN column" HeaderText="Txt_ISBN" SortExpression="Txt_ISBN" UniqueName="Txt_ISBN" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditionNo" FilterControlAltText="Filter EditionNo column" HeaderText="EditionNo" SortExpression="EditionNo" UniqueName="EditionNo" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PUB_YYYY" FilterControlAltText="Filter PUB_YYYY column" HeaderText="PUB_YYYY" SortExpression="PUB_YYYY" UniqueName="PUB_YYYY" AllowFiltering="false">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT OL_MasterCourse.Course, OL_Textbooks.ID, OL_Textbooks.Term, OL_Textbooks.Course, OL_Textbooks.MasterCourse, OL_Textbooks.REQ, OL_Textbooks.SUP, OL_Textbooks.ALT, OL_Textbooks.Text_Title, OL_Textbooks.Txt_ISBN, OL_Textbooks.PUB_YYYY, OL_Textbooks.EditionNo, OL_Textbooks.Txt_Author, OL_Textbooks.Txt_Publisher, OL_Textbooks.Txt_Type FROM OL_MasterCourse INNER JOIN OL_Textbooks ON OL_MasterCourse.MasterName = OL_Textbooks.MasterCourse WHERE (OL_MasterCourse.ID_ID = @User_ID) AND (OL_Textbooks.Term = @Term) ORDER BY OL_Textbooks.MasterCourse"  UpdateCommand="UPDATE [OL_Textbooks] SET [Term] = @Term, [CRS] = @CRS, [SUP] = @SUP, [ALT] = @ALT, [Text_Title] = @Text_Title, [Txt_ISBN] = @Txt_ISBN, [EditionNo] = @EditionNo, [PUB_YYYY] = @PUB_YYYY, [Txt_Author] = @Txt_Author, [Txt_Publisher] = @Txt_Publisher, [Txt_Type] = @Txt_Type WHERE [ID] = @ID">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="User_ID" SessionField="User_ID"  Type="Int32"  />
                <asp:SessionParameter DefaultValue="2197" Name="Term" SessionField="NextTerm" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Term" Type="Int32" />
                <asp:Parameter Name="CRS" Type="Int32" />
                <asp:Parameter Name="SUP" Type="Boolean" />
                <asp:Parameter Name="ALT" Type="Boolean" />
                <asp:Parameter Name="Text_Title" Type="String" />
                <asp:Parameter Name="Txt_ISBN" Type="String" />
                <asp:Parameter Name="EditionNo" Type="String" />
                <asp:Parameter Name="PUB_YYYY" Type="String" />
                <asp:Parameter Name="Txt_Author" Type="String" />
                <asp:Parameter Name="Txt_Publisher" Type="String" />
                <asp:Parameter Name="Txt_Type" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
