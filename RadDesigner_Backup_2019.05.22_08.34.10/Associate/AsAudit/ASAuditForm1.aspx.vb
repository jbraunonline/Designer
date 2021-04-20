Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class ASAuditForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Session("Audit_ID") = Request("ID")
        ' Response.Write(Session("Audit_ID"))
        'lblMaster.Text = "     This is audit data for  " & GetMasterCourse(Session("Audit_ID"))
        ' Session("MasterAuditName") = GetMasterCourse(Session("Audit_ID"))
        If Session("Role") = 2 Then
            btnReturn.Visible = True
        End If

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
        Response.Redirect("AsAuditProgress.aspx")
    End Sub
End Class