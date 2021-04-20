Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AsProctoredExam
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("MasterAuditName") = "" Then
            Response.Write("<b><font color=red>Your Session has expired. Please log in again! </font></b>")
            Response.End()
            'Session("MasterAuditName") = "2195_CLP1006_MC_VC"
            ' Session("Audit_ID") = "1084"
        End If
        If Not Page.IsPostBack Then
            'Response.Write("auditID=" & Session("Audit_ID"))
            Dim mystatus As String = GetStatus(Session("MasterAuditName"))
            lblMasterStatus.Text = mystatus
            lblCourse.Text = Session("MasterAuditName")
            'Does AuditProctor record exist? If not, create the record.
            If DoesAuditProctorExist(Session("Audit_ID"), Session("MasterAuditName")) = False Then
                SaveData(Session("Audit_ID"), Session("MasterAuditName"))
            End If


            DoesExamExist(Session("MasterAuditName"))

            getData()
        Else

        End If
    End Sub
    Protected Function DoesAuditProctorExist(ByVal myID As String, ByVal mycourse As String) As Boolean
        Dim myreturn As Boolean = False

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  MasterName from OL_AuditProctor Where Audit_ID=" & myID

        'Response.Write(strsql & "  doesAuditProctorExist<br>")

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        If dr.Read() Then
            myreturn = True
        Else
            myreturn = False
        End If
        If myConnection.State = ConnectionState.Open Then
            myConnection.Close()
        End If
        Return myreturn
    End Function



    Protected Function GetStatus(ByVal myID As String) As String
        Dim myreturn As String = ""
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT AuditStatus FROM OL_MasterAudit Where MasterName= '" & myID & "'"
        'Response.Write(strsql)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                ' Response.Write(dr("AuditStatus"))
                myreturn = dr("AuditStatus")
            End While
        End If
        Return myreturn
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Function

    Protected Sub DoesExamExist(ByVal myMaster As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select IsMid,IsFin,MidStart,MidEnd,FinStart,FinEnd from OL_MasterProctor Where MasterName='" & myMaster & "'"

        'Response.Write(strsql)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()
                'Response.Write("Mid=" & dr("IsMid"))
                If dr("IsMid") = 1 Then
                    radioMidExists.SelectedValue = "MidTerm Exists"
                    lblMidStart.Text = dr("MidStart")
                    lblMidEnd.Text = dr("MidEnd")
                Else
                    radioMidExists.SelectedValue = "No Midterm"
                End If

                If dr("IsFin") = 1 Then
                    radioFinExists.SelectedValue = "Final Exists"
                    lblFinStart.Text = dr("FinStart")
                    lblFinEnd.Text = dr("FinEnd")
                Else
                    radioFinExists.SelectedValue = "No Final"
                End If
                lblMidStart.Text = dr("MidStart")
                lblMidEnd.Text = dr("MidEnd")
            End While
        Else
            Response.Write("<font color=red>No Master Proctor Exam record exists for this course.  Please see administrator.</font>")
            Response.End()
        End If

    End Sub


    Protected Sub getData()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  * from OL_AuditProctor Where Audit_ID='" & Session("Audit_ID") & "'"

        'Response.Write(strsql & "  getdata<br>")

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("DateEntered")) Then



                    lblPageStatus.Text = "This data was saved on  " & dr("DateEntered")

                    btnUpdate.Visible = True

                End If
                If Not IsDBNull(dr("chkMidAvail")) Then
                        chkMidAvail.Checked = dr("chkMidAvail")
                    End If


                    If Not IsDBNull(dr("chkMIDLCLIP")) Then
                        chkMIDLCLIP.Checked = dr("chkMIDLCLIP")
                    End If


                    If Not IsDBNull(dr("chkMidDate")) Then
                        chkMidDate.Checked = dr("chkMidDate")
                    End If


                    If Not IsDBNull(dr("chkMidDateClear")) Then
                        chkMidDateClear.Checked = dr("chkMidDateClear")
                    End If


                    If Not IsDBNull(dr("chkMidCalendar")) Then
                        chkMidCalendar.Checked = dr("chkMidCalendar")
                    End If

                    If Not IsDBNull(dr("chkFINAvail")) Then
                        chkFINAvail.Checked = dr("chkFINAvail")
                    End If

                    If Not IsDBNull(dr("chkFINLCLIP")) Then
                        chkFINLCLIP.Checked = dr("chkFINLCLIP")
                    End If

                    If Not IsDBNull(dr("chkFinDate")) Then
                        chkFinDate.Checked = dr("chkFinDate")
                    End If

                    If Not IsDBNull(dr("chkFinDateClear")) Then
                        chkFinDateClear.Checked = dr("chkFinDateClear")
                    End If

                    If Not IsDBNull(dr("chkFinCalendar")) Then
                        chkFinCalendar.Checked = dr("chkFinCalendar")
                    End If

                    If Not IsDBNull(dr("chkMidAvailR")) Then
                        chkMidAvailR.Checked = dr("chkMidAvailR")
                    End If
                    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                    If Not IsDBNull(dr("chkMIDRMTIPR")) Then
                        chkMIDRMTIPR.Checked = dr("chkMIDRMTIPR")
                    End If


                    If Not IsDBNull(dr("chkMidDateR")) Then
                        chkMidDateR.Checked = dr("chkMidDateR")
                    End If

                    If Not IsDBNull(dr("chkMidDateCleaRr")) Then
                        chkMidDateClearR.Checked = dr("chkMidDateCleaRr")
                    End If

                    If Not IsDBNull(dr("chkMidCalendarR")) Then
                        chkMidCalendarR.Checked = dr("chkMidCalendarR")
                    End If

                    If Not IsDBNull(dr("chkFINAvailR")) Then
                        chkFINAvailR.Checked = dr("chkFINAvailR")
                    End If

                    If Not IsDBNull(dr("chkFINRMTIPR")) Then
                        chkFINRMTIPR.Checked = dr("chkFINRMTIPR")
                    End If

                    If Not IsDBNull(dr("chkFinDateR")) Then
                        chkFinDateR.Checked = dr("chkFinDateR")
                    End If

                    If Not IsDBNull(dr("chkFinDateClearR")) Then
                        chkFinDateClearR.Checked = dr("chkFinDateClearR")
                    End If

                    If Not IsDBNull(dr("chkFinCalendarR")) Then
                        chkFinCalendarR.Checked = dr("chkFinCalendarR")
                    End If






            End While
            btnSave.Visible = False
            btnUpdate.Visible = True
        Else
            lblPageStatus.Text = "No data has been saved"
            btnSave.Visible = True
            btnUpdate.Visible = False
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        lblPageStatus.Text = "Data has been saved"
        btnUpdate.Visible = True
        btnSave.Visible = False
    End Sub

    Protected Sub SaveData(ByVal myID As String, ByVal mycourse As String)
        Dim strSQL As String = "INSERT INTO OL_AuditProctor "
        strSQL += "(Audit_ID,MasterName ) "

        strSQL += "VALUES ("

        strSQL += Session("Audit_ID") & ",'"
        strSQL += Session("MasterAuditName") & "')"


        Response.Write(strSQL & "  sAVEdATA<BR>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD....[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
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


    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Dim strSQL As String = "Update OL_AuditProctor Set "

        If chkMidAvail.Checked = True Then
            strSQL += "chkMidAvail=1,"
        Else
            strSQL += "chkMidAvail=0,"
        End If

        If chkMIDLCLIP.Checked = True Then
            strSQL += "chkMIDLCLIP=1,"
        Else
            strSQL += "chkMIDLCLIP=0,"
        End If


        If chkMidDate.Checked = True Then
            strSQL += "chkMidDate=1,"
        Else
            strSQL += "chkMidDate=0,"
        End If

        If chkMidDateClear.Checked = True Then
            strSQL += "chkMidDateClear=1,"
        Else
            strSQL += "chkMidDateClear=0,"
        End If

        If chkMidCalendar.Checked = True Then
            strSQL += "chkMidCalendar=1,"
        Else
            strSQL += "chkMidCalendar=0,"
        End If

        If chkFINAvail.Checked = True Then
            strSQL += "chkFINAvail=1,"
        Else
            strSQL += "chkFINAvail=0,"
        End If

        If chkFINLCLIP.Checked = True Then
            strSQL += "chkFINLCLIP=1,"
        Else
            strSQL += "chkFINLCLIP=0,"
        End If



        If chkFinDate.Checked = True Then
            strSQL += "chkFinDate=1,"
        Else
            strSQL += "chkFinDate=0,"
        End If


        If chkFinDateClear.Checked = True Then
            strSQL += "chkFinDateClear=1,"
        Else
            strSQL += "chkFinDateClear=0,"
        End If

        If chkFinCalendar.Checked = True Then
            strSQL += "chkFinCalendar=1,"
        Else
            strSQL += "chkFinCalendar=0,"
        End If
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If chkMidAvailR.Checked = True Then
            strSQL += "chkMidAvailR=1,"
        Else
            strSQL += "chkMidAvailR=0,"
        End If

        If chkMIDRMTIPR.Checked = True Then
            strSQL += "chkMIDRMTIPR=1,"
        Else
            strSQL += "chkMIDRMTIPR=0,"
        End If


        If chkMidDateR.Checked = True Then
            strSQL += "chkMidDateR=1,"
        Else
            strSQL += "chkMidDateR=0,"
        End If

        If chkMidDateClearR.Checked = True Then
            strSQL += "chkMidDateClearR=1,"
        Else
            strSQL += "chkMidDateClearR=0,"
        End If

        If chkMidCalendarR.Checked = True Then
            strSQL += "chkMidCalendarR=1,"
        Else
            strSQL += "chkMidCalendarR=0,"
        End If

        If chkFINAvailR.Checked = True Then
            strSQL += "chkFINAvailR=1,"
        Else
            strSQL += "chkFINAvailR=0,"
        End If

        If chkFINRMTIPR.Checked = True Then
            strSQL += "chkFINRMTIPR=1,"
        Else
            strSQL += "chkFINRMTIPR=0,"
        End If



        If chkFinDateR.Checked = True Then
            strSQL += "chkFinDateR=1,"
        Else
            strSQL += "chkFinDateR=0,"
        End If


        If chkFinDateClearR.Checked = True Then
            strSQL += "chkFinDateClearR=1,"
        Else
            strSQL += "chkFinDateClearR=0,"
        End If

        If chkFinCalendarR.Checked = True Then
            strSQL += "chkFinCalendarR=1,"
        Else
            strSQL += "chkFinCalendarR=0,"
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        strSQL += "DateEntered ='" & DateTime.Now() & "'"



        strSQL += " Where Audit_ID=" & Session("Audit_ID")


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
            Response.Write("Fail uodate data")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try

        Response.Redirect("asProctoredExam.aspx")
    End Sub

End Class