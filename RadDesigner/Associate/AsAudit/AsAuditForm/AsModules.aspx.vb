Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AsModules
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("MasterAuditName") = "" Then
            Response.Write("<b><font color=red>Your Session has expired. Please log in again! </font></b>")
            Response.End()
        End If
        If Not Page.IsPostBack Then
            getData()
            Dim mystatus As String = GetStatus(Session("Audit_ID"))
            lblMasterStatus.Text = mystatus



            If Request("status") = "update" Then
                lblUpdate.Visible = True
                lblUpdate.Text = " Updated: " & Now
            End If

        End If
    End Sub


    Protected Function GetStatus(ByVal myID As String) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myreturn As String = ""
        Dim strsql As String
        strsql = "SELECT AuditStatus FROM OL_MasterAudit Where Audit_ID =" & myID

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

    Protected Sub getData()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  * from OL_AuditModules Where Audit_ID=" & Session("Audit_ID")

        Response.Write(strsql)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("DateEntered")) Then

                    lblPageStatus.Text = "This data was saved on  " & dr("DateEntered")
                    chkAssessPreview.Checked = dr("chkAssessPreview")
                    chkAssessNewWindow.Checked = dr("chkAssessNewWindow")
                    chkAssessAvail.Checked = dr("chkAssessAvail")
                    chkAllVideos.Checked = dr("chkAllVideos")
                    chkAllImages.Checked = dr("chkAllImages")
                    chkAllLinks.Checked = dr("chkAllLinks")
                    RadEditor1.Content = dr("ModuleProblems")
                    btnSave.Visible = False
                    btnUpdate.Visible = True
                Else

                End If


            End While
        Else
            lblPageStatus.Text = "No data has been saved"
            Dim thestatus As String = GetStatus(Session("Audit_ID"))


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





    Protected Sub SaveData()
        Dim strSQL As String = "INSERT INTO OL_AuditModules"
        strSQL += "(Audit_ID,MasterName,DateEntered,chkAssessPreview,chkAssessNewWindow,chkAssessAvail,chkAllVideos,chkAllImages,chkAllLinks,ModuleProblems) "

        strSQL += "VALUES ("

        strSQL += Session("Audit_ID") & ",'"
        strSQL += Session("MasterAuditName") & "','"
        strSQL += DateTime.Now & "',"

        If chkAssessPreview.Checked = True Then
            strSQL += "1,"
        Else
            strSQL += "0,"
        End If

        If chkAssessNewWindow.Checked = True Then
            strSQL += "1,"
        Else
            strSQL += "0,"
        End If

        If chkAssessAvail.Checked = True Then
            strSQL += "1,"
        Else
            strSQL += "0,"
        End If

        If chkAllVideos.Checked = True Then
            strSQL += "1,"
        Else
            strSQL += "0,"
        End If

        If chkAllImages.Checked = True Then
            strSQL += "1,"
        Else
            strSQL += "0,"
        End If

        If chkAllLinks.Checked = True Then
            strSQL += "1,'"
        Else
            strSQL += "0,'"
        End If


        strSQL += Replace(RadEditor1.Content, "'", "") & "')"
        'Response.Write(strSQL)

        'Response.End()

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ''Execute the command in a try/catch to catch duplicate username errors'
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

    Protected Sub UpdateData()

        Dim strSQL As String = "Update OL_AuditModules Set "

        strSQL += "DateEntered = '" & DateTime.Now() & "',"

        If chkAssessPreview.Checked = True Then
            strSQL += "chkAssessPreview=1,"
        Else
            strSQL += "chkAssessPreview=0,"
        End If

        If chkAssessNewWindow.Checked = True Then
            strSQL += "chkAssessNewWindow=1,"
        Else
            strSQL += "chkAssessNewWindow=0,"
        End If

        If chkAssessAvail.Checked = True Then
            strSQL += "chkAssessAvail=1,"
        Else
            strSQL += "chkAssessAvail=0,"
        End If

        If chkAllVideos.Checked = True Then
            strSQL += "chkAllVideos=1,"
        Else
            strSQL += "chkAllVideos=0,"
        End If

        If chkAllImages.Checked = True Then
            strSQL += "chkAllImages=1,"
        Else
            strSQL += "chkAllImages=0,"
        End If

        If chkAllLinks.Checked = True Then
            strSQL += "chkAllLinks=1,"
        Else
            strSQL += "chkAllLinks=0,"
        End If

        strSQL += "ModuleProblems = '" & Replace(RadEditor1.Content, "'", "") & "'"
        strSQL += " Where Audit_ID =" & Session("Audit_ID")

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

        '
    End Sub



    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        SaveData()
        Response.Redirect("AsModules.aspx")
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        UpdateData()
        Response.Redirect("AsModules.aspx?status=update")
    End Sub
End Class