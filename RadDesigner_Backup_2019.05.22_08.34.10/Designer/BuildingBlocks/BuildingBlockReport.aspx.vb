Imports System
Imports System.Collections.Generic
Imports System.Net.Mime.MediaTypeNames
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.IO
Imports Telerik.Web.UI.Skins

Public Class BuildingBlockReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            GetPublishers()
        End If
        lblPageTitle.Text = "Building Blocks for " & Session("MasterCourse")
        lblStatus.Text = getworkflow(Session("MasterCourse"), Session("NextTerm"), "BBlock")
        If lblStatus.Text <> "Verified" Then
            btnVerify.Visible = True
        End If
    End Sub

    Function getworkflow(ByVal mycourse As String, ByVal myTerm As Integer, myItem As String) As String
        Dim myreturn As String = "Not Verified"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT " & myItem & " FROM OL_Progress where MasterName= '" & mycourse & "' And Term =" & myTerm
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If dr("BBlock") = True Then
                    myreturn = "Verified"
                End If

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()


        Return myreturn
    End Function
    Sub updateProgress(ByVal mycourse As String, ByVal myTerm As Integer, myitem As String)
        Dim mysql As String = " Update OL_Progress SET "
        mysql += myitem & "=" & 1 & " where MasterName= '" & mycourse & "' And Term =" & myTerm

        'Response.Write(mysql & "<br>")


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
            Response.Write("Fail")
        Finally
            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try
        Response.Redirect("BuildingBlockReport.aspx")

    End Sub

    Protected Sub GetPublishers()

        Dim strSQL As String = "Select  Pub_ID, Publisher From OL_BBlock_Publisher Order By Publisher"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)


        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        DropDownList1.DataSource = dr
        DropDownList1.DataBind()
        DropDownList1.Items.Insert(0, "<-- Select a Publisher -->")
        myConnection.Close()



    End Sub






    Protected Sub GetArray(ByVal myMastername As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "Select BBObjArray  From OL_BBlock_Data Where  MasterName ='" & myMastername & "'"
        'Response.Write(strsql)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()
        If dr.HasRows Then
            While dr.Read()
                'lblMyArray1.Text = dr("BBObjArray")
            End While
        Else
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        'Response.Write(DropDownList1.SelectedValue)
        Response.Redirect("BuildingBlockDetails.aspx?Pub_ID=" & DropDownList1.SelectedValue.ToString)
    End Sub

    Protected Sub btnVerify_Click(sender As Object, e As EventArgs) Handles btnVerify.Click
        updateProgress(Session("MasterCourse"), Session("NextTerm"), "BBlock")
    End Sub
End Class