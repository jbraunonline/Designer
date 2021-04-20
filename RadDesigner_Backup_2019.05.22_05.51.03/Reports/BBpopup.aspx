<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BBpopup.aspx.vb" Inherits="RadDesigner.BBpopup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script "javascript">
var popupWindow = null;
function centeredPopup(url,winName,w,h,scroll){
LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
settings =
'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
popupWindow = window.open(url,winName,settings)
}
</script>

    <style type="text/css">
        .auto-style1 {
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
    
        <br />
        <asp:Button ID="btnClose" runat="server" BackColor="#FFFF99" BorderColor="#CC0000" Text="Close Window" />
    
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="Reference" FilterControlAltText="Filter Reference column" HeaderText="Reference" SortExpression="Reference" UniqueName="Reference">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor" SortExpression="Instructor" UniqueName="Instructor">
                    </telerik:GridBoundColumn>

                    
                    <telerik:GridTemplateColumn HeaderText="BBcontent" UniqueName="BBcontent" AllowSorting="False"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='../images/<%# Eval("IsCopytextWrite") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>


                    <telerik:GridBoundColumn DataField="CopyTextWriteDate" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="ContentCopyDate" AllowFiltering = "False"></telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn HeaderText="IsChild" UniqueName="IsChild" AllowSorting="False"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='../images/<%# Eval("IsChild") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="ChildOf" FilterControlAltText="Filter ChildOf column" HeaderText="ChildOf" SortExpression="ChildOf" UniqueName="ChildOf">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    
    </div>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Reference], [Course], [Session], [Instructor], [IsCopyTextWrite], [CopyTextWriteDate], [isChild], [ChildOf] FROM [BBCourses] WHERE (([TERM_KEY] = @TERM_KEY) AND ([Course] = @Course) AND ([Reference] NOT LIKE '%' + @Reference + '%')) ORDER BY [Session]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2195" Name="TERM_KEY" Type="String" />
                    <asp:QueryStringParameter DefaultValue="CGS1060C" Name="Course" QueryStringField="Course" Type="String" />
                    <asp:Parameter DefaultValue="MC_VC" Name="Reference" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
