Public Class popup1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblHelp.Text = Request("ID")
        If Request("ID") = "Headers" Then
            lblDetails.Text = "Do these items exist on the Main Left Menu?"
        Else
            lblDetails.Text = "Coming Soon !"

        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", "window.close()", True)
        'Response.Redirect("../ASMenu.aspx")
    End Sub
End Class