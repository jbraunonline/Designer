Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AddToCatalog
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myflag As Integer

        Dim fileStream As FileStream = File.Open(Server.MapPath("../Data/NewCatalog.csv"), FileMode.Open, FileAccess.Read)

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

            If astrValues.Length = 8 Then
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
                Response.Write("<br>")

            Else
                Response.Write("<B> ERROR Line " & nLine.ToString() & ":</B>" & strLine & "<br>")
            End If
            'HOLD SQL HOLD........................................................................
            If DoesRecordExist(mymaster) = False Then
                Response.Write("New <br>")
                addData(astrValues(0), astrValues(1), astrValues(2), astrValues(3), astrValues(4))
            Else
                Response.Write("Exitst <br>")
            End If




        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<hr></hr>")
        Response.Write("<br><br>New Courses: " & CStr(newCount) & "<br>")
        Response.Write("Changes: " & CStr(changeCount) & "<br>")
        Response.Write("No change: " & CStr(noCHange) & "<br>")

    End Sub


    Sub addData(ByVal strTextField0 As String, ByVal strTextField1 As String, ByVal strTextField2 As String, ByVal strTextField3 As String, ByVal strTextField4 As String)
        Dim mymaster As String = ""
        Dim strSQL As String = " Insert into OL_Catalog (CatalogName, Title, Term_Offering, Credits, Status)" &
                               "VALUES ('" & strTextField0 &
                               "','" & strTextField1 & 'isMid
                               "','" & strTextField2 & 'MidStart
                               "'," & strTextField3 &  'MidEnd
                               ",'" & strTextField4 & "')"


        ' Insert into OL_Catalog (CatalogName, Title, Term_Offering, Credits, Status)

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