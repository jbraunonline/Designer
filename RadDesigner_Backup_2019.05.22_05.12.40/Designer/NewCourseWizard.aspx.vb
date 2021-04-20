Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
';[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[Programmer Notes
'To add a new master course, this wizard ffirsts created a catalog entry and retrieves the Key ID from the query and puts it into a label
' then when the finish link is done, it creates four addl records, OL_MasterCourse, , OL_Exams ajd OL_Progress, OL_MasterPhase


Public Class NewCoourseWizard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            bindsubjects()
        End If
        lblNextTerm.Text = Session("NextTerm")

        lblDesigner.Text = Session("Name")
        If Request("Course") <> "" Then
            lblCreated.Text = "course " & Request("Course") & " was created. create another course or return to course list."
        End If
    End Sub
    Protected Sub Bindsubjects()
        Dim strsql As String = "SELECT distinct  [Subject_Area]  FROM [VC_VCData1].[dbo].[OL_Catalog] Where Subject_area <> '' "
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        myConnection.Open()
        Dim myCommand As New SqlCommand(strsql, myConnection)
        Dim da As New SqlDataAdapter(myCommand)
        Dim ds As New DataSet()
        da.Fill(ds)
        ddlSubject_area.DataSource = ds
        ddlSubject_area.DataTextField = "Subject_Area"
        ddlSubject_area.DataValueField = "Subject_Area"
        ddlSubject_area.DataBind()
        ddlSubject_area.Items.Insert(0, New ListItem("Please Select", "0"))
    End Sub




    Protected Sub RadWizard1_ActiveStepChanged(sender As Object, e As EventArgs) Handles RadWizard1.ActiveStepChanged
        Dim activeStepIndex As Integer = TryCast(sender, Telerik.Web.UI.RadWizard).ActiveStep.Index
        Response.Write(CStr(activeStepIndex) & "Step")
        If activeStepIndex = 1 Then
            ' Response.Write("This is step1<br>")

            lblMasterName.Text = Session("NextTerm") & "_" & txtCatName.Text & "_MC_VC"
            lblCourse.Text = txtCatName.Text
            lblDesigner.Text = Session("Name")
            lblTitle.Text = txtCatTitle.Text
            txtCredits.Text = ddlCredits.SelectedItem.Text
            SaveCatalog()
        End If
        If activeStepIndex = 2 Then
            Dim SaveLabel As String = "<b>Master Course Details</b><br>"
            SaveLabel += "Master Course: " & lblMasterName.Text & "<br>"
            SaveLabel += "Course: " & lblCourse.Text & "<br>"
            SaveLabel += "Title: " & lblTitle.Text & "<br>"
            SaveLabel += "Term: " & Session("NextTerm") & "<br>"
            SaveLabel += "Designer: " & Session("Name") & "<br>"
            SaveLabel += "Designer ID: " & Session("User_ID") & "<br>"
            SaveLabel += "Developerr: " & txtDeveloper.Text & "<br>"
            SaveLabel += "Co-Developer " & txtDeveloper.Text & "<br>"
            SaveLabel += "Status: " & ddlMasterStatus.SelectedItem.Text & "<br>"
            SaveLabel += "Catalog ID: " & lblCatalogID.Text & "<br>"
            SaveLabel += "<span class='auto-style16'>NOTE: You can change Master Course details by using the Previous Button. <br> Selecting FINISH will create your new Master Course.</span>"
            Literal2.Text = SaveLabel





        End If

    End Sub

    Protected Sub RadWizard1_FinishButtonClick(sender As Object, e As Telerik.Web.UI.WizardEventArgs) Handles RadWizard1.FinishButtonClick
        Label1.Text = "<b>TYour new course has been created. Please select the designer link on the top menu</b>"
        Label1.Text += "<br>  " & txtCatName.Text
        RadWizard1.Visible = False
        AddNewMaster()
        ' Response.Redirect("/designer/designer.aspx")
    End Sub

    Protected Sub RadWizard1_CancelButtonClick(sender As Object, e As Telerik.Web.UI.WizardEventArgs) Handles RadWizard1.CancelButtonClick
        'Response.Write("Shit it has been cancelled")
        Response.Redirect("NewCourseWizard.aspx")
    End Sub

    Protected Sub SaveCatalog()
        Dim theID As Integer = 0
        Dim strsql As String
        strsql = "Insert into OL_Catalog (CatalogName , Title, Subject_Area, Term_Offering, Credits, Pre_Requisites, Co_Requisites, Status) values ('"
        strsql += txtCatName.Text & "','"
        strsql += txtCatTitle.Text & "','"
        strsql += ddlSubject_area.SelectedItem.Text & "','"
        strsql += ddlTermOffering.SelectedItem.Text & "',"
        strsql += txtCredits.Text & ",'"
        strsql += txtPreReq.Text & "','"
        strsql += txtCoReq.Text & "','"
        strsql += ddlCatalogStatus.SelectedItem.Text & "');"
        strsql += " Select SCOPE_IDENTITY()  as myID"

        Dim mycatalog As String = "<b>New Catalog Entry</b><br>"
        mycatalog += "Name: " & txtCatName.Text & "<br>"
        mycatalog += "Title: " & txtCatTitle.Text & "<br>"
        mycatalog += "Subject Area: " & ddlSubject_area.SelectedItem.Text & "<br>"
        mycatalog += "Term OFFERING: " & ddlTermOffering.SelectedItem.Text & "<br>"
        mycatalog += "Credits: " & txtCredits.Text & "<br>"
        mycatalog += "Prerequisites: " & txtPreReq.Text & "<br>"
        mycatalog += "Corequisites: " & txtCoReq.Text & "<br>"
        mycatalog += "Catalog Status: " & ddlCatalogStatus.SelectedItem.Text & "<br>"
        mycatalog += "<font color=red><span class='auto-style16'>Catalog Entry has been saved and cannot be changed.<br><font> See administrator</span><br>"
        'lblNewCatalog.Text = mycatalog
        Literal1.Text = mycatalog
        'Response.Write(strsql & "'-----this is the saclar command<br>")
        '''''''''' strSQL2 As String = "  Insert into Course (CourseNo) values (24);"
        '''''''''' strSQL2 += " Select SCOPE_IDENTITY()  as myID"

        'note semicolon'  in above statement separating two commands

        'Response.Write("<BR>" & strSQL2 & "<BR>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        Try
            myConnection.Open()
            ''Note ExecuteScalar()  {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{ Hold below ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
            Dim xyz As Integer = myCommand.ExecuteScalar()
            lblCatalogID.Text = xyz
        Catch
            Response.Write("failed to create a new record <br>")
        Finally
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try
    End Sub

    Private Sub AddNewMaster()

        Dim mysql As String

        mysql = "Insert into OL_MasterCourse (Catalog_ID,MasterName,Course,Top_20_CRS,Developer_SME,Dev_ID,Co_Developer_SME,Co_Dev_ID,Instructional_Designer,ID_ID,Term,Status,Phase,Notes,Title,Term_Offering) Values ("

        mysql += lblCatalogID.Text
        mysql += ",'" & lblMasterName.Text  'MasterName,
        mysql += "','" & lblCourse.Text 'Course,
        mysql += "',0"   'Top_20_Course,
        mysql += ",'" & txtDeveloper.Text 'Developer_SME,
        mysql += "',0"   'Dev_ID,
        mysql += ",'" & txtCoDeveloper.Text 'Co_Developer_SME,
        mysql += "',0"   'Co_Dev_ID,
        mysql += ",'" & Session("Name")  'Instructional_Designer
        mysql += "'," & Session("User_ID") 'ID_ID,
        mysql += "," & Session("NextTerm")   'Term,
        mysql += ",'" & ddlMasterStatus.SelectedItem.Text 'Status
        mysql += "','" & "See phase tab"
        mysql += "','" & "Notes"
        mysql += " ','" & lblTitle.Text  'Title,
        mysql += "','" & ddlTermOffering.SelectedItem.Text & "')" 'Term_Offering
        'Response.Write(mysql & " ---Insert into OL Mastercourse<br>")
        'Response.End()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mysql, myConnection)
        Try
            myConnection.Open()
            'HOLD SQL HOLD..........[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[...HOLD..............................................................
            myCommand.ExecuteNonQuery()
        Catch
            Response.Write("failed to create a new record <br>")
        Finally
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try
        '[[[[[[[[[[[[[[[[[[[[[[[[[Now Create these records
        addExam(lblMasterName.Text, lblCourse.Text, Session("NextTerm"))

        addPhase(lblCourse.Text, Session("Name"), Session("User_ID"))
        addProgress(lblMasterName.Text, Session("Name"), Session("User_ID"), Session("NextTerm"), ddlMasterStatus.SelectedItem.Text)

    End Sub

    Private Sub addExam(ByVal string0 As String, ByVal string1 As String, ByVal string2 As String)
        Dim mymaster As String = ""
        Dim strSQL As String = " Insert into OL_MasterExam (MasterName,Course,Term) "

        strSQL += " Values ('" & string0
        strSQL += "','" & string1 'Course

        strSQL += "'," & string2 & ")" 'Term_Offering

        'Response.Write(strSQL & "  ---insertExam<br>")
        ' Insert into OL_Catalog (CatalogName, Title, Term_Offering, Credits, Status)

        'Response.Write("<BR>" & strSQL & "<BR>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        Try

            myConnection.Open()
            'HOLD SQL HOLD..........[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[...HOLD..............................................................
            myCommand.ExecuteNonQuery()

        Catch
            Response.Write("failed to create a new record <br>")
        Finally
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try

    End Sub

    Private Sub addPhase(ByVal myMaster As String, ByVal myname As String, ByVal myID As Integer)

        Dim strSQL As String = "Insert into OL_MasterPhase(course,IDesg,ID_ID,Level) "

        strSQL += " Values ('" & myMaster
        strSQL += "','" & myname
        strSQL += "'," & myID
        strSQL += ",'1')"

        'Response.Write(strSQL & "<br>")
        ' Insert into OL_Catalog (CatalogName, Title, Term_Offering, Credits, Status)

        'Response.Write("<BR>" & strSQL & "  --InsertPhase<BR>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        Try

            myConnection.Open()
            'HOLD SQL HOLD..........[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[...HOLD..............................................................
            myCommand.ExecuteNonQuery()

        Catch
            Response.Write("failed to create a new record <br>")
        Finally
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try

    End Sub




    Private Sub addProgress(ByVal MasterName As String, ByVal Instructional_Designer As String, ByVal ID_ID As Integer, ByVal Term As Integer, ByVal Status As String)

        Dim strSQL As String = "Insert into OL_Progress (Mastername,Instructional_Designer,ID_ID,Term,Status) "

        strSQL += "VALUES ('"
        strSQL += MasterName & "','"
        strSQL += Instructional_Designer & " ',"
        strSQL += ID_ID & ","
        strSQL += Term & ",'"
        strSQL += Status & "')"

        'Response.Write(strSQL & "<br>AddOL_Progress<br>")
        Response.Write("<b><font color=red>YOUR NEW COURSE HAS BEEN ADDED</font></b>")


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD.]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]].....................................
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

        'Response.Redirect("newcoursewizard.aspx?Course=" & lblCourse.Text)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("EditMyCourseList.aspx")
    End Sub
End Class