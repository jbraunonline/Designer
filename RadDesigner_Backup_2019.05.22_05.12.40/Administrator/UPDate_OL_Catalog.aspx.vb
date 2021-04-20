Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Text.RegularExpressions

Public Class UPDate_OL_Catalog
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As Boolean = 0
        Dim strsql As String
        strsql = "SELECT CatalogName FROM OL_Catalog"
        Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Dim myvar As String
                Response.Write("-------------------------------------------------------------------------------------------------------------------------------------<br>")
                myvar = dr("CatalogName")
                Response.Write(myvar & "<br>")
                getData(myvar)

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Private Sub getData(ByVal mycourse As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As Boolean = 0
        Dim strsql As String
        strsql = "SELECT Title, Credits,Description FROM MDCmasterCourses where course ='" & mycourse & "'"
        Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()

                If Not IsDBNull(dr("Title")) Then
                    Response.Write(dr("Title") & "<br>")
                    Response.Write(dr("Credits") & "<br>")
                    Response.Write(dr("Description") & "<br>")
                    Response.Write("Update<br><br>")
                    updateCatalog(dr("Title"), dr("Credits"), Replace(dr("Description"), "$", ","), mycourse)
                Else
                    Response.Write("<font color=red>No record </font><br><br>")
                End If

            End While
        Else
            Response.Write("<font color=red>No record </font><br><br>")
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()



    End Sub

    Private Sub updateCatalog(ByVal mytitle As String, ByVal Mycredits As String, ByVal myDescription As String, ByVal Course As String)
        '

        ''''''''''''''''''''''''''''''''''''''''''
        Dim mysql As String = "UPDATE OL_Catalog SET "


        mysql += "Title='" & mytitle & "'"
        mysql += ",credits='" & Mycredits & "'"
        mysql += ",CourseDescription='" & myDescription & "'"
        mysql += " WHERE catalogname='" & Course & "'"
        Response.Write(mysql & "<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mysql, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
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
    End Sub


End Class