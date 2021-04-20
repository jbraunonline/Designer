<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Delivery.aspx.vb" Inherits="RadDesigner.Delivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    This is the Delivery Team landing page

   

             <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="Office2010Black" SelectedIndex="0" Width="1600px" Align="Center">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Course Copy"  Visible="True" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Proctor Exam Results" visible="True" >
            </telerik:RadTab>

         </Tabs>
        </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1600px" Height="1600px"
                ContentUrl="http://virtual.mdc.edu/virtualadmin/live1/Dashboard.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1600px" Height="1600px"
                 ContentUrl="~/pages/Page2.aspx">
        </telerik:RadPageView>


    </telerik:RadMultiPage>
 



</asp:Content>
