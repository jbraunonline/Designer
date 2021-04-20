<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ChangeDeveloperOne.aspx.vb" Inherits="RadDesigner.ChangeDeveloperOne" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:TextBox ID="txtCourse" runat="server" Width="172px">COP1332</asp:TextBox>
&nbsp; Course<br />
        <asp:TextBox ID="txtMaster" runat="server" Width="168px">2215_COP1332_MC_VC</asp:TextBox>
&nbsp;&nbsp;&nbsp; MasterCourse<br />
        <asp:TextBox ID="txtID" runat="server" Width="167px">100</asp:TextBox>
&nbsp;&nbsp;&nbsp; ID_ID<br />
        <asp:TextBox ID="txtName" runat="server" Width="167px" CssClass="auto-style1">M Rios</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; IDname<br />
        <br />
        <asp:Button ID="btnChange" runat="server" Text="ChangeOne" BorderColor="#33CC33" Width="102px" />
        <br />
        <br />
        To make multiple changes, Upload a CSV file: DesignerChange.csv to the Data folder in this directory (Designer/Administrator/Admin/DesignerChange.csv)<br />
        The format is&nbsp;&nbsp;&nbsp;&nbsp; 2205_GEB3358_MC_VC,GEB3358,M. James,139&nbsp;&nbsp;&nbsp; 4 data items<br />
        <br />
        <asp:Button ID="btnChangeAll" runat="server" BorderColor="Red" BorderWidth="2px" ClientIDMode="Static" Text="Multiple Changes" />
&nbsp; Make sure the data file is up to date!</form>
</body>
</html>
