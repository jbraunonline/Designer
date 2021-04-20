<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MasterPhases.aspx.vb" Inherits="RadDesigner.MasterPhases" %>

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
    
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowSorting="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowFilteringByColumn="True" ShowGroupPanel="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowDragToGroup="True">
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Phase_ID" DataSourceID="SqlDataSource1"  EditMode="InPlace">
                <Columns>
                    <telerik:GridBoundColumn DataField="Phase_ID" DataType="System.Int32" FilterControlAltText="Filter Phase_ID column" HeaderText="Phase_ID" ReadOnly="True" SortExpression="Phase_ID" UniqueName="Phase_ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course" ReadOnly="true" ItemStyle-Font-Bold="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" SortExpression="Title" UniqueName="Title" ReadOnly="true" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Credits" DataType="System.Int32" FilterControlAltText="Filter Credits column" HeaderText="Credits" SortExpression="Credits" UniqueName="Credits" ReadOnly="true" Visible="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Level" FilterControlAltText="Filter Level column" HeaderText="Level" SortExpression="Level" UniqueName="Level"  ReadOnly="true" AllowFiltering="false" Visible="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Program" FilterControlAltText="Filter Program column" HeaderText="Program" SortExpression="Program" ReadOnly="true" UniqueName="Program"  AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term87" FilterControlAltText="Filter Term87 column" HeaderText="2187" SortExpression="Term87" UniqueName="Term87" ItemStyle-ForeColor="#993333" ItemStyle-Font-Bold="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term93" FilterControlAltText="Filter Term93 column" HeaderText="2193" SortExpression="Term93" UniqueName="Term93">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term95" FilterControlAltText="Filter Term95 column" HeaderText="2195" SortExpression="Term95" UniqueName="Term95">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DevFN" FilterControlAltText="Filter DevFN column" HeaderText="DevFN" SortExpression="DevFN" UniqueName="DevFN" ReadOnly="true" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DevLN" FilterControlAltText="Filter DevLN column" HeaderText="DevLN" SortExpression="DevLN" UniqueName="DevLN" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CoDevFN" FilterControlAltText="Filter CoDevFN column" HeaderText="CoDevFN" SortExpression="CoDevFN" UniqueName="CoDevFN" ReadOnly="true" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CoDevLN" FilterControlAltText="Filter CoDevLN column" HeaderText="CoDevLN" SortExpression="CoDevLN" UniqueName="CoDevLN" ReadOnly="true" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IDesg" FilterControlAltText="Filter IDesg column" HeaderText="IDesg" SortExpression="IDesg" UniqueName="IDesg" ReadOnly="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <HeaderStyle Font-Size="X-Small" />
            <ItemStyle Font-Names="Arial" Font-Size="Small" />
              <GroupingSettings CaseSensitive="false" />
        </telerik:RadGrid>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_MasterPhase] WHERE [Phase_ID] = @Phase_ID" InsertCommand="INSERT INTO [OL_MasterPhase] ([Course], [Title], [Credits], [Level], [Program], [Term87], [Term93], [Term95], [DevFN], [DevLN], [CoDevFN], [CoDevLN], [IDesg]) VALUES (@Course, @Title, @Credits, @Level, @Program, @Term87, @Term93, @Term95, @DevFN, @DevLN, @CoDevFN, @CoDevLN, @IDesg)" SelectCommand="SELECT * FROM [OL_MasterPhase] ORDER BY [Course]" UpdateCommand="UPDATE [OL_MasterPhase] SET [Course] = @Course, [Title] = @Title, [Credits] = @Credits, [Level] = @Level, [Program] = @Program, [Term87] = @Term87, [Term93] = @Term93, [Term95] = @Term95, [DevFN] = @DevFN, [DevLN] = @DevLN, [CoDevFN] = @CoDevFN, [CoDevLN] = @CoDevLN, [IDesg] = @IDesg WHERE [Phase_ID] = @Phase_ID">
            <DeleteParameters>
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Credits" Type="Int32" />
                <asp:Parameter Name="Level" Type="String" />
                <asp:Parameter Name="Program" Type="String" />
                <asp:Parameter Name="Term87" Type="String" />
                <asp:Parameter Name="Term93" Type="String" />
                <asp:Parameter Name="Term95" Type="String" />
                <asp:Parameter Name="DevFN" Type="String" />
                <asp:Parameter Name="DevLN" Type="String" />
                <asp:Parameter Name="CoDevFN" Type="String" />
                <asp:Parameter Name="CoDevLN" Type="String" />
                <asp:Parameter Name="IDesg" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Credits" Type="Int32" />
                <asp:Parameter Name="Level" Type="String" />
                <asp:Parameter Name="Program" Type="String" />
                <asp:Parameter Name="Term87" Type="String" />
                <asp:Parameter Name="Term93" Type="String" />
                <asp:Parameter Name="Term95" Type="String" />
                <asp:Parameter Name="DevFN" Type="String" />
                <asp:Parameter Name="DevLN" Type="String" />
                <asp:Parameter Name="CoDevFN" Type="String" />
                <asp:Parameter Name="CoDevLN" Type="String" />
                <asp:Parameter Name="IDesg" Type="String" />
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
