Public Class _default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim myID As String = System.Threading.Thread.CurrentPrincipal.Identity.Name
        'myID = "MDCC\aboxley1"
        Dim myUserID As String
        If Left(myID, 4) = "MYMD" Then
            myUserID = Replace(myID, "MYMDC\", "")
        Else
            myUserID = Replace(myID, "MDCC\", "")

        End If

        Session("Username") = myUserID
        Label1.Text = " Wecome " & Session("Username")


        ' for testing authentication   hide if not testing
        'Session("UserName") = "jbraun1"

        Response.Write("Session Username= " & Session("UserName"))
        Response.Redirect("Authenticate.aspx")
    End Sub

End Class