<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Design_Course_BU.aspx.vb" Inherits="RadDesigner.Design_Course" %>

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

        <asp:Panel ID="Panel1" runat="server">
            Please select a course from the drop down list in the left menu Column&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </asp:Panel>
        
        <asp:Panel ID="Panel2" runat="server">

        <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True" Font-Size="Larger"></asp:Label>

            <telerik:RadGrid ID="RadGrid1" runat="server" Skin="WebBlue" AutoGenerateColumns="False" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" AllowAutomaticUpdates="True">
                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                        <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CourseNo" FilterControlAltText="Filter CourseNo column" HeaderText="CourseNo" SortExpression="CourseNo" UniqueName="CourseNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" SortExpression="Title" UniqueName="Title" ItemStyle-Width="450">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="Top_20_CRS" DataType="System.Boolean" FilterControlAltText="Filter Top_20_CRS column" HeaderText="Top_20_CRS" SortExpression="Top_20_CRS" UniqueName="Top_20_CRS">
                        </telerik:GridCheckBoxColumn>

                        <telerik:GridTemplateColumn HeaderText="Developer" >
                           <ItemTemplate>
                               <%#DataBinder.Eval(Container.DataItem, "Developer_SME")%>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Developer_SME"  DataTextField="Abbr"
                               DataValueField="Abbr" DataSourceID="DeveloperDataSource" SelectedValue='<%#Bind("Developer_SME") %>' DropDownHeight="300">
                               </telerik:RadDropDownList>
                           </EditItemTemplate>
                        </telerik:GridTemplateColumn> 

                        <telerik:GridTemplateColumn HeaderText="Co_Developer"  Visible="True">
                           <ItemTemplate>
                               <%#DataBinder.Eval(Container.DataItem, "Co_Developer_SME")%>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Co_Developer_SME"  DataTextField="Abbr"
                               DataValueField="Abbr" DataSourceID="DeveloperDataSource" SelectedValue='<%#Bind("Co_Developer_SME") %>' DropDownHeight="300">
                               </telerik:RadDropDownList>
                           </EditItemTemplate>
                        </telerik:GridTemplateColumn>  


    

                        <telerik:GridTemplateColumn HeaderText="Designer " >
                           <ItemTemplate>
                               <%#DataBinder.Eval(Container.DataItem, "Instructional_Designer")%>
                           </ItemTemplate>

                           <EditItemTemplate>
                               <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Instructional_Designer"  DataTextField="Abbr"
                               DataValueField="Abbr" DataSourceID="DesignerDataSource" SelectedValue='<%#Bind("Instructional_Designer") %>' DropDownHeight="200">
                               </telerik:RadDropDownList>
                           </EditItemTemplate>
                        </telerik:GridTemplateColumn>  

                        <telerik:GridTemplateColumn HeaderText="Subject_Area " >
                           <ItemTemplate>
                               <%#DataBinder.Eval(Container.DataItem, "Subject_Area")%>
                           </ItemTemplate>

                           <EditItemTemplate>
                               <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Subject_Area"  DataTextField="Subject_Area"
                               DataValueField="Subject_Area" DataSourceID="SubjectDataSource" SelectedValue='<%#Bind("Subject_Area") %>'>
                               </telerik:RadDropDownList>
                           </EditItemTemplate>
                        </telerik:GridTemplateColumn> 




                            <telerik:GridTemplateColumn HeaderText="Term_Offering " >
                           <ItemTemplate>
                               <%#DataBinder.Eval(Container.DataItem, "Term_Offering")%>
                           </ItemTemplate>

                           <EditItemTemplate>
                               <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Term_Offering"  DataTextField="Term_Offering"
                               DataValueField="Term_Offering" DataSourceID="termofferingDataSource" SelectedValue='<%#Bind("Term_Offering") %>'>
                               </telerik:RadDropDownList>
                           </EditItemTemplate>
                        </telerik:GridTemplateColumn> 


                          
                      <telerik:GridTemplateColumn HeaderText="Status " >
                           <ItemTemplate>
                               <%#DataBinder.Eval(Container.DataItem, "Status")%>
                           </ItemTemplate>

                           <EditItemTemplate>
                               <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Status"  DataTextField="Status"
                               DataValueField="Status" DataSourceID="StatusDataSource" SelectedValue='<%#Bind("Status") %>'>
                               </telerik:RadDropDownList>
                           </EditItemTemplate>
                        </telerik:GridTemplateColumn> 



                    <telerik:GridTemplateColumn HeaderText="Notes" ItemStyle-Width="300px" Visible="false">
                      <ItemTemplate>
                             <%#DataBinder.Eval(Container.DataItem, "Notes")%>
                      </ItemTemplate>

                      <EditItemTemplate>
                          <telerik:RadEditor ID="Notes" runat="server" Content='<%# Bind("Notes") %>'>
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
                          <telerik:RadEditor ID="Notes" runat="server" Content='<%# Bind("Notes") %>'>
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
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [Course] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Course] ([CourseNo], [Title], [Top_20_CRS], [Developer_SME], [Co_Developer_SME], [Instructional_Designer], [Subject_Area], [Term_Offering], [status], [Notes]) VALUES (@CourseNo, @Title, @Top_20_CRS, @Developer_SME, @Co_Developer_SME, @Instructional_Designer, @Subject_Area, @Term_Offering, @status, @Notes)" SelectCommand="SELECT [ID], [CourseNo], [Title], [Top_20_CRS], [Developer_SME], [Co_Developer_SME], [Instructional_Designer], [Subject_Area], [Term_Offering], [status], [Notes] FROM [Course] WHERE ([CourseID] = @CourseID)" UpdateCommand="UPDATE [Course] SET [CourseNo] = @CourseNo, [Title] = @Title, [Top_20_CRS] = @Top_20_CRS, [Developer_SME] = @Developer_SME, [Co_Developer_SME] = @Co_Developer_SME, [Instructional_Designer] = @Instructional_Designer, [Subject_Area] = @Subject_Area, [Term_Offering] = @Term_Offering, [status] = @status, [Notes] = @Notes WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CourseNo" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Top_20_CRS" Type="Boolean" />
                <asp:Parameter Name="Developer_SME" Type="String" />
                <asp:Parameter Name="Co_Developer_SME" Type="String" />
                <asp:Parameter Name="Instructional_Designer" Type="String" />
                <asp:Parameter Name="Subject_Area" Type="String" />
                <asp:Parameter Name="Term_Offering" Type="String" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="CourseID" SessionField="CourseID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CourseNo" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Top_20_CRS" Type="Boolean" />
                <asp:Parameter Name="Developer_SME" Type="String" />
                <asp:Parameter Name="Co_Developer_SME" Type="String" />
                <asp:Parameter Name="Instructional_Designer" Type="String" />
                <asp:Parameter Name="Subject_Area" Type="String" />
                <asp:Parameter Name="Term_Offering" Type="String" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DesignerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT DISTINCT Abbr FROM  Person WHERE (JobTitle = 'Senior ID')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DeveloperDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT DISTINCT Abbr FROM Person WHERE (JobTitle = 'Developer')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SubjectDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT DISTINCT Subject_Area FROM Course"></asp:SqlDataSource>
        <asp:SqlDataSource ID="termofferingDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT distinct term_offering FROM Course"></asp:SqlDataSource>
        <asp:SqlDataSource ID="StatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT Status FROM Master_Status"></asp:SqlDataSource>
        <br />

    </form>
    <p>
        &nbsp;</p>
</body>
</html>
