Imports System.Data.SqlClient
Partial Class MyComplaints
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing OrElse Session("Role") Is Nothing Then
            Response.Redirect("Login.aspx")
            Return
        End If
        If Session("Role").ToString() <> "Student" Then
            Response.Redirect("AdminDashboard.aspx")
            Return
        End If
        If Not IsPostBack Then
            lblWelcome.Text = "Here are the issues you have submitted."
            LoadComplaints()
        End If
    End Sub
    Private Sub LoadComplaints()
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "SELECT ComplaintID, Title, Category, Description, Location, Status, ComplaintDate FROM Complaints WHERE UserID = @UserID ORDER BY ComplaintDate DESC"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@UserID", Session("UserID"))
                    Using da As New SqlDataAdapter(cmd)
                        Dim dt As New Data.DataTable()
                        da.Fill(dt)
                        gvComplaints.DataSource = dt
                        gvComplaints.DataBind()
                    End Using
                End Using
            End Using
        Catch ex As Exception
            lblWelcome.Text = "Unable to load your issues at the moment. Please try again."
            gvComplaints.DataSource = Nothing
            gvComplaints.DataBind()
        End Try
    End Sub
    Protected Sub gvComplaints_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvComplaints.RowCommand
        Try
            If e.CommandName = "EditComplaint" Then
                Dim complaintID As Integer = Convert.ToInt32(e.CommandArgument)
                Response.Redirect("EditComplaint.aspx?ComplaintID=" & complaintID)
            ElseIf e.CommandName = "DeleteComplaint" Then
                Dim complaintID As Integer = Convert.ToInt32(e.CommandArgument)
                DeleteComplaint(complaintID)
                LoadComplaints()
            End If
        Catch ex As FormatException
            lblWelcome.Text = "Invalid issue ID."
        Catch ex As Exception
            lblWelcome.Text = "Unable to process the request at the moment. Please try again."
        End Try
    End Sub
    Private Sub DeleteComplaint(ByVal complaintID As Integer)
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "DELETE FROM Complaints WHERE ComplaintID = @ComplaintID AND UserID = @UserID"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@ComplaintID", complaintID)
                    cmd.Parameters.AddWithValue("@UserID", Session("UserID"))
                    con.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch
            Throw
        End Try
    End Sub
    Protected Function GetStatusClass(ByVal status As String) As String
        If status = "Pending" Then
            Return "status status-pending"
        ElseIf status = "In Progress" Then
            Return "status status-progress"
        ElseIf status = "Resolved" Then
            Return "status status-resolved"
        Else
            Return "status"
        End If
    End Function
End Class