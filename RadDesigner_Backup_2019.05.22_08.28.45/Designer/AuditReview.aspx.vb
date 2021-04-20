Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins

Public Class AuditReview
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnRefresh_Click(sender As Object, e As EventArgs) Handles btnRefresh.Click
        Response.Redirect("AuditReview.aspx")
    End Sub
End Class