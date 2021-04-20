
Imports System
Imports System.Collections.Generic
Imports System.Net.Mime.MediaTypeNames
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.IO
Imports Telerik.Web.UI.Skins
Public Class BBlockReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            GetPublishers()
        End If
        Session("MasterName") = "2193_AMH2010_MC_VC"
        Session("NextTerm") = "2193"
        lblPageTitle.Text = "Building Blocks for " & Session("MasterName")

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
        Response.Redirect("showmac.aspx?Pub_ID=" & DropDownList1.SelectedValue.ToString)
    End Sub
End Class