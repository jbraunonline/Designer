Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class UpdateOL_MasterExam_temp4pilots
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myreturn As String = ""
        Dim strsql As String
        strsql = "SELECT MasterName, IsMid, IsFin FROM OL_MasterPRoctor Where Term= '2193'"

        Dim myCommand As New SqlCommand(strsql, myConnection)
        'Response.Write(strsql & "<br>")
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Response.Write(dr("MasterName") & "," & dr("IsMid") & "," & dr("IsFin") & "<br>")
                UpdateMasterExam(dr("MasterName"), dr("IsMid"), dr("IsFin"))
            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub
    Private Sub UpdateMasterExam(ByVal myMaster As String, myMid As Integer, myFin As Integer)

        Dim strSQL As String = "Update OL_MasterExam set"
        strSQL += " PM_Exists=" & myMid & ","
        strSQL += " PF_Exists=" & myFin
        strSQL += " Where MasterName = '" & myMaster & "'"


        Response.Write(strSQL & "<br><br>")


        Dim myNEWConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myNEWConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myNEWConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD..[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[_HOLD_[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[..
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record 
            Response.Write("Fail")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try


    End Sub



End Class