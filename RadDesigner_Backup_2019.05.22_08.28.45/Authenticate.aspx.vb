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
        If Request("User") = "" And Request("Token") = "" Then
            Response.Write("<font color=red>FAIL  You are not authorized to view this page!</font>")
            Response.End()
        End If

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

        Dim strUser As String = ""
        If Request("token") <> "" Then
            strUser = IsAuthenticated()
            ' simulate token= melisa
            'strUser = "mrios4"
            Session("strUser") = strUser
            'Response.Write(Session("strUser"))

            Dim thecount As Integer = GetCount(Session("strUser"))
            Response.Write(thecount & "count<br>"
                           )
            'Response.End()

            If strUser = "" Then

                Response.Write("<a href='../index.aspx' target=top>Login Again</a>")

            Else
                If thecount = 0 Then
                    lblNotAuthorized.Visible = True
                    Response.End()
                ElseIf thecount = 1 Then
                    'email= username
                    'get username from email(struser)
                    Session("UserName") = Session("strUser")
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
                    getmultipleUsers(Session("strUser"))
                    lblMyName.Text = getName(Session("strUser"))
                End If

            End If
        ElseIf Request("User") <> "" Then

            Session("UserName") = Request("User")
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

    Function IsAuthenticated() As String

        'URL that returns XML document
        Dim strURL As String = "https://login.mymdc.net/token_authenticator/student_data.asp?Token=" & Request.Params("Token")

        'Credential/Authentication stuff
        Dim myCred As New NetworkCredential("vcvcollegeta", "vUk6wep6ax2wrE", "")
        Dim myCache As New CredentialCache()

        myCache.Add(New Uri("https://login.mymdc.net"), "Basic", myCred)

        'Create XmlResolver object and assign credentials
        Dim resolver As XmlUrlResolver = New XmlUrlResolver()
        resolver.Credentials = myCred

        'Create XmlTextReader
        Dim reader As New XmlTextReader(strURL)

        'Assign XmlTextReader.XmlResolver property that we just created above
        'Necessary because of security issues
        reader.XmlResolver = resolver

        Dim strUser, strReason As String
        strReason = ""
        strUser = ""

        'I'm sure there's a better way to do this...but hey i'll research it tomorrow
        'We need these because each node has a beginning and ending XML tag
        'I.e <AUTHENTICATION_RESPONSE> AND </AUTHENTICATION_RESPONSE>
        'We just need the first instance of each tag to get the appropriate attribute

        Dim nUser As Integer = 0
        Dim nError As Integer = 0

        While (reader.Read())

            'Response.Write(reader.Name & "=" & reader.Value & "<br>")

            'Get user information
            If reader.Name = "AUTHENTICATION_RESPONSE" Then

                nUser = nUser + 1

                If nUser = 1 Then

                    strUser = reader.GetAttribute("USER")

                End If

            End If

            'Get authentication info
            If reader.Name = "ERROR" Then

                nError = nError + 1

                If nError = 1 Then

                    strReason = reader.GetAttribute("REASON")

                    'If REASON = Nothing...then we're authenticated

                    'If strReason = "" Then
                    '    Response.Write("Authentication Successful" & "<br>")
                    '    Response.Write("User=" & strUser)
                    'Else
                    '    Response.Write("Authentication Failed" & "<br>")
                    '    Response.Write("User=" & strUser)
                    'End If

                End If

            End If

        End While

        If strReason = "" Then
            Return strUser.Substring(strUser.IndexOf("\") + 1)
        Else
            Return ""
        End If

    End Function

    Protected Sub btnDesigner_Click(sender As Object, e As EventArgs) Handles btnDesigner.Click
        Response.Redirect("authenticate.aspx?User=" & lblDesigner.Text)
    End Sub

    Protected Sub btnAudit_Click(sender As Object, e As EventArgs) Handles btnAudit.Click
        Response.Redirect("authenticate.aspx?User=" & lblAudit.Text)
    End Sub
End Class