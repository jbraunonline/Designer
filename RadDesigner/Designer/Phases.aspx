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
        <telerik:RadGrid ID="RadGrid2" runat="server" AllowAutomaticUpdates="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource2" Skin="WebBlue" Width="800px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Phase_ID" DataSourceID="SqlDataSource2">
                        <EditFormSettings>
                            <EditColumn ButtonType="PushButton"></EditColumn>
                        </EditFormSettings>
                <Columns>
                    <telerik:GridBoundColumn DataField="Phase_ID" DataType="System.Int32" FilterControlAltText="Filter Phase_ID column" HeaderText="Phase_ID" ReadOnly="True" SortExpression="Phase_ID" UniqueName="Phase_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2187" FilterControlAltText="Filter T_2187 column" HeaderText="T_2187" SortExpression="T_2187" UniqueName="T_2187">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2193" FilterControlAltText="Filter T_2193 column" HeaderText="T_2193" SortExpression="T_2193" UniqueName="T_2193">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2195" FilterControlAltText="Filter T_2195 column" HeaderText="T_2195" SortExpression="T_2195" UniqueName="T_2195">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2197" FilterControlAltText="Filter T_2197 column" HeaderText="T_2197" SortExpression="T_2197" UniqueName="T_2197">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2203" FilterControlAltText="Filter T_2203 column" HeaderText="T_2203" SortExpression="T_2203" UniqueName="T_2203">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2205" FilterControlAltText="Filter T_2205 column" HeaderText="T_2205" SortExpression="T_2205" UniqueName="T_2205">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2207" FilterControlAltText="Filter T_2207 column" HeaderText="T_2207" SortExpression="T_2207" UniqueName="T_2207">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2213" FilterControlAltText="Filter T_2213 column" HeaderText="T_2213" SortExpression="T_2213" UniqueName="T_2213">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2215" FilterControlAltText="Filter T_2215 column" HeaderText="T_2215" SortExpression="T_2215" UniqueName="T_2215">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Phase_ID], [T_2187], [T_2193], [T_2195], [T_2197], [T_2203], [T_2205], [T_2207], [Course] FROM [OL_MasterPhase] WHERE ([Course] = @Course)" DeleteCommand="DELETE FROM [OL_MasterPhase] WHERE [Phase_ID] = @Phase_ID" InsertCommand="INSERT INTO [OL_MasterPhase] ([T_2187], [T_2193], [T_2195], [T_2197], [T_2203], [T_2205], [T_2207], [Course]) VALUES (@T_2187, @T_2193, @T_2195, @T_2197, @T_2203, @T_2205, @T_2207, @Course)" UpdateCommand="UPDATE [OL_MasterPhase] SET [T_2187] = @T_2187, [T_2193] = @T_2193, [T_2195] = @T_2195, [T_2197] = @T_2197, [T_2203] = @T_2203, [T_2205] = @T_2205, [T_2207] = @T_2207, [Course] = @Course WHERE [Phase_ID] = @Phase_ID">
            <DeleteParameters>
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="T_2187" Type="String" />
                <asp:Parameter Name="T_2193" Type="String" />
                <asp:Parameter Name="T_2195" Type="String" />
                <asp:Parameter Name="T_2197" Type="String" />
                <asp:Parameter Name="T_2203" Type="String" />
                <asp:Parameter Name="T_2205" Type="String" />
                <asp:Parameter Name="T_2207" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="BUL4461" Name="Course" SessionField="Course" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="T_2187" Type="String" />
                <asp:Parameter Name="T_2193" Type="String" />
                <asp:Parameter Name="T_2195" Type="String" />
                <asp:Parameter Name="T_2197" Type="String" />
                <asp:Parameter Name="T_2203" Type="String" />
                <asp:Parameter Name="T_2205" Type="String" />
                <asp:Parameter Name="T_2207" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblPhase" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnVerify" runat="server" Text="Click to Verify Phase" BackColor="#66FF99" BorderColor="#99FFCC" Font-Bold="True" />
        &nbsp; 
        <br />
        <strong>Directions: </strong>If the phase for any of the terms listed is wrong, select the edit button and change the values.<br />
        You will also need to Click the Verify button above to indicate that the phase for this term is correct and has been verified by you.<p>
&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_MasterPhase] WHERE [Phase_ID] = @Phase_ID" InsertCommand="INSERT INTO [OL_MasterPhase] ([Course], [T_2187], [T_2193], [T_2195], [T_2197], [T_2203], [T_2205], [T_2207]) VALUES (@Course, @T_2187, @T_2193, @T_2195, @T_2197, @T_2203, @T_2205, @T_2207)" SelectCommand="SELECT [Phase_ID], [Course], [T_2187], [T_2193], [T_2195], [T_2197], [T_2203], [T_2205], [T_2207], [T_2213], [T_2215] FROM [OL_MasterPhase] WHERE ([Course] = @Course)" UpdateCommand="UPDATE [OL_MasterPhase] SET [Course] = @Course, [T_2187] = @T_2187, [T_2193] = @T_2193, [T_2195] = @T_2195, [T_2197] = @T_2197, [T_2203] = @T_2203, [T_2205] = @T_2205, [T_2207] = @T_2207,[T_2213] = @T_2213 ,[T_2215] = @T_2215   WHERE [Phase_ID] = @Phase_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Phase_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Course" Type="String" />
                    <asp:Parameter Name="T_2187" Type="String" />
                    <asp:Parameter Name="T_2193" Type="String" />
                    <asp:Parameter Name="T_2195" Type="String" />
                    <asp:Parameter Name="T_2197" Type="String" />
                    <asp:Parameter Name="T_2203" Type="String" />
                    <asp:Parameter Name="T_2205" Type="String" />
                    <asp:Parameter Name="T_2207" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="BUL4444" Name="Course" SessionField="Course" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Course" Type="String" />
                    <asp:Parameter Name="T_2187" Type="String" />
                    <asp:Parameter Name="T_2193" Type="String" />
                    <asp:Parameter Name="T_2195" Type="String" />
                    <asp:Parameter Name="T_2197" Type="String" />
                    <asp:Parameter Name="T_2203" Type="String" />
                    <asp:Parameter Name="T_2205" Type="String" />
                    <asp:Parameter Name="T_2207" Type="String" />
                    <asp:Parameter Name="T_2213" Type="String" />
                    <asp:Parameter Name="T_2215" Type="String" />
                    <asp:Parameter Name="Phase_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    </form>
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

