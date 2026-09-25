Partial Class Dashboard
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
            If Session("UserName") IsNot Nothing Then
                lblUserName.Text = Session("UserName").ToString()
            End If
        End If
    End Sub
    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogout.Click
        Session.Clear()
        Session.Abandon()
        Response.Redirect("Login.aspx")
    End Sub
End Class