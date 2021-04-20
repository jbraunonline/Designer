Public Class Debug
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write(Session("MasterAuditName"))
        Response.Write(" MasterAuditName<br>")

        Response.Write(Session("Audit_ID"))
        Response.Write(" AuditID<br>")

        Dim strsql As String
        strsql = "Select  * from OL_Auditmanagement Where Audit_ID=" & Session("Audit_ID")

        'Response.Write(strsql)
        Response.Write("<br>")

        Dim strsql2 As String
        strsql2 = "SELECT AuditStatus FROM OL_MasterAudit Where MasterName= '" & Session("MasterAuditName") & "'"
        'Response.Write(strsql2)
        Response.Write("<br>")
        Response.Write("Session Variables<br>")
        Dim strSesVar As String
        For Each strSesVar In Session.Keys
            Response.Write(strSesVar + " : " + Session(strSesVar).ToString() + "<br>")
        Next

        Response.Write("<br><br>END")
    End Sub

End Class