<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Design_Course.aspx.vb" Inherits="RadDesigner.Design_Course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-large;
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

        <asp:Panel ID="Panel1" runat="server">
            Please select a course from the drop down list in the left menu Column&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server"></asp:Label>
        </asp:Panel>
        
        <asp:Panel ID="Panel2" runat="server">

        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" CssClass="auto-style1"></asp:Label>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_MasterCourse] WHERE [Master_ID] = @Master_ID" InsertCommand="INSERT INTO [OL_MasterCourse] ([MasterName], [ThisMasterSource], [Top_20_CRS], [Developer_SME], [Co_Developer_SME], [Status], [Notes], [Title], [Term_Offering], [Phase]) VALUES (@MasterName, @ThisMasterSource, @Top_20_CRS, @Developer_SME, @Co_Developer_SME, @Status, @Notes, @Title, @Term_Offering, @Phase)" SelectCommand="SELECT [MasterName], [ThisMasterSource], [Top_20_CRS], [Developer_SME], [Co_Developer_SME], [Status], [Notes], [Title], [Term_Offering], [Phase], [Master_ID] FROM [OL_MasterCourse] WHERE ([Master_ID] = @Master_ID)" UpdateCommand="UPDATE [OL_MasterCourse] SET [MasterName] = @MasterName, [ThisMasterSource] = @ThisMasterSource, [Top_20_CRS] = @Top_20_CRS, [Developer_SME] = @Developer_SME, [Co_Developer_SME] = @Co_Developer_SME, [Status] = @Status, [Notes] = @Notes, [Title] = @Title, [Term_Offering] = @Term_Offering, [Phase] = @Phase WHERE [Master_ID] = @Master_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Master_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MasterName" Type="String" />
                    <asp:Parameter Name="ThisMasterSource" Type="String" />
                    <asp:Parameter Name="Top_20_CRS" Type="Boolean" />
                    <asp:Parameter Name="Developer_SME" Type="String" />
                    <asp:Parameter Name="Co_Developer_SME" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Term_Offering" Type="String" />
                    <asp:Parameter Name="Phase" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="Master_ID" SessionField="Master_ID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MasterName" Type="String" />
                    <asp:Parameter Name="ThisMasterSource" Type="String" />
                    <asp:Parameter Name="Top_20_CRS" Type="Boolean" />
                    <asp:Parameter Name="Developer_SME" Type="String" />
                    <asp:Parameter Name="Co_Developer_SME" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Term_Offering" Type="String" />
                    <asp:Parameter Name="Phase" Type="String" />
                    <asp:Parameter Name="Master_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticUpdates="True" AutoGenerateColumns="False" AutoGenerateEditColumn="True" CellSpacing="-1" DataSourceID="SqlDataSource1" GridLines="Both" Skin="WebBlue">
                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <MasterTableView DataKeyNames="Master_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" ItemStyle-Width="450" SortExpression="Title" UniqueName="Title" >
                        </telerik:GridBoundColumn>

                        <telerik:GridCheckBoxColumn DataField="Top_20_CRS" DataType="System.Boolean" FilterControlAltText="Filter Top_20_CRS column" HeaderText="Top_20_CRS" SortExpression="Top_20_CRS" UniqueName="Top_20_CRS" >
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="Developer_SME" FilterControlAltText="Filter Developer_SME column" HeaderText="Developer_SME" SortExpression="Developer_SME" UniqueName="Developer_SME"  >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Co_Developer_SME" FilterControlAltText="Filter Co_Developer_SME column" HeaderText="Co_Developer_SME" SortExpression="Co_Developer_SME" UniqueName="Co_Developer_SME" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="Status" UniqueName="Status" >
                        </telerik:GridBoundColumn>


                        <telerik:GridBoundColumn DataField="Term_Offering" FilterControlAltText="Filter Term_Offering column" HeaderText="Term_Offering" SortExpression="Term_Offering" UniqueName="Term_Offering" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Phase" FilterControlAltText="Filter Phase column" HeaderText="Phase" SortExpression="Phase" UniqueName="Phase"  visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Master_ID" DataType="System.Int32" FilterControlAltText="Filter Master_ID column" HeaderText="Master_ID"  SortExpression="Master_ID" UniqueName="Master_ID" Visible="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ThisMasterSource" FilterControlAltText="Filter ThisMasterSource column" HeaderText="Content Sourse" SortExpression="ThisMasterSource" UniqueName="ThisMasterSource" >
                        </telerik:GridBoundColumn>

                        <telerik:GridTemplateColumn HeaderText="Notes" >
    <ItemTemplate>
       <%# Left(DataBinder.Eval(Container.DataItem, "Notes"), 20)%>
    </ItemTemplate>
    <EditItemTemplate>
    <telerik:RadEditor ID="Notes" runat="server" Content='<%# Bind("Notes") %>' BackColor="#66CCFF">
        <Tools>
            <telerik:EditorToolGroup>
                <telerik:EditorTool Name="Cut" />
                <telerik:EditorTool Name="Copy" />
                <telerik:EditorTool Name="Paste" />
            </telerik:EditorToolGroup>
        </Tools>
    </telerik:RadEditor>
</EditItemTemplate>
                            </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </asp:Panel>

    <p>
        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
        &nbsp;</p>

    </form>
    </body>
</html>
