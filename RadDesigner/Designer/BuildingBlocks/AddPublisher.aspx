<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddPublisher.aspx.vb" Inherits="RadDesigner.AddPublisher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
    font-family: Arial, Helvetica, sans-serif;
}

        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            width: 800px;
            border-style: solid;
            border-width: 1px;
        }
        .auto-style3 {
            height: 130px;
        }
        table {
  width: 800px;
}

td {
  vertical-align: top;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
            <span class="auto-style1"><strong>System Wide Building Blocks</strong></span><br />
            <br />
            <asp:Button ID="btnNewPubPanel" runat="server" Font-Bold="True" Text="Add New Publisher" BorderColor="#33CC33" BorderWidth="3px" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnNewBlockPanel" runat="server" Font-Bold="True" Text="Add/Edit Building Blocks For Puslisher" BorderColor="#00CC00" BorderWidth="3px" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnReturn" runat="server" Font-Bold="True" Text="Return to Building Block Report" BorderColor="#33CCCC" BorderWidth="3px" />
            <br />
        </div>
        <asp:Panel ID="pnlNewPub" runat="server" Visible="False">
            <br />
            <br />
            <table class="auto-style2">
                <tr>
                    <td class="auto-style3"><strong><span class="auto-style1">Add a New Publisher</span></strong><br /> Name of New Publisher<br />
                        <asp:TextBox ID="txtNewPublisher" runat="server" BackColor="#CCFFFF" Width="345px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="Button4" runat="server" BorderColor="#33CCCC" BorderWidth="3px" Text="Add This Publisher" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button5" runat="server" BorderColor="#CC0000" BorderWidth="2px" Text="Exit Adding Publisher Function" />
                        <br />
                        Duplicate Publishers will not be added.<br />
                        <asp:Label ID="lblNewPublisher" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="That Publisher already exists!" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style3"><strong>Current Publishers</strong><br />
                        <asp:ListBox ID="ListBox1" runat="server" BackColor="#CCFFFF" Height="344px"></asp:ListBox>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Publisher] FROM [OL_BBlock_Publisher] ORDER BY [Publisher]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
        </asp:Panel>
        <asp:Panel ID="pnlBuildingBlock" runat="server" Visible="False">
            <span class="auto-style1"><strong>
            <br />
            Add a Publisher Building Block</strong></span><br />
            <br />
            1. Select a Publisher:
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataTextField="Publisher" DataValueField="Pub_ID">
            </asp:DropDownList>
            &nbsp;<br />
            <br />
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticInserts="True" OnItemDataBound="RadGrid1_ItemDataBound" AllowAutomaticUpdates="True" AutoGenerateEditColumn="False" DataSourceID="SqlDataSource2" Skin="WebBlue" Visible="False" Width="800px">
                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="Obj_ID" DataSourceID="SqlDataSource2" CommandItemDisplay="Top">
                         <CommandItemTemplate>
          <asp:Button ID="Button1" Text="Add new item" runat="server" CommandName="InitInsert">
          </asp:Button>
      </CommandItemTemplate>
                     <CommandItemSettings ShowExportToExcelButton="False" ShowAddNewRecordButton="true" ShowRefreshButton="false" />
                                            <EditFormSettings>
                            <EditColumn ButtonType="PushButton"></EditColumn>
                        </EditFormSettings>
                    <Columns>
                        <telerik:GridBoundColumn DataField="Obj_ID" DataType="System.Int32" FilterControlAltText="Filter Obj_ID column" HeaderText="Obj_ID" ReadOnly="True" SortExpression="Obj_ID" UniqueName="Obj_ID" Visible ="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Pub_ID" DataType="System.Int32" FilterControlAltText="Filter Pub_ID column" HeaderText="Pub_ID" SortExpression="Pub_ID" UniqueName="Pub_ID" Visible ="false">
                        </telerik:GridBoundColumn>

                       
  


                        <telerik:GridBoundColumn DataField="BBName" FilterControlAltText="Filter BBName column" HeaderText="BBName" SortExpression="BBName" UniqueName="BBName">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="BBObjVis" DataType="System.Boolean" FilterControlAltText="Filter BBObjVis column" HeaderText="Visibility chk=true" SortExpression="BBObjVis" UniqueName="BBObjVis">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn"  ButtonType="PushButton" ItemStyle-ForeColor="YellowGreen">
                    </telerik:GridEditCommandColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_BBlock_Objects] WHERE [Obj_ID] = @Obj_ID" InsertCommand="INSERT INTO [OL_BBlock_Objects] ([Pub_ID], [BBName], [BBObjVis]) VALUES (@Pub_ID, @BBName, @BBObjVis)" SelectCommand="SELECT [Obj_ID], [Pub_ID], [BBName], [BBObjVis] FROM [OL_BBlock_Objects] WHERE ([Pub_ID] = @Pub_ID)" UpdateCommand="UPDATE [OL_BBlock_Objects] SET [Pub_ID] = @Pub_ID, [BBName] = @BBName, [BBObjVis] = @BBObjVis WHERE [Obj_ID] = @Obj_ID">
            <DeleteParameters>
                <asp:Parameter Name="Obj_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Pub_ID" Type="Int32" />
                <asp:Parameter Name="BBName" Type="String" />
                <asp:Parameter Name="BBObjVis" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="2" Name="Pub_ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Pub_ID" Type="Int32" />
                <asp:Parameter Name="BBName" Type="String" />
                <asp:Parameter Name="BBObjVis" Type="Boolean" />
                <asp:Parameter Name="Obj_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
