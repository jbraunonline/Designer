Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins

Public Class MyTasks1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("UserName") = "A Acosta"
    End Sub

End Class