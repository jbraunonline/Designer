Public Class PhaseHistory
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim mycourse As String = Request("ID")
        mycourse = Replace(mycourse, "2185_", "")
        mycourse = Replace(mycourse, "_MC_VC", "")
        'Response.Write(mycourse)
        Session("Course") = mycourse
        Label1.Text = mycourse
    End Sub

End Class