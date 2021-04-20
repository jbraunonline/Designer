<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="ReleaseAudit.aspx.vb" Inherits="RadDesigner.ReleaseAudit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <link href="~/Timeout/styles.css" rel="stylesheet" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

/* Create two unequal columns that floats next to each other */
.column {
  float: left;
  padding: 10px;
  height: 1100px; /* Should be removed. Only for demonstration */
}

.left {
  width: 60%;
}

.right {
  width: 40%;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
<div class="row">
  <div class="column left" style="background-color:#ffffff;">
       <p><asp:Button ID="btnReturn" runat="server" BackColor="#336699" Font-Bold="True" Font-Names="Arial" ForeColor="White" Text="Return to Audit List" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblMaster" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"></asp:Label>
       &nbsp; Designer Audit</p>
<telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" Skin="WebBlue" SelectedIndex="0" Width="900px">
                    <Tabs>
            <telerik:RadTab runat="server" Text="Course Info"  Visible="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Main Menu" visible="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Learning Modules" Visible="True" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Proctored Exams" Visible="True" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Course Management" Visible="True" Selected="True" >
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="Audit Status" Visible="True" >
            </telerik:RadTab>                       
                         

                        
                                </Tabs>
        </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" >
        <telerik:RadPageView ID="RadPageView1" runat="server" Width="900px" Height="800px"
                ContentUrl="~/Associate/AsAudit/AsAuditForm/AsCourse.aspx">
                   </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" Width="900px" Height="800px"
                ContentUrl="~/Associate/AsAudit/AsAuditForm/AsMenu.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" Width="900px" Height="800px"
                ContentUrl="~/Associate/AsAudit/AsAuditForm/AsModules.aspx">
        </telerik:RadPageView>
         <telerik:RadPageView ID="RadPageView4" runat="server" Width="900px" Height="800px"
                ContentUrl="~/Associate/AsAudit/AsAuditForm/ASProctoredExam.aspx">
        </telerik:RadPageView>
               <telerik:RadPageView ID="RadPageView5" runat="server" Width="900px" Height="800px"
                 ContentUrl="~/Associate/AsAudit/AsAuditForm/AsManagement.aspx">
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView6" runat="server" Width="900px" Height="800px"
                ContentUrl="~/Associate/AsAudit/AsAuditForm/AsStatus.aspx">
        </telerik:RadPageView>






           </telerik:RadMultiPage>
  </div>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
  <div class="column right" style="background-color:#ffffff">
 
     

 
 
        <span class="auto-style1"><strong>Please place ALL Audit Notes Here.<br />
        </strong></span>When saved, today&#39;s date and your name will appear at the top of the message window.<br />
    
        Notes for&nbsp; <asp:Label ID="lblAuditMasterName" runat="server"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="SaveNotes" BackColor="Red" Font-Bold="True" ForeColor="White" Visible="False" />
        <asp:Button ID="brnAjax" runat="server" Text="Save Notes" BackColor="#99FFCC" BorderColor="#CC0000" BorderWidth="4px" Font-Bold="True" />
        <telerik:RadEditor ID="RadEditor1" Runat="server" Width="500px" RenderMode="Lightweight" Skin="WebBlue">
            <Tools>
                <telerik:EditorToolGroup Tag="MainToolbar">
                    <telerik:EditorTool Name="FindAndReplace" />
                    <telerik:EditorSeparator />
                    <telerik:EditorSplitButton Name="Undo">
                    </telerik:EditorSplitButton>
                    <telerik:EditorSplitButton Name="Redo">
                    </telerik:EditorSplitButton>
                    <telerik:EditorSeparator />
                    <telerik:EditorTool Name="Cut" />
                    <telerik:EditorTool Name="Copy" />
                    <telerik:EditorTool Name="Paste" ShortCut="CTRL+V / CMD+V" />
                </telerik:EditorToolGroup>
                <telerik:EditorToolGroup Tag="Formatting">
                    <telerik:EditorTool Name="Bold" />
                    <telerik:EditorTool Name="Italic" />
                    <telerik:EditorTool Name="Underline" />
                    <telerik:EditorSeparator />
                    <telerik:EditorSplitButton Name="ForeColor">
                    </telerik:EditorSplitButton>
                    <telerik:EditorSplitButton Name="BackColor">
                    </telerik:EditorSplitButton>
                    <telerik:EditorSeparator />
                    <telerik:EditorDropDown Name="FontName">
                    </telerik:EditorDropDown>
                    <telerik:EditorDropDown Name="RealFontSize">
                    </telerik:EditorDropDown>
                </telerik:EditorToolGroup>
            </Tools>
            <Content>
</Content>

<TrackChangesSettings CanAcceptTrackChanges="False"></TrackChangesSettings>
        </telerik:RadEditor>
          
  </div>
              </ContentTemplate>
              </asp:UpdatePanel>
</div>
        <% =System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath) %><br />
        <% =System.IO.Path.GetFullPath(Request.Url.AbsolutePath) %><br />
</asp:Content>
