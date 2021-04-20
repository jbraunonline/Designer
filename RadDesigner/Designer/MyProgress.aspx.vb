Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class MyProgress
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblTerm.Text = Session("NextTerm")
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
    Protected Function getstatus(ByVal mymastername As String) As String
        Dim myReturn As String = "---"
        If IsTop20(mymastername) = True Then
            myReturn = "Top_20"
        ElseIf IsPilot(mymastername) = True Then
            myReturn = "PILOT"
        End If

        Return myReturn
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

    Protected Function getActivecount(ByVal mycourse As String) As String
        Dim mystatus As String = " = 'A' "

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


    Protected Function IsTop20(ByVal mycourse As String) As Boolean
        Dim myreturn As Boolean = False

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  Top_20_CRS from OL_MasterCourse Where MasterName='" & mycourse & "'"

        ' Response.Write(strsql & "<br>")

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        If dr.Read() Then
            Response.Write(dr("Top_20_CRS"))
            If dr("Top_20_CRS") = True Then
                myreturn = True
            End If
        End If


        If myConnection.State = ConnectionState.Open Then
            myConnection.Close()
        End If
        Return myreturn
    End Function

    Protected Function IsPilot(ByVal mycourse As String) As Boolean
        Dim myreturn As Boolean = False

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  Status from OL_MasterCourse Where MasterName='" & mycourse & "'"

        'Response.Write(strsql & "<br>")

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        If dr.Read() Then
            'Response.Write(dr("Status"))
            If dr("Status") = "Pilot" Then
                myreturn = True
            End If
        End If


        If myConnection.State = ConnectionState.Open Then
            myConnection.Close()
        End If
        Return myreturn
    End Function

End Class