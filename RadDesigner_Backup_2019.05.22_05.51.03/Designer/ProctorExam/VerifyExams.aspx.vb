Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class VerifyExams
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblVerify.Text = getworkflow(Session("MasterCourse"), Session("NextTerm"), "Exam")
        If lblVerify.Text <> "Verified" Then
            btnVerify.Visible = True
        End If
    End Sub
    Function getworkflow(ByVal mycourse As String, ByVal myTerm As Integer, myItem As String) As String
        Dim myreturn As String = "Not Verified"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT Exam  FROM OL_Progress where MasterName= '" & mycourse & "' And Term =" & myTerm
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If dr("Exam") = True Then
                    myreturn = "Verified"
                End If

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Sub updateProgress(ByVal mycourse As String, ByVal myTerm As Integer, myitem As String)
        Dim mysql As String = " Update OL_Progress SET "
        mysql += myitem & "=" & 1 & " where MasterName= '" & mycourse & "' And Term =" & myTerm

        'Response.Write(mysql & "<br>")


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mysql, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record 
            Response.Write("Fail")
        Finally
            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try
        Response.Redirect("VerifyExams.aspx")

    End Sub

    Protected Sub btnVerify_Click(sender As Object, e As EventArgs) Handles btnVerify.Click
        updateProgress(Session("MasterCourse"), Session("NextTerm"), "Exam")
    End Sub
End Class