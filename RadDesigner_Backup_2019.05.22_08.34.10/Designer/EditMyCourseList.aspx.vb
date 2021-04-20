Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins
Public Class EditMyCourseList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1.Text = "Edit " & Session("NextTerm") & " Courses for " & Session("Name") & "  " & Session("User_ID")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("NewCourseWizard.aspx")
    End Sub
End Class