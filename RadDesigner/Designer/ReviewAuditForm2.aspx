<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="ReviewAuditForm2.aspx.vb" Inherits="RadDesigner.ReviewAuditForm2" %>
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
    
    <br />
    <asp:Button ID="btnReturn" runat="server" Text="Return to Designer's Audit List" BackColor="#99FF99" />
<iframe src="../associate/ASAudit/ASAuditSession.aspx"  frameborder="0" scrolling="no" width="100%" height="1200" align="left"> </iframe> 
</asp:Content>
