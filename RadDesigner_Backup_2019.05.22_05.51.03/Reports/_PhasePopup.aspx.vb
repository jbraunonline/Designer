﻿Public Class PhasePopup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblCourse.Text = Request.QueryString("ID")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", "window.close()", True)
    End Sub
End Class