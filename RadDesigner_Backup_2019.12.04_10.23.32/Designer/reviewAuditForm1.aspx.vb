Public Class reviewAuditForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Audit_ID") = Request("ID")
    End Sub

End Class