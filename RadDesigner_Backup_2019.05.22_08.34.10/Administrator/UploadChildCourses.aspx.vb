Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Text.RegularExpressions

Public Class UploadChildCourses
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myflag As Integer

        Dim fileStream As FileStream = File.Open(Server.MapPath(txtPath.Text), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0
        Dim newCount As Integer = 0
        Dim changeCount As Integer = 0
        Dim noCHange As Integer = 0

        While (streamReader.Peek() > -1)



            Dim strLine As String = streamReader.ReadLine()

            myflag = 1

            nLine = nLine + 1
            Response.Write(nLine & " ")



            If (strLine = "") Then
                Exit While
            End If
            'Response.Write(nLine & "<br>")
            Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))

            If astrValues.Length = 2 Then
                '''''changed 6 t0 7


                Response.Write(astrValues(0))
                Response.Write("<br>")
                Response.Write(astrValues(1))
                Response.Write("<br>")
                'Response.Write(astrValues(2))
                'Response.Write("<br>")
                'Response.Write(astrValues(3))
                'Response.Write("<br>")
                'Response.Write(astrValues(4))
                'Response.Write("<br>")



                '

            Else
                Response.Write("<B> <font color=red>ERROR Line " & nLine.ToString() & ":</font></B>" & strLine & "<br>")
            End If
            'HOLD SQL HOLD........................................................................

            addData(astrValues(0), astrValues(1))

        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<hr></hr>")

    End Sub

    Protected Sub addData(ByVal text1 As String, ByVal text2 As String)
        Dim strSQL As String = "Update BBcourses set "
        strSQL += "Ischild =1,"
        strSQL += "childof ='" & text1 & "' "
        strSQL += " where course_ID = '" & text2 & "'"


        Response.Write(strSQL)
        Response.Write("<br>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '
        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
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

    End Sub




End Class