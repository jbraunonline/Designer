Public Class FinSettings
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblMasterCourse.Text = Session("MasterCourse")
    End Sub

End Class