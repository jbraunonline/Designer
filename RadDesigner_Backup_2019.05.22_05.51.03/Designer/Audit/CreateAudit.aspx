<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CreateAudit.aspx.vb" Inherits="RadDesigner.CreateAudit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

            body{
    margin-top: 5px; 
    margin-bottom: 0px; 
    margin-left: 0px; 

    font-family: Arial, Helvetica, sans-serif;
}
        table, td, th {
    border: 0px solid silver;
}

table {
    border-collapse: collapse;
    width: 800px;
}

th {
    text-align: left;
}
        .newStyle1 {
            background-color: #808080;
            font-family: Arial;
            color: #FFFFFF;
            font-weight: bold;
        }
        .newStyle2 {
            background-color: #E0E7ED;
        }
        .newStyle3 {
            border-style: none;
            border-color: #FFFFFF;
        }
        .auto-style4 {
            background-color: #E0E7ED;
            height: 38px;
        }
        .newStyle4 {
            font-size: medium;
        }
        .newStyle5 {
            font-size: large;
            color: #FFFFFF;
            font-weight: bold;
            font-family: Arial;
        }
        .newStyle6 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            color: #FFFFFF;
        }
        .newStyle7 {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            color: #FFFFFF;
            float: right;
        }
        .newStyle8 {
            width: 200px;
        }
        .newStyle9 {
            background-color: #FFFFFF;
        }
        .auto-style6 {
            width: 200px;
            height: 24px;
        }
        .auto-style7 {
            background-color: #E0E7ED;
            height: 24px;
        }
        .auto-style8 {
            font-size: x-large;
        }
        .auto-style9 {
            font-size: small;
            color: #CC0000;
            background-color: #FFFFCC;
        }
        .auto-style10 {
            height: 34px;
        }
        .auto-style11 {
            background-color: #FFFFCC;
        }
        .auto-style12 {
            font-size: small;
            color: #FF00FF;
            background-color: #FFFFCC;
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

            <table style="width:1000px;text-align:left;background-color:silver;" class="newStyle3" align="center">
            <tr class="newStyle9">
                <td colspan="2" class="auto-style10">
                    <span class="auto-style8"><strong>Audit Request Form</strong></span>&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAnother" runat="server" BackColor="#CCFFCC" Font-Bold="True" Text="Add Another Audit" Visible="False" />
                    <asp:Button ID="btnReturnToAuditList" runat="server" Text="Return To Audit List" />
                    <br />
                    <asp:Label ID="lblDone" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="newStyle9" colspan="2">&nbsp; <span class="auto-style9"><strong>You cannot create an audit unless you have verified the <span class="auto-style11">MasterCourse, </span> <span class="auto-style12">Building Blocks</span><span class="auto-style9">, </span></span> <span class="auto-style9">Textbook, Phase,and Exam</span></strong>&nbsp;</td>
            </tr>
            <tr>
                <td class="newStyle8">Course</td>
                <td class="newStyle2" >
                    <asp:DropDownList ID="ddlCourses" runat="server" Height="21px" Width="267px"  DataTextField="MasterName" DataValueField="MasterName" AutoPostBack="True" >
                    </asp:DropDownList>
                &nbsp;&nbsp;
                    <asp:Label ID="lblIsTop" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Auditor</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Auditor" DataValueField="User_ID" Width="265px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">&nbsp;</td>
                <td class="newStyle2">
                    <asp:CheckBox ID="chkDesigner" runat="server" Text="Designer has released this course for audit." />
                </td>
            </tr>
            <tr>
                <td class="newStyle8">&nbsp;</td>
                <td class="auto-style4">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Developer has released this course for audit." />
                </td>
            </tr>
            <tr>
                <td class="newStyle8">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblIsTop20" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                &nbsp;<asp:Label ID="lblIsPrimary" runat="server" Text="1" Visible="False"></asp:Label>
&nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Visible="False" Width="300px">
                        <asp:ListItem Value="First">First Audit</asp:ListItem>
                        <asp:ListItem Value="Second">Second Audit</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>


            <tr>
                <td class="newStyle8">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lblWarn" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="newStyle8">&nbsp;</td>
               <td  style="text-align: left;" class="newStyle2" >
                    <telerik:RadTextBox ID="RadTextBox1" Runat="server" EmptyMessage="If no Developer Sign Off, Please explain." Height="45px" LabelWidth="64px" Resize="None" Width="360px">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr class="newStyle9">
                <td >
        <asp:Button ID="Button1" runat="server" BackColor="#CC0000" Font-Bold="True" Font-Size="Medium" ForeColor="White" Text="Add Audit" Visible="False" />
                </td>
                <td "></td>
            </tr>
        </table>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT User_ID, FirstName + ' ' + LastName AS Auditor FROM OL_Users WHERE (Role = @Role)">
        </asp:SqlDataSource>

    </form>
   


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="Select UserName as Auditor, User_ID from OL_Users where Role= 2"></asp:SqlDataSource>
   


    </table>
    </form>
    </form>
    </form>
    </form>
    </form>
    </form>
       


    <p>
        email notification is off</p>
       


</body>
</html>
