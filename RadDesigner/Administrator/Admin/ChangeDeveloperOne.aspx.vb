Imports System.Configuration
Imports System.Data

Imports System.Data.SqlClient
Imports System.IO

Public Class ChangeDeveloperOne
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnChange_Click(sender As Object, e As EventArgs) Handles btnChange.Click
        Dim myCourse As String = txtCourse.Text
        Dim myMaster As String = txtMaster.Text
        Dim myID As String = txtID.Text
        Dim myName As String = txtName.Text

        updateData(myCourse, myMaster, myID, myName)
    End Sub

    Protected Sub updateData(ByVal mycourse As String, ByVal myMasterCourse As String, ByVal myNewID As String, ByVal myNewName As String)
        Dim strsql As String = ""
        Dim strsql2 As String = ""
        Dim strsql3 As String = ""
        strsql3 += "Update OL_Mastercourse set Instructional_Designer ='" & myNewName & "', ID_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "'"
        strsql += "<br>"
        strsql += "Update OL_MasterAudit set Designer_ID = " & myNewID & " , Designer='" & myNewName & "' Where mastername ='" & myMasterCourse & "'"
        strsql += "<br>"
        strsql += " Update OL_MasterProctor set ID_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "'"
        strsql += "<br>"
        strsql += "Update OL_MasterRelease set Designer ='" & myNewName & "', ID_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "'"
        strsql += "<br>"
        strsql += "Update OL_MasterSweep set Designer ='" & myNewName & "', Designer_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "'"
        strsql += "<br>"
        strsql += "Update OL_MasterPhase set IDesg='" & myNewName & "', ID_ID =" & myNewID & " Where course = '" & mycourse & "'"
        strsql += "<br>"
        strsql += "Update OL_MasterSweep set Designer ='" & myNewName & "', Designer_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "'"
        strsql += "<br>"
        strsql += " Update OL_Progress set Instructional_Designer ='" & myNewName & "', ID_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "'"
        strsql += "<br>"
        strsql += "Update OL_SweepDetails set Designer ='" & myNewName & "', Designer_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "'"
        strsql += "<br>"
        strsql += "Update OL_Textbooks set INST_DESIGNER='" & myNewName & "' where MasterCourse = '" & myMasterCourse & "'"
        strsql += "<br>"

        'Response.Write(strsql)


        strsql2 += "Update OL_Mastercourse set Instructional_Designer ='" & myNewName & "', ID_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "';   "

        strsql2 += "Update OL_MasterAudit set Designer_ID = " & myNewID & " , Designer='" & myNewName & "' Where mastername ='" & myMasterCourse & "';   "

        strsql2 += " Update OL_MasterProctor set ID_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "';   "

        strsql2 += "Update OL_MasterRelease set Designer ='" & myNewName & "', ID_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "';   "

        strsql2 += "Update OL_MasterSweep set Designer ='" & myNewName & "', Designer_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "';   "

        strsql2 += "Update OL_MasterPhase set IDesg='" & myNewName & "', ID_ID =" & myNewID & " Where course = '" & mycourse & "';   "

        strsql2 += "Update OL_MasterSweep set Designer ='" & myNewName & "', Designer_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "';   "

        strsql2 += " Update OL_Progress set Instructional_Designer ='" & myNewName & "', ID_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "';   "

        strsql2 += "Update OL_SweepDetails set Designer ='" & myNewName & "', Designer_ID = " & myNewID & " Where mastername ='" & myMasterCourse & "';   "

        strsql2 += "Update OL_Textbooks set INST_DESIGNER='" & myNewName & "' where MasterCourse = '" & myMasterCourse & "';   "

        'Response.Write("<br><br>")
        '
        Response.Write("<br>")
        Response.Write(strsql2)
        Response.Write("<br>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql2, myConnection) '
        Try
            Dim rows_affected As Integer
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD........................................................................
            rows_affected = myCommand.ExecuteNonQuery()
            Dim mycount As String = CStr(rows_affected)
            Response.Write("Rows  " & mycount & "<br>")
        Catch ex As Exception
            ' Display the message.
            Response.Write(ex.Message)

            ' failed to create a new record
            Response.Write("<br>FAIL<br>")


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try


    End Sub

    Protected Sub btnChangeAll_Click(sender As Object, e As EventArgs) Handles btnChangeAll.Click
        Dim myflag As Integer

        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/DesignerChange.csv"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0
        Dim newCount As Integer = 0
        Dim changeCount As Integer = 0
        Dim noCHange As Integer = 0
        Dim mycourse As String = ""

        Dim mymaster As String = ""
        Dim myID As String = ""
        Dim myName As String = ""
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

            If astrValues.Length = 4 Then
                '''''changed 6 t0 7


                Response.Write(astrValues(0))
                mymaster = astrValues(0)
                Response.Write("<br>")
                Response.Write(astrValues(1))
                mycourse = astrValues(1)
                Response.Write("<br>")
                Response.Write(astrValues(2))
                myName = astrValues(2)
                Response.Write("<br>")
                Response.Write(astrValues(3))
                myID = astrValues(3)
                Response.Write("<br>")
                'Response.Write(astrValues(4))
                'Response.Write("<br>")



                '

            Else
                Response.Write("<B> <font color=red>ERROR Line " & nLine.ToString() & ":</font></B>" & strLine & "<br>")
            End If
            'HOLD SQL HOLD........................................................................
            updateData(mycourse, mymaster, myID, myName)


        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<hr></hr>")
    End Sub
End Class