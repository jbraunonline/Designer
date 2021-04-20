Imports System
Imports System.Collections.Generic
Imports System.Net.Mime.MediaTypeNames
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.IO

Imports Telerik.Web.UI.Skins

Public Class showmac
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("Pub_ID") = "" Then
            Session("Pub_ID") = 1
        Else
            Session("Pub_ID") = Request.QueryString("Pub_ID")
            lblPubID.Text = Request.QueryString("Pub_ID")
            'Response.Write("pubid=" & Session("Pub_ID"))
        End If
        Session("MasterName") = "2193_AMH2010_MC_VC"
        Session("NextTerm") = "2193"
        If Not Page.IsPostBack Then
            LoadArray(Session("Pub_ID"), Session("MasterName"))
            lblPublisher.Text = "<font color-red>" & GetPublisher(Session("Pub_ID")) & "</font> Building Blocks in " & Session("MasterName")
            LoadListBox2(lblMyArray1.Text)
            LoadListBox1(lblMyArray1.Text)
        End If



    End Sub
    Protected Function GetPublisher(ByVal myID As String) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = ""
        Dim strsql As String
        strsql = "SELECT Publisher FROM OL_BBlock_Publisher where Pub_ID=" & myID
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("Publisher")
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function


    Protected Sub LoadListBox1(ByVal Myarray As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "Select Obj_ID, BBName  From OL_BBlock_Objects WHere Pub_ID =" & lblPubID.Text & "  and Obj_ID  Not In (" & Myarray & ")"

        lblTxt1.Text = strsql
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()
        If dr.HasRows Then
            RadListBox1.DataSource = dr
            RadListBox1.DataBind()
        Else
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub



    Protected Sub LoadListBox2(ByVal Myarray As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "Select Obj_ID, BBName  From OL_BBlock_Objects Where Pub_ID =" & lblPubID.Text & "  and Obj_ID  In (" & Myarray & ")"
        lblTxt2.Text = strsql
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()
        If dr.HasRows Then
            RadListBox2.DataSource = dr
            RadListBox2.DataBind()

        Else

        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub





    Protected Sub LoadArray(ByVal myPubID As String, ByVal myMastername As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "Select Obj_ID  From OL_BBlock_Data Where Pub_ID=" & myPubID & " And MasterName ='" & myMastername & "'"
        'Response.Write(strsql & "=getarraay<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()
        Dim myarray As String = ""
        If dr.HasRows Then
            While dr.Read()
                myarray += CStr(dr("Obj_ID")) & ","
            End While
            myarray = myarray.Substring(0, myarray.Length - 1)

        Else
            myarray = "0"
        End If
        lblMyArray1.Text = myarray
        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Private Sub SaveCheckedItems(ByVal listBox As Telerik.Web.UI.RadListBox)
        Dim sb As New StringBuilder()
        Dim collection As IList(Of RadListBoxItem) = listBox.Items
        For Each item As RadListBoxItem In collection
            Response.Write(Session("Mastername") & "," & CInt(Session("Pub_ID")) & "," & item.Value)
            Response.Write("<br>")
            SaveObjData(item.Value)
        Next



    End Sub



    Private Sub ShowCheckedItems(ByVal listBox As Telerik.Web.UI.RadListBox)
        Dim sb As New StringBuilder()
        Dim collection As IList(Of RadListBoxItem) = listBox.Items
        For Each item As RadListBoxItem In collection
            sb.Append(item.Value + ",")
        Next
        Dim myreturn As String = sb.ToString()
        txtValues.Text = myreturn.Substring(0, myreturn.Length - 1)


    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'ShowCheckedItems(RadListBox2, itemsClientSide)
        DeleteObjects(Session("MasterName"), Session("Pub_ID"))
        SaveCheckedItems(RadListBox2)
        Response.Redirect("BBlockReport.aspx")
    End Sub

    Protected Sub DeleteObjects(ByVal mymastername As String, ByVal myPubID As Integer)
        Dim strSQL As String = "Delete From OL_BBlock_data Where Pub_ID = " & myPubID & " and MasterName='" & mymastername & "'"
        Response.Write(strSQL)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '
        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            'HOLD SQL HOLD.{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{.......................................................................
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


    Private Sub SaveObjData(myObjID As String)
        Dim strSQL As String = "INSERT INTO OL_BBlock_Data "
        strSQL += "(Pub_ID,MasterName,Term,Obj_ID) "
        strSQL += "VALUES ("
        strSQL += Session("Pub_ID") & ",'"
        strSQL += Session("MasterName") & "','"
        strSQL += Session("NextTerm") & "',"
        strSQL += myObjID & ")"
        Response.Write(strSQL & "<br>")
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
    Public Function TrimRightCharacters(ByVal str As String) As String
        If 4 > str.Length Then
            Return str.Substring(4, str.Length - 1)
        Else
            Return str
        End If
    End Function

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("BBlockReport.aspx")
    End Sub
    'Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
    'Dim itemToRemove As RadListBoxItem = RadListBox1.FindItemByText("ALEKS")
    ' RadListBox1.Items.Remove(itemToRemove)
    'End Sub
End Class