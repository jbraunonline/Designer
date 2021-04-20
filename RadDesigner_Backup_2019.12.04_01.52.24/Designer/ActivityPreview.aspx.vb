Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class ActivityPreview
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblTitle.Text = "Schedule of Courses for term " & Session("NextTerm")
        getworkinglist()
    End Sub

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs) Handles btnReturn.Click
        Response.Redirect("myProgress2.aspx")
    End Sub

    Protected Function getTotal(ByVal myCourse As String) As String


        Dim strsql As String = ""
        strsql += "SELECT count (*) as thecount  FROM [VC_VCData].[dbo].[CMR]  where course = '" & myCourse & "' and term = '" & Session("NextTerm") & "' and Type = 'E' and InstAssign <> 'TBA'"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myreturn As String = "None"

        'response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()

                myreturn = CStr(dr("thecount"))

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn

    End Function


    Protected Sub getworkinglist()
        Dim SqlDataSource1 As New SqlDataSource()
        SqlDataSource1.ID = "SqlDataSource1"
        Me.Page.Controls.Add(SqlDataSource1)
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString

        Dim mysql As String = ""

        Dim myterm As Integer = CInt(Session("NextTerm"))


        'mysql += " Select dbo.OL_MasterCourse.Course, COUNT(dbo.OL_CMR.Course) As thecount "
        'mysql += "  From dbo.OL_MasterCourse INNER Join  dbo.OL_CMR ON dbo.OL_MasterCourse.Course = dbo.OL_CMR.Course "
        'mysql += "  Group By dbo.OL_MasterCourse.Course, dbo.OL_MasterCourse.ID_ID, dbo.OL_MasterCourse.Term, dbo.OL_CMR.Term "
        'mysql += "   HAVING(dbo.OL_MasterCourse.Term = " & myterm & " ) And (dbo.OL_CMR.Term = '" & Session("NextTerm") & "') AND (dbo.OL_MasterCourse.ID_ID =" & CInt(Session("User_ID")) & ")"
        'mysql += "   ORDER by thecount desc "

        mysql += " Select VC_VCData1.dbo.OL_MasterCourse.Course, COUNT(VC_VCData.dbo.CMR.Course) As thecount From VC_VCData1.dbo.OL_MasterCourse "
        mysql += " INNER Join VC_VCData.dbo.CMR ON VC_VCData1.dbo.OL_MasterCourse.Course = VC_VCData.dbo.CMR.Course "
        mysql += " Group By VC_VCData1.dbo.OL_MasterCourse.Course, VC_VCData1.dbo.OL_MasterCourse.ID_ID, VC_VCData1.dbo.OL_MasterCourse.Term, VC_VCData.dbo.CMR.Term "
        mysql += " HAVING(VC_VCData1.dbo.OL_MasterCourse.Term = " & myterm & ") And (VC_VCData.dbo.CMR.Term = '" & Session("NextTerm") & "') AND (VC_VCData1.dbo.OL_MasterCourse.ID_ID =" & CInt(Session("User_ID")) & ")"
        mysql += " ORDER by thecount desc "


        'Response.Write(mysql)
        SqlDataSource1.SelectCommand = mysql '"Select Reference,Course, Course_ID, MDCID,IsAssociated,iscopyready, copyReadyDate from BBCourses where course='" & mycourse & "' and Term_Key='20152' And Category <>  'Master' Order By MDCID"



        'Response.Write("SELECT Course, Course_ID from BBCourses where course='" & mycourse & "' and Term_Key='20152'")
        RadGrid1.DataSource = SqlDataSource1
        RadGrid1.DataBind()
    End Sub




End Class