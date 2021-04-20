Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class DataTransfer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    '//////////////////////////////////////////////////////////////////////////////////////NOTE  NOTE NOTE
    'The code below has been modified To copy courseID, CourseName, DateAndTime Term to the Course_BBlocks table


    Public Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  CourseID, CourseNo from Course"


        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()

                Response.Write(dr("CourseID") & ",")
                Response.Write(dr("CourseNo") & ",")
                Response.Write(TextBox1.Text & "<BR>")


                addmyData(dr("CourseID"), dr("CourseNo"), TextBox1.Text)
                'updateMidData(dr("CourseID"), dr("PM_EXISTS"), dr("PM_DURATION"), dr("PM_MG"), dr("PM_MG_FB"), dr("PM_MG_ES"), dr("PM_MG_SA"), dr("PM_MG_OTHER"), dr("PM_REQ_ANX"), dr("PM_LIST_MTRLS_OPT1"), dr("PM_LIST_MTRLS_OPT2"), dr("PM_LIST_MTRLS_OPT3"), dr("PM_LIST_ANXMTRLS"), dr("PM_WEIGHT"), dr("PM_LCL_NAME"), dr("PM_RMT_NAME"))
                ' updateFinData(dr("CourseID"), dr("PF_EXISTS"), dr("PF_DURATION"), dr("PF_MG"), dr("PF_MG_FB"), dr("PF_MG_ES"), dr("PF_MG_SA"), dr("PF_MG_OTHER"), dr("PF_REQ_ANX"), dr("PF_LIST_MTRLS_OPT1"), dr("PF_LIST_MTRLS_OPT2"), dr("PF_LIST_MTRLS_OPT3"), dr("PF_LIST_ANXMTRLS"), dr("PF_WEIGHT"), dr("PF_LCL_NAME"), dr("PF_RMT_NAME"))

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Public Sub addmyData(ByVal mycourseID As Integer, ByVal mycourse As String, ByVal myTerm As Integer)

        Dim strSQL As String = "INSERT INTO Course_BBlocks"
        strSQL += "(Term,CourseID,CourseNo) "
        strSQL += "VALUES ("
        strSQL += myTerm & ","
        strSQL += "" & mycourseID & ",'"
        strSQL += mycourse & "')"

        Response.Write(strSQL & "<br>")


        'strSQL += " '" & myTermStart & "',"
        'strSQL += "'" & myTermEnd & "',"
        'strSQL += "'" & mydescription & "',"
        'strSQL += "" & myCredits & ","
        'strSQL += "" & myReference & ","
        'strSQL += "'" & myLastName & "',"
        'strSQL += "'" & myFirstName & "',"
        'strSQL += "'" & myMDCID & "',"
        'strSQL += "" & myInstructorID & ","
        'strSQL += "'" & myMDCID & "',"
        'strSQL += "" & myVisible & ","
        'strSQL += "" & myisVisible & ","
        'strSQL += "'" & myPTFT & "',"
        'strSQL += "'" & myChair & "',"
        'strSQL += "'" & myChairOutlook & "',"
        'strSQL += "" & mychange & ","
        'strSQL += "'BB')"


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

    Public Function getcourse(ByVal myid As Integer) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "SELECT CourseNo  FROM course where CourseID=" & myid

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

    Public Function getDesigner(ByVal myid As Integer) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "SELECT Instructional_Designer  FROM course where CourseID=" & myid

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("Instructional_Designer")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Public Sub updateMidData(ByVal myCourseID As String, ByVal myPM_EXISTS As String, ByVal myPM_DURATION As String, ByVal myPM_MG As String, ByVal myPM_MG_FB As String, ByVal myPM_MG_ES As String, ByVal myPM_MG_SA As String, ByVal myPM_MG_OTHER As String, ByVal myPM_REQ_ANX As String, ByVal myPM_LIST_MTRLS_OPT1 As String, ByVal myPM_LIST_MTRLS_OPT2 As String, ByVal myPM_LIST_MTRLS_OPT3 As String, ByVal myPM_LIST_ANXMTRLS As String, ByVal myPM_WEIGHT As String, ByVal myPM_LCL_NAME As String, ByVal myPM_RMT_NAME As String)
        Dim strSQL As String = "UPDATE Design_Exams SET "
        strSQL += "SectionMaster='" & myCourseID & "',"
        strSQL += "SectionGroup='" & myCourseID & "',"
        strSQL += "SectionSetup='" & Now & "',"
        strSQL += "SectionNotes='" & myCourseID & "',"
        strSQL += "SectionMail='" & myCourseID & "'"
        strSQL += " WHERE CourseID" & myCourseID
        ''''''''''''''''''''''''''''''''''''''''''''''
        Dim myfillin As String = "0"
        If myPM_MG_FB = "True" Then
            myfillin = "1"
        End If

        Dim myessay As String = "0"
        If myPM_MG_ES = "True" Then
            myessay = "1"
        End If

        Dim ShortAnsw As String = "0"
        If myPM_MG_SA = "True" Then
            ShortAnsw = "1"
        End If

        Dim myother As String = "0"
        If Len(myPM_MG_OTHER) > 2 Then
            myother = 1
        End If

        Dim myoption1 As String = "0"
        If myPM_LIST_MTRLS_OPT1 = "True" Then
            myoption1 = "1"
        End If

        Dim myoption2 As String = "0"
        If myPM_LIST_MTRLS_OPT2 = "True" Then
            myoption2 = "1"
        End If

        Dim myoption3 As String = "0"
        If myPM_LIST_MTRLS_OPT3 = "True" Then
            myoption3 = "1"
        End If
        ''''''''''''''''''''''''''''''''''''''''''
        Dim mysql As String = "UPDATE Designer_Exams SET "
        mysql += "MID_Exists =" & myPM_EXISTS & ","
        mysql += "MID_Time ='" & myPM_DURATION & "',"
        mysql += "MID_Weight ='" & myPM_WEIGHT & "',"
        mysql += "MID_Local ='" & myPM_LCL_NAME & "',"
        mysql += "Mid_Remote ='" & myPM_RMT_NAME & "',"
        mysql += "MID_Manual =" & myPM_MG & ","
        mysql += "MID_FillIn =" & myfillin & ","
        mysql += "MID_Essay =" & myessay & ","
        mysql += "MID_ShortAnsw =" & ShortAnsw & ","
        mysql += "MID_Other_Type =" & myother & ","
        mysql += "MID_AncillaryMaterial =" & myPM_REQ_ANX & ","
        mysql += "MID_paper_pencil_pen =" & myoption1 & ","
        mysql += "MID_SimpleCalc =" & myoption2 & ","
        mysql += "MID_GraphCalc =" & myoption3 & ","
        mysql += "MID_Other_Required ='" & myPM_LIST_ANXMTRLS & "' "
        mysql += " WHERE CourseID=" & myCourseID
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

    Public Sub updateFinData(ByVal myCourseID As String, ByVal myPF_EXISTS As String, ByVal myPF_DURATION As String, ByVal myPF_MG As String, ByVal myPF_MG_FB As String, ByVal myPF_MG_ES As String, ByVal myPF_MG_SA As String, ByVal myPF_MG_OTHER As String, ByVal myPF_REQ_ANX As String, ByVal myPF_LIST_MTRLS_OPT1 As String, ByVal myPF_LIST_MTRLS_OPT2 As String, ByVal myPF_LIST_MTRLS_OPT3 As String, ByVal myPF_LIST_ANXMTRLS As String, ByVal myPF_WEIGHT As String, ByVal myPF_LCL_NAME As String, ByVal myPF_RMT_NAME As String)
        '
        Dim myfillin As String = "0"
        If myPF_MG_FB = "True" Then
            myfillin = "1"
        End If

        Dim myessay As String = "0"
        If myPF_MG_ES = "True" Then
            myessay = "1"
        End If

        Dim ShortAnsw As String = "0"
        If myPF_MG_SA = "True" Then
            ShortAnsw = "1"
        End If

        Dim myother As String = "0"
        If Len(myPF_MG_OTHER) > 2 Then
            myother = 1
        End If

        Dim myoption1 As String = "0"
        If myPF_LIST_MTRLS_OPT1 = "True" Then
            myoption1 = "1"
        End If

        Dim myoption2 As String = "0"
        If myPF_LIST_MTRLS_OPT2 = "True" Then
            myoption2 = "1"
        End If

        Dim myoption3 As String = "0"
        If myPF_LIST_MTRLS_OPT3 = "True" Then
            myoption3 = "1"
        End If
        ''''''''''''''''''''''''''''''''''''''''''
        Dim mysql As String = "UPDATE Designer_Exams SET "
        mysql += "FIN_Exists =" & myPF_EXISTS & ","
        mysql += "FIN_Time ='" & myPF_DURATION & "',"
        mysql += "FIN_Weight ='" & myPF_WEIGHT & "',"
        mysql += "FIN_Local ='" & myPF_LCL_NAME & "',"
        mysql += "FIN_Remote ='" & myPF_RMT_NAME & "',"
        mysql += "FIN_Manual =" & myPF_MG & ","
        mysql += "FIN_FillIn =" & myfillin & ","
        mysql += "FIN_Essay =" & myessay & ","
        mysql += "FIN_ShortAnsw =" & ShortAnsw & ","
        mysql += "FIN_Other_Type =" & myother & ","
        mysql += "FIN_AncillaryMaterial =" & myPF_REQ_ANX & ","
        mysql += "FIN_paper_pencil_pen =" & myoption1 & ","
        mysql += "FIN_SimpleCalc =" & myoption2 & ","
        mysql += "FIN_GraphCalc =" & myoption3 & ","
        mysql += "FIN_Other ='" & myPF_LIST_ANXMTRLS & "' "
        mysql += " WHERE CourseID=" & myCourseID
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