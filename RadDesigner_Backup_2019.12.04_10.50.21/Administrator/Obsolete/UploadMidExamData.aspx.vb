Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO


Public Class UploadMidExamData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myflag As Integer

        Dim fileStream As FileStream = File.Open(Server.MapPath("
data/MidTermData.csv"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0
        Dim newCount As Integer = 0
        Dim changeCount As Integer = 0
        Dim noCHange As Integer = 0

        While (streamReader.Peek() > -1)



            Dim strLine As String = streamReader.ReadLine()
            'strLine = Replace(strLine, ",", "|")
            myflag = 1
            Dim mymaster As String = ""
            nLine = nLine + 1
            Response.Write(nLine & " ")



            If (strLine = "") Then
                Exit While
            End If
            Response.Write(nLine & "<br>")
            Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))

            If astrValues.Length = 16 Then
                '''''changed 6 t0 7

                Response.Write(astrValues(0))

                Response.Write("<br>")

                'Response.Write("<br>")

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
                Response.Write(astrValues(11))
                Response.Write("<br>")


                Response.Write(astrValues(12))
                Response.Write("<br>")
                Response.Write(astrValues(13))
                Response.Write("<br>")
                Response.Write(astrValues(14))
                Response.Write("<br>")
                Response.Write(astrValues(15))
                Response.Write("<br>")

                addData(astrValues(0), astrValues(1), astrValues(2), astrValues(3), astrValues(4), astrValues(5), astrValues(6), astrValues(7), astrValues(8), astrValues(9), astrValues(10), astrValues(11), astrValues(12), astrValues(13), astrValues(14), astrValues(15))
                'Response.Write(astrValues(0) & "," & astrValues(12))
            Else
                Response.Write("<B> ERROR Line " & nLine.ToString() & ":</B>" & strLine & "<br>")
            End If
            'HOLD SQL HOLD........................................................................


            Response.Write("<br>")



        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<hr></hr>")


    End Sub


    Sub addData(ByVal string0 As String, ByVal string1 As String, ByVal string2 As String, ByVal string3 As String, ByVal string4 As String, ByVal string5 As String, ByVal string6 As String, ByVal string7 As String, ByVal string8 As String, ByVal string9 As String, ByVal string10 As String, ByVal string11 As String, ByVal string12 As String, ByVal string13 As String, ByVal string14 As String, ByVal string15 As String)
        Dim mymaster As String = ""
        Dim strSQL As String = " Insert into OL_MasterExam (MasterName,Course,Term,PM_EXISTS,PM_DURATION,PM_MG,PM_MG_FB,PM_MG_ES,PM_MG_SA,PM_MG_OTHER,PM_REQ_ANX,PM_LIST_MTRLS_OPT1,PM_LIST_MTRLS_OPT2,PM_LIST_MTRLS_OPT3,PM_LIST_ANXMTRLS,PM_LCL_NAME,PM_RMT_NAME,PM_WEIGHT) "

        strSQL += " Values ('" & "2187_" & string0 & "_MC_VC"   'Master Course
        strSQL += "','" & string0 'Course
        strSQL += "',2187" 'Term
        strSQL += "," & string1  'PM_EXISTS
        strSQL += "," & string2  'PM_DURATION
        strSQL += "," & string3  'PM_MG
        strSQL += "," & string4  'PM_MG_FB
        strSQL += "," & string5  'PM_MG_ES
        strSQL += "," & string6  'PM_MG_SA
        strSQL += ",'" & string7  'PM_MG_OTHER
        strSQL += "'," & string8  'PM_REQ_ANX
        strSQL += "," & string9  'PM_LIST_MTRLS_OPT1
        strSQL += "," & string10  'PM_LIST_MTRLS_OPT2
        strSQL += "," & string11  'PM_LIST_MTRLS_OPT3
        strSQL += ",'" & string12  'PM_LIST_ANXMTRLS
        strSQL += "','" & string13  'PM_LCL_NAME
        strSQL += "','" & string14  'PM_RMT_NAME
        strSQL += "','" & string15 & "')"  'PM_WEIGHT






        Response.Write("<BR>" & strSQL & "<BR>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
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