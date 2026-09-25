Imports System.Data
Imports System.Data.SqlClient
Partial Class Announcements
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
            LoadAnnouncements()
        End If
    End Sub
    Private Sub LoadAnnouncements()
        Try
            Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("CampusConnectConnection").ConnectionString
            Using con As New SqlConnection(connectionString)
                Dim query As String = "SELECT Title, Description, AnnouncementDate FROM Announcements ORDER BY AnnouncementDate DESC"
                Using cmd As New SqlCommand(query, con)
                    Using da As New SqlDataAdapter(cmd)
                        Dim ds As New DataSet()
                        da.Fill(ds, "Announcements")
                        If ds.Tables("Announcements").Rows.Count > 0 Then
                            rptAnnouncements.DataSource = ds.Tables("Announcements")
                            rptAnnouncements.DataBind()
                            lblNoAnnouncements.Visible = False
                        Else
                            rptAnnouncements.DataSource = Nothing
                            rptAnnouncements.DataBind()
                            lblNoAnnouncements.Text = "No announcements are available at the moment."
                            lblNoAnnouncements.Visible = True
                        End If
                    End Using
                End Using
            End Using
        Catch ex As Exception
            rptAnnouncements.DataSource = Nothing
            rptAnnouncements.DataBind()
            lblNoAnnouncements.Text = "Unable to load announcements at the moment. Please try again."
            lblNoAnnouncements.Visible = True
        End Try
    End Sub
End Class