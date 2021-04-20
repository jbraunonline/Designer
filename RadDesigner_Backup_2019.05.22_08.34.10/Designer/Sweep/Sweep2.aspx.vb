Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class Sweep2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Response.Write(doesSweepDetailsExist(Session("Sweep_ID")))

            If Request("ID") = "update" Then
                lblUpdate.Visible = True
                lblUpdate.Text = "This course has been released for copying."
                btnSave.Visible = False
                btnMistake.Visible = True

            End If
            If Request("ID") = "cancel" Then
                lblUpdate.Visible = True

                lblUpdate.Text = "Copy was cancelled, update the data and Release it again."
            End If
            'lblCurrentMaster.Text = Session("SweepMasterName")
            'lblNewContent.Text = Session("SweepMasterName")
            'Dim newMaster As String
            'newMaster = Replace(Session("SweepMasterName"), Session("NextTerm"), Session("NewMasterTerm"))
            'lblNewMasterCourse.Text = newMaster
            LoadData(Session("Sweep_ID"))
        End If
    End Sub

    Protected Sub chkIsAlt_CheckedChanged(sender As Object, e As EventArgs) Handles chkIsAlt.CheckedChanged
        If chkIsAlt.Checked = True Then '
            txtAltSource.Visible = True
        Else
            txtAltSource.Visible = False
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        UpdateData()
    End Sub
    Protected Function doesSweepDetailsExist(ByVal mysweepID As Integer) As Boolean
        'check to see if this master exists in the VC_VCdata BBMasterCourse table  NOTE this is not the VC_VCdata1 db -- connectionstring points to db
        Dim mysetup As Boolean = False
        Dim mySQL As String = "Select * from OL_SweepDetails where Sweep_ID=" & mysweepID
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mySQL, myConnection)
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

    Protected Sub LoadData(ByVal mySweepID As Integer)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myreturn As String = "Unknown"
        Dim strsql As String
        strsql = "SELECT MasterName,NewMasterName,NewMasterSource,IsAlt,AltSource,AltNotes,BBreadytoCopy FROM OL_SweepDetails where Sweep_ID=" & mySweepID
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()

                lblCurrentMaster.Text = dr("MasterName")

                If Not IsDBNull(dr("NewMasterName")) Then
                    lblNewMasterCourse.Text = dr("NewMasterName")
                Else
                    lblNewMasterCourse.Text = Replace(dr("MasterName"), Session("NextTerm"), Session("NewMasterTerm"))
                End If


                If Not IsDBNull(dr("NewMasterSource")) Then
                    lblNewContent.Text = dr("NewMasterSource")
                Else
                    lblNewContent.Text = dr("MasterName")
                End If

                If Not IsDBNull(dr("IsAlt")) Then
                    chkIsAlt.Checked = dr("IsAlt")
                Else
                    chkIsAlt.Checked = False
                End If

                If Not IsDBNull(dr("IsAlt")) Then
                    If dr("IsAlt") = True Then
                        txtAltSource.Visible = True
                    End If
                End If

                If Not IsDBNull(dr("AltSource")) Then
                    If dr("IsAlt") = True Then
                        txtAltSource.Text = dr("AltSource")
                        lblNewContent.Text = dr("AltSource")
                    End If

                Else
                End If

                If Not IsDBNull(dr("AltNotes")) Then
                    txtAltNotes.Content = dr("AltNotes")
                Else
                End If

                If Not IsDBNull(dr("BBreadytoCopy")) Then

                    If dr("BBreadytoCopy") = True Then
                        lblPageStatus.Text = "This course has been released for copy"
                        btnUpdate.Visible = False
                        btnMistake.Visible = True
                    Else
                        btnUpdate.Visible = True
                    End If
                Else
                    lblPageStatus.Text = "This data has not been saved."
                    btnSave.Visible = True
                End If




                '

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()






    End Sub

    Protected Sub UpdateData()
        Dim strSQL As String = "Update OL_SweepDetails set "
        strSQL += "NewMasterName ='" & lblNewMasterCourse.Text & "',"
        strSQL += "NewMasterSource ='" & lblNewContent.Text & "',"
        If chkIsAlt.Checked = True Then
            strSQL += "IsAlt=1,"
        Else
            strSQL += "IsAlt=0,"
        End If
        strSQL += "AltSource ='" & txtAltSource.Text & "',"
        strSQL += "AltNotes ='" & txtAltNotes.Content & "',"
        strSQL += "BBReadytoCopy =1,"
        strSQL += "BBReleaseDate ='" & DateTime.Now.ToShortDateString & "'"
        strSQL += " Where Sweep_ID=" & Session("Sweep_ID")
        'Response.Write(strSQL & "--<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

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
        UpdateMasterSweep()
        updateProgress(Session("SweepMasterName"), Session("NextTerm"), "Sweep")
        lblPageStatus.Text = "Sweep Complete - Updated: " & Now.ToShortDateString
        lblPageStatus.Visible = True
        Response.Redirect("Sweep2.aspx?ID=update")

    End Sub

    Public Sub UpdateMasterSweep()

        Dim strSQL As String = "Update OL_MasterSweep set "
        strSQL += " SweepStatus='1-Complete', "
        strSQL += " SweepComplete='" & DateTime.Now.ToShortDateString & "',"
        strSQL += "CopyMark = 1 "
        strSQL += " Where MasterName = '" & Session("SweepMasterName") & "'"


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

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click

        UpdateData()

    End Sub

    Protected Sub btnMistake_Click(sender As Object, e As EventArgs) Handles btnMistake.Click
        UpdateMasterMistake()
        UpdateDetailsMistake()
        Response.Redirect("Sweep2.aspx?ID=cancel")
    End Sub

    Protected Sub UpdateDetailsMistake()
        Dim strSQL As String = "Update OL_SweepDetails set "
        strSQL += "NewMasterName = NULL,"
        strSQL += "NewMasterSource = NULL,"
        strSQL += "IsAlt = NULL,"
        strSQL += "AltSource = NULL,"
        strSQL += "AltNotes = NULL,"
        strSQL += "BBReadytoCopy = NULL,"
        strSQL += "BBReleaseDate = NULL"
        strSQL += " Where Sweep_ID=" & Session("Sweep_ID")
        '.Write(strSQL & "--<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

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

        lblPageStatus.Text = "Sweep Complete - Updated: " & Now.ToShortDateString
        lblPageStatus.Visible = True
        'Response.Redirect("Sweep2.aspx")

    End Sub

    Protected Sub UpdateMasterMistake()

        Dim strSQL As String = "Update OL_MasterSweep set "
        strSQL += " SweepStatus='2-InProgress', "
        strSQL += " SweepComplete=Null,"
        strSQL += "CopyMark = 0 "
        strSQL += " Where Sweep_ID=" & Session("Sweep_ID")


        'Response.Write(strSQL & "<br>")


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

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
        lblPageStatus.Text = "Sweep Complete - Updated: " & Now.ToShortDateString
        lblPageStatus.Visible = True


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
        ' Response.Redirect("VerifyExams.aspx")

    End Sub





End Class