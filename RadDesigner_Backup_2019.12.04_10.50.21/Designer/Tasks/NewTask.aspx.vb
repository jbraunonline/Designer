
Imports Telerik.Web.UI.Skins
Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class NewTask
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtDate.Text = String.Format("{0:MM/dd/yyyy}", DateTime.Now)
        txtDesigner.Text = Session("Name")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim strSQL As String = "INSERT INTO OL_DesignerTasks"
        strSQL += " (MasterName,Master_ID,Term,Designer,Designer_ID,RequestMade,TaskSubject,Task,Severity)"
        strSQL += " VALUES ('"
        strSQL += ddlCourses.SelectedItem.Text & "',"
        strSQL += ddlCourses.SelectedItem.Value & ","
        strSQL += Session("NextTerm") & ",'"

        strSQL += Session("Name") & "',"
        strSQL += Session("User_ID") & ",'"
        strSQL += txtDate.Text & "','"

        strSQL += txtSummary.Text & "','"

        strSQL += RadEditor1.Text & "','"
        strSQL += ddlSeverity.SelectedItem.Text & "')"

        'Response.Write(strSQL & "<br>")


        'strSQL += " '" & myTermStart & "',"
        'strSQL += "'" & myTermEnd & "',"
        'strSQL += "'" & mydescription & "',"
        'strSQL += "" & myCredits & ","
        'strSQL += "" & myReference & ","
        'strSQL += "'" & myLastName & "',"
        'strSQL += "'" & myFirstName & "',"
        'strSQL += "'" & myMDCID & "',"
        'strSQL += "" & myInstructorID & ","
        'strSQL += "'" & myMDCID & "',"
        'strSQL += "" & myVisible & ","
        'strSQL += "" & myisVisible & ","
        'strSQL += "'" & myPTFT & "',"
        'strSQL += "'" & myChair & "',"
        'strSQL += "'" & myChairOutlook & "',"
        'strSQL += "" & mychange & ","
        'strSQL += "'BB')"


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


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try
        Response.Write("Task Added")
        lblNavigate.Visible = True
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        lblNavigate.Visible = True
        txtSummary.Text = ""
        RadEditor1.Content = ""
    End Sub
End Class