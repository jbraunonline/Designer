Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing

Public Class Authenticate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        'First check if it is an internaml request from default1
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If Request("DualUser") <> "" Then

            Session("UserName") = Request("DualUser")
            Session("Role") = CStr(getRole(Session("UserName")))
            Session("User_ID") = getUser_ID(Session("UserName"))
            Session("Name") = getName(Session("UserName"))

            Response.Write(Session("UserName") & "<br>")
            Response.Write(Session("Role") & "<br>")
            Response.Write(Session("User_ID") & "<br>")
            Response.Write(Session("Name") & "<br>")
            If Session("Role") = "1" Then
                Response.Redirect("Designer/Designer.aspx")
            End If

            If Session("Role") = "2" Then
                Response.Redirect("Associate/Associate.aspx")
            End If
            If Session("Role") = "11" Then
                Response.Redirect("Supervisor/Supervisor.aspx")
                ' Response.End()
            End If
        End If
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



        lblUserName.Text = Session("UserName")
        Session("UserID") = Session("UserName")
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


        Dim thecount As Integer = GetCount(Session("UserName"))
        'Response.Write(thecount & "count<br>")

        If thecount = 0 Then
            lblNotAuthorized.Visible = True
            Response.End()
        ElseIf thecount = 1 Then
            'email= username
            'get username from email(struser)
            'Session("UserName") = Session("strUser")
            Response.Write(Session("UserName") & "<br>")
            Session("Role") = CStr(getRole(Session("UserName")))
            Session("User_ID") = getUser_ID(Session("UserName"))
            Session("Name") = getName(Session("UserName"))

            Response.Write(Session("UserName") & "<br>")
            Response.Write(Session("Role") & "<br>")
            Response.Write(Session("User_ID") & "<br>")
            Response.Write(Session("Name") & "<br>")
            If Session("Role") = "1" Then
                Response.Redirect("Designer/Designer.aspx")

            ElseIf Session("Role") = "2" Then
                Response.Redirect("Associate/Associate.aspx")

            ElseIf Session("Role") = "11" Then
                Response.Write("Crap")
                Response.Redirect("Supervisor/Supervisor.aspx")
            End If

        ElseIf thecount = 2 Then
            Panel1.Visible = True
            getmultipleUsers(Session("UserName"))
            lblMyName.Text = getName(Session("UserName"))
        End If



    End Sub

    Sub getmultipleUsers(ByVal myemail As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT UserName, Role  FROM OL_Users  where Email='" & myemail & "' And Role < 3"

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If dr("role") = 1 Then
                    lblDesigner.Text = dr("UserName")
                Else
                    lblAudit.Text = dr("UserName")
                End If

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub




    Public Function GetCount(ByVal instructorID As String) As Integer

        Dim thecount As Integer = 0
        Dim strSQL As String = "Select Count(*) As thecount "
        strSQL += "FROM OL_Users Where email= '" & instructorID & "'"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        ' Create Instance of Connection and Command Object

        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        dr.Read()

        If dr.HasRows Then
            thecount = dr("thecount")
        End If
        myConnection.Close()
        Return thecount

    End Function
    Public Function getRole(ByVal myUsername As String) As Integer
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = 0
        Dim strsql As String
        strsql = "SELECT Role  FROM OL_Users  where Username='" & myUsername & "'"
        'Response.Write(strsql)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("Role")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Public Function getUser_ID(ByVal myUsername As String) As Integer
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = 0
        Dim strsql As String
        strsql = "SELECT User_ID  FROM OL_Users  where UserName='" & myUsername & "'"

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("User_ID")

            End While
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
        strsql = "SELECT FirstName +' ' + LastName as Name  FROM OL_Users  where Username='" & myUsername & "'"
        'Response.Write(strsql & "<br>")
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

    Public Function getUserName(ByVal myUsername As String) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "No Name"
        Dim strsql As String
        strsql = "SELECT UserName  FROM OL_Users  where Email='" & myUsername & "'"
        Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("UserName")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function



    Protected Sub btnDesigner_Click(sender As Object, e As EventArgs) Handles btnDesigner.Click
        Response.Redirect("authenticate.aspx?DualUser=" & lblDesigner.Text)
    End Sub

    Protected Sub btnAudit_Click(sender As Object, e As EventArgs) Handles btnAudit.Click
        Response.Redirect("authenticate.aspx?DualUser=" & lblAudit.Text)
    End Sub
End Class