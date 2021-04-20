Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class MyProgress2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Function getAudit(ByVal mycourse As String) As Boolean
        Dim myreturn As Boolean = False

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  AuditComplete from OL_MasterAudit Where MasterName='" & mycourse & "'"

        'Response.Write(strsql & "<br>")

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        If dr.Read() Then
            If Not IsDBNull(dr("AuditComplete")) Then
                'Response.Write(dr("AuditComplete"))


                myreturn = True

                End If
            Else
                'Response.Write("Null")



            End If


        If myConnection.State = ConnectionState.Open Then
            myConnection.Close()
        End If
        Return myreturn
    End Function

    Protected Function getSweep(ByVal mycourse As String) As Boolean
        Dim myreturn As Boolean = False

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select SweepComplete from OL_MasterSweep Where MasterName='" & mycourse & "'"

        'Response.Write(strsql & "<br>")

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        If dr.Read() Then
            If Not IsDBNull("SweepComplete") Then
                'Response.Write(dr("AuditComplete"))

                myreturn = True

            End If
        Else
            'Response.Write("Null")



        End If


        If myConnection.State = ConnectionState.Open Then
            myConnection.Close()
        End If
        Return myreturn
    End Function

    Protected Sub btnPreview_Click(sender As Object, e As EventArgs) Handles btnPreview.Click
        Response.Redirect("ActivityPreview.aspx")
    End Sub
End Class