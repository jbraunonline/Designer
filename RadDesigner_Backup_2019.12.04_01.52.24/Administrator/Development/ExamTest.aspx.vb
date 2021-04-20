Imports System
Imports System.Collections.Generic
Imports System.Net.Mime.MediaTypeNames
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports System.Data.SqlClient


Public Class ExamTest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        VerifyExam(TextBox1.Text)
    End Sub

    Sub VerifyExam(ByVal mycourse As String)
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
                    Response.Write(" The Mid Term Exam data is incorrect. If there is a Mid Term,  there must be a time duration and a name for the LCL and RMT exams.<br>")
                End If

                If dr("PF_EXISTS") = True Then

                        If dr("PF_Duration") < 1 Then
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
                    Response.Write(" The FInal Exam data is incorrect. If there is a Final,  there must be a time duration and a name for the LCL and RMT exams.<br>")
                End If


                If dr("PM_EXISTS") = False And dr("PF_EXISTS") = False Then
                    Response.Write("This course does not have any proctored exams.")
                    Button2.Visible = True
                End If


            End While
        Else

        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Write("OK")
    End Sub
End Class