<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Page1.aspx.vb" Inherits="RadDesigner.Page1" %>

<html xmlns='http://www.w3.org/1999/xhtml'>

<head runat="server">

    <title>Telerik ASP.NET Example</title>

    <link rel="stylesheet" type="text/css" href="styles.css" />

    <script type="text/javascript" src="scripts.js"></script>

</head>

<body>

    <form id="form1" runat="server">

        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadWizard ID="RadWizard1" Runat="server" DisplayCancelButton="True" Skin="WebBlue" Width="800px">
                <WizardSteps>
        <telerik:RadWizardStep Title="Requestor Information" Runat="server" ValidationGroup="accountInfo" CausesValidation="true" CssClass="auto-style1" style="margin-left: 6px">
            <h2>Requestor Information</h2>
            First Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <telerik:RadTextBox ID="RadTextBoxRFirst" Runat="server" EmptyMessage="Enter FirstName" LabelWidth="64px" Resize="None" Width="160px" ValidationGroup="accountinfo">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadTextBoxRFirst" ErrorMessage="Required Field" ValidationGroup="accountInfo"></asp:RequiredFieldValidator>
            <br />
            <br />
            Last Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <telerik:RadTextBox ID="RadTextBox1" Runat="server" EmptyMessage="Enter Last Name" LabelWidth="64px" Resize="None" Width="160px">
            </telerik:RadTextBox>
            <br />
            <br />
            MDC Username:<telerik:RadTextBox ID="RadTextBox2" Runat="server" EmptyMessage="Enter MDC username" LabelWidth="64px" Resize="None" Width="160px">
            </telerik:RadTextBox>
            &nbsp;@mdc.edu<br />
            <br />
            Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <telerik:RadTextBox ID="RadTextBox3" Runat="server" EmptyMessage="Enter Phone #" LabelWidth="92px" Resize="None" Width="232px">
            </telerik:RadTextBox>
            <br />
            <br />
            <telerik:RadCheckBox ID="RadCheckBox1" runat="server" style="top: 0px; left: 0px; height: 30px" Text="Staff Member" Width="150px" EnableAriaSupport="True" Font-Size="Small">
            </telerik:RadCheckBox>
            <br />
            <br />
            <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" AutoPostBack="True" Culture="en-US">
                <calendar enableweekends="True" fastnavigationnexttext="&amp;lt;&amp;lt;" usecolumnheadersasselectors="False" userowheadersasselectors="False">
                </calendar>
                <dateinput autopostback="True" dateformat="M/d/yyyy" displaydateformat="M/d/yyyy" labelwidth="40%">
                    <emptymessagestyle resize="None" />
                    <readonlystyle resize="None" />
                    <focusedstyle resize="None" />
                    <disabledstyle resize="None" />
                    <invalidstyle resize="None" />
                    <hoveredstyle resize="None" />
                    <enabledstyle resize="None" />
                </dateinput>
                <datepopupbutton hoverimageurl="" imageurl="" />
            </telerik:RadDatePicker>
            <br />
        </telerik:RadWizardStep>
        <telerik:RadWizardStep Title="Access Details" Runat="server">
            <h2>Grant Access to this Course, Organization</h2>
            Course or ORG:
            <asp:TextBox ID="TextBox1" runat="server" Width="757px"></asp:TextBox>
            &nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If multiple courses, please separate them with commas: 2177-12345,2177-78945<br />
            <br />
            User Role in Course:
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Student</asp:ListItem>
                <asp:ListItem>Instructor / Designer</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Duration of access:&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>1 Month</asp:ListItem>
                <asp:ListItem>This Term</asp:ListItem>
                <asp:ListItem>Raminder of Academic Year</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
        </telerik:RadWizardStep>
        <telerik:RadWizardStep Title="Guest Details" Runat="server">
            <h2>Guest Details</h2>
            First Name:
            <asp:TextBox ID="txtGfirst" runat="server"></asp:TextBox>
            <br />
            <br />
            Last Name:
            <asp:TextBox ID="txtGlast" runat="server"></asp:TextBox>
            <br />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtGemail" runat="server"></asp:TextBox>
            <br />
            <br />
            Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtGphone" runat="server"></asp:TextBox>
            <br />
            <br />
        </telerik:RadWizardStep>
        <telerik:RadWizardStep Title="Final" Runat="server">
            <h2>Guest Details</h2>
            First Name:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Last Name:
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
        </telerik:RadWizardStep>
    </WizardSteps>
        </telerik:RadWizard>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>

</body>

</html>