Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class UploadFiaalExamData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myflag As Integer

        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/FinalDataX.txt"), FileMode.Open, FileAccess.Read)

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

                updateData(astrValues(0), astrValues(1), astrValues(2), astrValues(3), astrValues(4), astrValues(5), astrValues(6), astrValues(7), astrValues(8), astrValues(9), astrValues(10), astrValues(11), astrValues(12), astrValues(13), astrValues(14), astrValues(15))
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

    Public Sub updateData(ByVal string0 As String, ByVal string1 As String, ByVal string2 As String, ByVal string3 As String, ByVal string4 As String, ByVal string5 As String, ByVal string6 As String, ByVal string7 As String, ByVal string8 As String, ByVal string9 As String, ByVal string10 As String, ByVal string11 As String, ByVal string12 As String, ByVal string13 As String, ByVal string14 As String, ByVal string15 As String)
        Dim strSQL As String = "UPDATE OL_MasterExam SET "
        strSQL += "PF_EXISTS =" & string1 & ","
        strSQL += "PF_DURATION =" & string2 & ","
        strSQL += "PF_MG =" & string3 & ","
        strSQL += "PF_MG_FB =" & string4 & ","
        strSQL += "PF_MG_ES =" & string5 & ","
        strSQL += "PF_MG_SA =" & string6 & ","
        strSQL += "PF_MG_OTHER ='" & string7 & "',"
        strSQL += "PF_REQ_ANX =" & string8 & ","
        strSQL += "PF_LIST_MTRLS_OPT1 =" & string9 & ","
        strSQL += "PF_LIST_MTRLS_OPT2 =" & string10 & ","
        strSQL += "PF_LIST_MTRLS_OPT3 =" & string11 & ","
        strSQL += "PF_LIST_ANXMTRLS ='" & string12 & "',"
        strSQL += "PF_LCL_NAME ='" & string13 & "',"
        strSQL += "PF_RMT_NAME ='" & string14 & "',"
        strSQL += "PF_WEIGHT ='" & string15 & "'"

        strSQL += " where Course = '" & string0 & "'"
        Response.Write(strSQL & "<br>")

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
            Response.Write("Fail")
        Finally
            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try
    End Sub

    Public Sub updateFinData(ByVal myCourseID As String, ByVal myPF_EXISTS As String, ByVal myPF_DURATION As String, ByVal myPF_MG As String, ByVal myPF_MG_FB As String, ByVal myPF_MG_ES As String, ByVal myPF_MG_SA As String, ByVal myPF_MG_OTHER As String, ByVal myPF_REQ_ANX As String, ByVal myPF_LIST_MTRLS_OPT1 As String, ByVal myPF_LIST_MTRLS_OPT2 As String, ByVal myPF_LIST_MTRLS_OPT3 As String, ByVal myPF_LIST_ANXMTRLS As String, ByVal myPF_WEIGHT As String, ByVal myPF_LCL_NAME As String, ByVal myPF_RMT_NAME As String)
        '
        Dim myfillin As String = "0"
        If myPF_MG_FB = "True" Then
            myfillin = "1"
        End If

        Dim myessay As String = "0"
        If myPF_MG_ES = "True" Then
            myessay = "1"
        End If

        Dim ShortAnsw As String = "0"
        If myPF_MG_SA = "True" Then
            ShortAnsw = "1"
        End If

        Dim myother As String = "0"
        If Len(myPF_MG_OTHER) > 2 Then
            myother = 1
        End If

        Dim myoption1 As String = "0"
        If myPF_LIST_MTRLS_OPT1 = "True" Then
            myoption1 = "1"
        End If

        Dim myoption2 As String = "0"
        If myPF_LIST_MTRLS_OPT2 = "True" Then
            myoption2 = "1"
        End If

        Dim myoption3 As String = "0"
        If myPF_LIST_MTRLS_OPT3 = "True" Then
            myoption3 = "1"
        End If
        ''''''''''''''''''''''''''''''''''''''''''
        Dim mysql As String = "UPDATE Designer_Exams SET "
        mysql += "FIN_Exists =" & myPF_EXISTS & ","
        mysql += "FIN_Time ='" & myPF_DURATION & "',"
        mysql += "FIN_Weight ='" & myPF_WEIGHT & "',"
        mysql += "FIN_Local ='" & myPF_LCL_NAME & "',"
        mysql += "FIN_Remote ='" & myPF_RMT_NAME & "',"
        mysql += "FIN_Manual =" & myPF_MG & ","
        mysql += "FIN_FillIn =" & myfillin & ","
        mysql += "FIN_Essay =" & myessay & ","
        mysql += "FIN_ShortAnsw =" & ShortAnsw & ","
        mysql += "FIN_Other_Type =" & myother & ","
        mysql += "FIN_AncillaryMaterial =" & myPF_REQ_ANX & ","
        mysql += "FIN_paper_pencil_pen =" & myoption1 & ","
        mysql += "FIN_SimpleCalc =" & myoption2 & ","
        mysql += "FIN_GraphCalc =" & myoption3 & ","
        mysql += "FIN_Other ='" & myPF_LIST_ANXMTRLS & "' "
        mysql += " WHERE CourseID=" & myCourseID
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