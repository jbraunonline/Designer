Imports System.Data
Imports System.Data.SqlClient
Imports System.IO


Public Class ReleaseForm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim NewCode As String
        Dim objMyMethod As DesignModule
        objMyMethod = New DesignModule
        NewCode = objMyMethod.getNextTerm
        Session("NextTerm") = NewCode

        If Not Page.IsPostBack Then
            Session("Release_ID") = Request("ID")

            'lblCurrentMaster.Text = Session("SweepMasterName")
            'lblNewContent.Text = Session("SweepMasterName")
            'Dim newMaster As String
            'newMaster = Replace(Session("SweepMasterName"), Session("NextTerm"), Session("NewMasterTerm"))
            'lblNewMasterCourse.Text = newMaster
            LoadData(Session("Release_ID"))
        End If
    End Sub





    Protected Sub LoadData(ByVal myReleaseID As Integer)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "Select MasterName,NewMasterName,CopySource,ReleaseStatus,chkDisable,chkContent,ReleaseNotes,DateRelease,IsReleased From OL_MasterRelease"
        strsql += " where Release_ID=" & myReleaseID
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()

                lblMasterName.Text = dr("MasterName")
                Session("MasterCourse") = lblMasterName.Text
                If Not IsDBNull(dr("NewMasterName")) Then
                    lblNewMasterCourse.Text = dr("NewMasterName")
                Else
                    ' lblNewMasterCourse.Text = Replace(dr("MasterName"), Session("NextTerm"), Session("NewMasterTerm"))
                End If


                If Not IsDBNull(dr("CopySource")) Then
                    lblContent.Text = dr("CopySource")
                Else
                    ' lblContent.Text = dr("MasterName")
                End If

                If Not IsDBNull(dr("chkDisable")) Then
                    chkDisable.Checked = dr("chkDisable")
                Else
                    chkDisable.Checked = False
                End If

                If Not IsDBNull(dr("chkContent")) Then
                    If dr("chkContent") = True Then
                        chkContent.Checked = True
                    Else
                        chkContent.Checked = False
                    End If
                End If

                If Not IsDBNull(dr("DateRelease")) Then
                    lblDateReleased.Text = dr("DateRelease")

                Else
                End If

                If Not IsDBNull(dr("ReleaseNotes")) Then
                    RadEditor1.Content = dr("ReleaseNotes")
                Else
                End If

                If Not IsDBNull(dr("IsReleased")) Then

                    If dr("IsReleased") = True Then
                        lblIsreleased.Text = "Yes"
                        btnRelease.Visible = False
                        btnUpdateNotes.Visible = True
                        lblReleased.Visible = True
                    Else
                        lblIsreleased.Text = "No"
                        btnRelease.Visible = True
                    End If
                Else
                    ' lblPageStatus.Text = "This data has not been saved."
                    btnRelease.Visible = True
                End If




                '

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()






    End Sub






    Protected Sub btnReturn_Click(sender As Object, e As EventArgs) Handles btnReturn.Click
        Response.Redirect("CopyProgress.aspx")
    End Sub

    Protected Sub btnRelease_Click(sender As Object, e As EventArgs) Handles btnRelease.Click
        If chkDisable.Checked = False Then
            lbldisablewarn.Visible = True
            Exit Sub
        ElseIf chkDisable.Checked = True Then
            lbldisablewarn.Visible = False
        End If

        If chkContent.Checked = False Then
            lblQAwarn.Visible = True
            Exit Sub
        ElseIf chkContent.Checked = True Then
            lblQAwarn.Visible = False
        End If

        DoRelease()
        'upload released master to the old copy system
        DoUpdateCopySystem(lblMasterName.Text)
        Response.Redirect("CopyProgress.aspx")

    End Sub

    Protected Sub DoRelease()
        Dim strSQL As String = "Update OL_MasterRelease set "
        strSQL += " isReleased=1,"
        strSQL += " DateRelease='" & Now & "',"
        strSQL += " chkDisable=1,"
        strSQL += " chkContent=1,"
        strSQL += " releaseNotes='" & radeditor1.content & "'"
        strSQL += " Where Release_ID =" & Session("Release_ID")


        Response.Write(strSQL & "<br>")


        Dim myNEWConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myNEWConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myNEWConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record 
            Response.Write("Fail")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try

        UpdateProgress(Session("MasterCourse"), Session("NextTerm"), "Release")


    End Sub

    Sub updateProgress(ByVal mycourse As String, ByVal myTerm As Integer, myitem As String)
        Dim mysql As String = " Update OL_Progress SET "
        mysql += myitem & "=" & 1 & " where MasterName= '" & mycourse & "' And Term ='" & myTerm & "'"

        'Response.Write(mysql & "<br>")


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mysql, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record 
            Response.Write("Fail")
        Finally
            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try


    End Sub




    Protected Sub UpDateNotes()
        Dim strSQL As String = "Update OL_MasterRelease set "
        strSQL += " releaseNotes='" & RadEditor1.Content & "'"
        strSQL += " Where Release_ID =" & Session("Release_ID")


        'Response.Write(strSQL & "<br>")


        Dim myNEWConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myNEWConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myNEWConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record 
            Response.Write("Fail")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try



    End Sub

    Protected Sub btnUpdateNotes_Click(sender As Object, e As EventArgs) Handles btnUpdateNotes.Click
        UpDateNotes()
        lblReleased.Visible = True
        lblReleased.Text = "Notes updated. Use top button to return to release list."
    End Sub

    Function doesMasterExist(ByVal myReference As String) As Boolean
        Dim mysetup As Boolean = False
        Dim strsql As String = "select Reference from BBCourses where Reference='" & myReference & "'"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        'myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()
        Dim myFlag As String = ""
        If dr.Read() Then
            If Not IsDBNull(dr("Reference")) Then
                myFlag = dr("Reference")
                If Len(myFlag) > 2 Then
                    mysetup = True
                End If
            Else
                mysetup = False
            End If
        Else
        End If

        dr.Close()
        myConnection.Close()
        'Response.Write("<br>" & CStr(mysetup) & "<br>")
        Return mysetup
    End Function


    Protected Sub doUpdateCopySystem(ByVal myMasterName As String)
        'does this course exist in the BBCourses table
        If doesMasterExist(myMasterName) = False Then
            Dim SIS_LINE As String = ""
            Dim Value0 As String = ""
            Dim Value1 As String = ""
            Dim Value2 As String = ""
            Dim Value3 As String = ""
            Dim Value4 As String = ""
            Dim Value5 As String = ""
            Dim Value6 As String = ""
            Dim Value7 As String = ""
            Dim Value8 As String = ""
            Dim Value9 As String = ""




            'Response.Write("<br>")
            ' Response.Write(dr("MasterName"))


            Value0 = myMasterName
            'SIS_LINE += strLine & "|"


            Value1 = myMasterName
            'SIS_LINE += astrValues(1) & "|"


            Value2 = Session("NextTerm")
            'SIS_LINE += txtTerm.Text & "|"

            Dim mystring As String = myMasterName
            Dim substring As String = Mid(mystring, 6, 8)
            substring = Replace(substring, "_", "")
            'Response.Write(substring)

            Value3 = substring
            'SIS_LINE += substring & "|"


            Value4 = "353"
            'SIS_LINE += "353|"


            Value5 = "ONLN"
            'SIS_LINE += "ONLN|"


            Value6 = "VIRT"
            'SIS_LINE += "VC_MC|"


            Value7 = "Master"
            'SIS_LINE += "Master|"



            Value8 = "20180101"
            'SIS_LINE += "20150101|"


            Value9 = "20181231"
            'SIS_LINE += "20151231|"





            addCopySystemData(Value0, Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9)
        End If

    End Sub

    Sub addCopySystemData(ByVal strTextField0 As String, ByVal strTextField1 As String, ByVal strTextField2 As String, ByVal strTextField3 As String, ByVal strTextField4 As String, ByVal strTextField5 As String, ByVal strTextField6 As String, ByVal strTextField7 As String, ByVal strTextField8 As String, ByVal strTextField9 As String)

        Dim strSQL As String = "Insert into BBCourses(Reference,Course_Name,Course_ID,TERM_KEY,Course,Section,Org_Name,Org_Type,Category,Start_Date,End_Date) " &
                               "VALUES ('" & strTextField0 &
                               "','" & strTextField1 &
                               "','" & Replace(strTextField1, " ", "") &
                               "','" & strTextField2 &
                               "','" & strTextField3 &
                               "','" & strTextField4 &
                               "','" & strTextField5 &
                               "','" & strTextField6 &
                               "','" & strTextField7 &
                               "','" & strTextField8 &
                               "','" & strTextField9 & "')"

        Response.Write("<BR>" & strSQL & "<BR>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        Try

            myConnection.Open()
            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()
        Catch
            Response.Write("failed to create a new record <br>")
        Finally
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try

    End Sub
End Class