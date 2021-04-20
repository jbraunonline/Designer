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
        <br />
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Skin="WebBlue" Width="900px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Phase_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="Phase_ID" DataType="System.Int32" FilterControlAltText="Filter Phase_ID column" HeaderText="Phase_ID" ReadOnly="True" SortExpression="Phase_ID" UniqueName="Phase_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2187" FilterControlAltText="Filter T_2187 column" HeaderText="T_2187" SortExpression="T_2187" UniqueName="T_2187">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2193" FilterControlAltText="Filter T_2193 column" HeaderText="T_2193" SortExpression="T_2193" UniqueName="T_2193">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2195" FilterControlAltText="Filter T_2195 column" HeaderText="T_2195" SortExpression="T_2195" UniqueName="T_2195">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2197" FilterControlAltText="Filter T_2197 column" HeaderText="T_2197" SortExpression="T_2197" UniqueName="T_2197">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2103" FilterControlAltText="Filter T_2103 column" HeaderText="T_2103" SortExpression="T_2103" UniqueName="T_2103">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2105" FilterControlAltText="Filter T_2105 column" HeaderText="T_2105" SortExpression="T_2105" UniqueName="T_2105">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2107" FilterControlAltText="Filter T_2107 column" HeaderText="T_2107" SortExpression="T_2107" UniqueName="T_2107">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Phase_ID], [T_2187], [T_2193], [T_2195], [T_2197], [T_2103], [T_2105], [T_2107] FROM [OL_MasterPhase] WHERE (([ID_ID] = @ID_ID) AND ([Course] = @Course))" DeleteCommand="DELETE FROM [OL_MasterPhase] WHERE [Phase_ID] = @Phase_ID" InsertCommand="INSERT INTO [OL_MasterPhase] ([T_2187], [T_2193], [T_2195], [T_2197], [T_2103], [T_2105], [T_2107]) VALUES (@T_2187, @T_2193, @T_2195, @T_2197, @T_2103, @T_2105, @T_2107)" UpdateCommand="UPDATE [OL_MasterPhase] SET [T_2187] = @T_2187, [T_2193] = @T_2193, [T_2195] = @T_2195, [T_2197] = @T_2197, [T_2103] = @T_2103, [T_2105] = @T_2105, [T_2107] = @T_2107 WHERE [Phase_ID] = @Phase_ID">
            <DeleteParameters>
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="T_2187" Type="String" />
                <asp:Parameter Name="T_2193" Type="String" />
                <asp:Parameter Name="T_2195" Type="String" />
                <asp:Parameter Name="T_2197" Type="String" />
                <asp:Parameter Name="T_2103" Type="String" />
                <asp:Parameter Name="T_2105" Type="String" />
                <asp:Parameter Name="T_2107" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="100" Name="ID_ID" SessionField="User_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="CIS2331" Name="Course" SessionField="Course" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="T_2187" Type="String" />
                <asp:Parameter Name="T_2193" Type="String" />
                <asp:Parameter Name="T_2195" Type="String" />
                <asp:Parameter Name="T_2197" Type="String" />
                <asp:Parameter Name="T_2103" Type="String" />
                <asp:Parameter Name="T_2105" Type="String" />
                <asp:Parameter Name="T_2107" Type="String" />
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

