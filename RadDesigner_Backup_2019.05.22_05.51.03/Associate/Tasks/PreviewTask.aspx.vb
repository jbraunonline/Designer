Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class PreviewTask
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GetTask(Request("ID"))
    End Sub

    Sub GetTask(ByVal myID As Integer)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT RequestMade,MasterName,Designer,Severity,TaskSubject,Task FROM OL_DesignerTasks Where Task_ID=" & myID

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                lblDatePosted.Text = dr("RequestMade")
                lblCourse.Text = dr("MasterName")
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

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs) Handles btnReturn.Click
        Response.Redirect("MyTasks.aspx")
    End Sub
End Class