<%@ Page Language="VB" debug="True" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.SQLClient" %>
<%@ import Namespace="System.Configuration" %>
<%@ import Namespace="System.IO" %>
<script runat="server">

    Sub Page_Load(Source As Object, E As EventArgs)
        pnlFileInfo.Visible = True
        Server.ScriptTimeout = 1320
    End Sub

    Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)

        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("BBMasterShells.txt"))
        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType

        pnlHome.Visible = False
        pnlFileInfo.Visible = True


    End Sub






    Protected Sub BtnInput_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim myflag As Integer
        Dim fileStream As FileStream = File.Open(Server.MapPath("BBMasterShells.txt"), FileMode.Open, FileAccess.Read)
        Dim streamReader As StreamReader = New StreamReader(fileStream)
        Dim nLine As Integer = 0
        Response.Write("External_Course_Key|Course_Name|TERM_KEY|Course|Section|Org_Name|Org_Type|Category|Start_Date|End_Date|Template_Course_Key<br>")
        While (streamReader.Peek() > -1)

            Dim strLine As String = streamReader.ReadLine()
            strLine = Replace(strLine, ",", "|")
            myflag = 1

            'nLine = nLine + 1
            'Response.Write(nLine)

            If (strLine = "") Then
                Response.Write("Force quit")
                Exit While
            End If
            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar("|"))
            Dim SIS_LINE As String = ""

            If astrValues.Length = 2 Then
                'Response.Write("we got 2 fields<br>")
                If doesMasterExist(astrValues(1)) = False Then

                    'Response.Write("<br>")
                    Response.Write(astrValues(1))
                    Response.Write("|")
                    SIS_LINE += astrValues(1) & "|"

                    Response.Write(astrValues(1))
                    Response.Write("|")
                    SIS_LINE += astrValues(1) & "|"

                    Response.Write(txtTerm.Text)
                    Response.Write("|")
                    SIS_LINE += txtTerm.Text & "|"

                    Dim mystring As String = astrValues(1)
                    Dim substring As String = Mid(mystring, 7, 8)
                    substring = Replace(substring, "_", "")
                    Response.Write(substring)
                    Response.Write("|")
                    SIS_LINE += substring & "|"

                    Response.Write("353")
                    Response.Write("|")
                    SIS_LINE += "353|"

                    Response.Write("ONLN")
                    Response.Write("|")
                    SIS_LINE += "ONLN|"

                    Response.Write("VC_MC")
                    Response.Write("|")
                    SIS_LINE += "VC_MC|"

                    Response.Write("College Credit")
                    Response.Write("|")
                    SIS_LINE += "College Credit|"


                    Response.Write("20180101")
                    Response.Write("|")
                    SIS_LINE += "20180101|"

                    Response.Write("20171231")
                    Response.Write("|")
                    SIS_LINE += "20171231|"

                    Response.Write(astrValues(0))
                    SIS_LINE += astrValues(0)

                    Response.Write("<br>")
                    ''Response.Write(SIS_LINE & "<br>")
                    SaveSIS(astrValues(1), astrValues(0), SIS_LINE)

                End If

                If chkReCopy.Checked = True Then
                    'Response.Write("<br>")
                    'Response.Write(astrValues(1))
                    'Response.Write("|")
                    SIS_LINE += astrValues(1) & "|"

                    'Response.Write(astrValues(1))
                    'Response.Write("|")
                    SIS_LINE += astrValues(1) & "|"

                    'Response.Write(txtTerm.Text)
                    'Response.Write("|")
                    SIS_LINE += txtTerm.Text & "|"

                    Dim mystring As String = astrValues(1)
                    Dim substring As String = Mid(mystring, 6, 8)
                    substring = Replace(substring, "_", "")
                    ' Response.Write(substring)
                    'Response.Write("|")
                    SIS_LINE += substring & "|"

                    'Response.Write("353")
                    'Response.Write("|")
                    SIS_LINE += "353|"

                    'Response.Write("ONLN")
                    'Response.Write("|")
                    SIS_LINE += "ONLN|"

                    'Response.Write("VC_MC")
                    'Response.Write("|")
                    SIS_LINE += "VC_MC|"

                    'Response.Write("College Credit")
                    'Response.Write("|")
                    SIS_LINE += "College Credit|"


                    'Response.Write("20150101")
                    'Response.Write("|")
                    SIS_LINE += "20160101|"

                    'Response.Write("20151231")
                    'Response.Write("|")
                    SIS_LINE += "20161231|"

                    'Response.Write(astrValues(0))
                    SIS_LINE += astrValues(0)
                    Response.Write(SIS_LINE)

                End If

                'Response.Write("<B> ERROR Line " & nLine.ToString() & ":</B>" & strLine & "<br>")

            End If


        End While

        streamReader.Close()
        fileStream.Close()
    End Sub

    Function doesMasterExist(ByVal myReference As String) As Boolean
        Dim mysetup As Boolean = False
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("select NewCourse from BBMasterCourse where NewCourse='" & myReference & "'", myConnection)
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

    Sub SaveSIS(ByVal strTextField1 As String, ByVal strTextField2 As String, ByVal strTextField3 As String)

        Dim strSQL As String = "Insert into BBMasterCourse(NewCourse,ContentSource,SIS_LINE,DateIn) " & _
                               "VALUES ('" & strTextField1 & _
                               "','" & strTextField2 & _
                               "','" & strTextField3 & _
                               "','" & Now() & "')"

        Response.Write("<BR>" & strSQL & "<BR>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        Try

            myConnection.Open()
            'HOLD SQL HOLD........................................................................
            'myCommand.ExecuteNonQuery()
        Catch
            Response.Write("failed to create a new record <br>")
        Finally
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try

    End Sub




    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("http://virtual.mdc.edu/virtualadmin/live")
    End Sub

    Protected Sub btnGetData_Click(sender As Object, e As EventArgs)
        'Get data from OL_SweepDetails
        'loop through data and create the upload text
        'save the new course data
        'Mark OL+Sweepdetails that the course was created.
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String

        strsql = "Select [Sweep_ID] ,[MasterName] FROM [VC_VCData1].[dbo].[OL_MasterSweep] "
        strsql += "where copyMark = 1 And term ='2185' "

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        'myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()


                Response.Write(dr("MasterName") & "|")
                Response.Write(dr("Sweep_ID"))
                Response.Write("<br>")
                Response.Write(getNewMaster(dr("Sweep_ID")))
                Response.Write("<br>")
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub
    Private Function getNewMaster(ByVal myID As Integer) As String
        Dim myreturn As String = ""
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)


        Dim strsql As String

        strsql = "Select NewMasterName, NewMasterSource FROM OL_SweepDetails "
        strsql += "where Sweep_ID= " & myID

        Dim myCommand As New SqlCommand(strsql, myConnection)
        myCommand.Connection.Open()
        ' Open the connection and execute the Command
        'myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader()


        If dr.HasRows Then
            While dr.Read()


                myreturn = dr("NewMasterName") & "|"
                myreturn += dr("NewMasterSource")


            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

        Return myreturn
    End Function
</script>
<html>
<head>
    <style type="text/css">
        .style2
        {
            text-decoration: underline;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .style3
        {
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style4
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .style7
        {
            font-family: Arial, Helvetica, sans-serif;
        }
        .style8
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-small;
        }
        </style>
</head>
<body>
    <form method="post" enctype="multipart/form-data" runat="server">
        <p class="style3">
            <strong>This form creates SIS input&nbsp; for new 
            <br />
            Blackboard Master Courses</strong> from specified existing Master Course<p 
            class="style4">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="Return to Index" />
        <p>
            <span class="style2"><strong>Data format exptected</strong></span><span 
                class="style4">:</span><p class="style7">
            <strong>ContentSource|NEWcourse</strong><p>
            <span class="style4">ContentSource_Course_Key|New Master_Course_Key</span><p>
            <span class="style8">
            <a href="http://virtual.mdc.edu/filewriter/bbdb/bbmastershells.txt"><strong>SAMPLE</strong></a></span><br /><br />
            <asp:Panel id="pnlHome" Visible="True" Runat="Server">
                <div align="left">
                    <table cellspacing="0" cellpadding="4" width="580" border="0">
                        <tbody>
                            <tr>
                                <td bgcolor="#ff0000">
                                    <b><font face="Arial" color="#ffffff" size="3"> Upload </font><font face="Arial" color="#ffffff" size="2">Raw
                                    Data File</font><font face="Arial" color="#ffffff" size="2">.</font></b></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <p>
                    <asp:Label id="lblUploadText" runat="server" font-size="X-Small" font-names="Arial">Select
                    the file to upload:</asp:Label>
                    <input id="UploadFile" type="file" name="UploadFile" runat="server" />
                    <br />
                    <asp:Button id="btnSubmit" onclick="btnSubmit_Click" runat="server" Text="Submit"></asp:Button>
                </p>
                <!-- Insert content here -->
                <p align="left">
                    &nbsp;</p>
            </asp:Panel>
            <asp:Panel id="pnlFileInfo" Visible="False" Runat="Server" Width="1047px">
                <span class="style7">File Uploaded As:</span><asp:Label id="lblFileName" 
                    runat="Server" CssClass="style7"></asp:Label>
                <br class="style7" />
                <span class="style7">Size:</span><asp:Label id="lblFileSize" runat="Server" 
                    CssClass="style7"></asp:Label>
                <br class="style7" />
                <span class="style7">Type:</span><asp:Label id="lblFileContentType" 
                    runat="Server" CssClass="style7"></asp:Label>
                <br class="style7" />
                <br class="style7" />
                Enter a term for these master courses&nbsp;<asp:TextBox ID="txtTerm" 
                    runat="server">20152</asp:TextBox>
                <br class="style7" />
                <asp:CheckBox ID="chkReCopy" runat="server" 
                    Text="This is a re-copy of   a course previously created." />
                <br />
                <br />
&nbsp;
                <asp:Button ID="BtnInput" runat="server" onclick="BtnInput_Click" 
                    Text="Get Data" />
&nbsp;
                <asp:Button ID="btnGetData" runat="server" OnClick="btnGetData_Click" Text="GetData" />
                </asp:Panel>
            &nbsp;
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>

</body>
</html>