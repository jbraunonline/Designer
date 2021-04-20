Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins

Public Class ProgressReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Then
            ' Response.Redirect("~/Default.aspx")
        End If
        Dim NewCode As String
        Dim objMyMethod As DesignModule
        objMyMethod = New DesignModule
        NewCode = objMyMethod.getNextTerm
        Session("NextTerm") = NewCode
        Dim myThisTerm As String = objMyMethod.getThisTerm
        Session("ThisTerm") = myThisTerm
        Dim myNextTerm As String = objMyMethod.getNextTerm
        Session("NextTerm") = myNextTerm

        Dim mynewmasterterm As String = objMyMethod.getNewMasterTerm
        Session("NewMasterTerm") = mynewmasterterm
        lblTerm.Text = Session("NextTerm")
    End Sub
    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs)
        If (TypeOf e.Item Is GridDataItem AndAlso e.Item.OwnerTableView.DataSourceID = "SqlDataSource1") Then
            Dim lbl As Label = CType(e.Item.FindControl("numberLabel"), Label)
            lbl.Text = (e.Item.ItemIndex + 1).ToString
        End If
    End Sub
End Class