<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Designer.aspx.vb" Inherits="RadDesigner.Designer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager2" runat="server">
</telerik:RadStyleSheetManager>
        <style type="text/css">
            .auto-style2 {
                width: 200px;
            }
        </style>
      <link href="/Timeout/styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <table cellspacing="0" cellpadding="0">
 <tr><td style="vertical-align:top; " class="auto-style2" >

     <asp:Label ID="lblUserName" runat="server"></asp:Label>
     <br />

     <asp:DropDownList ID="DropDownList2" runat="server" DataTextField="Course" DataValueField="Master_ID" AutoPostBack="True"></asp:DropDownList>
   
           <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="WebBlue" Orientation="VerticalLeft" SelectedIndex="0" Width="200px" Visible="False" BorderWidth="1px" BorderStyle="None" Font-Bold="True" Font-Names="Arial">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Courses"  Visible="True" Selected="True" BackColor="LightSteelBlue" BorderColor="#400040" BorderStyle="Solid" BorderWidth="0px" ForeColor="Black" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="BuildingBlocks" visible="True" BackColor="LightSteelBlue" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Textbooks" visible="True" BackColor="LightSteelBlue" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Phase" visible="True" BackColor="LightSteelBlue" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="ProctoredExam" visible="True" BackColor="LightSteelBlue" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Audit" visible="True" BackColor="LightSteelBlue">
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Sweep" visible="True" BackColor="LightSteelBlue" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="QA / Release" visible="True" BackColor="LightSteelBlue" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="My Progress" visible="True" BackColor="LightSteelBlue" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Priority Progress" visible="True" BackColor="LightSteelBlue" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Edit MyCourses" visible="True" BackColor="LightSteelBlue" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="BookStore" visible="True" BackColor="LightSteelBlue" >
            </telerik:RadTab>

         </Tabs>
        </telerik:RadTabStrip>

            </td>
            <td style = "text-align: left;">
<telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="1600px" Height="1200px"
                ContentUrl="Design_Course.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="BuildingBlocks/BuildingBlockReport.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="Textbook.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="Phases.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="Exam.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView6" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="Audit/AuditProgress.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView7" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="Sweep.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView8" runat="server" Width="1500px" Height="1200px"
                 ContentUrl="CopyPages/copyprogress.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView9" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="MyProgress.aspx">
        </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView10" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="MyProgress2.aspx">
        </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView11" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="EditMyCourseList.aspx">
        </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView12" runat="server" Width="1600px" Height="1200px"
                 ContentUrl="Reports/BookReport.aspx">
        </telerik:RadPageView>

    </telerik:RadMultiPage>
 
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
