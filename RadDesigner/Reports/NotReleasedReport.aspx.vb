Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins

Public Class NotReleasedReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Then
            ' Response.Redirect("~/Default.aspx")
        End If
        If Not Page.IsPostBack Then

        Else

        End If
        Dim NewCode As String
        Dim objMyMethod As DesignModule
        objMyMethod = New DesignModule
        NewCode = objMyMethod.getNextTerm
        Session("NextTerm") = NewCode
        Dim myThisTerm As String = objMyMethod.getThisTerm
        Session("ThisTerm") = myThisTerm
        Dim myNextTerm As String = objMyMethod.getNextTerm
        Session("NextTerm") = myNextTerm

        Dim mynewmasterterm As String = objMyMethod.getNewMasterTerm
        Session("NewMasterTerm") = mynewmasterterm
        lblTerm.Text = Session("NextTerm")
    End Sub

    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs)
        If (TypeOf e.Item Is GridDataItem AndAlso e.Item.OwnerTableView.DataSourceID = "SqlDataSource1") Then
            Dim lbl As Label = CType(e.Item.FindControl("numberLabel"), Label)
            lbl.Text = (e.Item.ItemIndex + 1).ToString
        End If
    End Sub
    Protected Function getphase(ByVal mymastername As String) As String
        Dim myreturn As String = ""
        Dim mycourse As String = mymastername
        mycourse = Replace(mymastername, Session("Nextterm") & "_", "")
        mycourse = Replace(mycourse, "_MC_VC", "")

        Return lookupPhase(mycourse)
    End Function

    Protected Function getPopUp(ByVal MyMaster As String) As String
        Dim myreturn As String = "Nada"
        Dim mycourse As String = MyMaster
        mycourse = Replace(mycourse, Session("Nextterm") & "_", "")
        mycourse = Replace(mycourse, "_MC_VC", "")
        myreturn = "<a href='popup.aspx?ID=" & mycourse & "' onclick=""centeredPopup(this.href,'myWindow','950','860','yes');return false"">History</a>"

        Return myreturn
    End Function

    Protected Function lookupPhase(ByVal mycourse As String) As String
        Dim myreturn As String = ""
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "SELECT term97  FROM OL_MasterPhase where Course='" & mycourse & "'"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("term97")) Then
                    Dim myvar As String
                    myreturn = dr("term97")
                End If


            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn


    End Function

    Protected Function getcount(ByVal mycourse As String) As String
        Dim mystatus As String = " <> 'X' "

        Dim myreturn As String = ""
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "SELECT count (*) as thecount   FROM [VC_VCData].[dbo].[CMR]  where term = '" & Session("NextTerm") & "' and status " & mystatus & " and type='E' and course = '" & mycourse & "'"
        'response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("thecount")) Then
                    Dim myvar As String
                    myreturn = dr("thecount")
                End If


            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

        Return myreturn

    End Function
    Protected Function getBB(ByVal mycourse As String) As String


        Dim myreturn As String = "Tentative"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "SELECT count (*) as thecount   FROM [VC_VCData].[dbo].[CMR]  where term = '" & Session("NextTerm") & "' and status = 'A' and type='E' and course = '" & mycourse & "'"
        'response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("thecount")) Then
                    If dr("thecount") > 0 Then
                        myreturn = "Active"
                    End If

                End If
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

        Return myreturn

    End Function



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", "window.close()", True)
    End Sub






    Protected Sub btnRefresh_Click(sender As Object, e As EventArgs) Handles btnRefresh.Click
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
        strsql = "SELECT course, COUNT(*) as thecount FROM CMR where term = '2197' and status = 'A' GROUP BY course "

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
        strsql += " WHERE     (dbo.OL_MasterCourse.Term = '2197') and dbo.OL_MasterRelease.IsReleased is not NULL   and (course = '" & myCourse & "')"
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