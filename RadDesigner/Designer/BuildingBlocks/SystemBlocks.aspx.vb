Imports Telerik.Web.UI


Public Class SystemBlocks
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs)
        For Each groupHeader As GridGroupHeaderItem In RadGrid1.MasterTableView.GetItems(GridItemType.GroupHeader)
            Dim children As GridItem() = groupHeader.GetChildItems()

            For Each child As GridItem In children
                If child.Expanded Then child.Expanded = False
            Next
        Next
    End Sub
End Class