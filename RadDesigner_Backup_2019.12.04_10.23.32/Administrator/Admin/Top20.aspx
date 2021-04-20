<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Top20.aspx.vb" Inherits="RadDesigner.Top20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <telerik:RadStyleSheetManager ID="RadStyleSheetManager2" runat="server">
</telerik:RadStyleSheetManager>
   <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            align-content:center
        }
        body {
    font-family: Arial, Helvetica, sans-serif;
    text-align: center;
}
         div.RadGrid
        {
            margin-left: auto !important;
            margin-right: auto !important;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
     
        <span class="auto-style1">
        <br />
        Top 20 Progress</span><br />
        <div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" Skin="WebBlue" Width="1033px" CssClass="RadGrid">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MasterName" FilterControlAltText="Filter MasterName column" HeaderText="MasterName" SortExpression="MasterName" UniqueName="MasterName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term" DataType="System.Int32" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Instructional_Designer" FilterControlAltText="Filter Instructional_Designer column" HeaderText="Instructional_Designer" SortExpression="Instructional_Designer" UniqueName="Instructional_Designer">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ID_ID" DataType="System.Int32" FilterControlAltText="Filter ID_ID column" HeaderText="ID_ID" SortExpression="ID_ID" UniqueName="ID_ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="Status" UniqueName="Status" Visible="false">
                    </telerik:GridBoundColumn>

                      <telerik:GridTemplateColumn HeaderText="Phase" UniqueName="Phase" SortExpression="Phase"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("Phase") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>


                      <telerik:GridTemplateColumn HeaderText="Textbook" UniqueName="Textbook" SortExpression="Textbook"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("Textbook") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>



                      <telerik:GridTemplateColumn HeaderText="Exam" UniqueName="Exam" SortExpression="Exam"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("Exam") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>



                      <telerik:GridTemplateColumn HeaderText="Audit" UniqueName="Audit" SortExpression="Audit"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("Audit") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>



                      <telerik:GridTemplateColumn HeaderText="Sweep" UniqueName="Sweep" SortExpression="Sweep"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("Sweep") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>


   
                      <telerik:GridTemplateColumn HeaderText="Copy" UniqueName="Copy" SortExpression="Copy"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("Copy") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>



                      <telerik:GridTemplateColumn HeaderText="Release" UniqueName="Release" SortExpression="Release"  AllowFiltering="false" >
                        <ItemTemplate>
                            <img src='<%# Eval("Release") %>.png' alt='No''>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>


                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    
        </div>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT ID, MasterName, Term, Instructional_Designer, ID_ID, Status, Phase, Textbook, Exam, Audit, Sweep, Copy, Release FROM OL_Progress WHERE (MasterName IN (SELECT MasterName FROM OL_MasterCourse WHERE (Top_20_CRS = 1))) AND (Term = @Term) ORDER BY MasterName">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="2193" Name="Term" SessionField="NextTerm" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>
