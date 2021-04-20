Imports Telerik.Web.UI.Skins

Public Class CopyProgress
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write(Session("User_ID"))
    End Sub

End Class