Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports Telerik.Web.UI

Public Class ReviewAuditForm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If Not IsPostBack Then
            'set the expire timeout for the session 
            'Session.Timeout = 2
            Session.Timeout = 60
            'configure the notification to automatically show 1 min before session expiration
            RadNotification1.ShowInterval = (Session.Timeout - 0.5) * 60 * 1000
            'ResolveClentURL= SessionExpired.aspx
            'set the redirect url as a value for an easier and faster extraction in on the client
            RadNotification1.Value = Page.ResolveClientUrl("/Default.aspx")
        End If
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        lblMaster.Text = "     This is audit data for  " & GetMasterCourse(Request("ID"))
        Session("MasterAuditName") = GetMasterCourse(Request("ID"))
        Session("Audit_ID") = Request("ID")
    End Sub

    Function GetMasterCourse(ByVal myID As Integer) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myreturn As String = "Not Found"
        Dim strsql As String
        strsql = "SELECT MasterName FROM OL_MasterAudit Where Audit_ID=" & myID

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("MasterName")
            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()




        Return myreturn
    End Function

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs) Handles btnReturn.Click
        Response.Redirect("ReviewAudit.aspx")
    End Sub

    Protected Sub OnCallbackUpdate(sender As Object, e As RadNotificationEventArgs)

    End Sub


End Class