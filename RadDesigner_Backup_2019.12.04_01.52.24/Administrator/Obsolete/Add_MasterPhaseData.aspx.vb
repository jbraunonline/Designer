Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class Add_MasterPhaseData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myflag As Integer
        Dim mycount As Integer = 0
        Dim fileStream As FileStream = File.Open(Server.MapPath("New_MasterPhase.csv"), FileMode.Open, FileAccess.Read)

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

            If astrValues.Length = 14 Then
                '''''changed 6 t0 7

                Dim value1 As String = astrValues(1)
                Dim value12 As String = astrValues(12)
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
                If astrValues(13) = "100" Then
                    addData(astrValues(0), astrValues(1), astrValues(2), astrValues(3), astrValues(4), astrValues(5), astrValues(6), astrValues(7), astrValues(8), astrValues(9), astrValues(10), astrValues(11), astrValues(12), astrValues(13))
                    Response.Write(astrValues(0) & "," & astrValues(13))
                    mycount = mycount + 1
                End If
            Else
                    Response.Write("<B> ERROR Line " & nLine.ToString() & ":</B>" & strLine & "<br>")
            End If
            'HOLD SQL HOLD........................................................................


            Response.Write("<br>")



        End While
        Response.Write("melissa = " & mycount)
        streamReader.Close()
        fileStream.Close()
        Response.Write("<hr></hr>")
        Response.Write("<br><br>New Courses: " & CStr(newCount) & "<br>")
        Response.Write("Changes: " & CStr(changeCount) & "<br>")
        Response.Write("No change: " & CStr(noCHange) & "<br>")

    End Sub


    Sub addData(ByVal string0 As String, ByVal string1 As String, ByVal string2 As String, ByVal string3 As String, ByVal string4 As String, ByVal string5 As String, ByVal string6 As String, ByVal string7 As String, ByVal string8 As String, ByVal string9 As String, ByVal string10 As String, ByVal string11 As String, ByVal string12 As String, ByVal string13 As String)
        Dim mymaster As String = ""
        Dim strSQL As String = " Insert into OL_MasterPhase (Course,Title,Credits,Level,Program,Term95,Term93,Term87,DevLN,DevFN,CoDevLN,CoDevFN,IDesg,ID_ID) "

        strSQL += " Values ('" & string0 'Course
        strSQL += "','" & string1 'Tutke
        strSQL += "'," & string2 'Credits
        strSQL += ",'" & string3 'Level
        strSQL += "','" & string4 'Progam
        strSQL += "','" & string5 'T95
        strSQL += "','" & string6 'T93
        strSQL += "','" & string7 'T87
        strSQL += "','" & string8 'DEvLastr
        strSQL += "','" & string9 'DevFirst
        strSQL += "','" & string10 'CoLast
        strSQL += "','" & string11 'CoFirst
        strSQL += "','" & string12
        strSQL += "'," & string13 & ")" 'iDesgn




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

    Protected Function getID(ByVal myCourse As String) As Integer
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As Integer = 0
        Dim strsql As String
        strsql = "SELECT ID_ID  FROM OL_MasterCourse where Course='" & myCourse & "'"
        Response.Write(strsql & "<br>")
        'Response.End()
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.Read() Then

            myreturn = dr("ID_ID")

        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function
    Protected Function DoesRecordExist(ByVal mycourse As String) As Boolean
        Dim myreturn As Boolean = False

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  CatalogName from OL_Catalog Where CatalogName='" & mycourse & "'"

        'response.Write(strsql)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        If dr.Read() Then
            myreturn = True
        Else
            myreturn = False
        End If
        If myConnection.State = ConnectionState.Open Then
            myConnection.Close()
        End If
        Return myreturn
    End Function
End Class