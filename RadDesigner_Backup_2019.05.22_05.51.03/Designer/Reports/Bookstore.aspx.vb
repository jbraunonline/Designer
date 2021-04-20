Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins

Public Class Bookstore
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblSession.Text = Session("NextTerm")
        lblName.Text = Session("Name")
    End Sub

End Class