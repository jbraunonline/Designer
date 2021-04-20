Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins
Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class Consultant
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Write(txtUserName.Text & "<br>")
        Response.Write(txtPassword.Text & "<br>")
        Response.Write(getUser_ID(txtUserName.Text, txtPassword.Text))

        If getUser_ID(txtUserName.Text, txtPassword.Text) > 212 Then
            Session("UserName") = txtUserName.Text
            Session("Role") = "2"
            Session("User_ID") = getUser_ID(txtUserName.Text, txtPassword.Text)
            Session("Name") = getName(txtUserName.Text)
            Dim NewCode As String
            Dim objMyMethod As DesignModule
            objMyMethod = New DesignModule
            NewCode = objMyMethod.getNextTerm
            Session("NextTerm") = NewCode
            Dim myThisTerm As String = objMyMethod.getThisTerm
            Session("ThisTerm") = myThisTerm
            Dim myNextTerm As String = objMyMethod.getNextTerm
            Session("NextTerm") = myNextTerm

            Dim mynewmasterterm As String = objMyMethod.getNewMasterTerm
            Session("NewMasterTerm") = mynewmasterterm
            Response.Redirect("Associate/Associate.aspx")
        End If

    End Sub


    Public Function getUser_ID(ByVal myUsername As String, ByVal mypassword As String) As Integer
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = 0
        Dim strsql As String
        strsql = "SELECT User_ID  FROM OL_Users  where UserName='" & myUsername & "' and Password = '" & mypassword & "'"

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("User_ID")

            End While
        Else
            lblMessage.Visible = True

        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Public Function getName(ByVal myUsername As String) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "No Name"
        Dim strsql As String
        strsql = "SELECT FirstName +' ' + LastName as Name  FROM OL_Users  where UserName='" & myUsername & "'"

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("Name")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel1.Visible = True
    End Sub
End Class