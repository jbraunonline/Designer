<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="popup.aspx.vb" Inherits="RadDesigner.popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        div.b {
  width: 450px;
  border: 1px solid black;  
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
    <div class="auto-style1">
        
        <br />
        
        <asp:Button ID="Button1" runat="server" BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="2px" Text="Close Window" BackColor="#FFFF66" />

        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="450px" CellSpacing="5" BackColor="#F8EBB8">
            <EditItemTemplate>
                Course:
                <asp:TextBox ID="CourseTextBox" runat="server" Text='<%# Bind("Course") %>' />
                <br />
                Title:
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                IDesg:
                <asp:TextBox ID="IDesgTextBox" runat="server" Text='<%# Bind("IDesg") %>' />
                <br />
                T_2187:
                <asp:TextBox ID="T_2187TextBox" runat="server" Text='<%# Bind("T_2187") %>' />
                <br />
                T_2193:
                <asp:TextBox ID="T_2193TextBox" runat="server" Text='<%# Bind("T_2193") %>' />
                <br />
                T_2195:
                <asp:TextBox ID="T_2195TextBox" runat="server" Text='<%# Bind("T_2195") %>' />
                <br />
                T_2197:
                <asp:TextBox ID="T_2197TextBox" runat="server" Text='<%# Bind("T_2197") %>' />
                <br />
                T_2203:
                <asp:TextBox ID="T_2203TextBox" runat="server" Text='<%# Bind("T_2203") %>' />
                <br />
                T_2205:
                <asp:TextBox ID="T_2205TextBox" runat="server" Text='<%# Bind("T_2205") %>' />
                <br />
                T_2207:
                <asp:TextBox ID="T_2207TextBox" runat="server" Text='<%# Bind("T_2207") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Course:
                <asp:TextBox ID="CourseTextBox" runat="server" Text='<%# Bind("Course") %>' />
                <br />
                Title:
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                IDesg:
                <asp:TextBox ID="IDesgTextBox" runat="server" Text='<%# Bind("IDesg") %>' />
                <br />
                T_2187:
                <asp:TextBox ID="T_2187TextBox" runat="server" Text='<%# Bind("T_2187") %>' />
                <br />
                T_2193:
                <asp:TextBox ID="T_2193TextBox" runat="server" Text='<%# Bind("T_2193") %>' />
                <br />
                T_2195:
                <asp:TextBox ID="T_2195TextBox" runat="server" Text='<%# Bind("T_2195") %>' />
                <br />
                T_2197:
                <asp:TextBox ID="T_2197TextBox" runat="server" Text='<%# Bind("T_2197") %>' />
                <br />
                T_2203:
                <asp:TextBox ID="T_2203TextBox" runat="server" Text='<%# Bind("T_2203") %>' />
                <br />
                T_2205:
                <asp:TextBox ID="T_2205TextBox" runat="server" Text='<%# Bind("T_2205") %>' />
                <br />
                T_2207:
                <asp:TextBox ID="T_2207TextBox" runat="server" Text='<%# Bind("T_2207") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Course:
                <asp:Label ID="CourseLabel" runat="server" Text='<%# Bind("Course") %>' Font-Bold="True" />
                <br />
                
                Title:
                
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>'  Font-Bold="True" />
                <br />
                
                Designer
                
                <asp:Label ID="IDesgLabel" runat="server" Text='<%# Bind("IDesg") %>' Font-Bold="True" />
                <br />T_2187:
                <asp:Label ID="T_2187Label" runat="server" Text='<%# Bind("T_2187") %>' Font-Bold="True" />
                <br />
                T_2193:
                <asp:Label ID="T_2193Label" runat="server" Text='<%# Bind("T_2193") %>' Font-Bold="True" />
                <br />
                T_2195:
                <asp:Label ID="T_2195Label" runat="server" Text='<%# Bind("T_2195") %>' Font-Bold="True" />
                <br />
                T_2197:
                <asp:Label ID="T_2197Label" runat="server" Text='<%# Bind("T_2197") %>' Font-Bold="True" />
                <br />
                T_2203:
                <asp:Label ID="T_2203Label" runat="server" Text='<%# Bind("T_2203") %>' Font-Bold="True" />
                <br />
                T_2205:
                <asp:Label ID="T_2205Label" runat="server" Text='<%# Bind("T_2205") %>' Font-Bold="True" />
                <br />
                T_2207:
                <asp:Label ID="T_2207Label" runat="server" Text='<%# Bind("T_2207") %>' Font-Bold="True" />
                <br />

            </ItemTemplate>
        </asp:FormView>
        
        <br />

    
        <br />

        <br />

    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Course], [Title], [IDesg], [T_2187], [T_2193], [T_2195], [T_2197], [T_2203], [T_2205], [T_2207] FROM [OL_MasterPhase] WHERE ([Course] = @Course)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="CGS1060C" Name="Course" QueryStringField="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
