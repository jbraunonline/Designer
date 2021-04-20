Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Text.RegularExpressions

Public Class GETbb
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Write("External_Course_Key|Course_Name|TERM_KEY|Course|Section|Org_Name|Org_Type|Category|Start_Date|End_Date<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myreturn As Boolean = 0
        Dim strsql As String
        strsql = "SELECT Term,Reference,Prefix,Catalog,Course,StartDate,EndDate FROM CMR where term = '2195'"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Dim mystart As Date = dr("StartDate")
                Dim ymd As String = mystart.ToString("yyyyMMdd")
                Dim myend As Date = dr("EndDate")
                Dim ymd2 As String = myend.ToString("yyyyMMdd")

                Response.Write(dr("Term") & "-")
                Response.Write(dr("Reference") & "|")
                Response.Write(dr("Course") & "-" & dr("term") & "-" & dr("Reference") & "|" & dr("term") & "|" & dr("Course") & "|37|ONLN|VIRT|College Credit|" & ymd & "|" & ymd2 & "<br>")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Write("External_Course_Key|External_Person_Key|Role|Available_Ind|ROW_STATUS<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myreturn As Boolean = 0
        Dim strsql As String
        strsql = "SELECT Term,Reference,MDCID FROM CMR where term = '2195'"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()


                Response.Write(dr("Term") & "-" & dr("Reference") & "|" & dr("MDCID") & "|Instructor|N|enabled<br>")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub
End Class