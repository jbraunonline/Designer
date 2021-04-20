<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProgressGraphic.aspx.vb" Inherits="RadDesigner.ProgressGraphic" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <style type="text/css">
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-large;
            color: #FF0066;
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
    <span class="auto-style2"><strong>Progress Report</strong></span><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT * FROM [Workflow] WHERE ([Term] = @Term)" DeleteCommand="DELETE FROM [Workflow] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Workflow] ([CourseID], [Term], [Instructional_Designer], [Status], [Phase], [CourseInit], [Textbook], [Exam], [Audit], [Sweep], [Copy], [Release]) VALUES (@CourseID, @Term, @Instructional_Designer, @Status, @Phase, @CourseInit, @Textbook, @Exam, @Audit, @Sweep, @Copy, @Release)" UpdateCommand="UPDATE [Workflow] SET [CourseID] = @CourseID, [Term] = @Term, [Instructional_Designer] = @Instructional_Designer, [Status] = @Status, [Phase] = @Phase, [CourseInit] = @CourseInit, [Textbook] = @Textbook, [Exam] = @Exam, [Audit] = @Audit, [Sweep] = @Sweep, [Copy] = @Copy, [Release] = @Release WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CourseID" Type="String" />
            <asp:Parameter Name="Term" Type="Int32" />
             <asp:Parameter Name="Instructional_Designer" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Phase" Type="String" />
            <asp:Parameter Name="CourseInit" Type="Boolean" />
            <asp:Parameter Name="Textbook" Type="Boolean" />
            <asp:Parameter Name="Exam" Type="Boolean" />
            <asp:Parameter Name="Audit" Type="Boolean" />
            <asp:Parameter Name="Sweep" Type="Boolean" />
            <asp:Parameter Name="Copy" Type="Boolean" />
            <asp:Parameter Name="Release" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="2187" Name="Term" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseID" Type="String" />
            <asp:Parameter Name="Term" Type="Int32" />
            <asp:Parameter Name="Instructional_Designer" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Phase" Type="String" />
            <asp:Parameter Name="CourseInit" Type="Boolean" />
            <asp:Parameter Name="Textbook" Type="Boolean" />
            <asp:Parameter Name="Exam" Type="Boolean" />
            <asp:Parameter Name="Audit" Type="Boolean" />
            <asp:Parameter Name="Sweep" Type="Boolean" />
            <asp:Parameter Name="Copy" Type="Boolean" />
            <asp:Parameter Name="Release" Type="Boolean" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Text], [Value] FROM [DropdownItems] WHERE ([Item] = @Item)">
        <SelectParameters>
            <asp:Parameter DefaultValue="TF" Name="Item" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True" DataSourceID="SqlDataSource1" ShowGroupPanel="True" Skin="WebBlue" AutoGenerateHierarchy="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" AutoGenerateEditColumn="True" Font-Bold="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings ExportOnlyData="True">
        </ExportSettings>
        <ClientSettings AllowDragToGroup="True">
        </ClientSettings>
        <MasterTableView DataSourceID="SqlDataSource1"  EnableGroupsExpandAll="true"  CommandItemDisplay="Top" HierarchyDefaultExpanded="false" GroupsDefaultExpanded="False" DataKeyNames="ID">
             <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
             <Columns>
                 <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID"  Visible="false">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="CourseID" FilterControlAltText="Filter CourseID column" HeaderText="CourseID" SortExpression="CourseID" UniqueName="CourseID">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="Term" DataType="System.Int32" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="Instructional_Designer" FilterControlAltText="Filter Instructional_Designer column" HeaderText="Instructional_Designer" SortExpression="Instructional_Designer" UniqueName="Instructional_Designer">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="Status" UniqueName="Status"  Visible="false">
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="Phase" FilterControlAltText="Filter Phase column" HeaderText="Phase" SortExpression="Phase" UniqueName="Phase"  Visible="false">
                 </telerik:GridBoundColumn>



   
                        <telerik:GridTemplateColumn DataField="Textbook" DataType="System.Boolean" FilterControlAltText="Filter CourseInit column" HeaderText="CourseInit" SortExpression="CourseInit" UniqueName="CourseInit">
                           <ItemTemplate>
                               <img src="../images/<%#DataBinder.Eval(Container.DataItem, "CourseInit")%>.png" >  
                           </ItemTemplate>
                           <EditItemTemplate>

                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="CourseInit"  DataTextField="CourseInit"
                               DataValueField="Text" DataSourceID="SqlDataSource2" SelectedText='<%#Bind("CourseInit") %>' >
                               </telerik:RadDropDownList>
                              
                                </EditItemTemplate>
                        </telerik:GridTemplateColumn> 


                        <telerik:GridTemplateColumn DataField="Textbook" DataType="System.Boolean" FilterControlAltText="Filter Textbook column" HeaderText="Textbook" SortExpression="Textbook" UniqueName="Textbook">
                           <ItemTemplate>
                               <img src="../images/<%#DataBinder.Eval(Container.DataItem, "Textbook")%>.png" >  
                           </ItemTemplate>
                           <EditItemTemplate>

                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Textbook"  DataTextField="Text"
                               DataValueField="Text" DataSourceID="SqlDataSource2" SelectedText='<%#Bind("Textbook") %>' >
                               </telerik:RadDropDownList>
                              
                                </EditItemTemplate>
                        </telerik:GridTemplateColumn> 

                        <telerik:GridTemplateColumn DataField="Exam" DataType="System.Boolean" FilterControlAltText="Filter Exam column" HeaderText="Exam" SortExpression="Exam" UniqueName="Exam">
                           <ItemTemplate>
                               <img src="../images/<%#DataBinder.Eval(Container.DataItem, "Exam")%>.png" >  
                           </ItemTemplate>
                           <EditItemTemplate>
                           <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Exam"  DataTextField="Text"
                               DataValueField="Text" DataSourceID="SqlDataSource2" SelectedText='<%#Bind("Exam") %>' >
                            </telerik:RadDropDownList>
                            </EditItemTemplate>
                          </telerik:GridTemplateColumn> 

                        <telerik:GridTemplateColumn DataField="Audit" DataType="System.Boolean" FilterControlAltText="Filter Audit column" HeaderText="Audit" SortExpression="Audit" UniqueName="Audit">
                           <ItemTemplate>
                               <img src="../images/<%#DataBinder.Eval(Container.DataItem, "Audit")%>.png" >  
                           </ItemTemplate>
                           <EditItemTemplate>
                           <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Audit"  DataTextField="Text"
                               DataValueField="Text" DataSourceID="SqlDataSource2" SelectedText='<%#Bind("Audit") %>' >
                            </telerik:RadDropDownList>
                            </EditItemTemplate>
                          </telerik:GridTemplateColumn> 

                        <telerik:GridTemplateColumn DataField="Sweep" DataType="System.Boolean" FilterControlAltText="Filter Sweep column" HeaderText="Sweep" SortExpression="Sweep" UniqueName="Sweep">
                           <ItemTemplate>
                               <img src="../images/<%#DataBinder.Eval(Container.DataItem, "Sweep")%>.png" >  
                           </ItemTemplate>
                           <EditItemTemplate>
                           <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Sweep"  DataTextField="Text"
                               DataValueField="Text" DataSourceID="SqlDataSource2" SelectedText='<%#Bind("Sweep") %>' >
                            </telerik:RadDropDownList>
                            </EditItemTemplate>
                          </telerik:GridTemplateColumn> 

                        <telerik:GridTemplateColumn DataField="Copy" DataType="System.Boolean" FilterControlAltText="Filter Copy column" HeaderText="Copy" SortExpression="Copy" UniqueName="Copy">
                           <ItemTemplate>
                               <img src="../images/<%#DataBinder.Eval(Container.DataItem, "Copy")%>.png" >  
                           </ItemTemplate>
                           <EditItemTemplate>
                           <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Copy"  DataTextField="Text"
                               DataValueField="Text" DataSourceID="SqlDataSource2" SelectedText='<%#Bind("Copy") %>' >
                            </telerik:RadDropDownList>
                            </EditItemTemplate>
                          </telerik:GridTemplateColumn> 

                        <telerik:GridTemplateColumn DataField="Release" DataType="System.Boolean" FilterControlAltText="Filter Release column" HeaderText="Release" SortExpression="Release" UniqueName="Release">
                           <ItemTemplate>
                               <img src="../images/<%#DataBinder.Eval(Container.DataItem, "Release")%>.png" >  
                           </ItemTemplate>
                           <EditItemTemplate>
                           <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Release"  DataTextField="Text"
                               DataValueField="Text" DataSourceID="SqlDataSource2" SelectedText='<%#Bind("Release") %>' >
                            </telerik:RadDropDownList>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn> 



             </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>

