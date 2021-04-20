Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Public Class UploadProctorUdata
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myflag As Integer

        Dim fileStream As FileStream = File.Open(Server.MapPath("../Data/ProctorU.csv"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0
        Dim newCount As Integer = 0
        Dim changeCount As Integer = 0
        Dim noCHange As Integer = 0

        While (streamReader.Peek() > -1)



            Dim strLine As String = streamReader.ReadLine()

            Dim astrValues As String() = strLine.Split(CChar(","))




            nLine = nLine + 1
            Response.Write(nLine & "<br>")
            Response.Write(strLine & "<br>")


            'Response.Write(strLine & "<br>")
            Response.Write(astrValues(0))
            Response.Write("<br>")
            Response.Write(astrValues(1))
            Response.Write("<br>")
            Response.Write(astrValues(2))
            Response.Write("<br>")
            Response.Write(astrValues(3))
            Response.Write("<br>")
            Response.Write(astrValues(4))
            Response.Write("<br>")
            Response.Write(astrValues(5))
            Response.Write("<br>")
            Response.Write(astrValues(6))
            Response.Write("<br>")
            Response.Write(astrValues(7))
            Response.Write("<br>")
            Response.Write(astrValues(8))
            Response.Write("<br>")
            Response.Write(astrValues(9))
            Response.Write("<br>")
            Response.Write(astrValues(10))
            Response.Write("<br>")


            Dim strSQL As String = "INSERT INTO ProctorU ("
            strSQL += "Exam,Instructor,Duration,Password,Resources,Additional_Notes,Contact,Email,Phone,StartDate,EndDate,Term ) "
            strSQL += "VALUES ('"
            strSQL += astrValues(0) & "','"
            strSQL += astrValues(1) & "','"
            strSQL += astrValues(2) & "','"

            strSQL += astrValues(3) & "','"

            strSQL += astrValues(4) & "','"

            strSQL += astrValues(5) & "','"

            strSQL += astrValues(6) & "','"

            strSQL += astrValues(7) & "','"

            strSQL += astrValues(8) & "','"

            strSQL += astrValues(9) & "','"

            strSQL += astrValues(10) & "','"

            strSQL += "2187')"

            Response.Write(strSQL & "<br>")


            Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim myCommand As New SqlCommand(strSQL, myConnection)
            Try

                myConnection.Open()
                'HOLD SQL HOLD........................................................................


                myCommand.ExecuteNonQuery()

            Catch
                Response.Write("failed to create a new record <br>")
            Finally
                If myConnection.State = ConnectionState.Open Then
                    myConnection.Close()
                End If
            End Try







            If (strLine = "") Then
                Exit While
            End If


        End While

        streamReader.Close()
        fileStream.Close()


    End Sub
End Class