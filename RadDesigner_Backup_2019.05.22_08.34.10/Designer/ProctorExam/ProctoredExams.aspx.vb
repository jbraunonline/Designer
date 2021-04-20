﻿Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class ProctoredExams
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Response.Write(Session("MasterAuditName"))
        lblMasterCourse.Text = Session("MasterCourse")

        GetData(Session("MasterCourse"))
        lblVerify.Text = getworkflow(Session("MasterCourse"), Session("NextTerm"), "Exam")
        lblOL_MasterProctor.Text = doesMasterExamExist(Session("MasterCourse"))
    End Sub
    Function getworkflow(ByVal mycourse As String, ByVal myTerm As Integer, myItem As String) As String
        Dim myreturn As String = "Not Verified"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT Exam  FROM OL_Progress where MasterName= '" & mycourse & "' And Term =" & myTerm
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If dr("Exam") = True Then
                    myreturn = "Verified"
                End If

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn
    End Function
    Protected Sub GetData(ByVal myID As String)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)

        Dim strsql As String
        strsql = "SELECT * FROM OL_MasterProctor Where MasterName= '" & myID & "'"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()


                ' 'lblTitle.text = 
                txtMidStart.Text = dr("MidStart")
                txtMidEnd.Text = dr("MidEnd")
                txtFinStart.Text = dr("FinStart")
                txtFinEnd.Text = dr("FinEnd")
                If dr("isMid") = 1 Then
                    radioMid.SelectedValue = "Yes"
                    lblIsMid.Text = "Yes"
                Else
                    radioMid.SelectedValue = "No"
                    lblIsMid.Text = "No"
                End If
                If dr("isFin") = 1 Then
                    radioFinal.SelectedValue = "Yes"
                    lblIsfin.Text = "Yes"

                Else
                    radioFinal.SelectedValue = "No"
                    lblIsfin.Text = "No"
                End If



            End While
        End If

        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub

    Protected Function doesMasterExamExist(ByVal mymastercourse As String) As String
        Dim myreturn As String = "False"



        Dim mySQL As String = "Select * from OL_MasterExam where mastername='" & mymastercourse & "'"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mySQL, myConnection)
        'Response.Write(mySQL & "<br>")
        'Response.Write("does sweep details exist <br>")
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myFlag As String = ""
        If dr.Read() Then
            If Not IsDBNull(dr("MasterName")) Then
                myFlag = dr("MasterName")
                If Len(myFlag) > 2 Then
                    myreturn = "True"
                End If
            Else
                myreturn = "False"


            End If
        Else
            CreateRecord(Session("MasterCourse"))
            Response.Write("Oh Crap")
        End If

        dr.Close()
        myConnection.Close()
        'Response.Write("<br>" & CStr(mysetup) & "<br>")

        Return myreturn
    End Function

    Protected Sub CreateRecord(ByVal myMasterName As String)
        Dim mycourse As String = Replace(myMasterName, Session("NextTerm") & "_", "")
        mycourse = Replace(mycourse, "_MC_VC", "")
        Dim strSQL As String = "INSERT INTO OL_MasterExam "
        strSQL += "(Mastername,Term,Course,PM_Exists,PF_Exists) "

        strSQL += "VALUES ('"

        strSQL += myMasterName & "','"
        strSQL += Session("NextTerm") & "','"
        strSQL += mycourse & "',"
        strSQL += getIs(Session("Mastercourse"), "IsMid") & ","

        strSQL += getIs(Session("Mastercourse"), "IsFin") & ")"


        Response.Write(strSQL)



        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1

            'HOLD SQL HOLD.}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
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


    End Sub

    Protected Function getIs(ByVal mymastercourse As String, ByVal myfield As String) As Integer
        Dim myreturn As Integer = 0

        Dim mysql = "SELECT " & myfield & " FROM OL_MasterProctor Where MasterName= '" & mymastercourse & "'"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mysql, myConnection)
        'Response.Write(mysql & "<br>")
        'Response.Write("does sweep details exist <br>")
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)

        If dr.Read() Then
            'Response.Write(dr(myfield) & "<br>")

            If dr(myfield) = 1 Then
                myreturn = 1
            End If




        Else

            End If

        dr.Close()
        myConnection.Close()
        'Response.Write("<br>" & CStr(mysetup) & "<br>")

        Return myreturn
    End Function

End Class