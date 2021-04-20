<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Phases.aspx.vb" Inherits="RadDesigner.Phases" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
        }

body {
    font-family: Arial, Helvetica, sans-serif;
}
        .auto-style2 {
            font-size: small;
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
            <strong>
            <asp:Label ID="lblCourse" runat="server" CssClass="auto-style1"></asp:Label>
            </strong>
            <span class="auto-style1">&nbsp;</span></div>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" Width="950px" Font-Bold="False" Font-Names="Arial" AutoGenerateEditColumn="True" AllowAutomaticUpdates="True" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Phase_ID"  EditMode="EditForms">
                <Columns>
                    <telerik:GridBoundColumn DataField="Phase_ID" DataType="System.Int32" FilterControlAltText="Filter Phase_ID column" HeaderText="Phase_ID" SortExpression="Phase_ID" UniqueName="Phase_ID" Visible="true" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course" >
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="Level" FilterControlAltText="Filter Level column" HeaderText="Level" SortExpression="Level" UniqueName="Level">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Term87" FilterControlAltText="Filter Term87 column" HeaderText="Term87" SortExpression="Term87" UniqueName="Term87" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term93" FilterControlAltText="Filter Term93 column" HeaderText="Term93" SortExpression="Term93" UniqueName="Term93">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term95" FilterControlAltText="Filter Term95 column" HeaderText="Term95" SortExpression="Term95" UniqueName="Term95">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Term97" FilterControlAltText="Filter Term97 column" HeaderText="Term97" SortExpression="Term97" UniqueName="Term97">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term03" FilterControlAltText="Filter Term03 column" HeaderText="Term03" SortExpression="Term03" UniqueName="Term03">
                    </telerik:GridBoundColumn>

                </Columns>
            </MasterTableView>
            <GroupingSettings CaseSensitive="false" />
            <ActiveItemStyle Font-Names="Arial" Font-Size="Small" />
            <ItemStyle Font-Names="Arial" Font-Size="Small" />
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Phase_ID], [Course], [Term87], [Term93], [Term95], [Level], [Term97], [Term03] FROM [OL_MasterPhase] WHERE (([ID_ID] = @ID_ID) AND ([Course] = @Course)) ORDER BY [Course]" DeleteCommand="DELETE FROM [OL_MasterPhase] WHERE [Phase_ID] = @Phase_ID" InsertCommand="INSERT INTO [OL_MasterPhase] ([Course], [Term87], [Term93], [Term95], [Level], [Term97], [Term03]) VALUES (@Course, @Term87, @Term93, @Term95, @Level, @Term97, @Term03)" UpdateCommand="UPDATE [OL_MasterPhase] SET [Course] = @Course, [Term87] = @Term87, [Term93] = @Term93, [Term95] = @Term95, [Level] = @Level, [Term97] = @Term97, [Term03] = @Term03 WHERE [Phase_ID] = @Phase_ID">
            <DeleteParameters>
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Term87" Type="String" />
                <asp:Parameter Name="Term93" Type="String" />
                <asp:Parameter Name="Term95" Type="String" />
                <asp:Parameter Name="Level" Type="String" />
                <asp:Parameter Name="Term97" Type="String" />
                <asp:Parameter Name="Term03" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="ID_ID" SessionField="User_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="CIS2331" Name="Course" SessionField="course" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Term87" Type="String" />
                <asp:Parameter Name="Term93" Type="String" />
                <asp:Parameter Name="Term95" Type="String" />
                <asp:Parameter Name="Level" Type="String" />
                <asp:Parameter Name="Term97" Type="String" />
                <asp:Parameter Name="Term03" Type="String" />
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblPhase" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnVerify" runat="server" Text="Click to Verify Phase" BackColor="#66FF99" BorderColor="#99FFCC" Font-Bold="True" />
        &nbsp; 
        <br />
        <strong>Directions: </strong>If the phase for any of the terms listed is wrong, select the edit button and change the values.<br />
        You will also need to Click the Verify button above to indicate that the phase for this term is correct and has been verified by you.</form>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <strong><span class="auto-style2">Programmer Notes</span></strong><span class="auto-style2">: the method to track phases has shifted from uploading a master file of phases to allowing designers to manage phases,&nbsp; This table is the legacy data for phase history. It should be restructured to have a table linked to Master courses with individual records for each phase by term in a Phase History Table.</span></p>
</body>
</html>

