Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class ProctoredExamReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub RadGrid1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadGrid1.Init
        Dim menu As Telerik.Web.UI.GridFilterMenu = RadGrid1.FilterMenu
        Dim i As Integer = 0
        While i < menu.Items.Count
            If menu.Items(i).Text = "NoFilter" Or
           menu.Items(i).Text = "Contains" Or
           menu.Items(i).Text = "GreaterThan" Or
           menu.Items(i).Text = "LessThan" Or
           menu.Items(i).Text = "EqualTo" Then
                i = i + 1
            Else
                menu.Items.RemoveAt(i)
            End If
        End While
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", "window.close()", True)
    End Sub
End Class