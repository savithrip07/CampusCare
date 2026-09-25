Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data.SqlClient
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class CampusCareService
    Inherits System.Web.Services.WebService
    <WebMethod()> _
    Public Function GetTotalIssues() As Integer
        Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
        Using con As New SqlConnection(connectionString)
            Dim query As String = "SELECT COUNT(*) FROM Complaints"
            Using cmd As New SqlCommand(query, con)
                con.Open()
                Return Convert.ToInt32(cmd.ExecuteScalar())
            End Using
        End Using
    End Function
    <WebMethod()> _
    Public Function GetPendingIssues() As Integer
        Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
        Using con As New SqlConnection(connectionString)
            Dim query As String = "SELECT COUNT(*) FROM Complaints WHERE Status = 'Pending'"
            Using cmd As New SqlCommand(query, con)
                con.Open()
                Return Convert.ToInt32(cmd.ExecuteScalar())
            End Using
        End Using
    End Function
    <WebMethod()> _
    Public Function GetInProgressIssues() As Integer
        Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
        Using con As New SqlConnection(connectionString)
            Dim query As String = "SELECT COUNT(*) FROM Complaints WHERE Status = 'In Progress'"
            Using cmd As New SqlCommand(query, con)
                con.Open()
                Return Convert.ToInt32(cmd.ExecuteScalar())
            End Using
        End Using
    End Function
    <WebMethod()> _
    Public Function GetResolvedIssues() As Integer
        Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
        Using con As New SqlConnection(connectionString)
            Dim query As String = "SELECT COUNT(*) FROM Complaints WHERE Status = 'Resolved'"
            Using cmd As New SqlCommand(query, con)
                con.Open()
                Return Convert.ToInt32(cmd.ExecuteScalar())
            End Using
        End Using
    End Function
End Class