<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExamReport.aspx.vb" Inherits="RadDesigner.ExamReport1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
<style type="text/css">
        input[type=checkbox][enabled]
        {
           opacity:3 !important;
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
    
    </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="Glow" AutoGenerateColumns="False">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                   <ExportSettings ExportOnlyData="True">
                       <Excel Format="ExcelML" />
            </ExportSettings>
                   <MasterTableView DataSourceID="SqlDataSource1"  EnableGroupsExpandAll="true"  CommandItemDisplay="Top" HierarchyDefaultExpanded="false" GroupsDefaultExpanded="False">
             <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
                <Columns>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term" DataType="System.Int32" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_EXISTS" DataType="System.Boolean" FilterControlAltText="Filter PM_EXISTS column" HeaderText="PM_EXISTS" SortExpression="PM_EXISTS" UniqueName="PM_EXISTS">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PM_DURATION" DataType="System.Int32" FilterControlAltText="Filter PM_DURATION column" HeaderText="PM_DURATION" SortExpression="PM_DURATION" UniqueName="PM_DURATION">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_MG" DataType="System.Boolean" FilterControlAltText="Filter PM_MG column" HeaderText="PM_MG" SortExpression="PM_MG" UniqueName="PM_MG">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_MG_FB" DataType="System.Boolean" FilterControlAltText="Filter PM_MG_FB column" HeaderText="PM_MG_FB" SortExpression="PM_MG_FB" UniqueName="PM_MG_FB">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_MG_ES" DataType="System.Boolean" FilterControlAltText="Filter PM_MG_ES column" HeaderText="PM_MG_ES" SortExpression="PM_MG_ES" UniqueName="PM_MG_ES">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_MG_SA" DataType="System.Boolean" FilterControlAltText="Filter PM_MG_SA column" HeaderText="PM_MG_SA" SortExpression="PM_MG_SA" UniqueName="PM_MG_SA">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PM_MG_OTHER" FilterControlAltText="Filter PM_MG_OTHER column" HeaderText="PM_MG_OTHER" SortExpression="PM_MG_OTHER" UniqueName="PM_MG_OTHER">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_REQ_ANX" DataType="System.Boolean" FilterControlAltText="Filter PM_REQ_ANX column" HeaderText="PM_REQ_ANX" SortExpression="PM_REQ_ANX" UniqueName="PM_REQ_ANX">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_LIST_MTRLS_OPT1" DataType="System.Boolean" FilterControlAltText="Filter PM_LIST_MTRLS_OPT1 column" HeaderText="PM_LIST_MTRLS_OPT1" SortExpression="PM_LIST_MTRLS_OPT1" UniqueName="PM_LIST_MTRLS_OPT1">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_LIST_MTRLS_OPT2" DataType="System.Boolean" FilterControlAltText="Filter PM_LIST_MTRLS_OPT2 column" HeaderText="PM_LIST_MTRLS_OPT2" SortExpression="PM_LIST_MTRLS_OPT2" UniqueName="PM_LIST_MTRLS_OPT2">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PM_LIST_MTRLS_OPT3" DataType="System.Boolean" FilterControlAltText="Filter PM_LIST_MTRLS_OPT3 column" HeaderText="PM_LIST_MTRLS_OPT3" SortExpression="PM_LIST_MTRLS_OPT3" UniqueName="PM_LIST_MTRLS_OPT3">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PM_LIST_ANXMTRLS" FilterControlAltText="Filter PM_LIST_ANXMTRLS column" HeaderText="PM_LIST_ANXMTRLS" SortExpression="PM_LIST_ANXMTRLS" UniqueName="PM_LIST_ANXMTRLS">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PM_LCL_NAME" FilterControlAltText="Filter PM_LCL_NAME column" HeaderText="PM_LCL_NAME" SortExpression="PM_LCL_NAME" UniqueName="PM_LCL_NAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PM_RMT_NAME" FilterControlAltText="Filter PM_RMT_NAME column" HeaderText="PM_RMT_NAME" SortExpression="PM_RMT_NAME" UniqueName="PM_RMT_NAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PM_WEIGHT" FilterControlAltText="Filter PM_WEIGHT column" HeaderText="PM_WEIGHT" SortExpression="PM_WEIGHT" UniqueName="PM_WEIGHT">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_EXISTS" DataType="System.Boolean" FilterControlAltText="Filter PF_EXISTS column" HeaderText="PF_EXISTS" SortExpression="PF_EXISTS" UniqueName="PF_EXISTS">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PF_DURATION" DataType="System.Int32" FilterControlAltText="Filter PF_DURATION column" HeaderText="PF_DURATION" SortExpression="PF_DURATION" UniqueName="PF_DURATION">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_MG" DataType="System.Boolean" FilterControlAltText="Filter PF_MG column" HeaderText="PF_MG" SortExpression="PF_MG" UniqueName="PF_MG">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_MG_FB" DataType="System.Boolean" FilterControlAltText="Filter PF_MG_FB column" HeaderText="PF_MG_FB" SortExpression="PF_MG_FB" UniqueName="PF_MG_FB">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_MG_ES" DataType="System.Boolean" FilterControlAltText="Filter PF_MG_ES column" HeaderText="PF_MG_ES" SortExpression="PF_MG_ES" UniqueName="PF_MG_ES">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_MG_SA" DataType="System.Boolean" FilterControlAltText="Filter PF_MG_SA column" HeaderText="PF_MG_SA" SortExpression="PF_MG_SA" UniqueName="PF_MG_SA">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PF_MG_OTHER" FilterControlAltText="Filter PF_MG_OTHER column" HeaderText="PF_MG_OTHER" SortExpression="PF_MG_OTHER" UniqueName="PF_MG_OTHER">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_REQ_ANX" DataType="System.Boolean" FilterControlAltText="Filter PF_REQ_ANX column" HeaderText="PF_REQ_ANX" SortExpression="PF_REQ_ANX" UniqueName="PF_REQ_ANX">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_LIST_MTRLS_OPT1" DataType="System.Boolean" FilterControlAltText="Filter PF_LIST_MTRLS_OPT1 column" HeaderText="PF_LIST_MTRLS_OPT1" SortExpression="PF_LIST_MTRLS_OPT1" UniqueName="PF_LIST_MTRLS_OPT1">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_LIST_MTRLS_OPT2" DataType="System.Boolean" FilterControlAltText="Filter PF_LIST_MTRLS_OPT2 column" HeaderText="PF_LIST_MTRLS_OPT2" SortExpression="PF_LIST_MTRLS_OPT2" UniqueName="PF_LIST_MTRLS_OPT2">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="PF_LIST_MTRLS_OPT3" DataType="System.Boolean" FilterControlAltText="Filter PF_LIST_MTRLS_OPT3 column" HeaderText="PF_LIST_MTRLS_OPT3" SortExpression="PF_LIST_MTRLS_OPT3" UniqueName="PF_LIST_MTRLS_OPT3">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PF_LIST_ANXMTRLS" FilterControlAltText="Filter PF_LIST_ANXMTRLS column" HeaderText="PF_LIST_ANXMTRLS" SortExpression="PF_LIST_ANXMTRLS" UniqueName="PF_LIST_ANXMTRLS">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PF_LCL_NAME" FilterControlAltText="Filter PF_LCL_NAME column" HeaderText="PF_LCL_NAME" SortExpression="PF_LCL_NAME" UniqueName="PF_LCL_NAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PF_RMT_NAME" FilterControlAltText="Filter PF_RMT_NAME column" HeaderText="PF_RMT_NAME" SortExpression="PF_RMT_NAME" UniqueName="PF_RMT_NAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PF_WEIGHT" FilterControlAltText="Filter PF_WEIGHT column" HeaderText="PF_WEIGHT" SortExpression="PF_WEIGHT" UniqueName="PF_WEIGHT">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="MLD_Verified" DataType="System.Boolean" FilterControlAltText="Filter MLD_Verified column" HeaderText="MLD_Verified" SortExpression="MLD_Verified" UniqueName="MLD_Verified">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="FIN_Verified" DataType="System.Boolean" FilterControlAltText="Filter FIN_Verified column" HeaderText="FIN_Verified" SortExpression="FIN_Verified" UniqueName="FIN_Verified">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="Exam" DataType="System.Boolean" FilterControlAltText="Filter Exam column" HeaderText="Exam" SortExpression="Exam" UniqueName="Exam"   StringTrueValue="YES" StringFalseValue="No">
                    </telerik:GridCheckBoxColumn>
                                         <telerik:GridTemplateColumn HeaderText="Verified" UniqueName="Verified" SortExpression="Verified"  AllowFiltering="false" >
                        <ItemTemplate>
                            <label id="mylable" ><%# Eval("Exam") %></label>
                           
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT     dbo.OL_MasterExam.Course, dbo.OL_MasterExam.Term, dbo.OL_MasterExam.PM_EXISTS, dbo.OL_MasterExam.PM_DURATION, dbo.OL_MasterExam.PM_MG, dbo.OL_MasterExam.PM_MG_FB, 
                      dbo.OL_MasterExam.PM_MG_ES, dbo.OL_MasterExam.PM_MG_SA, dbo.OL_MasterExam.PM_MG_OTHER, dbo.OL_MasterExam.PM_REQ_ANX, dbo.OL_MasterExam.PM_LIST_MTRLS_OPT1, 
                      dbo.OL_MasterExam.PM_LIST_MTRLS_OPT2, dbo.OL_MasterExam.PM_LIST_MTRLS_OPT3, dbo.OL_MasterExam.PM_LIST_ANXMTRLS, dbo.OL_MasterExam.PM_LCL_NAME, 
                      dbo.OL_MasterExam.PM_RMT_NAME, dbo.OL_MasterExam.PM_WEIGHT, dbo.OL_MasterExam.PF_EXISTS, dbo.OL_MasterExam.PF_DURATION, dbo.OL_MasterExam.PF_MG, 
                      dbo.OL_MasterExam.PF_MG_FB, dbo.OL_MasterExam.PF_MG_ES, dbo.OL_MasterExam.PF_MG_SA, dbo.OL_MasterExam.PF_MG_OTHER, dbo.OL_MasterExam.PF_REQ_ANX, 
                      dbo.OL_MasterExam.PF_LIST_MTRLS_OPT1, dbo.OL_MasterExam.PF_LIST_MTRLS_OPT2, dbo.OL_MasterExam.PF_LIST_MTRLS_OPT3, dbo.OL_MasterExam.PF_LIST_ANXMTRLS, 
                      dbo.OL_MasterExam.PF_LCL_NAME, dbo.OL_MasterExam.PF_RMT_NAME, dbo.OL_MasterExam.PF_WEIGHT, dbo.OL_MasterExam.MLD_Verified, dbo.OL_MasterExam.FIN_Verified, 
                      dbo.OL_Progress.Exam
FROM         dbo.OL_MasterExam RIGHT OUTER JOIN
                      dbo.OL_Progress ON dbo.OL_MasterExam.MasterName = dbo.OL_Progress.MasterName
WHERE     (dbo.OL_Progress.Exam = 1) AND (dbo.OL_MasterExam.Term = '2193')
ORDER BY dbo.OL_MasterExam.Course"></asp:SqlDataSource>
    </form>
</body>
</html>
