<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="myTimeOut.aspx.vb" Inherits="RadDesigner.myTmeOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link href="timeout/styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 ........................................................................................
            <telerik:RadStyleSheetManager ID="RadStyleSheetManager2" runat="server">
        </telerik:RadStyleSheetManager>

 
        <br />

                
 
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0"  >
            <Tabs>
                <telerik:RadTab runat="server" Text="Page1"  visible= "True" Selected="true">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Page 2"  visible="True" >
                </telerik:RadTab>
            </Tabs>

        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultiPage1" Runat="server"    SelectedIndex="0"  >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="500px" Height="1500px"
                ContentUrl="Pages/Page1.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="500px" Height="1500px"
                ContentUrl="pages/Page2.aspx">
        </telerik:RadPageView>

        </telerik:RadMultiPage>



    <p>
        <a href="https://demos.telerik.com/aspnet-ajax/notification/examples/sessiontimeout/defaultvb.aspx?show-source=true">https://demos.telerik.com/aspnet-ajax/notification/examples/sessiontimeout/defaultvb.aspx?show-source=true</a></p>
    <p>
        for the timer to work properly, the scripts.js file (in Timeout folder) timeout in seconds must be set </p>
    <p>
        equal to the number of minutes in the .aspx.vb rile; 3600 seconds in scripts and60 min in vb session time</p>

       <div class="demo-container no-bg">
    <div class="clockSession">
        <div class="contSession">
            <div class="sesseionExpire">
                Your Session will expire in
                <%= Session.Timeout %>
                minutes</div>
            <div class="showNotification">
                Notification will be shown in:</div>
            <div class="timeRemain">
                <span class="timeSeconds"><span id="mainLbl"> </span></span>seconds</div>
        </div>
    </div>
    </div>
    <telerik:RadNotification RenderMode="Lightweight" ID="RadNotification1" runat="server" Position="Center" Width="370"
        Height="210" OnCallbackUpdate="OnCallbackUpdate" LoadContentOn="PageLoad" AutoCloseDelay="60000"
        OnClientShowing="notification_showing" OnClientHidden="notification_hidden"
        Title="Continue Your Session" Skin="Office2007" EnableRoundedCorners="true"
        ShowCloseButton="false" KeepOnMouseOver="false" CssClass="timeoutNotification" Animation="Fade" ShowSound="tada.wav" BackColor="Red">
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
    <script type="text/javascript" src="timeout/scripts.js"></script>
    <script type="text/javascript">
        //<![CDATA[
        serverIDs({ notificationID: '<%= RadNotification1.ClientID %>' });
        //]]>
    </script>





[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
</asp:Content>
