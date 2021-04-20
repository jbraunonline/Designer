Imports System
Imports System.Collections.Generic
Imports System.Net.Mime.MediaTypeNames
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.IO


Public Class AddPublisher
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnNewPubPanel_Click(sender As Object, e As EventArgs) Handles btnNewPubPanel.Click
        pnlNewPub.Visible = True
        pnlBuildingBlock.Visible = False
        btnNewBlockPanel.Visible = False
        btnReturn.Visible = False
        GetPublishers()
    End Sub
    Protected Sub GetPublishers()

        Dim strSQL As String = "Select  Pub_ID, Publisher From OL_BBlock_Publisher Order By Publisher"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)


        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        ListBox1.DataSource = dr
        ListBox1.DataTextField = "Publisher"
        ListBox1.DataValueField = "Publisher"
        ListBox1.DataBind()

        myConnection.Close()



    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click

        Dim strSQL As String = "INSERT INTO OL_BBlock_Publisher "
        strsql += "(Publisher,PubVis) "
        strSQL += "VALUES ('"
        strSQL += txtNewPublisher.Text & "',1)"
        'Response.Write(strSQL)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection) '
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
        GetPublishers()

    End Sub

    Protected Sub btnNewBlockPanel_Click(sender As Object, e As EventArgs) Handles btnNewBlockPanel.Click
        pnlBuildingBlock.Visible = True
        GetBlockPublishers()

    End Sub
    Protected Sub GetBlockPublishers()

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

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        RadGrid1.Visible = True
        Response.Write(DropDownList1.SelectedValue)
    End Sub
    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As GridItemEventArgs)
        If TypeOf e.Item Is GridEditFormInsertItem Then
            Dim editor As GridTextBoxColumnEditor = TryCast((TryCast(e.Item, GridEditFormInsertItem)).EditManager.GetColumnEditor("Pub_ID"), GridTextBoxColumnEditor)
            editor.Text = DropDownList1.SelectedValue.ToString
            editor.TextBoxControl.Enabled = False ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
        End If
        If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
            Dim eitem As GridEditableItem = CType(e.Item, GridEditableItem)
            eitem("Pub_ID").Visible = False
            eitem("Pub_ID").Parent.Visible = False
        End If

    End Sub




    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Response.Redirect("AddPublisher.aspx")
    End Sub

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs) Handles btnReturn.Click
        Response.Redirect("BuildingBlockReport.aspx")
    End Sub
End Class