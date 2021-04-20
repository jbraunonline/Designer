Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class CheckboxList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            loadCheckList()
            getdata()
            'getarray()
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Write(RadCheckBoxList1.SelectedValue.ToString)
        Dim mylist As String = ""
        For Each item As Telerik.Web.UI.ButtonListItem In RadCheckBoxList1.Items
            If item.Selected Then
                'Response.Write(String.Format("item with text {0} and value {1} is selected<br />", item.Text, item.Value))
                Response.Write(String.Format("{0} and value {1} is selected<br />", item.Text, item.Value))
                mylist += String.Format("{1},", item.Text, item.Value)
            End If
        Next
        TextBox1.Text = mylist
    End Sub

    Protected Sub RadCheckBoxList1_SelectedIndexChanged(sender As Object, e As EventArgs)
        'get all selected items via a loop
        For Each item As Telerik.Web.UI.ButtonListItem In RadCheckBoxList1.Items
            If item.Selected Then
                Response.Write(String.Format("item with text {0} and value {1} is selected<br />", item.Text, item.Value))
            End If
        Next

        'get the first selected item through exposed properties
        Dim selectedIndex As Integer = RadCheckBoxList1.SelectedIndex
        Dim selectedButtonListItem As Telerik.Web.UI.ButtonListItem = RadCheckBoxList1.SelectedItem
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        ListBox1.Items.Clear()
        Dim mylist As String = ""
        Dim mylist2 As String = ""
        Dim item As ListItem
        For Each item In CheckBoxList1.Items
            If item.Selected Then
                mylist2 += item.Text.ToString() & ","
                mylist += item.ToString() & ","
            End If
        Next
        ' mylist = Left(mylist, Len(mylist) - 1)
        'mylist2 = Left(mylist2, Len(mylist2) - 1)
        TextBox2.Text = mylist
        TextBox3.Text = mylist2
        addmyData(mylist2, mylist)
    End Sub

    Sub addmyData(ByVal myIDArray As String, ByVal myNameArray As String)

        Dim strSQL As String = "INSERT INTO OL_MasterBuildingBlocks"
        strSQL += "(BB_IDarray,BB_NAMEarray,MasterName,DateEntered) "
        strSQL += "VALUES ('"
        strSQL += myIDArray & "','"
        strSQL += myNameArray & "','"
        strSQL += "VC_MasterCourse" & "','"
        strSQL += DateTime.Now() & "')"

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
            Response.Write("FAIL")

        Finally

            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try

        '
    End Sub

    Sub getarray()

        Dim myarray As Array = Split(TextBox4.Text, ",")
        For Each i As Integer In myarray
            CheckBoxList1.Items(i - 1).Selected = True
            ' If CheckBoxList1.Items.FindByValue = i Then
            'End If



        Next

    End Sub
    Sub getdata()





        Dim strsql As String
        strsql = "Select BB_IDarray from OL_MasterBuildingBlocks Where MasterName='VC_MasterCourse'"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        While dr.Read()
            TextBox4.Text = dr("BB_IDarray")
        End While

        Response.Write("No Data")


        dr.Close()
        dr = Nothing
        myConnection.Close()






    End Sub

    Protected Sub loadCheckList()





        Dim strsql As String
        strsql = "SELECT BB_ID, BBName FROM OL_BuildingBlocks order by BB_ID"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        CheckBoxList1.DataSource = dr
        CheckBoxList1.DataBind()

        'While dr.Read()
        'Response.Write(dr("BBName"))
        '  End While


        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub



End Class