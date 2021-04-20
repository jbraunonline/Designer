<%@ Page Language="vb" AutoEventWireup="false"  MaintainScrollPositionOnPostback="true" CodeBehind="PhaseReport.aspx.vb"  Inherits="RadDesigner.PhaseReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
               <script "javascript">
var popupWindow = null;
function centeredPopup(url,winName,w,h,scroll){
LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
settings =
'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
popupWindow = window.open(url,winName,settings)
}
</script>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: xx-large;
            font-family: Arial, Helvetica, sans-serif;
        }
        body {
    font-family: Arial, Helvetica, sans-serif;
}
           div.RadGrid
        {
            margin-left: auto !important;
            margin-right: auto !important;
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
    
        <span class="auto-style2"><strong>Phase Report</strong></span><br />
        <asp:Button ID="Button1" runat="server" BorderColor="#CC0000" BorderWidth="2px" Text="Close Window" />
        </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowGroupPanel="True" AutoGenerateEditColumn="True" Skin="WebBlue" AllowAutomaticUpdates="True" Width="1000px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowDragToGroup="True">
            </ClientSettings>
            <MasterTableView DataKeyNames="Phase_ID" DataSourceID="SqlDataSource1"    CommandItemDisplay="Top" >
                <CommandItemSettings ShowAddNewRecordButton="False" ShowRefreshButton="true" />
                <Columns>
                    <telerik:GridBoundColumn DataField="Phase_ID" DataType="System.Int32" FilterControlAltText="Filter Phase_ID column" HeaderText="Phase_ID" ReadOnly="True" SortExpression="Phase_ID" UniqueName="Phase_ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term87" FilterControlAltText="Filter Term87 column" HeaderText="Term87" SortExpression="Term87" UniqueName="Term87">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term93" FilterControlAltText="Filter Term93 column" HeaderText="Term93" SortExpression="Term93" UniqueName="Term93">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term95" FilterControlAltText="Filter Term95 column" HeaderText="Term95" SortExpression="Term95" UniqueName="Term95">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IDesg" FilterControlAltText="Filter IDesg column" HeaderText="IDesg" SortExpression="IDesg" UniqueName="IDesg">
                    </telerik:GridBoundColumn>

                </Columns>
            </MasterTableView>
              <GroupingSettings CaseSensitive="false" />
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Phase_ID], [Course], [Term87], [Term93], [Term95], [IDesg] FROM [OL_MasterPhase]" DeleteCommand="DELETE FROM [OL_MasterPhase] WHERE [Phase_ID] = @Phase_ID" InsertCommand="INSERT INTO [OL_MasterPhase] ([Course], [Term87], [Term93], [Term95], [IDesg]) VALUES (@Course, @Term87, @Term93, @Term95, @IDesg)" UpdateCommand="UPDATE [OL_MasterPhase] SET [Course] = @Course, [Term87] = @Term87, [Term93] = @Term93, [Term95] = @Term95, [IDesg] = @IDesg WHERE [Phase_ID] = @Phase_ID">
            <DeleteParameters>
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Term87" Type="String" />
                <asp:Parameter Name="Term93" Type="String" />
                <asp:Parameter Name="Term95" Type="String" />
                <asp:Parameter Name="IDesg" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Term87" Type="String" />
                <asp:Parameter Name="Term93" Type="String" />
                <asp:Parameter Name="Term95" Type="String" />
                <asp:Parameter Name="IDesg" Type="String" />
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
