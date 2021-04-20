<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="MyTasks.aspx.vb" Inherits="RadDesigner.MyTasks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol>
        <li>
            <h5 class="auto-style1">You are in
  DESIGNER&nbsp; &gt;&gt; TASKS&nbsp;&nbsp; <span class="auto-style2">to exit, use the top menu</span></h5>
        </li>
    </ol>
    .           <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="Office2010Black" Orientation="HorizontalTop" SelectedIndex="0" Width="1600px" Align="Center">
                    <Tabs>
            <telerik:RadTab runat="server" Text="My Task List"  Visible="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Add Task" visible="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="All Tasks" Visible="True" Selected="False" >
            </telerik:RadTab>
         </Tabs>
        </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1600px" Height="1200px"
                ContentUrl="myTaskProgress.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="NewTask.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" Width="1600px" Height="1200px"
                ContentUrl="AllTasks.aspx">
        </telerik:RadPageView>

    </telerik:RadMultiPage>


</asp:Content>
