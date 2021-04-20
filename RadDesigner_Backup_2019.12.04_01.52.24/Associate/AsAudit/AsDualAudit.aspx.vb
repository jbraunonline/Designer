Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AsDualAudit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Session("Audit_ID") = "999"
        Response.Write(Request("action"))
        'ession("MasterAuditName") = "2195_AMH2010_MC_VC"
        lblAuditMasterName.Text = Session("MasterAuditName")
        lblMaster.Text = "Audit for " & Session("MasterAuditName")
        If Not Page.IsPostBack Then
            'lblAuditStatusExists.Text = DoesAuditStatusExist(Session("Audit_ID"))
            'DIV B ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
            getData(Session("Audit_ID"))







        End If
        If Session("Role") = 2 Then
            btnReturn.Visible = True
        End If
    End Sub
    Protected Sub getData(ByVal myID As Integer)


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String
        strsql = "Select  AuditNotes from OL_MasterAudit Where Audit_ID=" & myID

        'Response.Write(strsql)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()

                If Not IsDBNull(dr("AuditNotes")) Then
                    RadEditor1.Content = dr("AuditNotes")
                Else
                    RadEditor1.Content = ""
                End If


            End While

        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        SaveNotes()
    End Sub


    Protected Sub SaveNotes()
        Dim mycolor As String = ""
        If Session("Role") = "1" Then
            mycolor = "<font color=red>"
        Else
            mycolor = "<font color=blue>"
        End If


        Dim mycontent As String = "<br>" & mycolor & "*******" & Now.ToShortDateString & " -- " & Session("Name") & "</font><br>" & RadEditor1.Content
        mycontent = Replace(mycontent, "'", "''")
        Dim strSQL As String = "Update OL_MasterAudit "

        strSQL += "Set AuditNotes='" & mycontent & "'  where Audit_ID =" & Session("Audit_ID")

        'Response.Write(strSQL)



        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD.[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[.......................................................................
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
        ' Response.Redirect("SideSide.aspx?action=DataUpdated")
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    End Sub

    Protected Sub brnAjax_Click(sender As Object, e As EventArgs) Handles brnAjax.Click
        SaveNotes()
        getData(Session("Audit_ID"))
    End Sub

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs) Handles btnReturn.Click

        Response.Redirect("ASAuditProgress.aspx")

    End Sub
End Class