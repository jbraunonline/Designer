Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins

Public Class Sweep
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblTitle.Text = "Sweeps for " & Session("NextTerm")
    End Sub

End Class