Public Class Design_Course
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label3.Text = Session("Course") & " " & Session("CourseID")
        If Session("Course") = "" Then
            Panel1.Visible = True
        Else
            Panel1.Visible = False

            Panel2.Visible = True

        End If

        Label2.Text = Session("Course")
    End Sub

End Class