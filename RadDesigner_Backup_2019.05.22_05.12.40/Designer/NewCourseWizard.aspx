<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewCourseWizard.aspx.vb" Inherits="RadDesigner.NewCoourseWizard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <style type="text/css">
                  td {
             vertical-align: top;
        }
               .auto-style1 {
            text-align: left;
        }
        .centered{
            margin-left:30%;
        }
        .auto-style2 {
            width: 144px;
        }
        .auto-style3 {
            width: 144px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style6 {
            height: 26px;
            width: 37px;
        }
        .auto-style7 {
            width: 37px;
            height: 20px;
        }
        .auto-style8 {
            height: 20px;
        }
        .auto-style9 {
            width: 37px;
        }
        .auto-style10 {
            width: 144px;
            height: 28px;
        }
        .auto-style11 {
            height: 28px;
        }
        .auto-style12 {
            color: #CC0000;
        }
        .auto-style13 {
            width: 100%;
        }
        .auto-style14 {
            width: 37px;
            height: 36px;
        }
        .auto-style15 {
            height: 36px;
        }
        .auto-style16 {
            font-size: x-small;
        }
        .auto-style18 {
            width: 144px;
            height: 33px;
        }
        .auto-style19 {
            height: 33px;
        }
        .auto-style20 {
            color: #CC0000;
            background-color: #FFFFFF;
        }
        </style>
</head>
<body>
        <div class="left">
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
    <div>
    
        <h4><strong>&nbsp;
    
        Add New Master Course to Designer DB </strong></h4>
        <p>&nbsp; 
            <asp:Button ID="Button1" runat="server" BackColor="Lime" Font-Bold="True" Text="Return to Course List" />&nbsp;<asp:Label ID="lblCreated" runat="server" ForeColor="#CC0000"></asp:Label>
            &nbsp;
            <br />
            This is a two step process. First we create a catalog entry for a course and then we create a new Master Course.&nbsp;</p>
        </div>
         <div class="auto-style1">
        <telerik:RadWizard ID="RadWizard1" Runat="server" DisplayCancelButton="True" Width="985px" Skin="WebBlue">
                            <WizardSteps>
        <telerik:RadWizardStep Title="CatalogInfo" Runat="server" CssClass="auto-style1" style="margin-left: 6px"  AllowReturn="false" ValidationGroup="catalog" >
            <h2>New Course Catalog Information</h2>
            &nbsp;<table class="auto-style1">
                <tr>
                    <td class="auto-style10">[CatalogName]</td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtCatName" runat="server" Width="321px" CausesValidation="True" ValidationGroup="catalog"></asp:TextBox>
                        &nbsp; Example: EXX1234
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCatName" ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="Red" ValidationGroup="catalog">Required</asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">[Title]</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtCatTitle" runat="server" Width="321px" CausesValidation="True" ValidationGroup="catalog"></asp:TextBox>
                        &nbsp;Example:&nbsp; Introduction to Phonix&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCatTitle" ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="#CC0000" ValidationGroup="catalog">Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">[Subject_Area]</td>
                    <td class="auto-style19">
                        <asp:DropDownList ID="ddlSubject_area" runat="server" DataTextField="Subject_Area" DataValueField="Subject_Area" AutoPostBack="True" CausesValidation="True" ValidationGroup="catalog">
                        </asp:DropDownList>
                        <span class="auto-style20">&nbsp;</span><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlSubject_area" ErrorMessage="Please Select" ForeColor="#CC0000" InitialValue="0" ValidationGroup="catalog" Font-Bold="True"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">[Term_Offering]</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlTermOffering" runat="server" DataSourceID="SqlDataSource2" DataTextField="Text" DataValueField="Text">
                        </asp:DropDownList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">[Credits]</td>
                    <td>
                        <asp:DropDownList ID="ddlCredits" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem Selected="True">3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">[Pre_Requisites]</td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtPreReq" runat="server" Width="321px">unknown</asp:TextBox>
                        &nbsp;No commas or apostrophes<br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">[Co_Requisites]</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtCoReq" runat="server" Width="321px">unknown</asp:TextBox>
                        &nbsp;No commas or apostrophes<br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">[Status]</td>
                    <td>
                        <asp:DropDownList ID="ddlCatalogStatus" runat="server">
                            <asp:ListItem Selected="True">Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp; This indicates if this catalog entry is active or inactive.<br />
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Text], [Value] FROM [OL_DropdownItems] WHERE ([Item] = @Item)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Offering" Name="Item" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT distinct       [Subject_Area]

  FROM [VC_VCData1].[dbo].[OL_Catalog]
Where Subject_area &lt;&gt; ''"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT [Text], [Value] FROM [DropdownItems] WHERE ([Item] = @Item)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="MasterStatus" Name="Item" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <hr style="border-style: solid; border-width: medium" />
            Selecting &quot;Next&quot; will create a new catalog record. You cannot return or modify data after it is saved.<br /> <span class="auto-style12">Enter the New Course Catalog Information carefully</span>. ONLY the adminisrator can change this record after it is created<br />
        </telerik:RadWizardStep>
        <telerik:RadWizardStep Title="MasterInfo"  CssClass="auto-style1" Runat="server">
            <h2>Master Course Details</h2>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style9">Course</td>
                    <td>
                        <asp:Label ID="lblMasterName" runat="server"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">[Course]</td>
                    <td>
                        <asp:Label ID="lblCourse" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Developer</td>
                    <td>
                        <asp:TextBox ID="txtDeveloper" runat="server" BackColor="#D9ECFF" Width="443px">None</asp:TextBox>
                        &nbsp;No commas or apostrophes<br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">CoDev</td>
                    <td>
                        <asp:TextBox ID="txtCoDeveloper" runat="server" BackColor="#D9ECFF" Width="443px">none</asp:TextBox>
                        No commas or apostrophes<br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">Designer</td>
                    <td class="auto-style15">
                        &nbsp;<br />
                        <asp:Label ID="lblDesigner" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Term</td>
                    <td>
                        <asp:Label ID="lblNextTerm" runat="server"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Status</td>
                    <td>
                        <asp:DropDownList ID="ddlMasterStatus" runat="server">
                            <asp:ListItem Selected="True">Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                            <asp:ListItem>Pilot</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<span class="auto-style12"> <strong>If Pilot,</strong> mark as pilot course</span><br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Phase</td>
                    <td><span class="auto-style16">A blank Phase Record will be created. Phase data must be entered fat the Master Course level in the GUI.</span><br /> </td>
                </tr>
                <tr>
                    <td class="auto-style6">Title</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label>
                    </td>
                
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtCredits" runat="server" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblCatalogID" runat="server"></asp:Label>
            <br />
        </telerik:RadWizardStep>
        <telerik:RadWizardStep Title="Save Master"  CssClass="auto-style1" Runat="server" >
            <h2>Review of New Catalog/Master Course</h2>
            <p>
                &nbsp;
            </p>
            <table class="auto-style13">
                <tr>
                    <td>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        
                    </td>
                    <td><asp:Literal ID="Literal2" runat="server"></asp:Literal></td>
                </tr>

            </table>
<div class="w3-cell-row">
  <div class="w3-container  w3-cell m6" >
      <p>&nbspbb;</p>
  </div>
  <div class="w3-container  w3-cell m6" >
      <p>&nbsvvp;</p>
  </div>
</div>
            <br />
        </telerik:RadWizardStep>
    </WizardSteps>



        </telerik:RadWizard>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    </form>
</div>
</body>
</html>
