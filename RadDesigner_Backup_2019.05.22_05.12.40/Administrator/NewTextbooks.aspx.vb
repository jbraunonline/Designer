Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO


Public Class NewTextbooks
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        ''Import old term into New table temp_text
        'modify values in temp_text with this form.
        'import updated values from temp_text into OL_Textbooks
        'DeletedRowInaccessibleException 

        '        Select * INTO temp_text
        'From Textbooks
        'Where Term = 2183; 


        'Use VC_VCData1

        'INSERT INTO textbooks (Term, CRS, REQ, SUP, ALT, Text_Title, Txt_ISBN, EditionNo, PUB_YYYY, Txt_Author, Txt_Publisher, Txt_Type, Pub_Rep, PUB_CONFIRM, PUB_CONF_CMTS, BKS_CONFIRM, BKS_CONF_CMTS, DEV_CONFIRM, ID_CONFIRM, NEW_TEXT, NOTES, INST_DESIGNER, CRS_DEV, MasterCourse, Course)
        '    Select Case Term,CRS,REQ,SUP,ALT,Text_Title,Txt_ISBN,EditionNo,PUB_YYYY,Txt_Author,Txt_Publisher,Txt_Type,Pub_Rep,PUB_CONFIRM,PUB_CONF_CMTS,BKS_CONFIRM,BKS_CONF_CMTS,DEV_CONFIRM,ID_CONFIRM,NEW_TEXT,NOTES,INST_DESIGNER,CRS_DEV,MasterCourse,Course FROM temp_text


        'Fields Used
        'Term, CRS, REQ, SUP, ALT, Text_Title, Txt_ISBN, EditionNo, PUB_YYYY, Txt_Author, Txt_Publisher, Txt_Type, Pub_Rep, PUB_CONFIRM, PUB_CONF_CMTS, BKS_CONFIRM, BKS_CONF_CMTS, DEV_CONFIRM, ID_CONFIRM, NEW_TEXT, NOTES, INST_DESIGNER, CRS_DEV, MasterCourse, Course







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
        strsql = "Select ID,Term,Course,MasterCourse from Temp_Text"


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
                Course = dr("Course")
                Response.Write(dr("Course") & "<BR>")
                MasterCourse = dr("MasterCourse")
                Response.Write(dr("MasterCourse") & "<BR><BR>")
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

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Public Sub updateData(ByVal myID As Integer, ByVal myCourse As String, ByVal myMasterCourse As String)
        '

        ''''''''''''''''''''''''''''''''''''''''''
        Dim mysql As String = "UPDATE temp_Text SET "
        mysql += "Term = 2185" & ","

        mysql += " MasterCourse='" & Replace(myMasterCourse, "2183", "2185") & "'"

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