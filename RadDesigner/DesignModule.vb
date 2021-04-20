Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO



Public Class DesignModule
    Implements IHttpModule

    Private WithEvents _context As HttpApplication

    ''' <summary>
    '''  You will need to configure this module in the Web.config file of your
    '''  web and register it with IIS before being able to use it. For more information
    '''  see the following link: http://go.microsoft.com/?linkid=8101007
    ''' </summary>
#Region "IHttpModule Members"

    Public Sub Dispose() Implements IHttpModule.Dispose

        ' Clean-up code here

    End Sub

    Public Sub Init(ByVal context As HttpApplication) Implements IHttpModule.Init
        _context = context
    End Sub

#End Region

    Public Sub OnLogRequest(ByVal source As Object, ByVal e As EventArgs) Handles _context.LogRequest

        ' Handles the LogRequest event to provide a custom logging 
        ' implementation for it

    End Sub

    Public Function getThisTerm() As String
        Dim myreturn As String = "2213"
        Return myreturn
    End Function

    Public Function getNextTerm() As String
        Dim myreturn As String = "2215"
        Return myreturn
    End Function


    Public Function getNewMasterTerm() As String
        Dim myreturn As String = "2217"
        Return myreturn
    End Function


    Public Function getCourseByID(ByVal myID As String) As String
        Using myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
            Dim myreturn As String = "Not Founc"
            Dim strsql As String
            strsql = "SELECT CourseNo FROM course Where CourseID=" & myID

            Dim myCommand As New SqlCommand(strsql, myConnection)

            ' Open the connection and execute the Command
            myConnection.Open()
            Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
            If dr.HasRows Then
                While dr.Read()
                    myreturn = dr("CourseNo")
                End While
            End If
            Return myreturn
            dr.Close()
            dr = Nothing
        End Using


    End Function

    Function getINI(ByVal mypage As String, ByVal myItem As String) As String
        Dim myreturn As String = ""
        Dim strSQL As String = "SELECT Value"
        strSQL += " FROM  dbo.VC_INI "
        strSQL += "WHERE (Page = '" & mypage & "' and item='" & myItem & "')"
        ' Create Instance of Connection and Command Object
        Using myConnection As New SqlConnection(ConfigurationManager.AppSettings("ConnectionString"))
            Dim myCommand As New SqlCommand(strSQL, myConnection)

            ' Open the connection and execute the Command
            myConnection.Open()
            Using dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
                While dr.Read
                    If Not IsDBNull(dr("value")) Then
                        myreturn = dr("Value")
                    End If
                End While
                myConnection.Close()


            End Using
        End Using
        Return myreturn
    End Function





End Class
