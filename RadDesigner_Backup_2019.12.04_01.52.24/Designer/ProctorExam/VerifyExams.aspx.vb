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
        CanVerify(Session("MasterCourse"))
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

    Sub CanVerify(ByVal mycourse As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "  Select PM_EXISTS ,PM_DURATION ,PM_LCL_NAME ,PM_RMT_NAME ,PF_EXISTS ,PF_DURATION ,PF_LCL_NAME ,PF_RMT_NAME "
        strsql += "From OL_MasterExam where MasterName = '" & mycourse & "'"
        ' Response.Write(strsql)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()

                Dim PM_OK As Integer = 1
                Dim PF_OK As Integer = 1

                If dr("PM_EXISTS") = True Then
                    'Response.Write(dr("PM_Duration") & " Duration anm-d lcl =" & dr("PM_LCL_Name") & "<br>")
                    If dr("PM_Duration") < 1 Then
                        PM_OK = 0
                    End If

                    If Len(dr("PM_LCL_Name")) < 3 Then
                        PM_OK = 0
                    End If

                    If Len(dr("PM_RMT_Name")) < 3 Then
                        PM_OK = 0
                    End If

                End If

                If PM_OK = 0 Then
                    lblWarn.Text = " The Mid Term Exam data is incorrect. If there is a Mid Term,  there must be a time duration and a name for the LCL and RMT exams."
                End If

                If dr("PF_EXISTS") = True Then
                    'Response.Write(dr("PF_Duration") & " Duration and lcl =" & dr("PF_LCL_Name"))
                    If CInt(dr("PF_Duration")) < 1 Then
                        PF_OK = 0
                    End If

                    If Len(dr("PF_LCL_Name")) < 3 Then
                        PF_OK = 0
                    End If

                    If Len(dr("PF_RMT_Name")) < 3 Then
                        PF_OK = 0
                    End If

                End If

                If PF_OK = 0 Then
                    lblWarn.Text = " The FInal Exam data is incorrect. If there is a Final,  there must be a time duration and a name for the LCL and RMT exams.<br>"
                End If


                If dr("PM_EXISTS") = False And dr("PF_EXISTS") = False And getworkflow(Session("MasterCourse"), Session("NextTerm"), "Exam") <> "Verified" Then
                    lblWarn.Text = "This course does not have any proctored exams."
                    btnOverride.Visible = True
                    btnVerify.Visible = False
                Else


                    If PF_OK = 1 And PM_OK = 1 Then

                        If lblVerify.Text <> "Verified" Then
                            lblVerify.Text = "Exams are NOT verified."
                            btnVerify.Visible = True
                        End If
                    End If


                End If

            End While
        Else

        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub

    Protected Sub btnOverride_Click(sender As Object, e As EventArgs) Handles btnOverride.Click
        updateProgress(Session("MasterCourse"), Session("NextTerm"), "Exam")
    End Sub

    Protected Sub btnRefresh_Click(sender As Object, e As EventArgs) Handles btnRefresh.Click
        Response.Redirect("VerifyExams.aspx")
    End Sub
End Class