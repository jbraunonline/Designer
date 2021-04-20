Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins

Public Class ProgressReport1
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Then
            ' Response.Redirect("~/Default.aspx")
        End If
        If Not Page.IsPostBack Then

        Else

        End If
        Dim NewCode As String
        Dim objMyMethod As DesignModule
        objMyMethod = New DesignModule
        NewCode = objMyMethod.getNextTerm
        Session("NextTerm") = NewCode
        Dim myThisTerm As String = objMyMethod.getThisTerm
        Session("ThisTerm") = myThisTerm
        Dim myNextTerm As String = objMyMethod.getNextTerm
        Session("NextTerm") = myNextTerm

        Dim mynewmasterterm As String = objMyMethod.getNewMasterTerm
        Session("NewMasterTerm") = mynewmasterterm
        lblTerm.Text = Session("NextTerm")
    End Sub

    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs)
        If (TypeOf e.Item Is GridDataItem AndAlso e.Item.OwnerTableView.DataSourceID = "SqlDataSource1") Then
            Dim lbl As Label = CType(e.Item.FindControl("numberLabel"), Label)
            lbl.Text = (e.Item.ItemIndex + 1).ToString
        End If
    End Sub
    Protected Function getphase(ByVal mymastername As String) As String
        Dim myreturn As String = ""
        Dim mycourse As String = mymastername
        mycourse = Replace(mymastername, Session("Nextterm") & "_", "")
        mycourse = Replace(mycourse, "_MC_VC", "")

        Return lookupPhase(mycourse)
    End Function

    Protected Function getPopUp(ByVal MyMaster As String) As String
        Dim myreturn As String = "Nada"
        Dim mycourse As String = MyMaster
        mycourse = Replace(mycourse, Session("Nextterm") & "_", "")
        mycourse = Replace(mycourse, "_MC_VC", "")
        myreturn = "<a href='popup.aspx?ID=" & mycourse & "' onclick=""centeredPopup(this.href,'myWindow','950','860','yes');return false"">History</a>"

        Return myreturn
    End Function

    Protected Function lookupPhase(ByVal mycourse As String) As String
        Dim myreturn As String = ""
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "SELECT term03  FROM OL_MasterPhase where Course='" & mycourse & "'"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("term03")) Then
                    Dim myvar As String
                    myreturn = dr("term03")
                End If


            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn


    End Function

    Protected Function getcount(ByVal mycourse As String) As String
        Dim mystatus As String = " <> 'X' "
        If lblSelect.Text = "Open" Then
            mystatus = " = 'A' "
        ElseIf lblSelect.Text = "All" Then
            mystatus = " <> 'X' "
        End If
        Dim myreturn As String = ""
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "SELECT count (*) as thecount   FROM [VC_VCData].[dbo].[CMR]  where term = '" & Session("NextTerm") & "' and status " & mystatus & " and type='E' and course = '" & mycourse & "'"
        'response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("thecount")) Then
                    Dim myvar As String
                    myreturn = dr("thecount")
                End If


            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        If lblSelect.Text = "Open" Then
            myreturn = "<font color = red>" & myreturn & "</font>"

        Else

        End If
        Return myreturn

    End Function

    Protected Function getActivecount(ByVal mycourse As String) As String
        Dim mystatus As String = ""

        mystatus = " = 'A' "

        Dim myreturn As String = ""
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "SELECT count (*) as thecount   FROM [VC_VCData].[dbo].[CMR]  where term = '" & Session("NextTerm") & "' and status " & mystatus & " and type='E' and course = '" & mycourse & "'"
        'response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("thecount")) Then
                    Dim myvar As String
                    myreturn = dr("thecount")
                End If


            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        If lblSelect.Text = "Open" Then
            myreturn = "<font color = red>" & myreturn & "</font>"

        Else

        End If
        Return myreturn

    End Function

    Protected Function getBB(ByVal mycourse As String) As String
        Dim myBBcount As String = ""

        Dim myreturn As String = ""
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim strsql As String
        strsql = "SELECT count (*) as thecount   FROM [VC_VCData].[dbo].[BBcourses]  where  "
        strsql += "(term_key = '" & Session("NextTerm") & "'and course = '" & mycourse & "' and  iscopytextwrite= 1) or (term_key = '" & Session("NextTerm") & "'and course = '" & mycourse & "' and ischild = 1)"



        'response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                If Not IsDBNull(dr("thecount")) Then
                    Dim myvar As String
                    myBBcount = CStr(dr("thecount"))
                End If


            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        myreturn = "<a href='BBpopup.aspx?Course=" & mycourse & "' onclick=""centeredPopup(this.href,'myWindow','950','860','yes');return false"">" & myBBcount & "</a>"
        Return myreturn

    End Function



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", "window.close()", True)
    End Sub



    Protected Sub btnAllSections_Click(sender As Object, e As EventArgs) Handles btnAllSections.Click
        lblSectionStatus.Text = "Section Count = All CMR sections not cancelled."
        lblSelect.Text = "All"
        RadGrid1.DataBind()
    End Sub

    Protected Sub btnOpenSections_Click(sender As Object, e As EventArgs) Handles btnOpenSections.Click
        lblSectionStatus.Text = "<font color = red>Section Count =  All CMR sections<b> OPEN for REGISTRATION</b></font>."
        lblSelect.Text = "Open" '
        RadGrid1.DataBind()
    End Sub
End Class