Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class BuildingBlocks
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Session("MasterCourse") = "2185_AMH2010_MC_VC"
        Label1.Text = Session("MasterCourse")
        If Not Page.IsPostBack Then
            loadCheckList()
            loadCheckList2()
            getarray()
            'getarray2()
        End If
    End Sub

    Protected Sub loadCheckList()

        Dim strsql As String
        strsql = "SELECT BB_ID, BBName FROM OL_BuildingBlocks Where IsLTI = 1 "
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        CheckBoxList1.DataSource = dr
        CheckBoxList1.DataBind()

        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Protected Sub loadCheckList2()

        Dim strsql As String
        strsql = "SELECT BB_ID, BBName FROM OL_BuildingBlocks Where IsLTI = 0 "
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        CheckBoxList2.DataSource = dr
        CheckBoxList2.DataBind()

        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Sub getarray()


        Dim strsql As String
        strsql = "Select BB_Namearray,DateEntered  from OL_MasterBuildingBlocks Where MasterName='" & Session("MasterCourse") & "'"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        'Response.Write(strsql)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        If dr.Read() Then
            If Not IsDBNull(dr("DateEntered")) Then
                lblDateEntered.Text = "Updated:" & dr("DateEntered")
                lblDateEntered.Visible = True
                TextBox4.Text = dr("BB_Namearray")


                btnSave.Visible = False


                Dim testvalues As String = TextBox4.Text
                Dim myarray As Array = testvalues.Split(Microsoft.VisualBasic.ChrW(44))
                For Each item In myarray
                    Dim listItem As ListItem = Me.CheckBoxList1.Items.FindByText(item)
                    If (Not (listItem) Is Nothing) Then
                        listItem.Selected = True
                    End If
                Next

                For Each item In myarray
                    Dim listItem As ListItem = Me.CheckBoxList2.Items.FindByText(item)
                    If (Not (listItem) Is Nothing) Then
                        listItem.Selected = True
                    End If
                Next


            Else

            End If

            btnUpdate.Visible = True
            btnSave.Visible = False
        Else
            btnUpdate.Visible = False
            btnSave.Visible = True
        End If









        dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Protected Sub getarray2()


        Dim strsql As String
        strsql = "Select BB_IDarray from OL_MasterBuildingBlocks Where MasterName='" & Session("MasterCourse") & "'"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        ''myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        If dr.HasRows Then
            While dr.Read()
                TextBox5.Text = dr("BB_IDarray")
                Response.End()
            End While

            Response.Write("No Data2")
            If TextBox5.Text <> "" Then
                Dim myarray2 As Array = Split(TextBox5.Text, ",")
                For Each i As Integer In myarray2
                    CheckBoxList2.Items(i - 1).Selected = True
                Next
            End If
        End If

            dr.Close()
        dr = Nothing
        myConnection.Close()
    End Sub

    Sub addmyData(ByVal myIDArray As String, ByVal myNameArray As String)

        Dim strSQL As String = "INSERT INTO OL_MasterBuildingBlocks"
        strSQL += "(BB_IDarray,BB_NAMEarray,MasterName,DateEntered) "
        strSQL += "VALUES ('"
        strSQL += myIDArray & "','"
        strSQL += myNameArray & "','"
        strSQL += Session("MasterCourse") & "','"
        strSQL += DateTime.Now() & "')"

        'Response.Write(strSQL & "<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()


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
        lblMessage.Text = "Data Saved"
        '
    End Sub

    Sub UpdateData(ByVal myIDArray As String, ByVal myNameArray As String)

        Dim strSQL As String = "Update OL_MasterBuildingBlocks set "
        strSQL += "BB_IDarray='" & myIDArray & "',"
        strSQL += "BB_NAMEarray='" & myNameArray & "',"
        strSQL += " DateEntered='" & DateTime.Now() & "'"
        strSQL += " Where MasterName='" & Session("MasterCourse") & "'"


        'Response.Write(strSQL & "<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            'mycounter = mycounter + 1

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
        lblMessage.Text = "Data Updated"
    End Sub



    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim mylist As String = ""
        Dim mylist2 As String = ""
        Dim mylistB As String = ""
        Dim mylist2B As String = ""
        Dim item As ListItem
        For Each item In CheckBoxList1.Items
            If item.Selected Then
                mylist2 += item.Value.ToString() & ","
                mylist += item.ToString() & ","
            End If
        Next

        For Each item In CheckBoxList2.Items
            If item.Selected Then
                mylist2B += item.Value.ToString() & ","
                mylistB += item.ToString() & ","
            End If
        Next



        'mylist = Left(mylist, Len(mylist) - 1)
        'mylist2 = Left(mylist2, Len(mylist2) - 1)
        TextBox2.Text = mylist
        TextBox3.Text = mylist2
        TextBox7.Text = mylistB
        TextBox8.Text = mylist2B
        Dim theselection As String = mylist & mylistB
        Dim theselection2 As String = mylist2 & mylist2B
        'TextBox4.Text = theselection
        If Len(theselection) < 1 Then
            Response.Write("Nothing Selected")
            btnNoBlocks.Visible = True
            Exit Sub
        End If
        theselection = Left(theselection, Len(theselection) - 1)
        theselection2 = Left(theselection2, Len(theselection2) - 1)
        TextBox5.Text = theselection
        addmyData(theselection2, theselection)
        Response.Redirect("BuildingBlocks.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim testvalues As String = TextBox4.Text
        Dim myarray As Array = testvalues.Split(Microsoft.VisualBasic.ChrW(44))
        For Each item In myarray
            Dim listItem As ListItem = Me.CheckBoxList1.Items.FindByText(item)
            If (Not (listItem) Is Nothing) Then
                listItem.Selected = True
            End If
        Next

        For Each item In myarray
            Dim listItem As ListItem = Me.CheckBoxList2.Items.FindByText(item)
            If (Not (listItem) Is Nothing) Then
                listItem.Selected = True
            End If
        Next

    End Sub
    Protected Sub UpdateBlocks()
        Dim mylist As String = ""
        Dim mylist2 As String = ""
        Dim mylistB As String = ""
        Dim mylist2B As String = ""
        Dim item As ListItem
        For Each item In CheckBoxList1.Items
            If item.Selected Then
                mylist2 += item.Value.ToString() & ","
                mylist += item.ToString() & ","
            End If
        Next

        For Each item In CheckBoxList2.Items
            If item.Selected Then
                mylist2B += item.Value.ToString() & ","
                mylistB += item.ToString() & ","
            End If
        Next



        TextBox2.Text = mylist
        TextBox3.Text = mylist2
        TextBox7.Text = mylistB
        TextBox8.Text = mylist2B
        Dim theselection As String = mylist & mylistB
        Dim theselection2 As String = mylist2 & mylist2B
        'TextBox4.Text = theselection
        If Len(theselection) < 1 Then
            Response.Write("<font color-red>Nothing Selected</font>")
            btnNoBlocks.Visible = True
            Exit Sub
        End If
        theselection = Left(theselection, Len(theselection) - 1)
        theselection2 = Left(theselection2, Len(theselection2) - 1)
        TextBox5.Text = theselection
        TextBox6.Text = theselection2
        UpdateData(theselection2, theselection)
        Response.Redirect("BuildingBlocks.aspx")



    End Sub
    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        UpdateBlocks()

    End Sub

    Protected Sub btnNoBlocks_Click(sender As Object, e As EventArgs) Handles btnNoBlocks.Click
        If btnSave.Visible = True Then
            addmyData("", "")
            lblMessage.Text = "This record has been Saved"
            Response.Redirect("BuildingBlocks.aspx")
        ElseIf btnUpdate.Visible = True Then
            UpdateData("", "")
            lblMessage.Text = "This record has been updated"
            Response.Redirect("BuildingBlocks.aspx")
        End If
    End Sub
End Class