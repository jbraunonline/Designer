Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO


Public Class CreateMasterCourseByTerm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  * from MasterCourse"


        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()
        Dim Catalog_ID As Integer
        Dim MasterName As String
        Dim Course As String
        Dim ThisMasterSource As String
        Dim Top_20_CRS As Boolean = 0
        Dim Developer_SME As String
        Dim Dev_ID As Integer
        Dim Co_Developer_SME As String
        Dim Co_Dev_ID As Integer
        Dim Instructional_Designer As String
        Dim ID_ID As Integer
        Dim Term As Integer
        Dim Phase As String
        Dim Status As String

        If dr.HasRows Then
            While dr.Read()

                ID_ID = getID(dr("Instructional_Designer"))
                Dev_ID = getID(dr("Developer_SME"))
                Co_Dev_ID = getID(dr("Co_Developer_SME"))
                ThisMasterSource = getsource(dr("MasterCourse"))
                Catalog_ID = getCatalog(dr("CourseNo"))
                Course = dr("CourseNo")
                Dim mybit As Boolean = 0
                If dr("Top_20_CRS") = True Then
                    mybit = 1
                Else
                    mybit = 0
                End If
                Response.Write("<br>" & mybit & "<br>")
                Co_Developer_SME = dr("Co_Developer_SME")
                Developer_SME = dr("Developer_SME")
                Instructional_Designer = dr("Instructional_Designer")
                'dr("Subject_Area")
                'dr("Term_Offering")
                'dr("Credits")
                'dr("Course_Level")
                Status = dr("Status")
                'dr("Notes")
                Term = dr("Term")
                MasterName = dr("MasterCourse")
                Phase = dr("Phase")

                addmyData(Catalog_ID, MasterName, Course, ThisMasterSource, mybit, Developer_SME, Dev_ID, Co_Developer_SME, Co_Dev_ID, Instructional_Designer, ID_ID, Term, Phase, Status)

                'updateMidData(dr("CourseID"), dr("PM_EXISTS"), dr("PM_DURATION"), dr("PM_MG"), dr("PM_MG_FB"), dr("PM_MG_ES"), dr("PM_MG_SA"), dr("PM_MG_OTHER"), dr("PM_REQ_ANX"), dr("PM_LIST_MTRLS_OPT1"), dr("PM_LIST_MTRLS_OPT2"), dr("PM_LIST_MTRLS_OPT3"), dr("PM_LIST_ANXMTRLS"), dr("PM_WEIGHT"), dr("PM_LCL_NAME"), dr("PM_RMT_NAME"))
                ' updateFinData(dr("CourseID"), dr("PF_EXISTS"), dr("PF_DURATION"), dr("PF_MG"), dr("PF_MG_FB"), dr("PF_MG_ES"), dr("PF_MG_SA"), dr("PF_MG_OTHER"), dr("PF_REQ_ANX"), dr("PF_LIST_MTRLS_OPT1"), dr("PF_LIST_MTRLS_OPT2"), dr("PF_LIST_MTRLS_OPT3"), dr("PF_LIST_ANXMTRLS"), dr("PF_WEIGHT"), dr("PF_LCL_NAME"), dr("PF_RMT_NAME"))

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Public Sub addmyData(ByVal Catalog_ID As Integer, ByVal MasterName As String, ByVal Course As String, ByVal ThisMasterSource As String, ByVal mybit As Boolean, ByVal Developer_SME As String, ByVal Dev_ID As Integer, ByVal Co_Developer_SME As String, ByVal Co_Dev_ID As Integer, ByVal Instructional_Designer As String, ByVal ID_ID As Integer, ByVal Term As Integer, ByVal Phase As String, ByVal Status As String)

        Dim strSQL As String = "INSERT INTO OL_MasterCourse"
        strSQL += "(Catalog_ID,MasterName,Course,ThisMasterSource,Top_20_CRS,Developer_SME,Dev_ID,Co_Developer_SME,Co_Dev_ID,Instructional_Designer,ID_ID,Term,Phase,Status) "

        strSQL += "VALUES ("
        strSQL += Catalog_ID & ",'"
        strSQL += MasterName & "','"
        strSQL += Course & "','"
        strSQL += ThisMasterSource & "',"
        Dim mybool As Integer = 0
        If mybit = True Then
            mybool = 1
        End If
        strSQL += mybool & ",'"
        strSQL += Developer_SME & "',"
        strSQL += Dev_ID & ",'"
        strSQL += Co_Developer_SME & "',"
        strSQL += Co_Dev_ID & " ,'"
        strSQL += Instructional_Designer & " ',"
        strSQL += ID_ID & ","
        strSQL += Term & ",'"
        strSQL += Phase & "','"
        strSQL += Status & "')"

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
            Response.Write("<br>FAIL<br>")


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try

        '
    End Sub

    Public Function getID(ByVal myAbbr As String) As Integer
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As Integer = 0
        Dim strsql As String
        strsql = "SELECT User_ID  FROM OL_Users where Abbr='" & myAbbr & " ' "
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("User_ID")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Public Function getCatalog(ByVal myCourseNo As String) As Integer
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As Integer = 0
        Dim strsql As String
        strsql = "SELECT Catalog_ID  FROM OL_Catalog where CatalogName='" & myCourseNo & " ' "
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("Catalog_ID")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function




    Function getsource(ByVal mycourse As String) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myreturn As String
        Dim strsql As String
        strsql = "Select ContentSource From [VC_VCData].[dbo].[BBMasterCourse] Where newcourse ='" & mycourse & "'"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("ContentSource")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn

    End Function




End Class