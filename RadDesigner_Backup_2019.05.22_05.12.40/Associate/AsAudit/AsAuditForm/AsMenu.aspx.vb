Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AsMenu
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("MasterAuditName") = "" Then
                Response.Write("<b><font color=red>Your Session has expired. Please log in again! </font></b>")
                Response.End()
            End If
            getData()
            'getstatus checks masteraudit
            Dim mystatus As String = GetStatus(Session("MasterAuditName"))
            lblMasterStatus.Text = mystatus
            litHeaders.Text = "    <a href='help/popup.aspx?ID=Headers' onclick=""centeredPopup(this.href,'myWindow','950','860','yes');return false""> <img src='help/helpicon.png' alt='Smiley face' height='15' width='15'> </a>"
            litSetup.Text = " <a href='help/popup.aspx?ID=Setup' onclick=""centeredPopup(this.href,'myWindow','950','860','yes');return false""> <img src='help/helpicon.png' alt='Smiley face' height='15' width='15'> </a>"
            litCalendar.Text = "<a href='help/popup.aspx?ID=Calendar' onclick=""centeredPopup(this.href,'myWindow','950','860','yes');return false""> <img src='help/helpicon.png' alt='Smiley face' height='15' width='15'> </a>"


        Else

        End If
    End Sub


    Protected Sub chkOtherHeaders_CheckedChanged(sender As Object, e As EventArgs) Handles chkOtherHeaders.CheckedChanged
        If chkOtherHeaders.Checked = True Then
            txtOtherHeader.Visible = True
        Else
            txtOtherHeader.Visible = False

        End If
    End Sub

    Protected Sub getData()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  * from OL_AuditMenu Where Audit_ID='" & Session("Audit_ID") & "'"

        'response.Write(strsql)

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
                chkCourseInfo.Checked = dr("ckCourseInfo")
                chkContent.Checked = dr("chkContent")
                chkToolsResources.Checked = dr("chkToolsResources")
                chkOtherHeaders.Checked = dr("chkOtherHeaders")
                txtOtherHeader.Visible = dr("chkOtherHeaders")
                txtOtherHeader.Text = dr("txtOtherHeader")
                chkSetupGuide.Checked = dr("chkSetupGuide")
                chkCalendar.Checked = dr("chkCalendar")
                chkCourseMessage.Checked = dr("chkCourseMessage")
                chkQAForum.Checked = dr("chkQAForum")
                chkBBResources.Checked = dr("chkBBResources")
                chkMygrades.Checked = dr("chkMygrades")
                chkMDCResources.Checked = dr("chkMDCResources")
                chkCheckActivity.Checked = dr("chkCheckActivity")
                chkOtherMenu.Checked = dr("chkOtherMenu")
                txtOtherMainMenu.Visible = dr("chkOtherMenu")
                txtOtherMainMenu.Text = dr("txtOtherMainMenu")
                chkSyllabusStd.Checked = dr("chkSyllabusStd")
                chkSyllabusAlign.Checked = dr("chkSyllabusAlign")
                chkMenuGuide.Checked = dr("chkMenuGuide")
                chkIntroVC.Checked = dr("chkIntroVC")
                chkStudOrient.Checked = dr("chkStudOrient")
                chkProcAssignMenu.Checked = dr("chkProcAssignMenu")
                chkProcScript.Checked = dr("chkProcScript")
                chkProcExam.Checked = dr("chkProcExam")



            End While
        Else
            lblPageStatus.Text = "No data has been saved"
            Dim thestatus As String = GetStatus(Session("MasterAuditName"))

            Select Case thestatus
                Case "1-Complete"
                    btnSave.Visible = True
                Case "2-InProgress"
                    btnSave.Visible = True
                Case "3-NotStarted"
                    btnSave.Visible = False
                    btnUpdate.Visible = False
                Case "9-Problems"
                    btnSave.Visible = True
                Case Else
            End Select

        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub




    Protected Sub chkOtherMenu_CheckedChanged(sender As Object, e As EventArgs) Handles chkOtherMenu.CheckedChanged
        If chkOtherMenu.Checked = True Then
            txtOtherMainMenu.Visible = True
        Else
            txtOtherMainMenu.Visible = False
        End If
    End Sub

    Function GetStatus(ByVal myID As String) As String
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

                myreturn = dr("AuditStatus")
            End While
        End If
        Return myreturn
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Function

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        SaveData()
        Response.Redirect("AsMenu.aspx?Status=Save")
    End Sub

    Protected Sub SaveData()
        Dim strSQL As String = "INSERT INTO OL_AuditMenu "
        strSQL += "(Audit_ID,MasterName,DateEntered,ckCourseInfo,chkContent,chkToolsResources,chkOtherHeaders,txtOtherHeader,chkSetupGuide,chkCalendar,chkCourseMessage,chkQAForum,chkBBResources,chkMygrades,chkMDCResources,chkCheckActivity,chkOtherMenu,txtOtherMainMenu,chkSyllabusStd,chkSyllabusAlign,chkMenuGuide,chkIntroVC,chkStudOrient,chkProcAssignMenu,chkProcScript,chkProcExam) "

        strSQL += "VALUES ("

        strSQL += Session("Audit_ID") & ",'"
        strSQL += Session("MasterAuditName") & "','"
        strSQL += DateTime.Now & "',"

        Dim X As Integer = 0
        If chkCourseInfo.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkContent.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkToolsResources.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkOtherHeaders.Checked = True Then
            X = 1
        End If
        strSQL += X & ",'"


        strSQL += txtOtherHeader.Text & "',"

        X = 0
        If chkSetupGuide.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkCalendar.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkCourseMessage.Checked = True Then
            X = 1
        End If
        strSQL += X & ","
        X = 0
        If chkQAForum.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkBBResources.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkMygrades.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkMDCResources.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkCheckActivity.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkOtherMenu.Checked = True Then
            X = 1
        End If
        strSQL += X & ",'"

        strSQL += txtOtherMainMenu.Text & "',"

        X = 0
        If chkSyllabusStd.Checked = True Then
            X = 1
        End If
        strSQL += X & ","


        X = 0
        If chkSyllabusAlign.Checked = True Then
            X = 1
        End If
        strSQL += X & ","


        X = 0
        If chkMenuGuide.Checked = True Then
            X = 1
        End If
        strSQL += X & ","


        X = 0
        If chkIntroVC.Checked = True Then
            X = 1
        End If
        strSQL += X & ","


        X = 0
        If chkStudOrient.Checked = True Then
            X = 1
        End If
        strSQL += X & ","

        X = 0
        If chkProcAssignMenu.Checked = True Then
            X = 1
        End If
        strSQL += X & ","


        X = 0
        If chkProcScript.Checked = True Then
            X = 1
        End If
        strSQL += X & ","


        X = 0
        If chkProcExam.Checked = True Then
            X = 1
        End If
        strSQL += X & ")"

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

    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click

        Dim strSQL As String = "Update OL_AuditMenu Set "

        If chkCourseInfo.Checked = True Then
            strSQL += "ckCourseInfo=1,"
        Else
            strSQL += "ckCourseInfo=0,"
        End If

        If chkContent.Checked = True Then
            strSQL += "chkContent=1,"
        Else
            strSQL += "chkContent=0,"
        End If
        If chkToolsResources.Checked = True Then
            strSQL += "chkToolsResources=1,"
        Else
            strSQL += "chkToolsResources=0,"
        End If

        If chkOtherHeaders.Checked = True Then
            strSQL += "chkOtherHeaders=1,"
        Else
            strSQL += "chkOtherHeaders=0,"
        End If

        strSQL += "txtOtherHeader ='" & txtOtherHeader.Text & "',"

        If chkSetupGuide.Checked = True Then
            strSQL += "chkSetupGuide=1,"
        Else
            strSQL += "chkSetupGuide=0,"
        End If

        If chkCalendar.Checked = True Then
            strSQL += "chkCalendar=1,"
        Else
            strSQL += "chkCalendar=0,"
        End If

        If chkCourseMessage.Checked = True Then
            strSQL += "chkCourseMessage=1,"
        Else
            strSQL += "chkCourseMessage=0,"
        End If

        If chkQAForum.Checked = True Then
            strSQL += "chkQAForum=1,"
        Else
            strSQL += "chkQAForum=0,"
        End If

        If chkBBResources.Checked = True Then
            strSQL += "chkBBResources=1,"
        Else
            strSQL += "chkBBResources=0,"
        End If

        If chkMygrades.Checked = True Then
            strSQL += "chkMygrades=1,"
        Else
            strSQL += "chkMygrades=0,"
        End If


        If chkMDCResources.Checked = True Then
            strSQL += "chkMDCResources=1,"
        Else
            strSQL += "chkMDCResources=0,"
        End If

        If chkCheckActivity.Checked = True Then
            strSQL += "chkCheckActivity=1,"
        Else
            strSQL += "chkCheckActivity=0,"
        End If

        If chkOtherMenu.Checked = True Then
            strSQL += "chkOtherMenu=1,"
        Else
            strSQL += "chkOtherMenu=0,"
        End If

        strSQL += "txtOtherMainMenu ='" & txtOtherMainMenu.Text & "',"

        If chkSyllabusStd.Checked = True Then
            strSQL += "chkSyllabusStd=1,"
        Else
            strSQL += "chkSyllabusStd=0,"
        End If

        If chkSyllabusAlign.Checked = True Then
            strSQL += "chkSyllabusAlign=1,"
        Else
            strSQL += "chkSyllabusAlign=0,"
        End If

        If chkMenuGuide.Checked = True Then
            strSQL += "chkMenuGuide=1,"
        Else
            strSQL += "chkMenuGuide=0,"
        End If



        If chkIntroVC.Checked = True Then
            strSQL += "chkIntroVC=1,"
        Else
            strSQL += "chkIntroVC=0,"
        End If

        If chkStudOrient.Checked = True Then
            strSQL += "chkStudOrient=1,"
        Else
            strSQL += "chkStudOrient=0,"
        End If

        If chkProcAssignMenu.Checked = True Then
            strSQL += "chkProcAssignMenu=1,"
        Else
            strSQL += "chkProcAssignMenu=0,"
        End If

        If chkProcScript.Checked = True Then
            strSQL += "chkProcScript=1,"
        Else
            strSQL += "chkProcScript=0,"
        End If

        If chkProcExam.Checked = True Then
            strSQL += "chkProcExam=1,"
        Else
            strSQL += "chkProcExam=0,"
        End If

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
            Response.Write("Fail")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try
        Response.Redirect("AsMenu.aspx")
        '
    End Sub
End Class