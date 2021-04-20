Public Class PhaseReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write("This page is no longer available, see Jerry")
        Response.End()
    End Sub


    Protected Function getPopUp(ByVal MyMaster As String) As String
        Dim myreturn As String = "Nada"
        Dim mycourse As String = MyMaster
        mycourse = Replace(mycourse, Session("Nextterm") & "_", "")
        mycourse = Replace(mycourse, "_MC_VC", "")
        myreturn = "<a href='PhasePopup.aspx?ID=" & mycourse & "' onclick=""centeredPopup(this.href,'myWindow','950','860','yes');return false"">Edit</a>"

        Return myreturn
    End Function

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", "window.close()", True)
    End Sub
    Private Sub RadGrid1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadGrid1.Init
        Dim menu As Telerik.Web.UI.GridFilterMenu = RadGrid1.FilterMenu
        Dim i As Integer = 0
        While i < menu.Items.Count
            If menu.Items(i).Text = "NoFilter" Or
           menu.Items(i).Text = "Contains" Or
           menu.Items(i).Text = "EqualTo" Then
                i = i + 1
            Else
                menu.Items.RemoveAt(i)
            End If
        End While
    End Sub
End Class