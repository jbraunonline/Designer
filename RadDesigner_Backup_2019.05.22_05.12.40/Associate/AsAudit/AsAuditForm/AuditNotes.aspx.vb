Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AuditNotes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write(Request("action"))
        lblAuditMasterName.Text = Session("MasterAuditName")
        If Not Page.IsPostBack Then
            'lblAuditStatusExists.Text = DoesAuditStatusExist(Session("Audit_ID"))

            getData(Session("Audit_ID"))
        End If
    End Sub


    Protected Function DoesAuditStatusExist(ByVal myID As Integer) As Boolean
        'check to see if this master exists in the VC_VCdata BBMasterCourse table  NOTE this is not the VC_VCdata1 db -- connectionstring points to db
        Dim mysetup As Boolean = False
        Dim mySQL As String = "Select * from OL_AuditStatus where Audit_ID=" & myID
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mySQL, myConnection)
        Response.Write(mySQL & "<br>")
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
        Response.Redirect("AuditNotes.aspx")
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
        savenotes()
    End Sub


    Protected Sub SaveNotes()
        Dim mycolor As String = ""
        If Session("Role") = "1" Then
            mycolor = "<font color=red>"
        Else
            mycolor = "<font color=blue>"
        End If


        Dim mycontent As String = mycolor & "*******" & Now.ToShortDateString & " -- " & Session("Name") & "</font><br>" & Replace(RadEditor1.Content, "'", "")

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
        Response.Redirect("AuditNotes.aspx?action=DataUpdated")
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    End Sub


End Class