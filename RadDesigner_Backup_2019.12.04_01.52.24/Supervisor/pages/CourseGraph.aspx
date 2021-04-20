<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CourseGraph.aspx.vb" Inherits="RadDesigner.CourseGraph" %>

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
    
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AutoGenerateEditColumn="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="CourseID" FilterControlAltText="Filter CourseID column" HeaderText="CourseID" SortExpression="CourseID" UniqueName="CourseID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Instructional_Designer" FilterControlAltText="Filter Instructional_Designer column" HeaderText="Instructional_Designer" SortExpression="Instructional_Designer" UniqueName="Instructional_Designer">
                    </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn DataField="Textbook" DataType="System.Boolean" FilterControlAltText="Filter CourseInit column" HeaderText="CourseInit" SortExpression="CourseInit" UniqueName="CourseInit">
                           <ItemTemplate>
                               <img src="../images/<%#DataBinder.Eval(Container.DataItem, "CourseInit")%>.png" >  
                           </ItemTemplate>
                           <EditItemTemplate>

                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="CourseInit"  DataTextField="Text"
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
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [CourseID], [Instructional_Designer], [CourseInit], [Textbook], [Exam], [Audit], [Sweep], [Copy], [Release], [ID] FROM [Workflow] WHERE ([Term] = @Term)" DeleteCommand="DELETE FROM [Workflow] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Workflow] ([CourseID], [Instructional_Designer], [CourseInit], [Textbook], [Exam], [Audit], [Sweep], [Copy], [Release]) VALUES (@CourseID, @Instructional_Designer, @CourseInit, @Textbook, @Exam, @Audit, @Sweep, @Copy, @Release)" UpdateCommand="UPDATE [Workflow] SET [CourseID] = @CourseID, [Instructional_Designer] = @Instructional_Designer, [CourseInit] = @CourseInit, [Textbook] = @Textbook, [Exam] = @Exam, [Audit] = @Audit, [Sweep] = @Sweep, [Copy] = @Copy, [Release] = @Release WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CourseID" Type="String" />
            <asp:Parameter Name="Instructional_Designer" Type="String" />
             <asp:Parameter Name="CourseInit" Type="Boolean" />
            <asp:Parameter Name="Textbook" Type="Boolean" />
            <asp:Parameter Name="Exam" Type="Boolean" />
            <asp:Parameter Name="Audit" Type="Boolean" />
            <asp:Parameter Name="Sweep" Type="Boolean" />
            <asp:Parameter Name="Copy" Type="Boolean" />
            <asp:Parameter Name="Release" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="2187" Name="Term" SessionField="NextTerm" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseID" Type="String" />
            <asp:Parameter Name="Instructional_Designer" Type="String" />
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
    </form>
</body>
</html>
