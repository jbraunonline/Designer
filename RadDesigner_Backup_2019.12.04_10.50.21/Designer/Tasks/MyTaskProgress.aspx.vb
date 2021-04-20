Imports Telerik.Web.UI.Skins
Public Class MyTaskProgress
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Term") = 2185
        Session("UserName") = "M Rios"
    End Sub

End Class