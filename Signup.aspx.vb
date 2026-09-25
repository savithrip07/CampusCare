Imports System.Data.SqlClient
Partial Class Signup
    Inherits System.Web.UI.Page
    Protected Sub btnSignup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignup.Click
        Page.Validate("SignupValidation")
        If Not Page.IsValid Then
            Return
        End If
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim checkQuery As String = "SELECT COUNT(*) FROM Users WHERE Email = @Email"
                Using checkCmd As New SqlCommand(checkQuery, con)
                    checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim())
                    con.Open()
                    Dim emailCount As Integer = Convert.ToInt32(checkCmd.ExecuteScalar())
                    If emailCount > 0 Then
                        lblMessage.Text = "An account with this email already exists."
                        Return
                    End If
                End Using
                Dim query As String = "INSERT INTO Users (Name, Email, Password, Department, Year, Role) VALUES (@Name, @Email, @Password, @Department, @Year, @Role)"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim())
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim())
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text)
                    cmd.Parameters.AddWithValue("@Department", txtDepartment.Text.Trim())
                    cmd.Parameters.AddWithValue("@Year", Convert.ToInt32(txtYear.Text))
                    cmd.Parameters.AddWithValue("@Role", "Student")
                    cmd.ExecuteNonQuery()
                End Using
            End Using
            Response.Redirect("Login.aspx")
        Catch ex As Exception
            lblMessage.Text = "Unable to create your account at the moment. Please try again."
        End Try
    End Sub
End Class