Imports System.Data
Imports System.Data.SqlClient

Public Class AddExamPasswords
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim Num1 As Integer = 999
        Dim Num2 As Integer = 1999
        Dim Num3 As Integer = 2999
        Dim Num4 As Integer = 3999
        Dim Num5 As Integer = 4999
        Dim Num6 As Integer = 5999

        Dim Word1 As String = "pain"
        Dim Word2 As String = "gain"

        Dim Mid1_LPass As String = ""
        Dim Final1_LPass As String = ""
        Dim MidA_LPass As String = ""
        Dim FinalA_LPass As String = ""
        Dim MidB_LPass As String = ""
        Dim FinalB_LPass As String = ""

        Dim Mid1_RPass As String = ""
        Dim Final1_RPass As String = ""
        Dim MidA_RPass As String = ""
        Dim FinalA_RPass As String = ""
        Dim MidB_RPass As String = ""
        Dim FinalB_RPass As String = ""

        Dim myDataset As New DataSet()
        myDataset = GetCourses()

        For Each dr In myDataset.Tables(0).Rows

            Num1 = Num1 + 1
            Num2 = Num2 + 1
            Num3 = Num3 + 1
            Num4 = Num4 + 1
            Num5 = Num5 + 1
            Num6 = Num6 + 1
            Dim strSql As String = "Update MasterExamDates set "

            Response.Write(Word1 & Num1.ToString & "<br>")
            Mid1_LPass = Word1 & Num1.ToString
            Response.Write(Word2 & Num1.ToString & "<br>")
            Mid1_RPass = Word2 & Num1.ToString

            Response.Write(Word1 & Num2.ToString & "<br>")
            Final1_LPass = Word1 & Num2.ToString
            Response.Write(Word2 & Num2.ToString & "<br>")
            Final1_RPass = Word2 & Num2.ToString

            Response.Write(Word1 & Num3.ToString & "<br>")
            MidA_LPass = Word1 & Num3.ToString
            Response.Write(Word2 & Num3.ToString & "<br>")
            MidA_RPass = Word2 & Num3.ToString

            Response.Write(Word1 & Num4.ToString & "<br>")
            FinalA_LPass = Word1 & Num4.ToString
            Response.Write(Word2 & Num4.ToString & "<br>")
            FinalA_RPass = Word2 & Num4.ToString

            Response.Write(Word1 & Num5.ToString & "<br>")
            MidB_LPass = Word1 & Num5.ToString
            Response.Write(Word2 & Num5.ToString & "<br>")
            MidB_RPass = Word2 & Num5.ToString

            Response.Write(Word1 & Num6.ToString & "<br>")
            FinalB_LPass = Word1 & Num6.ToString
            Response.Write(Word2 & Num6.ToString & "<br>")
            FinalB_RPass = Word2 & Num6.ToString


            Response.Write("<br>")
            Response.Write(dr("Course") & "<br>")
            Response.Write("Mid1_LPass= " & Mid1_LPass & "<br>")
            Response.Write("Final1_LPass= " & Final1_LPass & "<br>")
            Response.Write("MidA_LPass= " & MidA_LPass & "<br>")
            Response.Write("FinalA_LPass= " & FinalA_LPass & "<br>")
            Response.Write("MidB_LPass= " & MidB_LPass & "<br>")
            Response.Write("FinalB_LPass= " & FinalB_LPass & "<br>")
            Response.Write("<br>")
            Response.Write("Mid1_RPass= " & Mid1_RPass & "<br>")
            Response.Write("Final1_RPass= " & Final1_RPass & "<br>")
            Response.Write("MidA_RPass= " & MidA_RPass & "<br>")
            Response.Write("FinalA_RPass= " & FinalA_RPass & "<br>")
            Response.Write("MidB_RPass= " & MidB_RPass & "<br>")
            Response.Write("FinalB_RPass= " & FinalB_RPass & "<br>")
            Response.Write("<br>")

            strSql += "Mid1_LPass='" & Mid1_LPass & "',"
            strSql += "Final1_LPass='" & Final1_LPass & "',"
            strSql += "MidA_LPass='" & MidA_LPass & "',"
            strSql += "FinalA_LPass='" & FinalA_LPass & "',"
            strSql += "MidB_LPass='" & MidB_LPass & "',"
            strSql += "FinalB_LPass='" & FinalB_LPass & "',"

            strSql += "Mid1_RPass='" & Mid1_RPass & "',"
            strSql += "Final1_RPass='" & Final1_RPass & "',"
            strSql += "MidA_RPass='" & MidA_RPass & "',"
            strSql += "FinalA_RPass='" & FinalA_RPass & "',"
            strSql += "MidB_RPass='" & MidB_RPass & "',"
            strSql += "FinalB_RPass='" & FinalB_RPass & "'"
            strSql += " Where course ='" & dr("Course") & "'"
            Response.Write(strSql & "<br><br>")
            UpdateMasterExam(strSql)
        Next
    End Sub

    Function GetCourses() As DataSet
        Dim strSQL As String = "SELECT Course  FROM [VC_VCData].[dbo].[MasterExamDates]"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlDataAdapter(strSQL, myConnection)

        ' Create and Fill the DataSet
        Dim myDataSet As New DataSet()
        myCommand.Fill(myDataSet)
        myConnection.Close()
        ' Return the DataSet
        Return myDataSet

    End Function

    Private Sub UpdateMasterExam(ByVal mySQL As String)


        Response.Write(mySQL & "<br>")


        Dim myNEWConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mySQL, myNEWConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myNEWConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD..[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[_HOLD_[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[..
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record 
            Response.Write("<br><font color=red> Fail**********************************************************************************<br></font>")
        Finally


            'Close the Connection
            If myNEWConnection.State = ConnectionState.Open Then
                myNEWConnection.Close()
            End If

        End Try


    End Sub


End Class