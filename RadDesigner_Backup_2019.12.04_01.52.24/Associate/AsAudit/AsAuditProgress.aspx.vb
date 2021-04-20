Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class As_AuditProgress
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Function IsTop(ByVal mycourse As String) As String


        Dim myreturn As String = "False.png"
        Dim mySQL As String = "Select Top_20_CRS   From  OL_MasterCourse  where course='" & mycourse & "'"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mySQL, myConnection)
        'Response.Write("Select * from Section where SectionID=" & course)
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)

        If dr.Read() Then
            If Not IsDBNull(dr("Top_20_CRS")) Then

                If dr("Top_20_CRS") = True Then
                    myreturn = "True.png"
                End If

            End If
        Else
        End If

        dr.Close()
        myConnection.Close()
        'Response.Write("<br>" & CStr(mysetup) & "<br>")
        Return myreturn

    End Function
End Class