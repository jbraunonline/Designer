Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Text.RegularExpressions

Public Class AddSweep
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myflag As Integer

        Dim fileStream As FileStream = File.Open(Server.MapPath("AddSweeps.csv"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0
        Dim newCount As Integer = 0
        Dim changeCount As Integer = 0
        Dim noCHange As Integer = 0

        While (streamReader.Peek() > -1)



            Dim strLine As String = streamReader.ReadLine()
            strLine = Replace(strLine, ",", "|")
            myflag = 1

            nLine = nLine + 1
            Response.Write(nLine & " ")



            If (strLine = "") Then
                Exit While
            End If
            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar("|"))

            If astrValues.Length = 3 Then
                '''''changed 6 t0 7



                'Response.Write("<br>")
                ' Response.Write(astrValues(0))
                'Response.Write("|")
                'Response.Write(astrValues(1))
                'Response.Write("|")
                'Response.Write(astrValues(2))

                Response.Write("<br>")

            Else
                Response.Write("<B> ERROR Line " & nLine.ToString() & ":</B>" & strLine & "<br>")
            End If
            'HOLD SQL HOLD........................................................................

            AddSweep(astrValues(0), astrValues(1), astrValues(2))




        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<hr></hr>")
        Response.Write("<br><br>New Courses: " & CStr(newCount) & "<br>")
        Response.Write("Changes: " & CStr(changeCount) & "<br>")
        Response.Write("No change: " & CStr(noCHange) & "<br>")

    End Sub

    Protected Sub addSweep(ByVal mymaster As String, ByVal myDesignerID As String, ByVal myDesigner As String)
        Dim strSQL As String = "INSERT INTO OL_MasterSweep "
        strSQL += "(MasterName,Term,Designer_ID,Designer,SweepCreated,SweepStatus) "
        strSQL += "VALUES ('"
        strSQL += mymaster & "',"
        strSQL += "2185,"
        strSQL += myDesignerID & ",'"
        strSQL += myDesigner & "','"
        strSQL += DateTime.Now & "','"
        strSQL += "3-NotStarted')"

        Response.Write(strSQL)
        Response.Write("<br>")
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

    End Sub
End Class