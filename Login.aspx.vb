Imports System.Data.SqlClient
Partial Class CampusConnectLogin
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.Cookies("CampusCareEmail") IsNot Nothing Then
                txtEmail.Text = Request.Cookies("CampusCareEmail").Value
                chkRememberEmail.Checked = True
            End If
        End If
    End Sub
    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Page.Validate("LoginValidation")
        If Not Page.IsValid Then
            Return
        End If
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "SELECT UserID, Name, Role FROM Users WHERE Email = @Email AND Password = @Password"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim())
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text)
                    con.Open()
                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        If reader.Read() Then
                            Session("UserID") = reader("UserID")
                            Session("UserName") = reader("Name")
                            Session("Role") = reader("Role")
                            Dim userRole As String = reader("Role").ToString()
                            If chkRememberEmail.Checked Then
                                Dim emailCookie As New HttpCookie("CampusCareEmail")
                                emailCookie.Value = txtEmail.Text.Trim()
                                emailCookie.Expires = DateTime.Now.AddDays(30)
                                Response.Cookies.Add(emailCookie)
                            Else
                                If Request.Cookies("CampusCareEmail") IsNot Nothing Then
                                    Dim emailCookie As New HttpCookie("CampusCareEmail")
                                    emailCookie.Expires = DateTime.Now.AddDays(-1)
                                    Response.Cookies.Add(emailCookie)
                                End If
                            End If
                            reader.Close()
                            If userRole = "Admin" Then
                                Response.Redirect("AdminDashboard.aspx")
                            Else
                                Response.Redirect("Dashboard.aspx")
                            End If
                        Else
                            lblMessage.Text = "Invalid email or password."
                        End If
                    End Using
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "Unable to login at the moment. Please try again."
        End Try
    End Sub
End Class