<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Home.aspx.vb" Inherits="RadDesigner.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="Office2010Black" SelectedIndex="0" Width="1600px" Align="Center">
                    <Tabs>
            <telerik:RadTab runat="server" Text="BB Access - MDC User"  Visible="True" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="BB Access - External User" visible="True" >
            </telerik:RadTab>

         </Tabs>
        </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1600px" Height="1600px"
                ContentUrl="http://virtual.mdc.edu/guestaccess/special.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1600px" Height="1600px"
                 ContentUrl="http://virtual.mdc.edu/guestaccess/special.aspx">
        </telerik:RadPageView>


    </telerik:RadMultiPage>
</asp:Content>
