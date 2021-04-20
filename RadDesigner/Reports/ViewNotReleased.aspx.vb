Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins

Public Class ViewNotReleased
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim NewCode As String
        Dim objMyMethod As DesignModule
        objMyMethod = New DesignModule
        NewCode = objMyMethod.getNextTerm
        Session("NextTerm") = NewCode

        DeleteCountRecords()
        CreateCountRecords()
    End Sub

    Sub DeleteCountRecords()
        Dim strSQL As String = "Delete From BB_97_NotReleased  "

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '
        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            'HOLD SQL HOLD.{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{.......................................................................
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


    Sub CreateCountRecords()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "SELECT course, COUNT(*) as thecount FROM CMR where term = '" & Session("NextTerm") & "' and status = 'A' GROUP BY course "
        Response.Write(strsql)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()
        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("Course")) Then
                    If IsReleased(dr("Course")) = False Then
                        'Response.Write(dr("Course"))
                        'Response.Write("   ")
                        'Response.Write(IsReleased(dr("Course")))
                        'Response.Write("  count=  ")
                        'Response.Write(dr("theCount"))
                        'Response.Write("<br>")
                        SaveRecords(dr("Course"), dr("thecount"))
                        'Response.Write("<br>")
                    End If
                Else
                End If
            End While
        Else
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Response.Redirect("NotReleasedReport.aspx")
    End Sub

    Protected Function IsReleased(ByVal myCourse As String) As Boolean
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As Boolean = 0
        Dim strsql As String
        strsql = "SELECT      dbo.OL_MasterCourse.MasterName, dbo.OL_MasterCourse.Course "
        strsql += " FROM         dbo.OL_MasterCourse LEFT OUTER JOIN dbo.OL_MasterRelease ON dbo.OL_MasterCourse.MasterName = dbo.OL_MasterRelease.MasterName "
        strsql += " WHERE     (dbo.OL_MasterCourse.Term = '" & Session("NextTerm") & "') and dbo.OL_MasterRelease.IsReleased is not NULL   and (course = '" & myCourse & "')"
        ' Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Dim myvar As String
                myvar = dr("MasterName")
                If Len(myvar) > 1 Then
                    myreturn = 1
                End If

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Protected Sub SaveRecords(ByVal mycourse As String, ByVal mycount As Integer)
        Dim strSQL As String = "INSERT INTO BB_97_NotReleased "
        strSQL += "(Count,Course) "
        strSQL += "VALUES ("
        strSQL += mycount & ",'"
        strSQL += mycourse & "')"

        ' Response.Write(strSQL)
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