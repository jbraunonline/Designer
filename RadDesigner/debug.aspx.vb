Public Class debug2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim mystring As String
        mystring = "Session Variables <br><br>"

        Dim strSesVar As String
        For Each strSesVar In Session.Keys
            mystring += strSesVar + " : " + Session(strSesVar).ToString() + "<br>"
        Next

        mystring += "<br><br>END"
        Label1.Text = mystring
    End Sub

End Class