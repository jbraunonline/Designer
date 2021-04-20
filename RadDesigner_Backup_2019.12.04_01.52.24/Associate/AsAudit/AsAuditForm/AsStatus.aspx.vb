Imports System.Data
Imports System.Data.SqlClient
Imports System.IO


Public Class AsStatus
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("MasterAuditName") = "" Then
            Response.Write("<b><font color=red>Your Session has expired. Please log in again! </font></b>")
            Response.End()
        End If
        '{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{  Programmer notes
        ' the audit section uses session(MasterAuditName)  and not MasterName or MasterCourse to identify the mastercourse
        'It gets to this page from a redirect from designer/ReviewAuditForm2.aspx?ID={0
        ' that page loads into an iframe ../associate/ASAudit/ASAuditSession.aspx   which creates session AuditID and Session MasterAuditName
        If Not Page.IsPostBack Then
            'Does OL_AuditStatus record exist
            lblAuditStatusExists.Text = DoesAuditStatusExist(Session("MasterAuditName"))
            If lblAuditStatusExists.Text = "False" Then
                createAuditStatusRecord(Session("MasterAuditName"), Session("Audit_ID"))
            End If
            Dim mystatus As String = GetStatus(Session("Audit_ID"))
                lblMasterStatus.Text = mystatus
                getData()
                If isSweep(Session("MasterAuditName")) = True Then
                    lblIsSweep.Text = "Sweep created"
                Else

                End If
                If Request("status") = "update" Then
                    lblUpdate.Visible = True
                    lblUpdate.Text = "Updeated: " & Now
                ElseIf Request("status") = "pushback" Then
                    lblUpdate.Visible = True
                    lblUpdate.Text = "Pushbacked: " & Now
                End If
            End If

        If Session("Role") = 1 Then
            btnPushBack.Visible = True
            lblPushBack.Visible = True
            lblPushBack.Text = "Please enter Push Back directions in the Notes area --> and state what must be done or fixed to complete the audit."
            If lblIsPrimary.Text = "True" Then
                btnSweep.Visible = True
            End If
        End If
    End Sub


    Protected Function DoesAuditStatusExist(ByVal mycourse As String) As Boolean
        'check to see if this master exists in the VC_VCdata BBMasterCourse table  NOTE this is not the VC_VCdata1 db -- connectionstring points to db
        Dim mysetup As Boolean = False
        Dim mySQL As String = "Select * from OL_AuditStatus where MasterName='" & mycourse & "'"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mySQL, myConnection)
        ' Response.Write(mySQL & " -Does aauditstatusExist<br>")
        'Response.Write("does sweep details exist <br>")
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myFlag As String = ""
        If dr.Read() Then
            If Not IsDBNull(dr("MasterName")) Then
                myFlag = dr("MasterName")
                If Len(myFlag) > 2 Then
                    mysetup = True
                End If
            Else
                mysetup = False
            End If
        Else
        End If

        dr.Close()
        myConnection.Close()
        'Response.Write("<br>" & CStr(mysetup) & "<br>")
        Return mysetup
    End Function

    Public Function isSweep(ByVal myCourse As String) As Boolean
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As Boolean = 0
        Dim strsql As String
        strsql = "SELECT MasterName  FROM OL_MasterSweep where MasterName='" & myCourse & "'"
        'Response.Write(strsql & " isSweep<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Dim myvar As String
                myvar = dr("MasterName")
                If Len(myvar) > 1 Then
                    myreturn = 1
                End If

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function


    Protected Function GetStatus(ByVal myID As String) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myreturn As String = ""
        Dim strsql As String
        strsql = "SELECT AuditStatus, IsPrimary FROM OL_MasterAudit Where Audit_ID= '" & myID & "'"
        'Response.Write(strsql & " getstatus <br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("AuditStatus")
                lblIsPrimary.Text = dr("IsPrimary")
                btnSweep.Visible = False
            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn

    End Function

    Protected Sub getData()

        Dim mystatus As String = lblMasterStatus.Text
        lblStatus.Text = mystatus
        Dim mydateEntered As String = "No Date"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select DateEntered from OL_AuditStatus Where Audit_ID=" & Session("Audit_ID")

        'Response.Write(strsql & " getdata<br>")

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()



        If dr.HasRows Then

            While dr.Read
                'Response.Write(dr("MasterName"))
                If Not IsDBNull(dr("DateEntered")) Then
                    mydateEntered = dr("DateEntered")
                    lblPageStatus.Text = "This data was saved on  " & mydateEntered
                    'lblPageStatus.Visible = False
                End If
            End While
            'There is a record in audit status///////////////////////////////////////////////////////////////////////
        End If
        If mydateEntered <> "No Date" Then
            Select Case mystatus
                Case "1-Complete"
                    lblCase.Text = "1"
                    chkCertify.Visible = True
                    chkProblems.Visible = True
                    chkCertify.Checked = True
                    chkProblems.Checked = False
                    lblStatus.Text = "1-Complete"
                    btnSave.Visible = False
                    btnUpdate.Visible = True

                Case "2-InProgress"
                    lblCase.Text = "2"
                    chkCertify.Visible = True
                    chkProblems.Visible = True
                    chkCertify.Checked = False
                    chkProblems.Checked = False
                    lblStatus.Text = "2-InProgress"
                    btnSave.Visible = False
                    btnUpdate.Visible = True

                Case "3-NotStarted"
                    lblCase.Text = "NoStart"
                    chkCertify.Visible = True
                    chkProblems.Visible = True
                    chkCertify.Checked = False
                    chkProblems.Checked = False
                    lblStatus.Text = "3-NotStarted"
                    btnSave.Visible = False
                    btnUpdate.Visible = True


                Case "9-Problems"
                    lblCase.Text = "Problems"
                    chkCertify.Visible = True
                    chkProblems.Visible = True
                    chkCertify.Checked = False
                    chkProblems.Checked = True
                    lblStatus.Text = "9-Problems"
                    btnSave.Visible = False
                    btnUpdate.Visible = True


                Case "7-PushBack"
                    lblCase.Text = "PushBK"
                    chkCertify.Visible = True
                    chkProblems.Visible = False
                    chkCertify.Checked = False
                    chkProblems.Checked = False
                    lblStatus.Text = "7-Pushback"
                    btnSave.Visible = False
                    btnUpdate.Visible = True
                    lblDirections.Visible = True


                Case "6-Fixed"
                    lblCase.Text = "Fix"
                    chkCertify.Visible = False
                    chkProblems.Visible = False
                    chkCertify.Checked = False
                    chkProblems.Checked = False
                    lblStatus.Text = "6-Fixed"
                    btnSave.Visible = False
                    btnUpdate.Visible = False

                    lblDirections.Visible = True
                    lblDirections.Text = "Only the Designer can update this record."
            End Select




        Else

            'There is NOT an AuditStatus record  ie No Record exists in auditStatus
            lblPageStatus.Text = "No data has been saved"

        Select Case mystatus
            Case "1-Complete"

                chkCertify.Visible = True
                chkProblems.Visible = True
                chkCertify.Checked = True
                chkProblems.Checked = False
                lblStatus.Text = "1-Complete"
                btnSave.Visible = True
                btnUpdate.Visible = False


            Case "2-InProgress"
                chkCertify.Visible = True
                chkProblems.Visible = True
                chkCertify.Checked = False
                chkProblems.Checked = False
                lblStatus.Text = "2-InProgress"
                btnSave.Visible = True
                btnUpdate.Visible = False

            Case "3-NotStarted"
                chkCertify.Visible = True
                chkProblems.Visible = True
                chkCertify.Checked = False
                chkProblems.Checked = False
                lblStatus.Text = "3-NotStarted"
                btnSave.Visible = True
                btnUpdate.Visible = False


            Case "9-Problems"
                chkCertify.Visible = True
                chkProblems.Visible = True
                chkCertify.Checked = False
                chkProblems.Checked = True
                lblStatus.Text = "9-Problems"
                btnSave.Visible = True
                btnUpdate.Visible = False


            Case "7-Pushback"
                chkCertify.Visible = False
                chkProblems.Visible = False
                chkCertify.Checked = False
                chkProblems.Checked = False
                lblStatus.Text = "7-Pushback"
                btnSave.Visible = True
                btnUpdate.Visible = False
                lblDirections.Visible = True

            Case "6-Fixed"
                chkCertify.Visible = False
                chkProblems.Visible = False
                chkCertify.Checked = False
                chkProblems.Checked = False
                lblStatus.Text = "6-Fixed"
                btnSave.Visible = False
                btnUpdate.Visible = False
                lblDirections.Visible = True
                lblDirections.Text = "Only the Designer can update this record."

        End Select

        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub

    Protected Sub createAuditStatusRecord(ByVal myMasterName As String, MyAuditID As Integer)



        Dim strSQL As String = "INSERT INTO OL_AuditStatus "
        strSQL += "(Audit_ID,MasterName) "

        strSQL += "VALUES ("

        strSQL += Session("Audit_ID") & ",'"
        strSQL += Session("MasterAuditName") & "')"

        Response.Write(strSQL)



        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD..]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
            myCommand.ExecuteNonQuery()

        Catch

            ' failed to create a new record
            Response.Write("<br>FAIL<br>")


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Response.Redirect("AsStatus.aspx")
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    End Sub





    Protected Sub SaveData()
        Dim mystatus As String = ""
        If chkCertify.Checked Then
            mystatus = "1-Complete"
        ElseIf chkProblems.Checked Then
            mystatus = "9-Problems"
        ElseIf lblStatus.Text = "7-Pushback" Then
            mystatus = "6-Fixed"
        End If


        Dim strSQL As String = "Update OL_AuditStatus "
        strSQL += "Set DateEntered='" & DateTime.Now & "',"
        strSQL += " lblStatus='" & mystatus & "'"

        strSQL += " Where Audit_ID =" & Session("Audit_ID")


        ''strSQL += Session("Audit_ID") & ",'"
        ' strSQL += Session("MasterAuditName") & "','"
        'strSQL += DateTime.Now & "','"
        'strSQL += mystatus & "','"
        'strSQL += Replace(txtNotes.Content, "'", "") & "')"
        'Response.Write(strSQL)



        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()

        Catch

            ' failed to create a new record
            Response.Write("<br>FAIL to savedataI()<br>")


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    End Sub

    Protected Sub UpdateData(ByVal myStatus As String)  'this updates the OL_AuditStatus record for this page
        Dim thestatus As String = ""
        If lblPushBackStatus.Text = "7-PushBack" Then
            thestatus = "7-PushBack"
        ElseIf lblPushBackStatus.Text = "Complete" Then
            thestatus = "1-Complete"
        ElseIf chkCertify.Checked Then
            thestatus = "1-Complete"
        ElseIf chkProblems.Checked Then
            thestatus = "9-Problems"
        ElseIf lblStatus.Text = "7-Pushback" Then
            thestatus = "6-Fixed"
        End If
        Dim strSQL As String = "Update OL_AuditStatus Set "

        strSQL += "DateEntered = '" & DateTime.Now() & "',"
        strSQL += "lblStatus = '" & thestatus & "'"

        strSQL += " Where Audit_ID =" & Session("Audit_ID")

        'Response.Write(strSQL & "--data<br>")


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
            Response.Write("Fail to update data()")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try


    End Sub
    Protected Sub UpdateStatus()
        Dim thestatus As String = ""
        If lblPushBackStatus.Text = "7-PushBack" Then
            thestatus = "7-PushBack"
        ElseIf lblPushBackStatus.Text = "Complete" Then
            thestatus = "1-Complete"
        ElseIf chkCertify.Checked Then
            thestatus = "1-Complete"
        ElseIf chkProblems.Checked Then
            thestatus = "9-Problems"
        ElseIf lblStatus.Text = "7-Pushback" Then
            thestatus = "6-Fixed"

        End If


        Dim strSQL As String = ""

        strSQL = "Update OL_MasterAudit set "
        strSQL += "AuditStatus='" & thestatus & "',"
        If lblPushBackStatus.Text = "Complete" Then
            strSQL += " AuditComplete=  '" & DateTime.Now() & "'"
            If lblIsPrimary.Text = "True" Then
                strSQL += ", IsSweep= 1 "
            End If
        Else
                strSQL += " AuditComplete= Null  "
        End If



        strSQL += " Where Audit_ID=" & Session("Audit_ID")



        ' Response.Write("<BR>Status -- " & strSQL)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()

        Catch
            Response.Write("Fail Update status()")
            ' failed to create a new record


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try
    End Sub




    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If chkCertify.Checked = False And chkProblems.Checked = False Then
            lblMustCheck.Visible = True
            Exit Sub
        ElseIf chkCertify.Checked = True Or chkProblems.Checked = True Then
            lblMustCheck.Visible = False
        End If
        Dim mystatus As String = lblStatus.Text
        SaveData()
        UpdateStatus()
        Response.Redirect("AsStatus.aspx?status=update")
    End Sub

    Protected Sub chkProblems_CheckedChanged(sender As Object, e As EventArgs) Handles chkProblems.CheckedChanged
        If chkProblems.Checked = True Then
            lblStatus.Text = "9-Problems"
            chkCertify.Checked = False

        End If
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        If chkCertify.Checked = False And chkProblems.Checked = False Then
            lblMustCheck.Visible = True
            Exit Sub
        ElseIf chkCertify.Checked = True Or chkProblems.Checked = True Then
            lblMustCheck.Visible = False
        End If
        UpdateData(lblStatus.Text)
        UpdateStatus()
        'Response.Redirect("AsStatus.aspx?status=update")
    End Sub

    Protected Sub btnPushBack_Click(sender As Object, e As EventArgs) Handles btnPushBack.Click
        lblPushBackStatus.Text = "7-PushBack"

        UpdateStatus()
        Pushback()
        Response.Redirect("AsStatus.aspx?status=pushback")
    End Sub
    Protected Sub Pushback()

        Dim strSQL As String = "Update OL_AuditStatus Set "

        strSQL += "DateEntered = '" & DateTime.Now() & "',"
        strSQL += "lblStatus = '7-PushBack'"

        strSQL += " Where Audit_ID =" & Session("Audit_ID")

        'Response.Write(strSQL & "<br>")
        ' Response.End()

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
            Response.Write("Fail pushback()")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try
        'Response.Redirect("AsStatus.aspx?status=update")
        '
    End Sub

    Function getDesignerID(ByVal myID As String) As Integer
        Dim myreturn As Integer = 0
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT ID_ID FROM OL_MasterCourse Where MasterName= '" & myID & "'"

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("ID_ID")
            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function

    Protected Sub createSweep()
        Dim strSQL As String = "INSERT INTO OL_MasterSweep "
        strSQL += "(MasterName,Term,Designer_ID,SweepCreated,SweepStatus) "
        strSQL += "VALUES ('"
        strSQL += Session("MasterAuditName") & "',"
        strSQL += Session("NextTerm") & ","
        strSQL += getDesignerID(Session("MasterAuditName")) & ",'"
        strSQL += DateTime.Now & "','"
        strSQL += "3-NotStarted')"

        'Response.Write(strSQL)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '
        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()

        Catch
            ' failed to create a new record
            Response.Write("<br>FAIL createsweep()<br>")
        Finally
            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try

    End Sub

    Protected Sub chkCertify_CheckedChanged(sender As Object, e As EventArgs) Handles chkCertify.CheckedChanged
        If chkCertify.Checked = True Then
            lblStatus.Text = "1-Complete"
            chkProblems.Checked = False

        End If
    End Sub

    Protected Sub btnSweep_Click(sender As Object, e As EventArgs) Handles btnSweep.Click
        lblPushBackStatus.Text = "Complete"
        UpdateData(lblStatus.Text)
        UpdateStatus()

        If lblIsPrimary.Text = "True" Then
            updateProgress1(Session("MasterAuditName"), Session("NextTerm"), "Audit")
            If isSweep(Session("MasterAuditName")) = False Then
                createSweep()
                lblIsSweep.Text = "Sweep Created"
            End If
        End If
    End Sub

    Private Sub updateProgress1(ByVal mycourse As String, ByVal myTerm As Integer, myitem As String)
        Dim mysql As String = " Update OL_Progress SET "
        mysql += myitem & "=" & 1 & " where MasterName= '" & mycourse & "' And Term ='" & myTerm & "'"

        Response.Write(mysql & "<br>")
        'Response.End()

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mysql, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record 
            Response.Write("Fail updateprogress()")
        Finally
            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try


    End Sub





End Class