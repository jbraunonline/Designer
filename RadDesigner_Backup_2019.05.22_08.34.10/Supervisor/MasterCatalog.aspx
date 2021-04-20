<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MasterCatalog.aspx.vb" Inherits="RadDesigner.MasterCatalog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    
    </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True" AutoGenerateColumns="False"  AutoGenerateEditColumn="True" AllowAutomaticInserts="True" DataSourceID="SqlDataSource1" ShowGroupPanel="True" Skin="WebBlue" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
            
            <ClientSettings AllowDragToGroup="True">
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView DataKeyNames="Catalog_ID" DataSourceID="SqlDataSource1" EditMode="InPlace" CommandItemDisplay="TopAndBottom"  >
                <CommandItemSettings ShowExportToWordButton="true" ShowExportToCsvButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                <Columns>
                    <telerik:GridBoundColumn DataField="Catalog_ID" DataType="System.Int32" FilterControlAltText="Filter Catalog_ID column" HeaderText="Catalog_ID" ReadOnly="True" SortExpression="Catalog_ID" UniqueName="Catalog_ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CatalogName" FilterControlAltText="Filter CatalogName column" HeaderText="CatalogName" SortExpression="CatalogName" UniqueName="CatalogName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" SortExpression="Title" UniqueName="Title" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Subject_Area" FilterControlAltText="Filter Subject_Area column" HeaderText="Subject_Area" SortExpression="Subject_Area" UniqueName="Subject_Area">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term_Offering" FilterControlAltText="Filter Term_Offering column" HeaderText="Term_Offering" SortExpression="Term_Offering" UniqueName="Term_Offering">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Credits" FilterControlAltText="Filter Credits column" HeaderText="Credits" SortExpression="Credits" UniqueName="Credits" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Pre_Requisites" FilterControlAltText="Filter Pre_Requisites column" HeaderText="Pre_Requisites" SortExpression="Pre_Requisites" UniqueName="Pre_Requisites" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Co_Requisites" FilterControlAltText="Filter Co_Requisites column" HeaderText="Co_Requisites" SortExpression="Co_Requisites" UniqueName="Co_Requisites" Visible="false">
                    </telerik:GridBoundColumn>

                     <telerik:GridTemplateColumn HeaderText="Status" ItemStyle-Width="200px" FilterControlAltText="Filter Status column">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "Status")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="RadDropDownList1"  DataTextField="Text"
                                DataValueField="Value" DataSourceID="SqlDataSource2" SelectedValue='<%#Bind("Status") %>'>
                            </telerik:RadDropDownList>
                        </EditItemTemplate>

<ItemStyle Width="200px"></ItemStyle>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="Course_Level" FilterControlAltText="Filter Course_Level column" HeaderText="Course_Level" SortExpression="Course_Level" UniqueName="Course_Level" Visible="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_Catalog] WHERE [Catalog_ID] = @Catalog_ID" InsertCommand="INSERT INTO [OL_Catalog] ([CatalogName], [Title], [Subject_Area], [Term_Offering], [Credits], [Pre_Requisites], [Co_Requisites], [Status], [Course_Level]) VALUES (@CatalogName, @Title, @Subject_Area, @Term_Offering, @Credits, @Pre_Requisites, @Co_Requisites, @Status, @Course_Level)" SelectCommand="SELECT * FROM [OL_Catalog] Order By [CatalogName]" UpdateCommand="UPDATE [OL_Catalog] SET [CatalogName] = @CatalogName, [Title] = @Title, [Subject_Area] = @Subject_Area, [Term_Offering] = @Term_Offering, [Credits] = @Credits, [Pre_Requisites] = @Pre_Requisites, [Co_Requisites] = @Co_Requisites, [Status] = @Status, [Course_Level] = @Course_Level WHERE [Catalog_ID] = @Catalog_ID">
            <DeleteParameters>
                <asp:Parameter Name="Catalog_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CatalogName" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Subject_Area" Type="String" />
                <asp:Parameter Name="Term_Offering" Type="String" />
                <asp:Parameter Name="Credits" Type="String" />
                <asp:Parameter Name="Pre_Requisites" Type="String" />
                <asp:Parameter Name="Co_Requisites" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Course_Level" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CatalogName" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Subject_Area" Type="String" />
                <asp:Parameter Name="Term_Offering" Type="String" />
                <asp:Parameter Name="Credits" Type="String" />
                <asp:Parameter Name="Pre_Requisites" Type="String" />
                <asp:Parameter Name="Co_Requisites" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Course_Level" Type="String" />
                <asp:Parameter Name="Catalog_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT * FROM [OL_DropdownItems] WHERE ([Item] = @Item)">
            <SelectParameters>
                <asp:Parameter DefaultValue="Status" Name="Item" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
