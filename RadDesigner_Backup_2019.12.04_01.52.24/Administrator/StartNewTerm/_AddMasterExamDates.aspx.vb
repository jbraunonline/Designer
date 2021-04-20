Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AddMasterExamDates
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myflag As Integer

        Dim fileStream As FileStream = File.Open(Server.MapPath("../Data/2203MasterExamDates.csv"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0
        Dim newCount As Integer = 0
        Dim changeCount As Integer = 0
        Dim noCHange As Integer = 0

        While (streamReader.Peek() > -1)



            Dim strLine As String = streamReader.ReadLine()
            strLine = Replace(strLine, ",", "|")
            myflag = 1
            Dim mymaster As String = ""
            nLine = nLine + 1
            Response.Write(nLine & " ")



            If (strLine = "") Then
                Exit While
            End If
            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar("|"))

            If astrValues.Length = 15 Then
                '''''changed 6 t0 7



                'Response.Write("<br>")
                mymaster = astrValues(0)

                Response.Write(astrValues(0))
                Response.Write("|")
                Response.Write(astrValues(1))
                Response.Write("|")
                Response.Write(astrValues(2))
                Response.Write("|")
                Response.Write(astrValues(3))
                Response.Write("|")
                Response.Write(astrValues(4))
                Response.Write("|")
                Response.Write(astrValues(5))
                Response.Write("|")
                Response.Write(astrValues(6))
                Response.Write("|")
                Response.Write(astrValues(7))
                Response.Write("|")
                Response.Write(astrValues(8))
                Response.Write("|")
                Response.Write(astrValues(9))
                Response.Write("|")
                Response.Write(astrValues(10))
                Response.Write("|")
                Response.Write(astrValues(11))
                Response.Write("|")
                Response.Write(astrValues(12))
                Response.Write("|")
                Response.Write(astrValues(13))
                Response.Write("|")
                Response.Write(astrValues(14))
                Response.Write("|")




                Response.Write("<br>")

            Else
                Response.Write("<B> ERROR Line " & nLine.ToString() & ":</B>" & strLine & "<br>")
            End If
            'HOLD SQL HOLD........................................................................

            AddData(astrValues(0), astrValues(1), astrValues(2), astrValues(3), astrValues(4), astrValues(5), astrValues(6), astrValues(7), astrValues(8), astrValues(9), astrValues(10), astrValues(11), astrValues(12), astrValues(13), astrValues(14))





        End While

        streamReader.Close()
        fileStream.Close()




    End Sub

    Sub AddData(ByVal myCourse As String, ByVal myisMid As String, ByVal myMid1_Start As String, ByVal myMid1_End As String, ByVal myisFinal As String, ByVal myFinal1_Start As String, ByVal myFinal1_End As String, ByVal myMidA_Start As String, ByVal myMidA_End As String, ByVal myFinalA_Start As String, ByVal myFinalA_End As String, ByVal myMidB_Start As String, ByVal myMidB_End As String, ByVal myFinalB_Start As String, ByVal myFinalB_End As String)
        Dim Strsql As String ="Insert into dbo.MasterExamDates (Term,Course,isMid,Mid1_Start,Mid1_End,isFinal,Final1_Start,Final1_End,MidA_Start,MidA_End,FinalA_Start,FinalA_End,MidB_Start,MidB_End,FinalB_Start,FinalB_End)"
        Strsql += "Values ('" & txtTerm.Text & "','"
        Strsql += myCourse & "',"
Strsql += myisMid & ",'"
Strsql += myMid1_Start & "','"
        Strsql += myMid1_End & "',"
        Strsql += myisFinal & ",'"
Strsql += myFinal1_Start & "','"
Strsql += myFinal1_End & "','"
Strsql += myMidA_Start & "','"
Strsql += myMidA_End & "','"
Strsql += myFinalA_Start & "','"
Strsql += myFinalA_End & "','"
Strsql += myMidB_Start & "','"
Strsql += myMidB_End & "','"
Strsql += myFinalB_Start & "','"
        Strsql += myFinalB_End & "')"

        Response.Write(Strsql & "<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(Strsql, myConnection)
        Try

            myConnection.Open()
            'HOLD SQL HOLD...]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]].....................................................................


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