<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="_PhasePopup.aspx.vb" Inherits="RadDesigner.PhasePopup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
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
    
        Edit Phases for
        <asp:Label ID="lblCourse" runat="server" Text="Label"></asp:Label>
    
        <br />
        <asp:Button ID="Button1" runat="server" BorderColor="#CC0000" BorderWidth="2px" Text="Close Window" />
    
    </div>
        <telerik:RadDataForm ID="RadDataForm1" runat="server" CssClass="rdfLeftAligned rdfNoFieldHint" DataKeyNames="Phase_ID" DataSourceID="SqlDataSource1" RenderMode="Lightweight" Skin="Web20">
            <LayoutTemplate>
                <div class="RadDataForm RadDataForm_<%# Container.Skin %> rdfLeftAligned rdfNoFieldHint">
                    <div id="itemPlaceholder" runat="server">
                    </div>
                    <div class="rdfPager">
                        <span>
                        <telerik:RadButton ID="btnFirst" runat="server" CommandArgument="First" CommandName="Page" CssClass="rdfActionButton rdfPageFirst" RenderMode="Lightweight" ToolTip="First">
                            <Icon PrimaryIconCssClass="rdfIcon rdfPageFirstIcon" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnPrev" runat="server" CommandArgument="Prev" CommandName="Page" CssClass="rdfActionButton rdfPagePrev" RenderMode="Lightweight" ToolTip="Previous">
                            <Icon PrimaryIconCssClass="rdfIcon rdfPagePrevIcon" />
                        </telerik:RadButton>
                        </span><span>
                        <telerik:RadButton ID="btnNext" runat="server" CommandArgument="Next" CommandName="Page" CssClass="rdfActionButton rdfPageNext" RenderMode="Lightweight" ToolTip="Next">
                            <Icon PrimaryIconCssClass="rdfIcon rdfPageNextIcon" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnLast" runat="server" CommandArgument="Last" CommandName="Page" CssClass="rdfActionButton rdfPageLast" RenderMode="Lightweight" ToolTip="Last">
                            <Icon PrimaryIconCssClass="rdfIcon rdfPageLastIcon" />
                        </telerik:RadButton>
                        </span>
                    </div>
                </div>
</LayoutTemplate>
            <ItemTemplate>
                <fieldset class="rdfFieldset rdfBorders">
                    <legend class="rdfLegend">View</legend>
                    <div class="rdfRow">
                        <asp:Label ID="Phase_IDLabel2" runat="server" CssClass="rdfLabel" Text="Phase_ID"></asp:Label>
                        <asp:Label ID="Phase_IDLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Phase_ID") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CourseLabel2" runat="server" CssClass="rdfLabel" Text="Course"></asp:Label>
                        <asp:Label ID="CourseLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Course") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="TitleLabel2" runat="server" CssClass="rdfLabel" Text="Title"></asp:Label>
                        <asp:Label ID="TitleLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Title") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Term87Label2" runat="server" CssClass="rdfLabel" Text="Term87"></asp:Label>
                        <asp:Label ID="Term87Label1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Term87") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Term93Label2" runat="server" CssClass="rdfLabel" Text="Term93"></asp:Label>
                        <asp:Label ID="Term93Label1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Term93") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Term95Label2" runat="server" CssClass="rdfLabel" Text="Term95"></asp:Label>
                        <asp:Label ID="Term95Label1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Term95") %>' />
                    </div>
                    <div class="rdfCommandButtons">
                        <hr class="rdfHr" />
                        <telerik:RadButton ID="InitInsertButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="InitInsert" RenderMode="Lightweight" Text="Insert" ToolTip="Insert" Visible="false" />
                        <telerik:RadButton ID="EditButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Edit" RenderMode="Lightweight" Text="Edit" ToolTip="Edit" />
                        <telerik:RadButton ID="DeleteButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Delete" RenderMode="Lightweight" Text="Delete" ToolTip="Delete" Visible="False" />
                    </div>
                </fieldset>
            </ItemTemplate>
            <EditItemTemplate>
                <fieldset class="rdfFieldset rdfBorders">
                    <legend class="rdfLegend">Edit</legend>
                    <div class="rdfRow">
                        <asp:Label ID="Phase_IDLabel2" runat="server" CssClass="rdfLabel" Text="Phase_ID"></asp:Label>
                        <asp:Label ID="Phase_IDLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Phase_ID") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CourseLabel2" runat="server" AssociatedControlID="CourseTextBox" CssClass="rdfLabel" Text="Course"></asp:Label>
                        <telerik:RadTextBox ID="CourseTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Course") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="TitleLabel2" runat="server" AssociatedControlID="TitleTextBox" CssClass="rdfLabel" Text="Title"></asp:Label>
                        <telerik:RadTextBox ID="TitleTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Title") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Term87Label2" runat="server" AssociatedControlID="Term87TextBox" CssClass="rdfLabel" Text="Term87"></asp:Label>
                        <telerik:RadTextBox ID="Term87TextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Term87") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Term93Label2" runat="server" AssociatedControlID="Term93TextBox" CssClass="rdfLabel" Text="Term93"></asp:Label>
                        <telerik:RadTextBox ID="Term93TextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Term93") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Term95Label2" runat="server" AssociatedControlID="Term95TextBox" CssClass="rdfLabel" Text="Term95"></asp:Label>
                        <telerik:RadTextBox ID="Term95TextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Term95") %>' WrapperCssClass="rdfInput" Width="155" />
                    </div>
                    <div class="rdfCommandButtons">
                        <hr class="rdfHr" />
                        <telerik:RadButton ID="UpdateButton" runat="server" ButtonType="SkinnedButton" CommandName="Update" RenderMode="Lightweight" Text="Update" ToolTip="Update" />
                        <telerik:RadButton ID="CancelButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Cancel" RenderMode="Lightweight" Text="Cancel" ToolTip="Cancel" />
                    </div>
                </fieldset>
            </EditItemTemplate>
            <InsertItemTemplate>
                <fieldset class="rdfFieldset rdfBorders">
                    <legend class="rdfLegend">Insert</legend>
                    <div class="rdfRow">
                        <asp:Label ID="CourseLabel2" runat="server" AssociatedControlID="CourseTextBox" CssClass="rdfLabel" Text="Course"></asp:Label>
                        <telerik:RadTextBox ID="CourseTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Course") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="TitleLabel2" runat="server" AssociatedControlID="TitleTextBox" CssClass="rdfLabel" Text="Title"></asp:Label>
                        <telerik:RadTextBox ID="TitleTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Title") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Term87Label2" runat="server" AssociatedControlID="Term87TextBox" CssClass="rdfLabel" Text="Term87"></asp:Label>
                        <telerik:RadTextBox ID="Term87TextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Term87") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Term93Label2" runat="server" AssociatedControlID="Term93TextBox" CssClass="rdfLabel" Text="Term93"></asp:Label>
                        <telerik:RadTextBox ID="Term93TextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Term93") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Term95Label2" runat="server" AssociatedControlID="Term95TextBox" CssClass="rdfLabel" Text="Term95"></asp:Label>
                        <telerik:RadTextBox ID="Term95TextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Term95") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfCommandButtons">
                        <hr class="rdfHr" />
                        <telerik:RadButton ID="PerformInsertButton" runat="server" ButtonType="SkinnedButton" CommandName="PerformInsert" RenderMode="Lightweight" Text="Insert" ToolTip="Insert" Visible="false" />
                        <telerik:RadButton ID="CancelButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Cancel" RenderMode="Lightweight" Text="Cancel" ToolTip="Cancel" Visible="false" />
                    </div>
                </fieldset>
            </InsertItemTemplate>
            <EmptyDataTemplate>
                <div class="RadDataForm RadDataForm_<%# Container.Skin %>">
                    <div class="rdfEmpty">
                        There are no items to be displayed.</div>
                </div>
            </EmptyDataTemplate>
        </telerik:RadDataForm>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_MasterPhase] WHERE [Phase_ID] = @Phase_ID" InsertCommand="INSERT INTO [OL_MasterPhase] ([Course], [Title], [Term87], [Term93], [Term95]) VALUES (@Course, @Title, @Term87, @Term93, @Term95)" SelectCommand="SELECT [Phase_ID], [Course], [Title], [Term87], [Term93], [Term95] FROM [OL_MasterPhase] WHERE ([Course] = @Course)" UpdateCommand="UPDATE [OL_MasterPhase] SET [Course] = @Course, [Title] = @Title, [Term87] = @Term87, [Term93] = @Term93, [Term95] = @Term95 WHERE [Phase_ID] = @Phase_ID">
            <DeleteParameters>
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Term87" Type="String" />
                <asp:Parameter Name="Term93" Type="String" />
                <asp:Parameter Name="Term95" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="Enc1101" Name="Course" QueryStringField="ID" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Term87" Type="String" />
                <asp:Parameter Name="Term93" Type="String" />
                <asp:Parameter Name="Term95" Type="String" />
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
