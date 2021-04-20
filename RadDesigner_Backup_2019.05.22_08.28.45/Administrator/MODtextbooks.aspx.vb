Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Public Class MODtextbooks
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim Term As Integer
        Dim CRS As Integer
        Dim REQ As Boolean
        Dim SUP As Boolean
        Dim ALT As Boolean
        Dim Text_Title As String


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim MasterCourse As String = ""
        Dim Course As String = ""
        Dim myID As Integer = 0

        Dim strsql As String
        strsql = "Select * from textbooks Order By CRS"


        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        'myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()
                myID = dr("ID")
                Response.Write(myID & "<BR>")
                Response.Write(dr("Term") & "<BR>")
                Response.Write(dr("CRS") & "<BR>")
                Course = getCourse(dr("CRS"))
                Response.Write(Course & "<BR>")
                MasterCourse = dr("Term") & "_" & Course & "_MC_VC"
                Response.Write(MasterCourse & "<BR><BR>")
                'Response.Write(dr("REQ") & "<BR>")
                'Response.Write(dr("SUP") & "<BR>")
                'Response.Write(dr("ALT") & "<BR>")
                'Response.Write(dr("Text_Title") & "<BR>")
                ' Response.Write(dr("Txt_ISBN") & " <br> ")
                ' Response.Write(dr("EditionNo") & " <br> ")
                ' Response.Write(dr("PUB_YYYY") & " <br> ")
                ' Response.Write(dr("Txt_Author") & " <br> ")
                ' Response.Write(dr("Txt_Publisher") & " <br> ")
                ' Response.Write(dr("Txt_Type") & " <br> ")
                ' Response.Write(dr("Pub_Rep") & " <br> ")
                ' Response.Write(dr("PUB_CONFIRM") & " <br> ")
                ' Response.Write(dr("PUB_CONF_CMTS") & " <br> ")
                ' Response.Write(dr("BKS_CONFIRM") & " <br> ")
                ' Response.Write(dr("BKS_CONF_CMTS") & " <br> ")
                ' Response.Write(dr("DEV_CONFIRM") & " <br> ")
                ' Response.Write(dr("ID_CONFIRM") & " <br> ")
                ' Response.Write(dr("NEW_TEXT") & " <br> ")
                ' Response.Write(dr("NOTES") & " <br> ")
                ' Response.Write(dr("INST_DESIGNER") & " <br> ")
                ' Response.Write(dr("CRS_DEV") & " <br> <br>")


                updateData(myID, Course, MasterCourse)
                'updateMidData(dr("CourseID"), dr("PM_EXISTS"), dr("PM_DURATION"), dr("PM_MG"), dr("PM_MG_FB"), dr("PM_MG_ES"), dr("PM_MG_SA"), dr("PM_MG_OTHER"), dr("PM_REQ_ANX"), dr("PM_LIST_MTRLS_OPT1"), dr("PM_LIST_MTRLS_OPT2"), dr("PM_LIST_MTRLS_OPT3"), dr("PM_LIST_ANXMTRLS"), dr("PM_WEIGHT"), dr("PM_LCL_NAME"), dr("PM_RMT_NAME"))
                ' updateFinData(dr("CourseID"), dr("PF_EXISTS"), dr("PF_DURATION"), dr("PF_MG"), dr("PF_MG_FB"), dr("PF_MG_ES"), dr("PF_MG_SA"), dr("PF_MG_OTHER"), dr("PF_REQ_ANX"), dr("PF_LIST_MTRLS_OPT1"), dr("PF_LIST_MTRLS_OPT2"), dr("PF_LIST_MTRLS_OPT3"), dr("PF_LIST_ANXMTRLS"), dr("PF_WEIGHT"), dr("PF_LCL_NAME"), dr("PF_RMT_NAME"))

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Public Function getCourse(ByVal myCourseID As Integer) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "SELECT CourseNo  FROM course where CourseID=" & myCourseID
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("CourseNo")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Public Sub updateData(ByVal myID As Integer, ByVal myCourse As String, ByVal myMasterCourse As String)
        '

        ''''''''''''''''''''''''''''''''''''''''''
        Dim mysql As String = "UPDATE Textbooks SET "
        mysql += "Course ='" & myCourse & "',"
        mysql += " MasterCourse ='" & myMasterCourse & "'"

        mysql += " WHERE ID=" & myID
        Response.Write(mysql & "<br>")

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
    End Sub


End Class