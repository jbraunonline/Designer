<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BuildingBlockDetails.aspx.vb" Inherits="RadDesigner.BuildingBlockDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 581px;
            background-color: #C1E0FF;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            text-align: center;
        }

body {
    font-family: Arial, Helvetica, sans-serif;

}
td {
    vertical-align: top;
}
#white { 
    background-color: white; 
    text-align: center;
}
#white2 { 
    background-color: white; 
    text-align: center;
}
        .auto-style5 {
            text-align: center;
            font-size: small;
        }
        .auto-style6 {
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
      
        &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT Obj_ID, BBName FROM OL_BBlock_Objects WHERE (Pub_ID = 1) AND (Obj_ID IN (1, 2))"></asp:SqlDataSource>
  
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Obj_ID], [BBName] FROM [OL_BBlock_Objects] WHERE ([Pub_ID] = @Pub_ID)
and Obj_ID Not in (1,2)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="Pub_ID" SessionField="Pub_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <table align="center" class="auto-style2">
            <tr>
                <td id="white" colspan="2"><strong>
                    <asp:Label ID="lblPublisher" runat="server" CssClass="auto-style3" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"><strong>Available Building Blocks</strong></td>
                <td class="auto-style4">&nbsp; <strong><span class="auto-style6">Building Blocks In Course&nbsp;</span></strong></td>
            </tr>
            <tr>
                <td>
                            <telerik:RadListBox ID="RadListBox1" runat="server" AllowTransfer="True" CheckBoxes="False" CssClass="auto-style1" DataKeyField="BBName" DataSortField="BBName" DataTextField="BBName" DataValueField="Obj_ID" TransferToID="RadListBox2" Height="400px" Width="325px" Skin="WebBlue" Font-Size="Small">
        </telerik:RadListBox>
                </td>
                <td>
                            <telerik:RadListBox ID="RadListBox2" runat="server"   DataKeyField="BBName" DataSortField="BBName"  DataTextField="BBName" DataValueField="Obj_ID" Skin="Glow" Font-Size="Small" Width="325px" Height="400px" >
            <ButtonSettings TransferButtons="All">
            </ButtonSettings>
        </telerik:RadListBox>
                </td>
            </tr>
            <tr>
                <td>
                            &nbsp;</td>
                <td>
                            &nbsp;</td>
            </tr>
            <tr>
                <td  id="white2"  colspan="2">
                           <asp:Button ID="Button1" runat="server" Text="Save Building Blocks" BorderColor="#CC0000" BorderWidth="2px" />;&nbsp;&nbsp;
                           <asp:Button ID="Button2" runat="server" BorderColor="#66FF99" Text="Cancel / Return" />
                </td>
            </tr>
        </table>
<div>





    </div>

        
        <br />
        <asp:TextBox ID="txtValues" runat="server" BackColor="#FFFF99" Width="351px" Visible="False"></asp:TextBox>
        <br />
        <asp:Literal ID="itemsClientSide" runat="server" />
        <p>
        <asp:Label ID="lblPubID" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblMyArray1" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
        &nbsp;</p>
        <p>
        <asp:Label ID="lblTxt1" runat="server" Visible="False"></asp:Label>
        &nbsp;<asp:Label ID="lblTxt2" runat="server" Visible="False"></asp:Label>
        </p>
    </form>
</body>
</html>

