Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class getSIS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        GetSISbyDate(TextBox1.Text)
    End Sub

    Protected Sub GetSISbyDate(ByVal mydate As Date)
        Dim mydata As String = "External_Course_Key|Course_Name|TERM_KEY|Course|Section|Org_Name|Org_Type|Category|Start_Date|End_Date|Template_Course_Key"
        Response.Write(mydata & "<BR>")
        'check to see if this master exists in the VC_VCdata BBMasterCourse table  NOTE this is not the VC_VCdata1 db -- connectionstring points to db
        Dim mysetup As Boolean = False
        Dim strSQL As String = "Select SIS_Line from BBMasterCourse where DateIn >= '" & mydate & "' And DateIn < '" & mydate.AddDays(1) & "'"
        'Response.Write(strSQL)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        'Response.Write("Select * from Section where SectionID=" & course)
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myFlag As String = ""
        If dr.Read() Then
            While dr.Read
                Response.Write(dr("SIS_Line") & "<br>")
            End While

        End If
        Response.Write("<br>")
        dr.Close()
        myConnection.Close()
        'Response.Write("<br>" & CStr(mysetup) & "<br>")

    End Sub
End Class