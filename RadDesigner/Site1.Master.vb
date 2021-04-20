Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class Site1
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Username") = "" Then
            Response.Redirect("index.aspx")
        End If
        If Not Page.IsPostBack Then


            Dim item1 As New RadMenuItem()
            item1.Text = "Developer"

            Dim item11 As New RadMenuItem()
            item11.Text = "Webform 4"
            item1.Items.Add(item11)
            item11.NavigateUrl = "webform4.aspx"
            item11.Target = "ContentPlaceHolder1"

            Dim item12 As New RadMenuItem()
            item12.Text = "Top 20"
            item12.NavigateUrl = "~/Administrator/Admin/Top20.aspx"
            item12.Target = "ContentPlaceHolder1"

            Dim item13 As New RadMenuItem()
            item13.Text = "Debug"
            item13.NavigateUrl = "debug.aspx"
            item13.Target = "ContentPlaceHolder1"


            Dim item2 As New RadMenuItem()
            item2.Text = "Designer"
            item2.NavigateUrl = "~/Designer/Designer.aspx"
            item2.Target = "ContentPlaceHolder1"

            Dim item21 As New RadMenuItem()
            item21.Text = "AssignTasks"
            item2.Items.Add(item21)
            item21.NavigateUrl = "~/Designer/Tasks/myTasks.aspx"
            item21.Target = "ContentPlaceHolder1"

            Dim item22 As New RadMenuItem()
            item22.Text = "Audit Review"
            item2.Items.Add(item22)
            item22.NavigateUrl = "~/Designer/ReviewAudit.aspx"
            item22.Target = "ContentPlaceHolder1"

            Dim item3 As New RadMenuItem()
            'item2.NavigateUrl = "~/Designer/Designer.aspx"
            item3.Text = "Associate"
            item3.NavigateUrl = "~/Associate/Associate.aspx"
            item3.Target = "ContentPlaceHolder1"


            Dim item4 As New RadMenuItem()
            item4.Text = "Reports"
            item4.Target = "ContentPlaceHolder1"
            item4.NavigateUrl = "~/Reports/Default.aspx"

            Dim item5 As New RadMenuItem()
            item5.Text = "Administrator"

            Dim item6 As New RadMenuItem()
            item5.Text = "*****|  <b>" & getName(Session("User_ID")) & " </b> |*****     "

            Dim item7 As New RadMenuItem()
            item7.Text = "LogOut"
            item7.NavigateUrl = "http://virtual.mdc.edu/exitDesigner.aspx"

            Dim item8 As New RadMenuItem()
            item8.Text = "Admin"

            Dim item9 As New RadMenuItem()
            item9.Text = "Switch User"
            item9.Target = "ContentPlaceHolder1"
            item9.NavigateUrl = "~/Default1.aspx"

            Dim item10 As New RadMenuItem()
            item10.Text = "Helpdesk"
            item10.Target = "ContentPlaceHolder1"
            item10.NavigateUrl = "~/Helpdesk/Helpdesk.aspx"

            If Session("Role") = "Helpdesk" Then
                RadMenu1.Items.Add(item10)
            End If

            If Session("Role") = "Delivery" Then
                RadMenu1.Items.Add(item9)
            End If

            If Session("Role") = "Developer" Then
                RadMenu1.Items.Add(item1)
            End If

            If Session("Role") = "1" Then
                RadMenu1.Items.Add(item2)
            End If
            If Session("Role") = "2" Then
                RadMenu1.Items.Add(item3)
            End If

            If Session("Role") = "Supervisor" Then
                RadMenu1.Items.Add(item4)
            End If

            RadMenu1.Items.Add(item5)
            RadMenu1.Items.Add(item6)
            RadMenu1.Items.Add(item7)
            ' RadMenu1.Items.Add(item8)

            ' added item9 tp a;;pw desogmers to switch roles
            If Session("Role") = "1" Then
                RadMenu1.Items.Add(item9)
            End If
            RadMenu1.Items.Add(item12)
            RadMenu1.Items.Add(item13)

            If Session("Role") = "1" Or Session("Role") = "11" Or Session("Username") = "eburt" Then
                RadMenu1.Items.Add(item4)
            End If



        End If

    End Sub

    Public Function getName(ByVal myUserID As Integer) As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "SELECT FirstName + ' ' + LastName as Name  FROM OL_Users where User_ID=" & myUserID
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("Name")

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        If myreturn = "Unknown" Then
            Response.Redirect("index.aspx")
        End If
        Return myreturn
    End Function



End Class