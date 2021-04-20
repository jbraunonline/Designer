Public Class ReviewAudit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblProgress.Text = "Review Audits for Term " & Session("NextTerm")
    End Sub

End Class