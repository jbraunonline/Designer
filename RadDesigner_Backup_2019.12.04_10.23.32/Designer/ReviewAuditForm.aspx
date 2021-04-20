<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="ReviewAuditForm.aspx.vb" Inherits="RadDesigner.ReviewAuditForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
          <link href="/Timeout/styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div align="center"; width:800px">
        ;<asp:Button ID="btnReturn" runat="server" BackColor="#99FF66" Font-Bold="True" Font-Names="Arial" ForeColor="Black" Text="Return to List" />
        &nbsp;<asp:Label ID="lblMaster" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:Label></div>
<telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="Office2010Black" SelectedIndex="0" Width="1400px" Align="Center">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Course Info"  Visible="True" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Main Menu" visible="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Learning Modules" Visible="True" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Course Management" Visible="True" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Audit Status" Visible="True" >
            </telerik:RadTab>                       
               <telerik:RadTab runat="server" Text="notes" Visible="True" >
            </telerik:RadTab>                            

                        
                                </Tabs>
        </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1400px" Height="1000px"
                ContentUrl="../Associate/AsAudit/AsAuditForm/AsCourse.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1400px" Height="900px"
                ContentUrl="../Associate/AsAudit/AsAuditForm/AsMenu.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" Width="1400px" Height="900px"
                ContentUrl="../Associate/AsAudit/AsAuditForm/AsModules.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server" Width="1400px" Height="900px"
                 ContentUrl="../Associate/AsAudit/AsAuditForm/AsManagement.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" runat="server" Width="1400px" Height="900px"
                ContentUrl="../Associate/AsAudit/AsAuditForm/AsStatus.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView6" runat="server" Width="1400px" Height="900px"
                ContentUrl="../Associate/AsAudit/AsAuditForm/AuditNotes.aspx">
        </telerik:RadPageView>





    </telerik:RadMultiPage>
     ''''''''''''''''''''''''''''''''

       <div class="demo-container no-bg">
    <div class="clockSession">
        <div class="contSession">


            <div class="timeRemain">
                <span class="timeSeconds"><span id="mainLbl"> </span></span>seconds</div>
        </div>
    </div>
    </div>
    <telerik:RadNotification RenderMode="Lightweight" ID="RadNotification1" runat="server" Position="Center" Width="370"
        Height="210" OnCallbackUpdate="OnCallbackUpdate" LoadContentOn="PageLoad" AutoCloseDelay="60000"
        OnClientShowing="notification_showing" OnClientHidden="notification_hidden"
        Title="Continue Your Session" Skin="Office2007" EnableRoundedCorners="true"
        ShowCloseButton="false" KeepOnMouseOver="false" CssClass="timeoutNotification" Animation="Fade" ShowSound="/Timeout/tada.wav" BackColor="Red">
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
