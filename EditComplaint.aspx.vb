Imports System.Data.SqlClient
Partial Class EditComplaint
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
        If Request.QueryString("ComplaintID") Is Nothing Then
            Response.Redirect("MyComplaints.aspx")
            Return
        End If
        If Not IsPostBack Then
            LoadComplaint()
        End If
    End Sub
    Private Sub LoadComplaint()
        Try
            Dim complaintID As Integer = Convert.ToInt32(Request.QueryString("ComplaintID"))
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "SELECT Title, Category, Description, Location FROM Complaints WHERE ComplaintID = @ComplaintID AND UserID = @UserID"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@ComplaintID", complaintID)
                    cmd.Parameters.AddWithValue("@UserID", Session("UserID"))
                    con.Open()
                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        If reader.Read() Then
                            txtTitle.Text = reader("Title").ToString()
                            ddlCategory.SelectedValue = reader("Category").ToString()
                            txtDescription.Text = reader("Description").ToString()
                            txtLocation.Text = reader("Location").ToString()
                        Else
                            Response.Redirect("MyComplaints.aspx")
                            Return
                        End If
                    End Using
                End Using
            End Using
        Catch ex As FormatException
            Response.Redirect("MyComplaints.aspx")
        Catch ex As Exception
            lblMessage.Text = "Unable to load the issue details. Please try again."
        End Try
    End Sub
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Page.Validate("EditIssueValidation")
        If Not Page.IsValid Then
            Return
        End If
        Try
            Dim complaintID As Integer = Convert.ToInt32(Request.QueryString("ComplaintID"))
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "UPDATE Complaints SET Title = @Title, Category = @Category, Description = @Description, Location = @Location WHERE ComplaintID = @ComplaintID AND UserID = @UserID"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim())
                    cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue)
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim())
                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text.Trim())
                    cmd.Parameters.AddWithValue("@ComplaintID", complaintID)
                    cmd.Parameters.AddWithValue("@UserID", Session("UserID"))
                    con.Open()
                    Dim rowsAffected As Integer = cmd.ExecuteNonQuery()
                    If rowsAffected > 0 Then
                        Response.Redirect("MyComplaints.aspx")
                    Else
                        lblMessage.Text = "Unable to update this issue."
                    End If
                End Using
            End Using
        Catch ex As FormatException
            lblMessage.Text = "Invalid issue ID."
        Catch ex As Exception
            lblMessage.Text = "Unable to update the issue at the moment. Please try again."
        End Try
    End Sub
End Class