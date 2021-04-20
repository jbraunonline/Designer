Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AddTextbook
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblMasterCourse.Text = Session("MasterCourse")
        txtMasterCourse.Text = Session("MasterCourse")
        txtCourse.Text = Session("Course")
        txtTerm.Text = Session("NextTerm")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Textbook.aspx")
    End Sub
    Public Sub addmyData()

        Dim strSQL As String = "INSERT INTO OL_Textbooks "
        strSQL += "(MasterCourse,Course,Term,REQ,SUP,ALT,Text_Title, Txt_ISBN,EditionNo, PUB_YYYY,Txt_Author, Txt_Publisher,Txt_Type) "
        'strSQL += "(MasterCourse,Course,Term,Text_Title,Txt_Author, Txt_Publisher,Txt_Type) "
        'integers term,  bit req,sup,su alt
        strSQL += "VALUES ('"
        strSQL += txtMasterCourse.Text & "','"
        strSQL += txtCourse.Text & "',"
        strSQL += txtTerm.Text & ","
        Dim mybool1 As Integer = 0
        If chkREQ.Checked = True Then
            mybool1 = 1
        End If
        strSQL += mybool1 & ","
        Dim mybool2 As Integer = 0
        If chkSUP.Checked = True Then
            mybool2 = 1
        End If
        strSQL += mybool2 & ","
        Dim mybool3 As Integer = 0
        If chkSUP.Checked = True Then
            mybool3 = 1
        End If
        strSQL += mybool3 & ",'"
        strSQL += txtTitle.Text & "','"
        strSQL += txtISBN.Text & "','"
        strSQL += txtEdition.Text & "','"
        strSQL += txtYrPub.Text & "','"
        strSQL += txtAuthor.Text & "','"
        strSQL += txtPublisher.Text & "','"
        strSQL += txtType.Text & "')"




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

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        addmyData()
        Response.Redirect("Textbook.aspx")
    End Sub
End Class