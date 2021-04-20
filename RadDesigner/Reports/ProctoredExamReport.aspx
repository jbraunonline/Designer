<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProctoredExamReport.aspx.vb" Inherits="RadDesigner.ProctoredExamReport" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI.Gantt" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
            text-align: center;
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
            <strong>Proctored Exam Report for term 2213
            <asp:Button ID="Button1" runat="server" BackColor="#FFFF66" Font-Bold="True" Text="Close WIndow" />
            </strong></div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True" DataSourceID="SqlDataSource1" ShowGroupPanel="True" Skin="WebBlue" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ExportSettings ExportOnlyData="True">
                <Csv EncloseDataWithQuotes="False" />
            </ExportSettings>
            <ClientSettings AllowDragToGroup="True">
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Exam_ID"  CommandItemDisplay = "Top">
               <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
                <Columns>
                    <telerik:GridBoundColumn DataField="Exam_ID" FilterControlAltText="Filter Exam_ID column" HeaderText="Exam_ID" SortExpression="Exam_ID" UniqueName="Exam_ID" DataType="System.Int32" ReadOnly="True" Visible ="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PM_EXISTS" FilterControlAltText="Filter PM_EXISTS column" HeaderText="MidTerm_EXISTS" SortExpression="PM_EXISTS" UniqueName="PM_EXISTS"   AllowFiltering="False" >
                    </telerik:GridBoundColumn>
                          <telerik:GridTemplateColumn HeaderText="isMidTerm" UniqueName="isMidTerm" SortExpression="isMidTerm"  AllowFiltering="False" AllowSorting="false" >
                        <ItemTemplate>
                            <img src='../Images/<%# Eval("PM_EXISTS") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="PM_DURATION" DataType="System.Int32" FilterControlAltText="Filter PM_DURATION column" HeaderText="PM_DURATION" SortExpression="PM_DURATION" UniqueName="PM_DURATION" AllowFiltering="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="PF_EXISTS" FilterControlAltText="Filter PF_EXISTS column" HeaderText="Final_EXISTS" SortExpression="PF_EXISTS" UniqueName="PF_EXISTS"   AllowFiltering="False" >
                    </telerik:GridBoundColumn>

                          <telerik:GridTemplateColumn HeaderText="isFinal" UniqueName="isFinal" SortExpression="isFinal"  AllowFiltering="False"  AllowSorting="false"  >
                        <ItemTemplate>
                            <img src='../Images/<%# Eval("PF_EXISTS") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="PF_DURATION" DataType="System.Int32" FilterControlAltText="Filter PF_DURATION column" HeaderText="PF_DURATION" SortExpression="PF_DURATION" UniqueName="PF_DURATION" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Instructional_Designer" FilterControlAltText="Filter Instructional_Designer column" HeaderText="Instructional_Designer" SortExpression="Instructional_Designer" UniqueName="Instructional_Designer">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
             <GroupingSettings CaseSensitive="false" />
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT     TOP (200) dbo.OL_MasterExam.Exam_ID, dbo.OL_MasterExam.MasterName, dbo.OL_MasterExam.Course, dbo.OL_MasterExam.PM_EXISTS, dbo.OL_MasterExam.PM_DURATION, 
                      dbo.OL_MasterExam.PF_EXISTS, dbo.OL_MasterExam.PF_DURATION, dbo.OL_MasterCourse.Instructional_Designer
FROM         dbo.OL_MasterExam INNER JOIN
                      dbo.OL_MasterCourse ON dbo.OL_MasterExam.MasterName = dbo.OL_MasterCourse.MasterName
WHERE     (dbo.OL_MasterExam.Term = '2213')">
        </asp:SqlDataSource>
    </form>
</body>
</html>
