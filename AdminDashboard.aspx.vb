Imports System.Data.SqlClient
Partial Class AdminDashboard
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing OrElse Session("Role") Is Nothing Then
            Response.Redirect("Login.aspx")
            Return
        End If
        If Session("Role").ToString() <> "Admin" Then
            Response.Redirect("Dashboard.aspx")
            Return
        End If
        If Not IsPostBack Then
            If Session("UserName") IsNot Nothing Then
                lblAdminName.Text = Session("UserName").ToString()
            End If
            LoadCounts()
        End If
    End Sub
    Private Sub LoadCounts()
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                con.Open()
                Dim totalQuery As String = "SELECT COUNT(*) FROM Complaints"
                Using cmd As New SqlCommand(totalQuery, con)
                    lblTotalCount.Text = cmd.ExecuteScalar().ToString()
                End Using
                Dim pendingQuery As String = "SELECT COUNT(*) FROM Complaints WHERE Status = 'Pending'"
                Using cmd As New SqlCommand(pendingQuery, con)
                    lblPendingCount.Text = cmd.ExecuteScalar().ToString()
                End Using
                Dim progressQuery As String = "SELECT COUNT(*) FROM Complaints WHERE Status = 'In Progress'"
                Using cmd As New SqlCommand(progressQuery, con)
                    lblProgressCount.Text = cmd.ExecuteScalar().ToString()
                End Using
                Dim resolvedQuery As String = "SELECT COUNT(*) FROM Complaints WHERE Status = 'Resolved'"
                Using cmd As New SqlCommand(resolvedQuery, con)
                    lblResolvedCount.Text = cmd.ExecuteScalar().ToString()
                End Using
            End Using
        Catch ex As Exception
            lblTotalCount.Text = "0"
            lblPendingCount.Text = "0"
            lblProgressCount.Text = "0"
            lblResolvedCount.Text = "0"
        End Try
    End Sub
    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogout.Click
        Session.Clear()
        Session.Abandon()
        Response.Redirect("Login.aspx")
    End Sub
End Class