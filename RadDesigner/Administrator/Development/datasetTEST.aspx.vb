Imports System.Data
Imports System.Data.SqlClient

Public Class datasetTEST
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myDataset As New DataSet()
        myDataset = GetCourses()

        For Each dr In myDataset.Tables(0).Rows
            Response.Write(dr("Course") & "<br>")
        Next
    End Sub

    Function GetCourses() As DataSet
        Dim strSQL As String = "SELECT Course  FROM [VC_VCData].[dbo].[MasterExamDates]"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlDataAdapter(strSQL, myConnection)

        ' Create and Fill the DataSet
        Dim myDataSet As New DataSet()
        myCommand.Fill(myDataSet)
        myConnection.Close()
        ' Return the DataSet
        Return myDataSet

    End Function


End Class