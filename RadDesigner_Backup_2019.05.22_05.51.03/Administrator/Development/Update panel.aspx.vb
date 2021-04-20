Public Class Update_panel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        DateTimeLabel1.Text = DateTime.Now.ToString()
        DateTimeLabel2.Text = DateTime.Now.ToString()
    End Sub

End Class