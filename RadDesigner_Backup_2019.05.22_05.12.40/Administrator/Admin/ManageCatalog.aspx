<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ManageCatalog.aspx.vb" Inherits="RadDesigner.ManageCatalog"   MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
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
    
        <span class="auto-style1"><strong>Manage Catalog FLVC Data</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Return to Index" />
        <br />
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowFilteringByColumn="True" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="Catalog_ID" DataSourceID="SqlDataSource1" CommandItemDisplay="Top">
                <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="true" ShowRefreshButton="false" />
                <Columns>
                    <telerik:GridBoundColumn DataField="Catalog_ID" DataType="System.Int32" FilterControlAltText="Filter Catalog_ID column" HeaderText="Catalog_ID" ReadOnly="True" SortExpression="Catalog_ID" UniqueName="Catalog_ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CatalogName" FilterControlAltText="Filter CatalogName column" HeaderText="CatalogName" SortExpression="CatalogName" UniqueName="CatalogName">
                    </telerik:GridBoundColumn>


                    <telerik:GridTemplateColumn HeaderText="Title" ItemStyle-Width="300px" Visible="true" AllowFiltering="false">
                      <ItemTemplate>
                             <%#DataBinder.Eval(Container.DataItem, "Title")%>
                      </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>' width="680" TextMode="MultiLine" Rows="1"></asp:TextBox>
                         </EditItemTemplate>

                       </telerik:GridTemplateColumn>


                    <telerik:GridBoundColumn DataField="Credits" FilterControlAltText="Filter Credits column" HeaderText="Credits" SortExpression="Credits" UniqueName="Credits" AllowFiltering="false">
                    </telerik:GridBoundColumn>


                             <telerik:GridTemplateColumn HeaderText="Pre_Requisites" ItemStyle-Width="300px" Visible="true" AllowFiltering="false">
                      <ItemTemplate>
                             <%#DataBinder.Eval(Container.DataItem, "Pre_Requisites")%>
                      </ItemTemplate>

                      <EditItemTemplate>
                          <telerik:RadEditor ID="Pre_Requisites" runat="server" Content='<%# Bind("Pre_Requisites") %>' BackColor="#66FFCC" Height="200px" AllowFiltering="false">
                              <Tools>
                                  <telerik:EditorToolGroup>
                                      <telerik:EditorTool Name="Cut" />
                                      <telerik:EditorTool Name="Copy" />
                                      <telerik:EditorTool Name="Paste" />
                                  </telerik:EditorToolGroup>
                              </Tools>
                          </telerik:RadEditor>
                      </EditItemTemplate>
                      <InsertItemTemplate>
                          <telerik:RadEditor ID="Pre_Requisites" runat="server" Content='<%# Bind("Pre_Requisites") %>'>
                              <Tools>
                                  <telerik:EditorToolGroup>
                                      <telerik:EditorTool Name="Cut" />
                                      <telerik:EditorTool Name="Copy" />
                                      <telerik:EditorTool Name="Paste" />
                                  </telerik:EditorToolGroup>
                              </Tools>
                          </telerik:RadEditor>                    
                      </InsertItemTemplate>
                      </telerik:GridTemplateColumn>


                      <telerik:GridTemplateColumn HeaderText="CourseDescription" ItemStyle-Width="300px" Visible="true" AllowFiltering="false">
                      <ItemTemplate>
                             <%#DataBinder.Eval(Container.DataItem, "CourseDescription")%>
                      </ItemTemplate>

                      <EditItemTemplate>
                          <telerik:RadEditor ID="CourseDescription" runat="server" Content='<%# Bind("CourseDescription") %>' BackColor="#99CCFF" Height="200px">
                              <Tools>
                                  <telerik:EditorToolGroup>
                                      <telerik:EditorTool Name="Cut" />
                                      <telerik:EditorTool Name="Copy" />
                                      <telerik:EditorTool Name="Paste" />
                                  </telerik:EditorToolGroup>
                              </Tools>
                          </telerik:RadEditor>
                      </EditItemTemplate>
                      <InsertItemTemplate>
                          <telerik:RadEditor ID="CourseDescription" runat="server" Content='<%# Bind("CourseDescription") %>'>
                              <Tools>
                                  <telerik:EditorToolGroup>
                                      <telerik:EditorTool Name="Cut" />
                                      <telerik:EditorTool Name="Copy" />
                                      <telerik:EditorTool Name="Paste" />
                                  </telerik:EditorToolGroup>
                              </Tools>
                          </telerik:RadEditor>                    
                      </InsertItemTemplate>
                      </telerik:GridTemplateColumn>


                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_Catalog] WHERE [Catalog_ID] = @Catalog_ID" InsertCommand="INSERT INTO [OL_Catalog] ([CatalogName], [Title], [Credits], [Pre_Requisites], [CourseDescription]) VALUES (@CatalogName, @Title, @Credits, @Pre_Requisites, @CourseDescription)" SelectCommand="SELECT [Catalog_ID], [CatalogName], [Title], [Credits], [Pre_Requisites], [CourseDescription] FROM [OL_Catalog]" UpdateCommand="UPDATE [OL_Catalog] SET [CatalogName] = @CatalogName, [Title] = @Title, [Credits] = @Credits, [Pre_Requisites] = @Pre_Requisites, [CourseDescription] = @CourseDescription WHERE [Catalog_ID] = @Catalog_ID">
            <DeleteParameters>
                <asp:Parameter Name="Catalog_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CatalogName" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Credits" Type="String" />
                <asp:Parameter Name="Pre_Requisites" Type="String" />
                <asp:Parameter Name="CourseDescription" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CatalogName" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Credits" Type="String" />
                <asp:Parameter Name="Pre_Requisites" Type="String" />
                <asp:Parameter Name="CourseDescription" Type="String" />
                <asp:Parameter Name="Catalog_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
