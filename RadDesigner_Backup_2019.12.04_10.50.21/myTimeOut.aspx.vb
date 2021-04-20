Imports Telerik.Web.UI
Public Class myTmeOut
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'set the expire timeout for the session 
            'Session.Timeout = 2
            Session.Timeout = 60
            'configure the notification to automatically show 1 min before session expiration
            RadNotification1.ShowInterval = (Session.Timeout - 0.5) * 60 * 1000
            'ResolveClentURL= SessionExpired.aspx
            'set the redirect url as a value for an easier and faster extraction in on the client
            RadNotification1.Value = Page.ResolveClientUrl("default1.aspx")
        End If
    End Sub
    Protected Sub OnCallbackUpdate(sender As Object, e As RadNotificationEventArgs)

    End Sub
End Class