Partial Class WebServiceDashboard
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
            LoadServiceData()
        End If
    End Sub
    Private Sub LoadServiceData()
        Try
            Dim service As New CampusConnect.CampusCareWebService.CampusCareService()
            lblTotal.Text = service.GetTotalIssues().ToString()
            lblPending.Text = service.GetPendingIssues().ToString()
            lblInProgress.Text = service.GetInProgressIssues().ToString()
            lblResolved.Text = service.GetResolvedIssues().ToString()
            lblMessage.Text = "Service data loaded successfully."
        Catch ex As Exception
            lblMessage.Text = "Unable to load web service data."
        End Try
    End Sub
    Protected Sub btnRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRefresh.Click
        LoadServiceData()
    End Sub
End Class