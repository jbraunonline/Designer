Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins
Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class _Default
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Course") = ""
        Session("Master_ID") = ""
        'Response.Redirect("index.aspx")
        txtPassword.Focus()

    End Sub




    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        ' NOTE Logging in creates 6 session variables that orient the user to this application.
        ' this term = term like 2183' next term like 2185 and copy term like 2187
        ' username, User_ID, role.
        ' these are stored as string values (variants) that may need to be coverted to a specific data type for any given purpose
        If txtPassword.Text <> "virtual" Then
            lblMessage.Visible = True
        Else

            If DropDownList1.SelectedValue = "nada" Then
                Response.Write("<font  color=red><B>Select a name</B></font>")

            End If

            If DropDownList1.SelectedIndex = 0 Then
                Response.Write("Please select a Name")
                Response.End()

            Else


                Session("UserName") = DropDownList1.SelectedValue.ToString
                Session("Role") = CStr(getRole(DropDownList1.SelectedValue.ToString))
                Session("User_ID") = getUser_ID(DropDownList1.SelectedValue.ToString)
                Session("Name") = getName(DropDownList1.SelectedValue.ToString)
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

                ' Response.Write(Session("ThisTerm") & "  " & Session("NextTerm") & " " & Session("NewMasterTerm") & "<br>")
                ''Response.Write(Session("UserName") & " - " & Session("User_ID") & " _ " & Session("Role"))
                'Response.End()

                ' NOTE: the following statements direct users to the proper application pages by their user ROLE.
                If Session("Role") = "1" Then
                    Response.Redirect("Designer/Designer.aspx")
                End If

                If Session("Role") = "4" Then
                    Response.Redirect("Supervisor/Supervisor.aspx")
                End If

                If Session("Role") = "2" Then
                    Response.Redirect("Associate/Associate.aspx")
                End If

                If Session("Role") = "5" Then
                    Response.Redirect("Developer/Developer.aspx")
                End If

                If Session("Role") = "7" Then
                    Response.Redirect("Delivery/Delivery.aspx")
                End If

                If Session("Role") = "Helpdesk" Then
                    Response.Redirect("Helpdesk/Helpdesk.aspx")
                End If


            End If
        End If
    End Sub


    Public Function getRole(ByVal myUsername As String) As Integer
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = 0
        Dim strsql As String
        strsql = "SELECT Role  FROM OL_Users  where UserName='" & myUsername & "'"
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

End Class
