Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins
Imports System.Web.UI

Public Class bookReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("NextTerm") = ddlTerms.SelectedValue
        lblTerm.Text = Session("NextTerm")
        lblUsername.Text = Session("Name")
    End Sub

    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As GridItemEventArgs)
        If TypeOf e.Item Is GridDataItem Then
            Dim rowCounter As Integer = New Integer()
            Dim lbl As Label = TryCast(e.Item.FindControl("numberLabel"), Label)
            rowCounter = RadGrid1.MasterTableView.PageSize * RadGrid1.MasterTableView.CurrentPageIndex
            lbl.Text = (e.Item.ItemIndex + 1 + rowCounter).ToString()
        End If
    End Sub

    'Programming Note: the sql command for the grid was obtained by combining the update sql from a simple grid that does not sort out by UserID
    ' Then I created a new sql sourcee using a sql query rather than the simple table select and made that using Term and UserID
    ' Finally I added the update command from the first page to the second page   Make sure you have the correct sql select parameters
End Class