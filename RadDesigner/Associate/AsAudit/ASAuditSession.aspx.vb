Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class ASAuditSession
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request("ID") = "" Then
            Session("MasterAuditName") = GetMasterCourse(Session("Audit_ID"))
        Else
            Session("Audit_ID") = Request("ID")
            Session("MasterAuditName") = GetMasterCourse(Session("Audit_ID"))
        End If
        Response.Redirect("ASDualAudit.aspx")
        'was adauditform1.a[sx
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

End Class