Imports System.Data.SqlClient
Partial Class AdminComplaints
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
            Dim statusFilter As String = Request.QueryString("Status")
            If statusFilter IsNot Nothing AndAlso statusFilter <> "" Then
                lblTitle.Text = statusFilter & " Issues"
            Else
                lblTitle.Text = "All Issues"
            End If
            LoadComplaints()
        End If
    End Sub
    Private Sub LoadComplaints()
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim statusFilter As String = Request.QueryString("Status")
                Dim query As String
                If statusFilter IsNot Nothing AndAlso statusFilter <> "" Then
                    query = "SELECT c.ComplaintID, u.Name AS StudentName, c.Title, c.Category, c.Description, c.Location, c.Status, c.ComplaintDate " &
                            "FROM Complaints c " &
                            "INNER JOIN Users u ON c.UserID = u.UserID " &
                            "WHERE c.Status = @Status " &
                            "ORDER BY c.ComplaintDate DESC"
                Else
                    query = "SELECT c.ComplaintID, u.Name AS StudentName, c.Title, c.Category, c.Description, c.Location, c.Status, c.ComplaintDate " &
                            "FROM Complaints c " &
                            "INNER JOIN Users u ON c.UserID = u.UserID " &
                            "ORDER BY c.ComplaintDate DESC"
                End If
                Using cmd As New SqlCommand(query, con)
                    If statusFilter IsNot Nothing AndAlso statusFilter <> "" Then
                        cmd.Parameters.AddWithValue("@Status", statusFilter)
                    End If
                    Using da As New SqlDataAdapter(cmd)
                        Dim dt As New Data.DataTable()
                        da.Fill(dt)
                        gvComplaints.DataSource = dt
                        gvComplaints.DataBind()
                    End Using
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "Unable to load issues at the moment. Please try again."
            gvComplaints.DataSource = Nothing
            gvComplaints.DataBind()
        End Try
    End Sub
    Protected Sub gvComplaints_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvComplaints.RowCommand
        If e.CommandName = "UpdateStatus" Then
            Try
                Dim complaintID As Integer = Convert.ToInt32(e.CommandArgument)
                Dim row As System.Web.UI.WebControls.GridViewRow = CType(CType(e.CommandSource, System.Web.UI.WebControls.Button).NamingContainer, System.Web.UI.WebControls.GridViewRow)
                Dim ddlStatus As System.Web.UI.WebControls.DropDownList = CType(row.FindControl("ddlStatus"), System.Web.UI.WebControls.DropDownList)
                Dim newStatus As String = ddlStatus.SelectedValue
                UpdateComplaintStatus(complaintID, newStatus)
                lblMessage.Text = "Issue status updated successfully."
                LoadComplaints()
            Catch ex As FormatException
                lblMessage.Text = "Invalid issue ID."
            Catch ex As Exception
                lblMessage.Text = "Unable to update the issue status at the moment. Please try again."
            End Try
        End If
    End Sub
    Private Sub UpdateComplaintStatus(ByVal complaintID As Integer, ByVal newStatus As String)
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "UPDATE Complaints SET Status = @Status WHERE ComplaintID = @ComplaintID"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@Status", newStatus)
                    cmd.Parameters.AddWithValue("@ComplaintID", complaintID)
                    con.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch
            Throw
        End Try
    End Sub
End Class