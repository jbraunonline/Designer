Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail

Public Class logintest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write(System.Threading.Thread.CurrentPrincipal.Identity.Name)
    End Sub

End Class