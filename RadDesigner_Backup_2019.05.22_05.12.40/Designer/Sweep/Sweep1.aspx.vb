Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class Sweep1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Response.Write(doesSweepDetailsExist(Session("Sweep_ID")))
            getSweep(Session("Sweep_ID"))
            getSweepDetails(Session("Sweep_ID"))
            If Request("Update") = "1" Then
                lblUpdate.Text = "Updated::" & Now
                lblUpdate.Visible = True
            ElseIf Request("Update") = "x" Then
                lblUpdate.Text = "Cannot create new sweep details record."
                lblUpdate.Visible = True
            End If
        Else

        End If
    End Sub

    Protected Function doesSweepDetailsExist(ByVal mysweepID As Integer) As Boolean
        'check to see if this master exists in the VC_VCdata BBMasterCourse table  NOTE this is not the VC_VCdata1 db -- connectionstring points to db
        Dim mysetup As Boolean = False
        Dim mySQL As String = "Select * from OL_SweepDetails where Sweep_ID=" & mysweepID
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mySQL, myConnection)
        'Response.Write(mySQL & "<br>")
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

    Public Sub getSweep(ByVal myUserID As Integer)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "SELECT MasterName,SweepStatus  FROM OL_MasterSweep where Sweep_ID=" & myUserID
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                lblMasterCourse.Text = dr("MasterName")
                Session("SweepMasterName") = dr("MasterName")
                lblSweepStatus.Text = dr("SweepStatus")

                If dr("SweepStatus") = "3-NotStarted" Or doesSweepDetailsExist(Session("Sweep_ID")) = False Then
                    'added the doessweepdetilexist to compensate for Althea;s inability to show save button if sweep marked 2-inProgress
                    btnStart.Visible = True
                    btnUpdate.Visible = False
                Else
                    btnStart.Visible = False
                    btnUpdate.Visible = True
                    lblContinue.Visible = True
                End If

                getAuditMaster(dr("MasterName"))

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub


    Public Sub getSweepDetails(ByVal myUserID As Integer)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "SELECT chkTextbook,chkGradebook,chkExam,Page1Done  FROM OL_SweepDetails where Sweep_ID=" & myUserID
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                chkTextbook.Checked = dr("chkTextbook")
                chkGradebook.Checked = dr("chkGradebook")
                chkExam.Checked = dr("chkExam")


            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub

    Public Sub getAuditMaster(ByVal myUserID As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "SELECT Auditor,AuditStatus  FROM OL_MasterAudit where MasterName='" & myUserID & "'"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                lblAuditor.Text = dr("Auditor")
                lblAuditStatus.Text = dr("AuditStatus")


            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub

    Protected Sub btnStart_Click(sender As Object, e As EventArgs) Handles btnStart.Click
        If doesSweepDetailsExist(Session("Sweep_ID")) = False Then
            savepage1()
        Else
            Response.Redirect("Sweep1.aspx?Update=x")
        End If

    End Sub

    Protected Sub savepage1()
        If chkTextbook.Checked = False Or chkExam.Checked = False Or chkGradebook.Checked = False Then
            lblWarn.Visible = True
            Exit Sub
        End If
        Dim strSQL As String = "INSERT INTO OL_SweepDetails "
        strSQL += "(Sweep_ID,MasterName,Designer_ID,Designer,chkTextbook,chkGradebook,chkExam,Page1Done) "

        strSQL += "VALUES ("

        strSQL += Session("Sweep_ID") & ",'"
        strSQL += Session("SweepMasterName") & "',"
        strSQL += Session("User_ID") & ",'"
        strSQL += Session("UserName") & "',"

        If chkTextbook.Checked = True Then

            strSQL += "1,"
        Else
            strSQL += "0,"
        End If

        If chkGradebook.Checked = True Then

            strSQL += "1,"
        Else
            strSQL += "0,"
        End If

        If chkExam.Checked = True Then

            strSQL += "1,"
        Else
            strSQL += "0,"
        End If
        strSQL += "1)"

        Response.Write(strSQL)




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
            Response.Write("<br>FAIL<br>")


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try
        StartSweep(Session("SweepMasterName"))
        Response.Redirect("Sweep1.aspx?Update=1")
    End Sub


    Public Sub StartSweep(ByVal myMaster As String)

        Dim strSQL As String = "Update OL_MasterSweep set"
        strSQL += " SweepStatus='2-InProgress', "
        strSQL += " SweepStart='" & DateTime.Now.ToShortDateString & "'"
        strSQL += " Where MasterName = '" & myMaster & "'"


        ' Response.Write(strSQL & "<br>")


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


    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click

        Dim strSQL As String = "Update OL_SweepDetails set"

        If chkTextbook.Checked = True Then

            strSQL += " chkTextbook= 1,"
        Else
            strSQL += " chkTextbook= 0,"
        End If

        If chkGradebook.Checked = True Then

            strSQL += " chkGradebook= 1,"
        Else
            strSQL += " chkGradebook= 0,"
        End If

        If chkExam.Checked = True Then

            strSQL += " chkExam= 1"
        Else
            strSQL += " chkExam= 0"
        End If
        strSQL += " Where MasterName = '" & Session("SweepMasterName") & "'"

        Response.Write(strSQL)


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







        Response.Redirect("Sweep1.aspx?update=1")



    End Sub
End Class