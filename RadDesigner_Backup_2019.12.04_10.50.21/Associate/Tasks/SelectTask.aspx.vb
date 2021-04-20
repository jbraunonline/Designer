Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class SelectTask
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GetTask(Request("ID"))

    End Sub


    Sub GetTask(ByVal myID As Integer)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT RequestMade,MasterName as Course,Designer,Severity,TaskSubject,Task FROM OL_DesignerTasks Where Task_ID=" & myID

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                lblDatePosted.Text = dr("RequestMade")
                lblCourse.Text = dr("Course")
                lblDesigner.Text = dr("Designer")
                lblSeverity.Text = dr("Severity")
                lblSummary.Text = dr("TaskSubject")
                RadEditor1.Content = dr("Task")

            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()




    End Sub

    Sub AcceptTask(ByVal myID As String)
        Dim strSQL As String = "UPDATE OL_DesignerTasks SET "
        strSQL += "TaskAcceptedBy='" & Session("Name") & "',"
        strSQL += "TaskAcceptedBy_ID=" & Session("User_ID") & ", "
        strSQL += "TaskAccepted='" & Now.ToShortDateString & "'"
        strSQL += " WHERE Task_ID = " & myID
        Response.Write(strSQL & "<br>")
        'response.Write(strSQL & "<br>")

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
        ' Response.Redirect("ALLTaskList.aspx")
    End Sub

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs) Handles btnReturn.Click
        Response.Redirect("AllTaskList.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        AcceptTask(Request("ID"))
    End Sub
End Class