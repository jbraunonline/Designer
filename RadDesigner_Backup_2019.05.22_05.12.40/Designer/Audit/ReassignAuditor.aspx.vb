﻿Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Public Class ReassignAuditor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Then
            Response.Write("<b><font color=red>Your Session has expired. Please log in again! </font></b>")
            btnReturn.Visible = True
            Response.End()
        End If
        If Not Page.IsPostBack Then
            If Request("Action") = "Delete" Then
                Response.Write("<b><font color=red>The record has been deleted.</font></b>")

            Else
                getData()
                BindAuditors()
            End If
            If candelete(Request("ID")) = "Not Found" Then
                Button2.Visible = True
            End If
        End If
    End Sub
    Protected Sub getData()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  MasterName, Auditor, AuditStatus from OL_MasterAudit Where Audit_ID=" & Request("ID")

        'Response.Write(strsql)
        ' Response.End()
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        While dr.Read

            lblMasterCourse.Text = dr("MasterName")
            lblAuditor.Text = dr("Auditor")

            If dr("AuditStatus") = "3-NotStarted" Then
                btnSwitch.Visible = True
            Else
                Label1.Text = "This audit is in progress and the auditor cannot be changed."
                Label1.Visible = True

            End If

        End While




        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Protected Sub BindAuditors()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select User_ID, FirstName + ' ' + Lastname as Abbr from OL_Users Where Role=2"

        'Response.Write(strsql)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then

            DropDownList1.DataSource = dr
            DropDownList1.DataBind()
            DropDownList1.Items.Insert(0, "-- Select an Auditor --")


        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Protected Sub UpdateData()

        Dim strSQL As String = "Update OL_MasterAudit Set "

        strSQL += "Auditor = '" & DropDownList1.SelectedItem.ToString & "',"
        strSQL += " Auditor_ID = " & DropDownList1.SelectedValue.ToString
        strSQL += " Where Audit_ID =" & Request("ID")

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
            Response.Write("<b><font color=red>Failed to update.</font></b>")
        Finally
            Label1.Visible = True

            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try

        '
    End Sub
    Function candelete(ByVal myID As Integer) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myreturn As String = "Not Found"
        Dim strsql As String
        strsql = "SELECT AuditStart FROM OL_masteraudit Where Audit_ID=" & myID
        'Response.Write(strsql)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("AuditStart")) Then
                    myreturn = "OK"
                End If
            End While

        End If
        Return myreturn
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function






    Protected Sub btnSwitch_Click(sender As Object, e As EventArgs) Handles btnSwitch.Click
        'Response.Write(DropDownList1.SelectedItem.ToString & "<Br>")
        'Response.Write(DropDownList1.SelectedValue.ToString & "<Br>")
        UpdateData()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("AuditProgress.aspx")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        btnDelete.Visible = True

    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click

        Dim strSQL As String = "Delete OL_MasterAudit  "

        strSQL += " Where Audit_ID =" & Request("ID")

        Response.Write(strSQL & "<br>")
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
            Response.Write("<b><font color=red>Failed to update.</font></b>")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try
        Response.Redirect("AuditProgress.aspx")

    End Sub
End Class