Imports System.Data.SqlClient
Partial Class AdminAnnouncements
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
            LoadAnnouncements()
        End If
    End Sub
    Private Sub LoadAnnouncements()
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "SELECT AnnouncementID, Title, Description, AnnouncementDate FROM Announcements ORDER BY AnnouncementDate DESC"
                Using cmd As New SqlCommand(query, con)
                    Using da As New SqlDataAdapter(cmd)
                        Dim dt As New Data.DataTable()
                        da.Fill(dt)
                        gvAnnouncements.DataSource = dt
                        gvAnnouncements.DataBind()
                    End Using
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "Unable to load announcements at the moment. Please try again."
            gvAnnouncements.DataSource = Nothing
            gvAnnouncements.DataBind()
        End Try
    End Sub
    Protected Sub btnPost_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPost.Click
        Page.Validate("AnnouncementValidation")
        If Not Page.IsValid Then
            Return
        End If
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "INSERT INTO Announcements (Title, Description, AnnouncementDate) VALUES (@Title, @Description, @AnnouncementDate)"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim())
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim())
                    cmd.Parameters.AddWithValue("@AnnouncementDate", DateTime.Now)
                    con.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            lblMessage.Text = "Announcement posted successfully!"
            txtTitle.Text = ""
            txtDescription.Text = ""
            LoadAnnouncements()
        Catch ex As Exception
            lblMessage.Text = "Unable to post the announcement at the moment. Please try again."
        End Try
    End Sub
    Protected Sub gvAnnouncements_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvAnnouncements.RowCommand
        If e.CommandName = "DeleteAnnouncement" Then
            Try
                Dim announcementID As Integer = Convert.ToInt32(e.CommandArgument)
                DeleteAnnouncement(announcementID)
                lblMessage.Text = "Announcement deleted successfully."
                LoadAnnouncements()
            Catch ex As FormatException
                lblMessage.Text = "Invalid announcement ID."
            Catch ex As Exception
                lblMessage.Text = "Unable to delete the announcement at the moment. Please try again."
            End Try
        End If
    End Sub
    Private Sub DeleteAnnouncement(ByVal announcementID As Integer)
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "DELETE FROM Announcements WHERE AnnouncementID = @AnnouncementID"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@AnnouncementID", announcementID)
                    con.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch
            Throw
        End Try
    End Sub
End Class