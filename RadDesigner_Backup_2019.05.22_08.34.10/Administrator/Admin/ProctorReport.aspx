<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProctorReport.aspx.vb" Inherits="RadDesigner.ProctorReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Exam_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Exam_ID" HeaderText="Exam_ID" InsertVisible="False" ReadOnly="True" SortExpression="Exam_ID" />
                <asp:BoundField DataField="MasterName" HeaderText="MasterName" SortExpression="MasterName" />
                <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                <asp:BoundField DataField="Term" HeaderText="Term" SortExpression="Term" />

                <asp:BoundField DataField="PM_EXISTS" HeaderText="PM_EXISTS" SortExpression="PM_EXISTS" />
                <asp:BoundField DataField="PM_DURATION" HeaderText="PM_DURATION" SortExpression="PM_DURATION" />
                <asp:BoundField DataField="PM_MG" HeaderText="PM_MG" SortExpression="PM_MG" />
                <asp:BoundField DataField="PM_MG_FB" HeaderText="PM_MG_FB" SortExpression="PM_MG_FB" />
                <asp:BoundField DataField="PM_MG_ES" HeaderText="PM_MG_ES" SortExpression="PM_MG_ES" />
                <asp:BoundField DataField="PM_MG_SA" HeaderText="PM_MG_SA" SortExpression="PM_MG_SA" />
                <asp:BoundField DataField="PM_MG_OTHER" HeaderText="PM_MG_OTHER" SortExpression="PM_MG_OTHER" />
                <asp:BoundField DataField="PM_REQ_ANX" HeaderText="PM_REQ_ANX" SortExpression="PM_REQ_ANX" />
                <asp:BoundField DataField="PM_LIST_MTRLS_OPT1" HeaderText="PM_LIST_MTRLS_OPT1" SortExpression="PM_LIST_MTRLS_OPT1" />
                <asp:BoundField DataField="PM_LIST_MTRLS_OPT2" HeaderText="PM_LIST_MTRLS_OPT2" SortExpression="PM_LIST_MTRLS_OPT2" />
                <asp:BoundField DataField="PM_LIST_MTRLS_OPT3" HeaderText="PM_LIST_MTRLS_OPT3" SortExpression="PM_LIST_MTRLS_OPT3" />
                <asp:BoundField DataField="PM_LIST_ANXMTRLS" HeaderText="PM_LIST_ANXMTRLS" SortExpression="PM_LIST_ANXMTRLS" />
                <asp:BoundField DataField="PM_LCL_NAME" HeaderText="PM_LCL_NAME" SortExpression="PM_LCL_NAME" />
                <asp:BoundField DataField="PM_RMT_NAME" HeaderText="PM_RMT_NAME" SortExpression="PM_RMT_NAME" />
                <asp:BoundField DataField="PM_WEIGHT" HeaderText="PM_WEIGHT" SortExpression="PM_WEIGHT" />
                <asp:BoundField DataField="PF_EXISTS" HeaderText="PF_EXISTS" SortExpression="PF_EXISTS" />
                <asp:BoundField DataField="PF_DURATION" HeaderText="PF_DURATION" SortExpression="PF_DURATION" />
                <asp:BoundField DataField="PF_MG" HeaderText="PF_MG" SortExpression="PF_MG" />
                <asp:BoundField DataField="PF_MG_FB" HeaderText="PF_MG_FB" SortExpression="PF_MG_FB" />
                <asp:BoundField DataField="PF_MG_ES" HeaderText="PF_MG_ES" SortExpression="PF_MG_ES" />
                <asp:BoundField DataField="PF_MG_SA" HeaderText="PF_MG_SA" SortExpression="PF_MG_SA" />
                <asp:BoundField DataField="PF_MG_OTHER" HeaderText="PF_MG_OTHER" SortExpression="PF_MG_OTHER" />
                <asp:BoundField DataField="PF_REQ_ANX" HeaderText="PF_REQ_ANX" SortExpression="PF_REQ_ANX" />
                <asp:BoundField DataField="PF_LIST_MTRLS_OPT1" HeaderText="PF_LIST_MTRLS_OPT1" SortExpression="PF_LIST_MTRLS_OPT1" />
                <asp:BoundField DataField="PF_LIST_MTRLS_OPT2" HeaderText="PF_LIST_MTRLS_OPT2" SortExpression="PF_LIST_MTRLS_OPT2" />
                <asp:BoundField DataField="PF_LIST_MTRLS_OPT3" HeaderText="PF_LIST_MTRLS_OPT3" SortExpression="PF_LIST_MTRLS_OPT3" />
                <asp:BoundField DataField="PF_LIST_ANXMTRLS" HeaderText="PF_LIST_ANXMTRLS" SortExpression="PF_LIST_ANXMTRLS" />
                <asp:BoundField DataField="PF_LCL_NAME" HeaderText="PF_LCL_NAME" SortExpression="PF_LCL_NAME" />
                <asp:BoundField DataField="PF_RMT_NAME" HeaderText="PF_RMT_NAME" SortExpression="PF_RMT_NAME" />
                <asp:BoundField DataField="PF_WEIGHT" HeaderText="PF_WEIGHT" SortExpression="PF_WEIGHT" />
                <asp:BoundField DataField="MLD_Verified" HeaderText="MLD_Verified" SortExpression="MLD_Verified" />
                <asp:BoundField DataField="FIN_Verified" HeaderText="FIN_Verified" SortExpression="FIN_Verified" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT * FROM [OL_MasterExam] WHERE ([Term] = @Term)">
            <SelectParameters>
                <asp:Parameter DefaultValue="2187" Name="Term" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
