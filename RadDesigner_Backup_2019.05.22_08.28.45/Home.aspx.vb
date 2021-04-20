Public Class Home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Course") = ""
        Session("Master_ID") = ""
        Session("MasterCourse") = ""
    End Sub

End Class