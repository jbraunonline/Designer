Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Net.Mail

Public Class CreateAudit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            GetCourses(CInt(Session("User_ID")))

        Else

        End If


    End Sub

    Sub GetCourses(ByVal myID As Integer)

        Dim strsql As String
        strsql = "Select MasterName FROM OL_MasterCourse Where Term = '" & Session("NextTerm") & "' And ID_ID=" & myID & "Order By MasterName"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        ddlCourses.DataSource = dr
        ddlCourses.DataBind()
        ddlCourses.SelectedValue = Session("MasterCourse")
        lblWarn.Text = CanAudit(ddlCourses.SelectedValue)
        If lblWarn.Text = "Audit Approved" Then
            Button1.Visible = True
        Else
            Button1.Visible = False
        End If
        ddlCourses.Items.Insert(0, New ListItem("Select a Course", ""))
        dr.Close()
        dr = Nothing
        myConnection.Close()





    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strSQL As String = "INSERT INTO OL_MasterAudit "
        strSQL += "(MasterName,Course,Term,Designer,Designer_ID,IsPrimary,Auditor,Auditor_ID,AuditCreated,AuditStatus) "
        strSQL += "VALUES ('"
        strSQL += ddlCourses.SelectedItem.Value & "','"
        strSQL += Session("Course") & "',"
        strSQL += Session("NextTerm") & ",'"
        strSQL += Session("UserName") & "',"
        strSQL += Session("User_ID") & ","
        strSQL += lblIsPrimary.Text & ",'"
        strSQL += "" & DropDownList1.SelectedItem.Text & "',"
        strSQL += "" & DropDownList1.SelectedItem.Value & ",'"
        strSQL += Now.ToShortDateString & "','"
        strSQL += "3-NotStarted')"

        Response.Write(strSQL & "<br>")


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD..[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
            myCommand.ExecuteNonQuery()

        Catch

            Response.Write("failed to create a new record")


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try
        lblDone.[Text] = "An audit for course " & ddlCourses.SelectedItem.Value & " has been created."
        ''doEmail1(ddlCourses.SelectedItem.Value, DropDownList1.SelectedItem.Text)
        btnAnother.Visible = True
    End Sub
    Sub doEmail1(ByVal mycourse As String, ByVal myEmail As String)
        Dim myCC As String = "vcproctor@mdc.edu"
        Dim my2 As String = "jbraun1@mdc.edu"
        Dim mySendTo As String = myEmail & "@mdc.edu"
        Dim theDesigner As String = getName(Session("User_ID"))
        Dim MyMessage As String = theDesigner & " has assigned " & mycourse & " to  " & mySendTo & " to be audited.<br>Date Assigned:: " & Now.ToShortDateString & " <br>Please go to http://virtual.mdc.edu/designer to do the audit.<br>"


        Try
            Dim Smtp_Server As New SmtpClient
            Dim e_mail As New MailMessage()
            Smtp_Server.UseDefaultCredentials = True

            Smtp_Server.Host = "mail.mdc.edu"

            e_mail = New MailMessage()
            e_mail.From = New MailAddress("vcVCdesigners@mdc.edu")
            e_mail.To.Add(mySendTo)
            e_mail.CC.Add(my2)
            e_mail.Subject = " New VC Designer Course Audit"
            e_mail.IsBodyHtml = True
            e_mail.Body = MyMessage
            ' MsgBox("do you want to sent the mail?")
            Smtp_Server.Send(e_mail)


        Catch error_t As Exception
            MsgBox(error_t.ToString)
        End Try
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
    Public Function CanAudit(ByVal myMasterCourse As String) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "The following have not been verified: "
        Dim strsql As String
        Dim mycount As Integer = 0
        strsql = "SELECT Phase, Textbook, Exam, BBlock  FROM OL_Progress where MasterName='" & myMasterCourse & "'"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If dr("Phase") = False Then
                    myreturn += " Phase,"
                    mycount = mycount + 1
                End If

                If dr("Textbook") = False Then
                    myreturn += " Textbook,"
                    mycount = mycount + 1
                End If

                If dr("Exam") = False Then
                    myreturn += " Exam,"
                    mycount = mycount + 1
                End If

                If dr("BBlock") = False Then
                    myreturn += " Building Block,"
                    mycount = mycount + 1
                End If

                If mycount = 0 Then
                    Return "Audit Approved"
                Else
                    Return myreturn
                End If

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Private Function istop(ByVal mymaster As String) As String


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = ""
        Dim myis20 As Boolean = False

        Dim strsql As String
        strsql = "Select Top_20_CRS from OL_MasterCourse where MasterName ='" & mymaster & "'"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myis20 = dr("Top_20_CRS")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

        If myis20 = True Then
            lblIsTop.Text = "This is a Top 20 Course"
            If getAuditCount(mymaster) = 2 Then
                myreturn = "There are two audits for this course"
                RadioButtonList1.Visible = False
                Button1.Visible = False
            ElseIf getAuditCount(mymaster) = 1 Then
                myreturn = "One audit is schedduled, you may add another"
                RadioButtonList1.Visible = True
                RadioButtonList1.SelectedValue = "Second"
            ElseIf getAuditCount(mymaster) = 0 Then
                myreturn = "No audits have been scheduled, Schedule the first audit."
                lblIsPrimary.Text = "0"
                RadioButtonList1.Visible = True
                RadioButtonList1.SelectedValue = "First"
            End If
        Else
            lblIsTop.Text = ""
            If getAuditCount(mymaster) = 1 Then
                myreturn = "This course has been audited"
                RadioButtonList1.Visible = False
                Button1.Visible = False
            ElseIf getAuditCount(mymaster) = 0 Then
                RadioButtonList1.Visible = False
                Button1.Visible = True
            End If
        End If



        Return myreturn




        Return myreturn
    End Function
    Private Function getAuditCount(ByVal mymaster As String) As Integer


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As Integer = 0
        Dim strsql As String
        strsql = "SELECT count (*) as thecount   FROM [VC_VCData1].[dbo].[OL_MasterAudit]   where mastername = '" & mymaster & "'"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("thecount")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn




        Return myreturn
    End Function

    Protected Sub btnAnother_Click(sender As Object, e As EventArgs) Handles btnAnother.Click
        Response.Redirect("CreateAudit.aspx")
    End Sub

    Protected Sub btnReturnToAuditList_Click(sender As Object, e As EventArgs) Handles btnReturnToAuditList.Click
        Response.Redirect("AuditProgress.aspx")
    End Sub

    Protected Sub ddlCourses_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlCourses.SelectedIndexChanged
        lblWarn.Text = CanAudit(ddlCourses.SelectedValue)
        Session("Course") = Mid(ddlCourses.SelectedValue, 6, 8)
        Session("Course") = Replace(Session("Course"), "_", "")
        Response.Write("Counse=" & Session("Course"))
        If lblWarn.Text = "Audit Approved" Then
            Button1.Visible = True
        Else
            Button1.Visible = False
        End If

        lblIsTop20.Text = istop(ddlCourses.SelectedValue)
    End Sub
End Class