<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FinSettings.aspx.vb" Inherits="RadDesigner.FinSettings" %>

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
        <span class="auto-style1"><strong>Final Proctored Exam for 
        </strong></span><strong>
        <asp:Label ID="lblMasterCourse" runat="server" CssClass="auto-style1"></asp:Label>
        </strong>&nbsp;<telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" DataSourceID="SqlDataSource1" GridLines="Both" Skin="WebBlue" AllowAutomaticUpdates="True" AutoGenerateEditColumn="True" Width="1000px" AllowCustomPaging="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Exam_ID" DataSourceID="SqlDataSource1">
                <Columns>
                      <telerik:GridBoundColumn DataField="Exam_ID" DataType="System.Int32" FilterControlAltText="Filter Exam_ID column" HeaderText="Exam_ID" ReadOnly="True" SortExpression="Exam_ID" UniqueName="Exam_ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_EXISTS" DataType="System.Boolean" FilterControlAltText="Filter PF_EXISTS column" HeaderText="Is Final" SortExpression="PF_EXISTS" UniqueName="PF_EXISTS">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PF_DURATION" DataType="System.Int32" FilterControlAltText="Filter PF_DURATION column" HeaderText="Duration" SortExpression="PF_DURATION" UniqueName="PF_DURATION">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_MG" DataType="System.Boolean" FilterControlAltText="Filter PF_MG column" HeaderText="Manual Grading" SortExpression="PF_MG" UniqueName="PF_MG">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_MG_FB" DataType="System.Boolean" FilterControlAltText="Filter PF_MG_FB column" HeaderText="Fill-in-Blank" SortExpression="PF_MG_FB" UniqueName="PF_MG_FB" Visible="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_MG_ES" DataType="System.Boolean" FilterControlAltText="Filter PF_MG_ES column" HeaderText="Essay" SortExpression="PF_MG_ES" UniqueName="PF_MG_ES" Visible="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_MG_SA" DataType="System.Boolean" FilterControlAltText="Filter PF_MG_SA column" HeaderText="Short Answer" SortExpression="PF_MG_SA" UniqueName="PF_MG_SA" Visible="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PF_MG_OTHER" FilterControlAltText="Filter PF_MG_OTHER column" HeaderText="MG OTHER" SortExpression="PF_MG_OTHER" UniqueName="PF_MG_OTHER" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_REQ_ANX" DataType="System.Boolean" FilterControlAltText="Filter PF_REQ_ANX column" HeaderText="REQ ANX" SortExpression="PF_REQ_ANX" UniqueName="PF_REQ_ANX">
                    </telerik:GridCheckBoxColumn>
                     <telerik:GridBoundColumn DataField="PF_LIST_ANXMTRLS" FilterControlAltText="Filter PF_LIST_ANXMTRLS column" HeaderText="PF_LIST_ANXMTRLS" SortExpression="PF_LIST_ANXMTRLS" UniqueName="PF_LIST_ANXMTRLS"  Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_LIST_MTRLS_OPT1" DataType="System.Boolean" FilterControlAltText="Filter PF_LIST_MTRLS_OPT1 column" HeaderText="Paper/Pen" SortExpression="PF_LIST_MTRLS_OPT1" UniqueName="PF_LIST_MTRLS_OPT1">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_LIST_MTRLS_OPT2" DataType="System.Boolean" FilterControlAltText="Filter PF_LIST_MTRLS_OPT2 column" HeaderText="Basic Calc" SortExpression="PF_LIST_MTRLS_OPT2" UniqueName="PF_LIST_MTRLS_OPT2">
                    </telerik:GridCheckBoxColumn>                    

                    <telerik:GridCheckBoxColumn DataField="PF_LIST_MTRLS_OPT3" DataType="System.Boolean" FilterControlAltText="Filter PF_LIST_MTRLS_OPT3 column" HeaderText="Graph Calc" SortExpression="PF_LIST_MTRLS_OPT3" UniqueName="PF_LIST_MTRLS_OPT3">
                    </telerik:GridCheckBoxColumn>

                    <telerik:GridBoundColumn DataField="PF_LCL_NAME" FilterControlAltText="Filter PF_LCL_NAME column" HeaderText="PF_LCL_NAME" SortExpression="PF_LCL_NAME" UniqueName="PF_LCL_NAME" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PF_RMT_NAME" FilterControlAltText="Filter PF_RMT_NAME column" HeaderText="PF_RMT_NAME" SortExpression="PF_RMT_NAME" UniqueName="PF_RMT_NAME" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PF_WEIGHT" FilterControlAltText="Filter PF_WEIGHT column" HeaderText="PF_WEIGHT" SortExpression="PF_WEIGHT" UniqueName="PF_WEIGHT">
                    </telerik:GridBoundColumn>

                    <telerik:GridCheckBoxColumn DataField="FIN_Verified" DataType="System.Boolean" FilterControlAltText="Filter FIN_Verified column" HeaderText="FIN_Verified" SortExpression="FIN_Verified" UniqueName="FIN_Verified"  ReadOnly="true" Visible="False">
                    </telerik:GridCheckBoxColumn>
                </Columns>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" Font-Size="Small" />
        </telerik:RadGrid>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_MasterExam] WHERE [Exam_ID] = @Exam_ID" InsertCommand="INSERT INTO [OL_MasterExam] ([PF_EXISTS], [PF_DURATION], [PF_MG], [PF_MG_FB], [PF_MG_ES], [PF_MG_SA], [PF_MG_OTHER], [PF_REQ_ANX], [PF_LIST_MTRLS_OPT1], [PF_LIST_MTRLS_OPT2], [PF_LIST_MTRLS_OPT3], [PF_LIST_ANXMTRLS], [PF_LCL_NAME], [PF_RMT_NAME], [PF_WEIGHT], [FIN_Verified]) VALUES (@PF_EXISTS, @PF_DURATION, @PF_MG, @PF_MG_FB, @PF_MG_ES, @PF_MG_SA, @PF_MG_OTHER, @PF_REQ_ANX, @PF_LIST_MTRLS_OPT1, @PF_LIST_MTRLS_OPT2, @PF_LIST_MTRLS_OPT3, @PF_LIST_ANXMTRLS, @PF_LCL_NAME, @PF_RMT_NAME, @PF_WEIGHT, @FIN_Verified)" SelectCommand="SELECT [Exam_ID], [PF_EXISTS], [PF_DURATION], [PF_MG], [PF_MG_FB], [PF_MG_ES], [PF_MG_SA], [PF_MG_OTHER], [PF_REQ_ANX], [PF_LIST_MTRLS_OPT1], [PF_LIST_MTRLS_OPT2], [PF_LIST_MTRLS_OPT3], [PF_LIST_ANXMTRLS], [PF_LCL_NAME], [PF_RMT_NAME], [PF_WEIGHT], [FIN_Verified] FROM [OL_MasterExam] WHERE ([MasterName] = @MasterName)" UpdateCommand="UPDATE [OL_MasterExam] SET [PF_EXISTS] = @PF_EXISTS, [PF_DURATION] = @PF_DURATION, [PF_MG] = @PF_MG, [PF_MG_FB] = @PF_MG_FB, [PF_MG_ES] = @PF_MG_ES, [PF_MG_SA] = @PF_MG_SA, [PF_MG_OTHER] = @PF_MG_OTHER, [PF_REQ_ANX] = @PF_REQ_ANX, [PF_LIST_MTRLS_OPT1] = @PF_LIST_MTRLS_OPT1, [PF_LIST_MTRLS_OPT2] = @PF_LIST_MTRLS_OPT2, [PF_LIST_MTRLS_OPT3] = @PF_LIST_MTRLS_OPT3, [PF_LIST_ANXMTRLS] = @PF_LIST_ANXMTRLS, [PF_LCL_NAME] = @PF_LCL_NAME, [PF_RMT_NAME] = @PF_RMT_NAME, [PF_WEIGHT] = @PF_WEIGHT, [FIN_Verified] = @FIN_Verified WHERE [Exam_ID] = @Exam_ID">
            <DeleteParameters>
                <asp:Parameter Name="Exam_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PF_EXISTS" Type="Boolean" />
                <asp:Parameter Name="PF_DURATION" Type="Int32" />
                <asp:Parameter Name="PF_MG" Type="Boolean" />
                <asp:Parameter Name="PF_MG_FB" Type="Boolean" />
                <asp:Parameter Name="PF_MG_ES" Type="Boolean" />
                <asp:Parameter Name="PF_MG_SA" Type="Boolean" />
                <asp:Parameter Name="PF_MG_OTHER" Type="String" />
                <asp:Parameter Name="PF_REQ_ANX" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT1" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT2" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT3" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_ANXMTRLS" Type="String" />
                <asp:Parameter Name="PF_LCL_NAME" Type="String" />
                <asp:Parameter Name="PF_RMT_NAME" Type="String" />
                <asp:Parameter Name="PF_WEIGHT" Type="String" />
                <asp:Parameter Name="FIN_Verified" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="2187_AMH2010_MC_VC" Name="MasterName" SessionField="MasterCourse" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="PF_EXISTS" Type="Boolean" />
                <asp:Parameter Name="PF_DURATION" Type="Int32" />
                <asp:Parameter Name="PF_MG" Type="Boolean" />
                <asp:Parameter Name="PF_MG_FB" Type="Boolean" />
                <asp:Parameter Name="PF_MG_ES" Type="Boolean" />
                <asp:Parameter Name="PF_MG_SA" Type="Boolean" />
                <asp:Parameter Name="PF_MG_OTHER" Type="String" />
                <asp:Parameter Name="PF_REQ_ANX" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT1" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT2" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT3" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_ANXMTRLS" Type="String" />
                <asp:Parameter Name="PF_LCL_NAME" Type="String" DefaultValue=" " />
                <asp:Parameter Name="PF_RMT_NAME" Type="String" DefaultValue=" " />
                <asp:Parameter Name="PF_WEIGHT" Type="String" />
                <asp:Parameter Name="FIN_Verified" Type="Boolean" />
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
        </form>
