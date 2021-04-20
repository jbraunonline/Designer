Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AddAllStaff
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myflag As Integer
        Dim mymaster As String = ""
        Dim fileStream As FileStream = File.Open(Server.MapPath("AllStaff.csv"), FileMode.Open, FileAccess.Read)

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
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))

            If astrValues.Length = 4 Then

                Response.Write(astrValues(0))
                Response.Write("|")
                Response.Write(astrValues(1))
                Response.Write("|")
                Response.Write(astrValues(2))
                Response.Write("|")
                Response.Write(astrValues(3))
                Response.Write("<br>")

            Else
                Response.Write("<B> ERROR Line " & nLine.ToString() & ":</B>" & strLine & "<br>")
            End If
            'HOLD SQL HOLD........................................................................

            addData(astrValues(0), astrValues(1), astrValues(2), astrValues(3))




        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<hr></hr>")


    End Sub

    Sub addData(ByVal strTextField0 As String, ByVal strTextField1 As String, ByVal strTextField2 As String, ByVal strTextField3 As String)
        'Use VC_VCdata (old db)
        Dim strSQL As String = "INSERT INTO BBAllStaff (MDCID,First,Last,Username) VALUES ("
        strSQL += "'" & strTextField0
        strSQL += "','" & strTextField1
        strSQL += "','" & strTextField2
        strSQL += "','" & strTextField3 & "')"



        Response.Write("<BR>" & strSQL & "<BR>")
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

    End Sub


End Class