Imports System.Data.SqlClient
Partial Class Complaint
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
    End Sub
    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Page.Validate("ComplaintValidation")
        If Not Page.IsValid Then
            Return
        End If
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "INSERT INTO Complaints (UserID, Title, Category, Description, Location, Status, ComplaintDate) VALUES (@UserID, @Title, @Category, @Description, @Location, @Status, @ComplaintDate)"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@UserID", Session("UserID"))
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim())
                    cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue)
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim())
                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text.Trim())
                    cmd.Parameters.AddWithValue("@Status", "Pending")
                    cmd.Parameters.AddWithValue("@ComplaintDate", DateTime.Now)
                    con.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            lblMessage.Text = "Issue submitted successfully!"
            txtTitle.Text = ""
            ddlCategory.SelectedIndex = 0
            txtDescription.Text = ""
            txtLocation.Text = ""
        Catch ex As Exception
            lblMessage.Text = "Unable to submit the issue at the moment. Please try again."
        End Try
    End Sub
End Class