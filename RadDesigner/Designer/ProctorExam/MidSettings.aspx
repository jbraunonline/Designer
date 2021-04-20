<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MidSettings.aspx.vb" Inherits="RadDesigner.MidSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .fieldset-auto-width {
         display: inline-block;
        }
        .auto-style1 {
            font-size: x-large;
        }


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
        <span class="auto-style1"><strong>Mid Term Proctored Exam for 
        </strong></span><strong>
        <asp:Label ID="lblMasterCourse" runat="server" CssClass="auto-style1"></asp:Label>
        </strong>&nbsp;<telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" DataSourceID="SqlDataSource1" GridLines="Both" Skin="WebBlue" AllowAutomaticUpdates="True" AutoGenerateEditColumn="True" Width="1000px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Exam_ID" DataSourceID="SqlDataSource1">

 
                        <EditFormSettings>
                            <EditColumn ButtonType="PushButton"></EditColumn>
                        </EditFormSettings>
                <Columns>
                      <telerik:GridBoundColumn DataField="Exam_ID" DataType="System.Int32" FilterControlAltText="Filter Exam_ID column" HeaderText="Exam_ID" ReadOnly="True" SortExpression="Exam_ID" UniqueName="Exam_ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_EXISTS" DataType="System.Boolean" FilterControlAltText="Filter PM_EXISTS column" HeaderText="Mid EXISTS" SortExpression="PM_EXISTS" UniqueName="PM_EXISTS">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PM_DURATION" DataType="System.Int32" FilterControlAltText="Filter PM_DURATION column" HeaderText="DURATION" SortExpression="PM_DURATION" UniqueName="PM_DURATION">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_MG" DataType="System.Boolean" FilterControlAltText="Filter PM_MG column" HeaderText="Manual Grade" SortExpression="PM_MG" UniqueName="PM_MG">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_MG_FB" DataType="System.Boolean" FilterControlAltText="Filter PM_MG_FB column" HeaderText="Fill-in-Blank" SortExpression="PM_MG_FB" UniqueName="PM_MG_FB" Visible="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_MG_ES" DataType="System.Boolean" FilterControlAltText="Filter PM_MG_ES column" HeaderText="Essay" SortExpression="PM_MG_ES" UniqueName="PM_MG_ES"  Visible="true">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_MG_SA" DataType="System.Boolean" FilterControlAltText="Filter PM_MG_SA column" HeaderText="Short Answ" SortExpression="PM_MG_SA" UniqueName="PM_MG_SA" Visible="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PM_MG_OTHER" FilterControlAltText="Filter PM_MG_OTHER column" HeaderText="OTHER Manaul Grade" SortExpression="PM_MG_OTHER" UniqueName="MG_OTHER"  Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_REQ_ANX" DataType="System.Boolean" FilterControlAltText="Filter PM_REQ_ANX column" HeaderText="Requires ANX materials" SortExpression="PM_REQ_ANX" UniqueName="PM_REQ_ANX">
                    </telerik:GridCheckBoxColumn>
                     <telerik:GridBoundColumn DataField="PM_LIST_ANXMTRLS" FilterControlAltText="Filter PM_LIST_ANXMTRLS column" HeaderText="PM_LIST_ANXMTRLS" SortExpression="PM_LIST_ANXMTRLS" UniqueName="PM_LIST_ANXMTRLS" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_LIST_MTRLS_OPT1" DataType="System.Boolean" FilterControlAltText="Filter PM_LIST_MTRLS_OPT1 column" HeaderText="Paper/Pen" SortExpression="PM_LIST_MTRLS_OPT1" UniqueName="PM_LIST_MTRLS_OPT1">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_LIST_MTRLS_OPT2" DataType="System.Boolean" FilterControlAltText="Filter PM_LIST_MTRLS_OPT2 column" HeaderText="Basic Calc" SortExpression="PM_LIST_MTRLS_OPT2" UniqueName="PM_LIST_MTRLS_OPT2">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_LIST_MTRLS_OPT3" DataType="System.Boolean" FilterControlAltText="Filter PM_LIST_MTRLS_OPT3 column" HeaderText="Graph Calc" SortExpression="PM_LIST_MTRLS_OPT3" UniqueName="PM_LIST_MTRLS_OPT3">
                    </telerik:GridCheckBoxColumn>                    
                    <telerik:GridBoundColumn DataField="PM_WEIGHT" FilterControlAltText="Filter PM_WEIGHT column" HeaderText="WEIGHT" SortExpression="PM_WEIGHT" UniqueName="PM_WEIGHT">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PM_RMT_NAME" FilterControlAltText="Filter PM_RMT_NAME column" HeaderText="RMT NAME" SortExpression="PM_RMT_NAME" UniqueName="PM_RMT_NAME" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PM_LCL_NAME" FilterControlAltText="Filter PM_LCL_NAME column" HeaderText="LCL NAME" SortExpression="PM_LCL_NAME" UniqueName="PM_LCL_NAME" Visible="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridCheckBoxColumn DataField="MLD_Verified" DataType="System.Boolean" FilterControlAltText="Filter MLD_Verified column" HeaderText="Verified" SortExpression="MLD_Verified" UniqueName="MLD_Verified" ReadOnly="true" Visible="False">
                    </telerik:GridCheckBoxColumn>
                </Columns>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" Font-Size="Small" />
        </telerik:RadGrid>
        The values entered here will be used to setup the proctored exams for all mastercourses.<br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_MasterExam] WHERE [Exam_ID] = @Exam_ID" InsertCommand="INSERT INTO [OL_MasterExam] ([PM_EXISTS], [PM_DURATION], [PM_MG], [PM_MG_FB], [PM_MG_ES], [PM_MG_SA], [PM_MG_OTHER], [PM_REQ_ANX], [PM_LIST_MTRLS_OPT1], [PM_WEIGHT], [PM_RMT_NAME], [PM_LCL_NAME], [PM_LIST_ANXMTRLS], [PM_LIST_MTRLS_OPT2], [PM_LIST_MTRLS_OPT3], [MLD_Verified]) VALUES (@PM_EXISTS, @PM_DURATION, @PM_MG, @PM_MG_FB, @PM_MG_ES, @PM_MG_SA, @PM_MG_OTHER, @PM_REQ_ANX, @PM_LIST_MTRLS_OPT1, @PM_WEIGHT, @PM_RMT_NAME, @PM_LCL_NAME, @PM_LIST_ANXMTRLS, @PM_LIST_MTRLS_OPT2, @PM_LIST_MTRLS_OPT3, @MLD_Verified)" SelectCommand="SELECT [Exam_ID], [PM_EXISTS], [PM_DURATION], [PM_MG], [PM_MG_FB], [PM_MG_ES], [PM_MG_SA], [PM_MG_OTHER], [PM_REQ_ANX], [PM_LIST_MTRLS_OPT1], [PM_WEIGHT], [PM_RMT_NAME], [PM_LCL_NAME], [PM_LIST_ANXMTRLS], [PM_LIST_MTRLS_OPT2], [PM_LIST_MTRLS_OPT3], [MLD_Verified] FROM [OL_MasterExam] WHERE ([MasterName] = @MasterName)" UpdateCommand="UPDATE [OL_MasterExam] SET [PM_EXISTS] = @PM_EXISTS, [PM_DURATION] = @PM_DURATION, [PM_MG] = @PM_MG, [PM_MG_FB] = @PM_MG_FB, [PM_MG_ES] = @PM_MG_ES, [PM_MG_SA] = @PM_MG_SA, [PM_MG_OTHER] = @PM_MG_OTHER, [PM_REQ_ANX] = @PM_REQ_ANX, [PM_LIST_MTRLS_OPT1] = @PM_LIST_MTRLS_OPT1, [PM_WEIGHT] = @PM_WEIGHT, [PM_RMT_NAME] = @PM_RMT_NAME, [PM_LCL_NAME] = @PM_LCL_NAME, [PM_LIST_ANXMTRLS] = @PM_LIST_ANXMTRLS, [PM_LIST_MTRLS_OPT2] = @PM_LIST_MTRLS_OPT2, [PM_LIST_MTRLS_OPT3] = @PM_LIST_MTRLS_OPT3, [MLD_Verified] = @MLD_Verified WHERE [Exam_ID] = @Exam_ID">
            <DeleteParameters>
                <asp:Parameter Name="Exam_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PM_EXISTS" Type="Boolean" />
                <asp:Parameter Name="PM_DURATION" Type="Int32" />
                <asp:Parameter Name="PM_MG" Type="Boolean" />
                <asp:Parameter Name="PM_MG_FB" Type="Boolean" />
                <asp:Parameter Name="PM_MG_ES" Type="Boolean" />
                <asp:Parameter Name="PM_MG_SA" Type="Boolean" />
                <asp:Parameter Name="PM_MG_OTHER" Type="String" />
                <asp:Parameter Name="PM_REQ_ANX" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT1" Type="Boolean" />
                <asp:Parameter Name="PM_WEIGHT" Type="String" />
                <asp:Parameter Name="PM_RMT_NAME" Type="String" />
                <asp:Parameter Name="PM_LCL_NAME" Type="String" />
                <asp:Parameter Name="PM_LIST_ANXMTRLS" Type="String" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT2" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT3" Type="Boolean" />
                <asp:Parameter Name="MLD_Verified" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="2197_AMH2010_MC_VC" Name="MasterName" SessionField="MasterCourse" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="PM_EXISTS" Type="Boolean" />
                <asp:Parameter Name="PM_DURATION" Type="Int32" />
                <asp:Parameter Name="PM_MG" Type="Boolean" />
                <asp:Parameter Name="PM_MG_FB" Type="Boolean" />
                <asp:Parameter Name="PM_MG_ES" Type="Boolean" />
                <asp:Parameter Name="PM_MG_SA" Type="Boolean" />
                <asp:Parameter Name="PM_MG_OTHER" Type="String" />
                <asp:Parameter Name="PM_REQ_ANX" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT1" Type="Boolean" />
                <asp:Parameter Name="PM_WEIGHT" Type="String" />
                <asp:Parameter Name="PM_RMT_NAME" Type="String" DefaultValue=" " />
                <asp:Parameter Name="PM_LCL_NAME" Type="String"  DefaultValue=" " />
                <asp:Parameter Name="PM_LIST_ANXMTRLS" Type="String" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT2" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT3" Type="Boolean" />
                <asp:Parameter Name="MLD_Verified" Type="Boolean" />
                <asp:Parameter Name="Exam_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
&nbsp;<asp:Button ID="btnSave" runat="server" Text="Save Data on this page." Visible="False" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdate" runat="server" Text="Update Page Data" Visible="False" />
&nbsp;&nbsp;
        </form> 
</body>
</html>


