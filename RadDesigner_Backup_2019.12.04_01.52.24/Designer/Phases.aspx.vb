Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins

Public Class Phases
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lblCourse.Text = "Phase History for " & Session("Course")
        'lblCurrent.Text = Session("CurrentTerm")
        'lblUpcoming.Text = Session("UpcomingTerm")
        lblPhase.Text = getworkflow(Session("MasterCourse"), Session("NextTerm"), "Phase")
        If getworkflow(Session("MasterCourse"), Session("NextTerm"), "Phase") = "Verified" Then
            btnVerify.Visible = False
        End If
    End Sub
    Private Sub RadGrid1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadGrid1.Init
        Dim menu As Telerik.Web.UI.GridFilterMenu = RadGrid1.FilterMenu
        Dim i As Integer = 0
        While i < menu.Items.Count
            If menu.Items(i).Text = "NoFilter" Or
           menu.Items(i).Text = "Contains" Or
           menu.Items(i).Text = "EqualTo" Then
                i = i + 1
            Else
                menu.Items.RemoveAt(i)
            End If
        End While
    End Sub
    Function getworkflow(ByVal mycourse As String, ByVal myTerm As Integer, myItem As String) As String
        Dim myreturn As String = "Not Verified"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT Phase  FROM OL_Progress where MasterName= '" & mycourse & "' And Term =" & myTerm
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If dr("Phase") = True Then
                    myreturn = "Verified"
                End If

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()


        Return myreturn
    End Function




    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub

    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As Telerik.Web.UI.GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource

    End Sub

    Protected Sub btnVerify_Click(sender As Object, e As EventArgs) Handles btnVerify.Click
        UpdateProgress(Session("MasterCourse"), Session("NextTerm"), "Phase")
    End Sub


    Sub updateProgress(ByVal mycourse As String, ByVal myTerm As Integer, myitem As String)
        Dim mysql As String = " Update OL_Progress SET "
        mysql += myitem & "=" & 1 & " where MasterName= '" & mycourse & "' And Term =" & myTerm

        ' Response.Write(mysql & "<br>")


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
        Response.Redirect("~/Designer/Phases.aspx")

    End Sub


End Class