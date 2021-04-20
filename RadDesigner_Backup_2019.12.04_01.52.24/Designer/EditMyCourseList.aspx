<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EditMyCourseList.aspx.vb" Inherits="RadDesigner.EditMyCourseList"  MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

body {
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
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        <br />You can mark a course Unavailible or change its Top 20 status by clicking on a pencil icon.
        <asp:Button ID="Button1" runat="server" BackColor="Lime" Font-Bold="True" Text="Add New Course" />
&nbsp;<div>
    
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AutoGenerateColumns="False" AutoGenerateEditColumn="True" AllowSorting="True" AllowAutomaticUpdates="True" Width="900px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="Master_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="Master_ID" DataType="System.Int32" FilterControlAltText="Filter Master_ID column" HeaderText="Master_ID" ReadOnly="True" SortExpression="Master_ID" UniqueName="Master_ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ThisMasterSource" FilterControlAltText="Filter ThisMasterSource column" HeaderText="ThisMasterSource" SortExpression="ThisMasterSource" UniqueName="ThisMasterSource1" Visible="false"  ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="Top_20_CRS" DataType="System.Boolean" FilterControlAltText="Filter Top_20_CRS column" HeaderText="Top_20_CRS" SortExpression="Top_20_CRS" UniqueName="Top_20_CRS" Visible="false">
                    </telerik:GridCheckBoxColumn>
                      
                    <telerik:GridTemplateColumn HeaderText="Top_20_CRS" UniqueName="Top_20_CRS2" SortExpression="Top_20_CRS"  AllowFiltering="false" ReadOnly="true" >
                        <ItemTemplate>
                            <img src='<%# Eval("Top_20_CRS") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>


                    <telerik:GridBoundColumn DataField="Instructional_Designer" FilterControlAltText="Filter Instructional_Designer column" HeaderText="Instructional_Designer" SortExpression="Instructional_Designer" UniqueName="Instructional_Designer" Visible="false"  ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ID_ID" DataType="System.Int32" FilterControlAltText="Filter ID_ID column" HeaderText="ID_ID" SortExpression="ID_ID" UniqueName="ID_ID" Visible="false"  ReadOnly="true">
                    </telerik:GridBoundColumn>


                 <telerik:GridTemplateColumn DataField="Status"  HeaderText="Course Status" SortExpression="Status" UniqueName="Status">
                           <ItemTemplate>
                               <%#DataBinder.Eval(Container.DataItem, "Status")%>
                           </ItemTemplate>

                           <EditItemTemplate>
                               <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="Status"  DataTextField="Text"
                               DataValueField="Value" DataSourceID="SqlDataSource2" SelectedValue='<%#Bind("Status") %>'>
                               </telerik:RadDropDownList>
                           </EditItemTemplate>
                        </telerik:GridTemplateColumn>  





                </Columns>
                <EditItemStyle BackColor="#FF8080" />
            </MasterTableView>
        </telerik:RadGrid>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_MasterCourse] WHERE [Master_ID] = @Master_ID" InsertCommand="INSERT INTO [OL_MasterCourse] ([MasterName], [Course], [ThisMasterSource], [Top_20_CRS], [Instructional_Designer], [ID_ID], [Status]) VALUES (@MasterName, @Course, @ThisMasterSource, @Top_20_CRS, @Instructional_Designer, @ID_ID, @Status)" SelectCommand="SELECT [Master_ID], [MasterName], [Course], [ThisMasterSource], [Top_20_CRS], [Instructional_Designer], [ID_ID], [Status] FROM [OL_MasterCourse] WHERE (([Term] = @Term) AND ([ID_ID] = @ID_ID))" UpdateCommand="UPDATE [OL_MasterCourse] SET [Top_20_CRS] = @Top_20_CRS, [Status] = @Status WHERE [Master_ID] = @Master_ID">
            <DeleteParameters>
                <asp:Parameter Name="Master_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MasterName" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="ThisMasterSource" Type="String" />
                <asp:Parameter Name="Top_20_CRS" Type="Boolean" />
                <asp:Parameter Name="Instructional_Designer" Type="String" />
                <asp:Parameter Name="ID_ID" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="2193" Name="Term" SessionField="NextTerm" Type="Int32" />
                <asp:SessionParameter DefaultValue="124" Name="ID_ID" SessionField="User_ID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Top_20_CRS" Type="Boolean" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Master_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Text], [Value] FROM [OL_DropdownItems] WHERE ([Item] = @Item)">
            <SelectParameters>
                <asp:Parameter DefaultValue="CourseStatus" Name="Item" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
