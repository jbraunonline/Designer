Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AsCourse
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("MasterAuditName") = "" Then
            Response.Write("<b><font color=red>Your Session has expired. Please log in again! </font></b>")

            '''''REMOVE   '''''''''''''''''''''''''''''''"""""""""""""""""""}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
            'Response.Write("Session Variables<br>")
            Dim strSesVar As String
            For Each strSesVar In Session.Keys
                ' Response.Write(strSesVar + " : " + Session(strSesVar).ToString() + "<br>")
            Next

            ' Response.Write("<br><br>END")



            Response.End()
        End If
        If Not Page.IsPostBack Then
            lblMasterCourse.Text = Session("MasterAuditName")
            lblRole.Text = Session("Role")

            GetData(Session("MasterAuditName"))
            Dim mystatus As String = GetStatus(Session("Audit_ID"))
            lblMasterStatus.Text = mystatus
            Select Case mystatus
                Case "1-Complete"
                    lblContinue.Visible = True
                Case "2-InProgress"
                    lblContinue.Visible = True
                Case "3-NotStarted"
                    Button1.Visible = True
                Case "9-Problems"
                    lblContinue.Visible = True
                Case Else
            End Select
        End If

    End Sub

    Protected Function GetStatus(ByVal myID As String) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myreturn As String = ""
        Dim strsql As String
        strsql = "SELECT AuditStatus FROM OL_MasterAudit Where Audit_ID= '" & myID & "'"

        Dim myCommand As New SqlCommand(strsql, myConnection)
        'Response.Write(strsql & "<br>")
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("AuditStatus")
            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn

    End Function


    Sub GetData(ByVal myID As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT * FROM OL_MasterCourse Where MasterName= '" & myID & "'"

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()


                ' 'lblTitle.text = 
                lblDesigner.Text = getName(dr("ID_ID"))
                lblDeveloper.Text = getName(dr("Dev_ID"))
                lblCodeveloper.Text = getName(dr("CO_DEV_ID"))
                'lblIsNewCourse.text = 
                lblPhase.Text = dr("Phase")
                lblAuditor.Text = Session("Name")
                'lblAuditStatus.Text =
                'GetAuditData(Session("MasterAuditName"))

                GetAuditData(Session("Audit_ID"))


            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub

    Sub GetAuditData(ByVal myID As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)

        Dim strsql As String
        'strsql = "SELECT * FROM OL_MasterAudit Where MasterName= '" & myID & "'"
        strsql = "SELECT * FROM OL_MasterAudit Where Audit_ID= " & myID


        Dim myCommand As New SqlCommand(strsql, myConnection)
        'Response.Write(strsql)
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                lblAuditStatus.Text = dr("AuditStatus")
                Dim mycourse As String = dr("Course")
                GetTitle(mycourse)
            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub

    Sub GetTitle(ByVal myID As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT Title,Status FROM OL_Catalog Where CatalogName= '" & myID & "'"

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                lblTitle.Text = dr("Title")
                lblStatus.Text = dr("Status")
            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub


    Public Function getName(ByVal myUserID As Integer) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "SELECT FirstName + ' ' + LastName as Name  FROM OL_Users where User_ID=" & myUserID
        'Response.Write(strsql & "<br>")
        'Response.End()
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()

                If Not IsDBNull(dr("Name")) Then
                    myreturn = dr("Name")
                End If
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        StartAudit(Session("Audit_ID"))
        Response.Redirect("AsCourse.aspx")
    End Sub

    Public Sub StartAudit(ByVal myID As String)

        Dim strSQL As String = "Update OL_MasterAudit set"
        strSQL += " AuditStatus='2-InProgress', "
        strSQL += " AuditStart='" & DateTime.Now.ToShortDateString & "'"
        strSQL += " Where Audit_ID=" & myID


        'Response.Write(strSQL & "<br>")


        Dim myNEWConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myNEWConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myNEWConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record 
            Response.Write("Fail")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try

        Response.Redirect("AsCourse.aspx")
    End Sub


End Class