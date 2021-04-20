<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Associate.aspx.vb" Inherits="RadDesigner.Associate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="/Timeout/styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table cellspacing="0" cellpadding="0">
 <tr><td style="vertical-align:top; width: 200px;" >

   
     <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="WebBlue" Orientation="VerticalLeft" SelectedIndex="2" Width="200px">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Available Tasks"  Visible="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="My Tasks" visible="True"  >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Audit Assignments" visible="True" >
            </telerik:RadTab>




         </Tabs>
        </telerik:RadTabStrip>

            </td>
            <td style = "text-align: left;">
<telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="2" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1600px" Height="1200px"
                ContentUrl="Tasks/AllTaskList.aspx" CssClass="auto-style1">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="Tasks/MyTasks.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="AsAudit/AsAuditProgress.aspx">
        </telerik:RadPageView>

       


    </telerik:RadMultiPage>
              '
            </td>
        </tr>
    </table>

    ''''''''''''''''''''''''''''''''

       <div class="demo-container no-bg">
    <div class="clockSession">
        <div class="contSession">


            <div class="timeRemain">
                <span class="timeSeconds"><span id="mainLbl"> </span></span>seconds</div>
        </div>
    </div>
    </div>
    <telerik:RadNotification RenderMode="Lightweight" ID="RadNotification1" runat="server" Position="Center" Width="370px"
        Height="210px" OnCallbackUpdate="OnCallbackUpdate" AutoCloseDelay="60000"
        OnClientShowing="notification_showing" OnClientHidden="notification_hidden"
        Title="Continue Your Session" Skin="Office2007" EnableRoundedCorners="True"
        ShowCloseButton="False" KeepOnMouseOver="False" CssClass="timeoutNotification" Animation="Fade" ShowSound="/Timeout/tada.wav" BackColor="Red">
        <ContentTemplate>
            <div class="infoIcon">
                <img src="images/infoIcon.jpg" alt="info icon" /></div>
            <div class="notificationContent">
                Time remaining:&nbsp; <span id="timeLbl">60</span>
                <telerik:RadButton RenderMode="Lightweight" Skin="Office2007" ID="continueSession" runat="server" Text="Continue Your Session" Width="190px"
                    Style="margin-top: 10px;" AutoPostBack="false" OnClientClicked="ContinueSession">
                </telerik:RadButton>
            </div>
        </ContentTemplate>
    </telerik:RadNotification>
    <script type="text/javascript" src="/Timeout/scripts.js"></script>
    <script type="text/javascript">
        //<![CDATA[
        serverIDs({ notificationID: '<%= RadNotification1.ClientID %>' });
        //]]>
    </script>

   
  
</asp:Content>
