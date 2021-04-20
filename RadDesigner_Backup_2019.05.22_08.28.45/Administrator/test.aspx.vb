Public Class test
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim mystring As String = "2185_NUR3805_MC_VC"
        Dim substring As String = Mid(mystring, 6, 8)
        substring = Replace(substring, "_", "")
        Response.Write(substring)
        'Response.Write("|")

    End Sub

End Class