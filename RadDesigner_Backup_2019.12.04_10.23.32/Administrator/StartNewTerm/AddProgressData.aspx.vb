Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AddProgressData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("NextTerm") = txtNextTerm.Text
        ' lblNextTerm.Text = Session("NextTerm")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        'DUMMY NOTE.  In OL_MasterCourse the Term is an INTEGER!  Everywhere else it is a STRING!
        Dim strsql As String
        strsql = "Select [MasterName] ,[Instructional_Designer] ,[ID_ID]  ,[Term] ,[Status]  ,[Phase] "
        strsql += "From [VC_VCData1].[dbo].[OL_MasterCourse]  Where Term = " & txtLastTerm.Text

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()
        Dim MasterName As String
        Dim Instructional_Designer As String
        Dim ID_ID As Integer
        Dim Term As Integer
        Dim Phase As String
        Dim Status As String

        If dr.HasRows Then
            While dr.Read()
                MasterName = Replace(dr("MasterName"), txtLastTerm.Text, txtNextTerm.Text)

                Instructional_Designer = dr("Instructional_Designer")

                ID_ID = dr("ID_ID")

                Term = Session("NextTerm")

                Status = dr("Status")

                Phase = dr("Phase")

                Response.Write(MasterName & ", " & Instructional_Designer & ", " & ID_ID & ", " & Term & ", " & Status & ", " & Phase & " <br>")

                addmyData(MasterName, Instructional_Designer, ID_ID, Term, Phase, Status)

                'updateMidData(dr("CourseID"), dr("PM_EXISTS"), dr("PM_DURATION"), dr("PM_MG"), dr("PM_MG_FB"), dr("PM_MG_ES"), dr("PM_MG_SA"), dr("PM_MG_OTHER"), dr("PM_REQ_ANX"), dr("PM_LIST_MTRLS_OPT1"), dr("PM_LIST_MTRLS_OPT2"), dr("PM_LIST_MTRLS_OPT3"), dr("PM_LIST_ANXMTRLS"), dr("PM_WEIGHT"), dr("PM_LCL_NAME"), dr("PM_RMT_NAME"))
                ' updateFinData(dr("CourseID"), dr("PF_EXISTS"), dr("PF_DURATION"), dr("PF_MG"), dr("PF_MG_FB"), dr("PF_MG_ES"), dr("PF_MG_SA"), dr("PF_MG_OTHER"), dr("PF_REQ_ANX"), dr("PF_LIST_MTRLS_OPT1"), dr("PF_LIST_MTRLS_OPT2"), dr("PF_LIST_MTRLS_OPT3"), dr("PF_LIST_ANXMTRLS"), dr("PF_WEIGHT"), dr("PF_LCL_NAME"), dr("PF_RMT_NAME"))

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Public Sub addmyData(ByVal MasterName As String, ByVal Instructional_Designer As String, ByVal ID_ID As Integer, ByVal Term As Integer, ByVal Phase As String, ByVal Status As String)

        Dim strSQL As String = "Insert into OL_Progress (Mastername, Instructional_Designer, ID_ID, Term, Status) "

        strSQL += "VALUES ('"
        strSQL += MasterName & "','"
        strSQL += Instructional_Designer & " ',"
        strSQL += ID_ID & ","
        strSQL += Term & ",'"
        strSQL += Status & "')"

        Response.Write(strSQL & "<br>")



        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1
            If radioProcess.SelectedValue = "Run" Then
                'HOLD SQL HOLD{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
                myCommand.ExecuteNonQuery()
                'Response.Write("I ran<br>")
            End If
        Catch

            ' failed to create a new record
            Response.Write("<br>FAIL<br>")


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try

        '
    End Sub





End Class