Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class getDistinct
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim MasterCourse As String = ""
        Dim Phase As String = ""

        Dim Term As String = ""


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "SELECT distinct  course   FROM [VC_VCData].[dbo].[BBCourses] where term_key = '2185'"


        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        'myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()
                Dim mycourse As String = "2185_"
                mycourse += dr("Course")
                mycourse += "_MC_VC"
                Response.Write(mycourse)
                Response.Write("<BR>")
                addmyData(mycourse)





                'UpdateData(MasterCourse, Term, Phase)
                'updateMidData(dr("CourseID"), dr("PM_EXISTS"), dr("PM_DURATION"), dr("PM_MG"), dr("PM_MG_FB"), dr("PM_MG_ES"), dr("PM_MG_SA"), dr("PM_MG_OTHER"), dr("PM_REQ_ANX"), dr("PM_LIST_MTRLS_OPT1"), dr("PM_LIST_MTRLS_OPT2"), dr("PM_LIST_MTRLS_OPT3"), dr("PM_LIST_ANXMTRLS"), dr("PM_WEIGHT"), dr("PM_LCL_NAME"), dr("PM_RMT_NAME"))
                ' updateFinData(dr("CourseID"), dr("PF_EXISTS"), dr("PF_DURATION"), dr("PF_MG"), dr("PF_MG_FB"), dr("PF_MG_ES"), dr("PF_MG_SA"), dr("PF_MG_OTHER"), dr("PF_REQ_ANX"), dr("PF_LIST_MTRLS_OPT1"), dr("PF_LIST_MTRLS_OPT2"), dr("PF_LIST_MTRLS_OPT3"), dr("PF_LIST_ANXMTRLS"), dr("PF_WEIGHT"), dr("PF_LCL_NAME"), dr("PF_RMT_NAME"))

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Public Sub addmyData(ByVal mycourse As String)

        Dim strSQL As String = "INSERT INTO OL_Distinct "
        strSQL += "(MasterName) "
        strSQL += "VALUES ('"
        strSQL += mycourse & "')"

        Response.Write(strSQL & "<br>")


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()

        Catch

            ' failed to create a new record


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try

        '
    End Sub




End Class