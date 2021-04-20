Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class NewMasterShells
    Inherits System.Web.UI.Page
    'NOTES: this page does does four things
    ' onLoad it gets current terms
    'the getshells button calls createtest() which gets all courses marked ready to copy by normal or alternate source depending on buttonlist1.selected value it then cycles through the recordset
    ' 1, this creates the text string to be used to create courses in blackboard
    ' 2. If there is no record in the BBMasterShells table, it saves the record there SaveSIS() and appends the text data for the BBoard upload file
    ' 3.  If there is no record for the MasterName in the OL_Master Release, it creates the release record for the designers
    ' 4.  After creating the recond, it updates the OL_MasterSweep record (MarkMasterSweep() ) and sets CopyComplete =1
    '
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim NewCode As String
        Dim objMyMethod As DesignModule
        objMyMethod = New DesignModule
        NewCode = objMyMethod.getNextTerm
        Session("NextTerm") = NewCode
        Dim myThisTerm As String = objMyMethod.getThisTerm
        Session("ThisTerm") = myThisTerm
        Dim myNextTerm As String = objMyMethod.getNextTerm
        Session("NextTerm") = myNextTerm
        lblNextTerm.Text = Session("NextTerm")

        Dim mynewmasterterm As String = objMyMethod.getNewMasterTerm
        Session("NewMasterTerm") = mynewmasterterm
        lblNewMasterTerm.Text = Session("NewMasterTerm")
    End Sub

    Protected Sub btnGetShells_Click(sender As Object, e As EventArgs) Handles btnGetShells.Click
        If radioAction.SelectedValue = "Run" Then
            lblData.ForeColor = System.Drawing.Color.Black
        End If
        createtext(RadioButtonList1.SelectedValue)

    End Sub
    Protected Sub createtext(ByVal myvalue As Integer)
        Dim mycount As Integer = 0
        Dim mydata As String = "External_Course_Key|Course_Name|TERM_KEY|Course|Section|Org_Name|Org_Type|Category|Start_Date|End_Date|Template_Course_Key"

        Dim strsql As String = " Select  dbo.OL_MasterSweep.Sweep_ID, dbo.OL_MasterSweep.Term, dbo.OL_MasterSweep.CopyMark, dbo.OL_SweepDetails.MasterName, dbo.OL_SweepDetails.Designer, "
        strsql += "              dbo.OL_SweepDetails.NewMasterName, dbo.OL_SweepDetails.NewMasterSource, dbo.OL_SweepDetails.AltSource, dbo.OL_SweepDetails.Designer_ID As ID_ID, dbo.OL_SweepDetails.IsAlt "
        strsql += " From dbo.OL_MasterSweep Left Outer Join "
        strsql += "      dbo.OL_SweepDetails On dbo.OL_MasterSweep.Sweep_ID = dbo.OL_SweepDetails.Sweep_ID "
        strsql += " Where (dbo.OL_MasterSweep.Term = " & Session("NextTerm") & ") And (dbo.OL_MasterSweep.CopyMark = 1) And (dbo.OL_SweepDetails.IsAlt =" & myvalue & ")"
        'strsql += " And (OL_MasterAudit.AuditComplete Is Not null)"
        'strsql += " And  OL_MasterSweep.MasterName In ('2195_ACG2450_MC_VC')"
        Response.Write("<br>")
        Response.Write(strsql)
        Response.Write("<br>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        'myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()

        Dim thecount As Integer = 0
        Dim releasecount As Integer = 0
        Dim BBMastercourse As Integer = 0
        Dim UpdateStatuscount As Integer = 0
        If dr.HasRows Then
            While dr.Read()

                Response.Write(dr("NewMasterName"))
                thecount = thecount + 1   'set the count of records that can be copied


                Response.Write("<br>")
                mycount = mycount + 1
                Dim mystuff As String = ""


                mystuff += dr("NewMasterName") & "|"
                mystuff += dr("NewMasterName") & "|"
                mystuff += Session("NewMasterTerm") & "|"
                Dim thecourse As String = Replace(dr("NewMasterName"), Session("NewMasterTerm"), "")
                thecourse = Replace(thecourse, "_MC_VC", "")
                thecourse = Replace(thecourse, "_", "")
                mystuff += thecourse & "|"
                mystuff += "353|ONLN|VC_MC|College Credit|"
                mystuff += txtStart.Text & "|"
                mystuff += txtEnd.Text & "|"
                '''''''{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{    Modify to get altmastername if isalt = 1
                If myvalue = 1 Then
                    mystuff += dr("AltSource")
                Else
                    mystuff += dr("NewMasterSource")
                End If

                ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''testing for release record
                If doesMasterExist(dr("NewMasterName")) = False Then
                    BBMastercourse = BBMastercourse + 1
                    ''Response.Write("The master does Not exist")
                    SaveSIS(dr("NewMasterName"), dr("NewMasterSource"), mystuff)

                    mydata += "<br>"
                    mydata += mystuff
                End If
                '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''testing for createion of masterRelease record
                If doesReleaseExist(dr("MasterName")) = False Then
                    CreateRelease(dr("MasterName"), dr("NewMasterName"), dr("NewMasterSource"), Session("NextTerm"), "3-NotStarted", dr("Designer"), dr("ID_ID"))
                    'NOTE: Mark OL_MasterSweep copycomplete=1
                    MarkMasterSweep(dr("MasterName"))
                    releasecount = releasecount + 1
                End If
                Response.Write("<br>")

            End While
            Response.Write(thecount & "---------records marked ready for copy<br>")
            Response.Write(releasecount & "----new master release records created<br>")
            Response.Write(BBMastercourse & "----new records created in BBMastercourse<br>")
        End If
        If radioAction.SelectedValue = "Hold" Then
            lblData.Text = "DO NOT use this data >>>>>>>>>>>>>>>>>>>>>>><br>" & mydata

        Else
            lblData.Text = mydata
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()
        lblMycount.text = mycount
    End Sub

    Protected Sub MarkMasterSweep(ByVal mymastername As String)

        Dim strSQL As String = "Update OL_MasterSweep set "
        strSQL += " CopyComplete=1 ,"
        strSQL += " CopyDate='" & Now() & "'"

        strSQL += " Where MasterName = '" & mymastername & "'"


        Response.Write("MarkMasterSweep complete <br>" & strSQL & "<br>")


        Dim myNEWConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myNEWConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myNEWConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD.]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]...................
            If radioAction.SelectedValue = "Run" Then
                myCommand.ExecuteNonQuery()
            Else
                Response.Write("Hold")
            End If
        Catch
            ' failed to create a new record 
            Response.Write(" ThenFail")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try
        updateProgress(mymastername, Session("NextTerm"), "Copy")
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




    Protected Sub CreateRelease(ByVal mymastername As String, ByVal myNewMaster As String, ByVal myMasterSource As String, ByVal myTerm As Integer, ByVal myStatus As String, ByVal myDesigner As String, ByVal myID_ID As Integer)
        'response.Write(mymastername & "," & myNewMaster & "," & myMasterSource & "," & myTerm & "," & myStatus & "," & myDesigner & "," & myID_ID & "<br>")
        Dim strsql As String = " Insert Into OL_MasterRelease (MasterName,NewMasterName,CopySource,Term,DateCreated,ReleaseStatus,Designer,ID_ID) Values ('"
        strsql += mymastername & " ',' "
        strsql += myNewMaster & " ',' "
        strsql += myMasterSource & " ',"
        strsql += myTerm & " ,' "
        strsql += Now.ToShortDateString & " ',' "
        strsql += myStatus & " ',' "
        strsql += myDesigner & " ', "
        strsql += myID_ID & " ) "


        Response.Write("create release <br>" & strsql & "<br>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        Try

            myConnection.Open()
            'HOLD SQL HOLD..[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[................

            If radioAction.SelectedValue = "Run" Then
                myCommand.ExecuteNonQuery()
            Else
                Response.Write("Hold")
            End If
        Catch
            Response.Write("failed to create a New record <br>")
        Finally
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try




    End Sub


    Protected Function doesMasterExist(ByVal myReference As String) As Boolean
        'check to see if this master exists in the VC_VCdata BBMasterCourse table  NOTE this is not the VC_VCdata1 db -- connectionstring points to db
        Dim mysetup As Boolean = False
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select NewCourse from BBMasterCourse where NewCourse='" & myReference & "'", myConnection)
        'Response.Write("Select * from Section where SectionID=" & course)
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myFlag As String = ""
        If dr.Read() Then
            If Not IsDBNull(dr("NewCourse")) Then
                myFlag = dr("NewCourse")
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

    Protected Function doesReleaseExist(ByVal myReference As String) As Boolean
        'this checks to see if thee is a record in OL_MasterRelease for the Master of term NextTerm  
        'check to see if this master exists in the VC_VCdata BBMasterCourse table  NOTE this is not the VC_VCdata1 db -- connectionstring points to db
        Dim mysetup As Boolean = False
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select MasterName from OL_MasterRelease where MasterName='" & myReference & "'", myConnection)
        'Response.Write("Select * from Section where SectionID=" & course)
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myFlag As String = ""
        If dr.Read() Then
            If Not IsDBNull(dr("MasterName")) Then
                myFlag = dr("MasterName")
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



    Sub SaveSIS(ByVal strTextField1 As String, ByVal strTextField2 As String, ByVal strTextField3 As String)

        Dim strSQL As String = "Insert into BBMasterCourse(NewCourse,ContentSource,SIS_LINE,DateIn) " &
                               "VALUES ('" & strTextField1 &
                               "','" & strTextField2 &
                               "','" & strTextField3 &
                               "','" & Now() & "')"

        Response.Write("SisRecord<BR>" & strSQL & "<BR>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        Try

            myConnection.Open()
            'HOLD SQL HOLD.]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]].........................................
            If radioAction.SelectedValue = "Run" Then
                myCommand.ExecuteNonQuery()
            Else
                Response.Write("Hold")
            End If
        Catch
            Response.Write("failed to create a new record <br>")
        Finally
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try

    End Sub





End Class