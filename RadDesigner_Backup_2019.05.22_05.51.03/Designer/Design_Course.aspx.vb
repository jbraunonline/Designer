Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins

Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class Design_Course
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Write(Session("Master_ID") & "   " & Session("Course"))

        If Session("Course") = "" And Session("Master_ID") = "" Then
            Panel1.Visible = True
            RadGrid1.Visible = False
        Else
            Panel1.Visible = False

            Panel2.Visible = True
            Label3.Text = getmaster(Session("Master_ID"))
            RadGrid1.Visible = True

            Label2.Text = getmaster(Session("Master_ID"))
            Session("MasterCourse") = getmaster(Session("Master_ID"))
            Label4.Text = Session("Course") & " " & Session("Master_ID")
        End If
    End Sub

    Function getmaster(ByVal myID As Integer) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myreturn As String = "Not Found"
        Dim strsql As String
        strsql = "SELECT MasterName FROM OL_mastercourse Where Master_ID=" & myID
        'Response.Write(strsql)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("MasterName")
            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function
End Class