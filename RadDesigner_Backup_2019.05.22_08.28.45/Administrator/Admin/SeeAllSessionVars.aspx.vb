Public Class SeeAllSessionVars
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strSesVar As String
        For Each strSesVar In Session.Keys
            Response.Write(strSesVar + " : " + Session(strSesVar).ToString() + "<br>")
        Next

        Response.Write("<br><br>END")
    End Sub

End Class