Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AddNew_OL_MasterCourse
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myflag As Integer

        Dim fileStream As FileStream = File.Open(Server.MapPath("NewOL_MasterCourse_2187.csv"), FileMode.Open, FileAccess.Read)

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

            If astrValues.Length = 19 Then
                '''''changed 6 t0 7



                'Response.Write("<br>")

                Response.Write(astrValues(1))

                Response.Write("<br>")

            Else
                Response.Write("<B> ERROR Line " & nLine.ToString() & ":</B>" & strLine & "<br>")
            End If
            'HOLD SQL HOLD........................................................................
            If DoesRecordExist(mymaster) = False Then
                Response.Write("New <br>")
                'add \Data creates new record in OL_MasterCourse
                addData(astrValues(0), astrValues(1), astrValues(2), astrValues(3), astrValues(4), astrValues(5), astrValues(6), astrValues(7), astrValues(8), astrValues(9), astrValues(10), astrValues(11), astrValues(12), astrValues(13), astrValues(14), astrValues(15), astrValues(16), astrValues(17), astrValues(18))
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


    Sub addData(ByVal string0 As Integer, ByVal string1 As String, ByVal string2 As String, ByVal string3 As Integer, ByVal string4 As String, ByVal string5 As Integer, ByVal string6 As String, ByVal string7 As Integer, ByVal string8 As String, ByVal string9 As Integer, ByVal string10 As Integer, ByVal string11 As String, ByVal string12 As String, ByVal string13 As String, ByVal string14 As Integer, ByVal string15 As Integer, ByVal string16 As String, ByVal string17 As String, ByVal string18 As String)
        Dim mymaster As String = ""
        Dim strSQL As String = " Insert into OL_MasterCourse (Catalog_ID,MasterName,Course,ThisMasterSource,Top_20_CRS,Developer_SME,Dev_ID,Co_Developer_SME,Co_Dev_ID,Instructional_Designer,ID_ID,Term,Status,Notes,Phase,FacCopyStatus,CopyStatusTerm,CopyStatusNotes,Title,Term_Offering) "

        strSQL += " Values (" & string0
        strSQL += ",'" & "2187_" & string1 & "_MC_VC" 'MasterCourse
        strSQL += "','" & string1 'Course
        strSQL += "','" & "2187_" & string1 & "_MC_VC" 'ThisMasterSource
        strSQL += "'," & string3 'Top_20_CRS x
        strSQL += ",'" & string4 'Developer_SME
        strSQL += "'," & string5 'Dev_ID x
        strSQL += ",'" & string6 'Co_Developer_SME
        strSQL += "'," & string7 'Co_'Dev_ID x
        strSQL += ",'" & string8 'Instructional_Designer
        strSQL += "'," & string9 'ID_ID x
        strSQL += "," & string10 'Term x
        strSQL += ",'" & string11 'Status
        strSQL += "','" & string12 'Notes
        strSQL += "','" & string13 'Phase
        strSQL += "'," & string14 'FacCopyStatus x
        strSQL += "," & string15 ' CopyStatusTerm x
        strSQL += ",'" & string16 'CopyStatusNotes
        strSQL += "','" & string17 'Title
        strSQL += "','" & string18 & "')" 'Term_Offering


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