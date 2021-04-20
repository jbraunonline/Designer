Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Public Class Designer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'get course list for M James and add a select course
        lblUserName.Text = getName(Session("User_ID"))
        If Not Page.IsPostBack Then
            '[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[]
            'set the expire timeout for the session 
            'Session.Timeout = 2
            Session.Timeout = 60
            'configure the notification to automatically show 1 min before session expiration
            RadNotification1.ShowInterval = (Session.Timeout - 0.5) * 60 * 1000
            'ResolveClentURL= SessionExpired.aspx
            'set the redirect url as a value for an easier and faster extraction in on the client
            RadNotification1.Value = Page.ResolveClientUrl("/Default1.aspx")
            '}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

            'Dim strSQL As String = "SELECT CourseID, CourseNo FROM  dbo.Course "
            'strSQL += "WHERE Instructional_Designer = '" & Session("UserName") & "'"
            'Response.Write(strSQL)

            ' Dim strSQL As String = "Select  CourseID, CourseNo, Instructional_Designer From MasterCourse"
            'strSQL += " Where Term=" & Session("NextTerm") & " AND (Instructional_Designer = '" & Session("UserName") & "')"
            Dim strSQL As String = "Select  Master_ID, Course From OL_MasterCourse"
            strSQL += " Where Term=" & Session("NextTerm") & " AND ID_ID = " & CInt(Session("User_ID")) & " Order By Course asc"

            'Response.Write(strSQL)
            'Response.End()



            ' Response.End()

            Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)

            Dim myCommand As New SqlCommand(strSQL, myConnection)


            ' Open the connection and execute the Command
            'myConnection.Open()
            myConnection.Open()
            Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)


            DropDownList2.DataSource = dr
            DropDownList2.DataBind()
            'End If
            DropDownList2.Items.Insert(0, "<-- Select a Course -->")
            myConnection.Close()

        Else
            Session("Course") = DropDownList2.SelectedItem.Text
            Session("Master_ID") = DropDownList2.SelectedItem.Value
            Session("MasterCourse") = getMaster(DropDownList2.SelectedItem.Value)
            RadTabStrip1.Visible = True
            'RadTabStrip1.SelectedIndex = 0


        End If







    End Sub


    Public Function getName(ByVal myUserID As Integer) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "SELECT FirstName + ' ' + LastName as Name  FROM OL_Users where User_ID=" & myUserID
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

    Protected Sub OnSelectedIndexChanged(sender As Object, e As EventArgs)
        Dim message As String = DropDownList2.SelectedItem.Text & " - " & DropDownList2.SelectedItem.Value


    End Sub

    Private Function getmaster(ByVal myID As Integer) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myreturn As String = "Not Found"
        Dim strsql As String
        strsql = "SELECT MasterName FROM OL_mastercourse Where Master_ID=" & myID
        'Response.Write(strsql)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("MasterName")
            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Protected Sub OnCallbackUpdate(sender As Object, e As RadNotificationEventArgs)

    End Sub


End Class