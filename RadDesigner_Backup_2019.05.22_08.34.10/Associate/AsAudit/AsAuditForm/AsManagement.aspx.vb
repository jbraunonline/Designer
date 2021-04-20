Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AsManagement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("MasterAuditName") = "" Then
            Response.Write("<b><font color=red>Your Session has expired. Please log in again! </font></b>")
            Response.End()
        End If

        If Not Page.IsPostBack Then

            Dim mystatus As String = GetStatus(Session("MasterAuditName"))
            lblMasterStatus.Text = mystatus

            getData()
            If Request("status") = "update" Then
                lblUpdate.Visible = True
                lblUpdate.Text = "Updated " & Now
            End If
        End If


    End Sub
    Protected Sub getData()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  * from OL_Auditmanagement Where Audit_ID=" & Session("Audit_ID")

        'Response.Write(strsql)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("DateEntered")) Then

                    lblPageStatus.Text = "This data was saved on  " & dr("DateEntered")
                End If
                If Not IsDBNull(dr("txtSize")) Then
                    txtSize.Text = dr("txtSize")
                End If

                If Not IsDBNull(dr("chkSpaces")) Then
                    chkSpaces.Checked = dr("chkSpaces")
                End If

                If Not IsDBNull(dr("txtDateManager")) Then
                    txtDateManager.Content = dr("txtDateManager")
                End If

                btnSave.Visible = False
                btnUpdate.Visible = True


            End While
        Else
            lblPageStatus.Text = "No data has been saved"

            Dim mystatus As String
            mystatus = lblMasterStatus.Text
            Select Case mystatus
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

    Protected Function GetStatus(ByVal myID As String) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myreturn As String = ""
        Dim strsql As String
        strsql = "SELECT AuditStatus FROM OL_MasterAudit Where MasterName= '" & myID & "'"

        Dim myCommand As New SqlCommand(strsql, myConnection)

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

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        SaveData()
        Response.Redirect("AsManagement.aspx")
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        UpdateData()
        Response.Redirect("AsManagement.aspx?status=update")
    End Sub

    Protected Sub SaveData()
        Dim strSQL As String = "INSERT INTO OL_AuditManagement "
        strSQL += "(Audit_ID, MasterName, DateEntered, txtSize, chkSpaces, txtDateManager) "

        strSQL += "VALUES ("

        strSQL += Session("Audit_ID") & ",'"
        strSQL += Session("MasterAuditName") & "','"
        strSQL += DateTime.Now & "','"
        strSQL += txtSize.Text & "',"

        If chkSpaces.Checked = True Then
            strSQL += "1,'"
        Else
            strSQL += "0,'"
        End If

        strSQL += Replace(txtDateManager.Content, "'", "") & "')"
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
            Response.Write("<br>FAIL<br>")


        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try

    End Sub

    Protected Sub UpdateData()

        Dim strSQL As String = "Update OL_AuditManagement Set "

        strSQL += "DateEntered = '" & DateTime.Now() & "',"
        strSQL += "txtSize = '" & txtSize.Text & "',"

        If chkSpaces.Checked = True Then
            strSQL += "chkSpaces=1,"
        Else
            strSQL += "chkSpaces=0,"
        End If

        strSQL += "txtDateManager = '" & Replace(txtDateManager.Content, "'", "") & "'"
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

    Protected Sub btnPreview_Click(sender As Object, e As EventArgs) Handles btnPreview.Click
        lblPreview.Text = txtDateManager.Content
    End Sub
End Class