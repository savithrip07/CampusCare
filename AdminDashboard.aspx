<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdminDashboard.aspx.vb" Inherits="AdminDashboard" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - Admin Dashboard</title>

    <style type="text/css">
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            background-color: #f3f6fb;
            color: #1f2937;
        }

        .header {
            height: 72px;
            background-color: #ffffff;
            border-bottom: 1px solid #e8edf4;
            padding: 0 55px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            color: #1f2a44;
            font-size: 25px;
            font-weight: 700;
        }

        .logo-care {
            color: #2f6fed;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .admin-label {
            font-size: 13px;
            color: #7a8495;
            background-color: #f3f6fb;
            padding: 8px 14px;
            border-radius: 20px;
        }

        .logout {
            color: #5f6b7a;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            padding: 9px 16px;
            border: 1px solid #dce2ea;
            border-radius: 8px;
        }

        .logout:hover {
            color: #2f6fed;
            border-color: #2f6fed;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 38px auto 60px auto;
        }

        .welcome-banner {
            position: relative;
            overflow: hidden;
            background-color: #1f2a44;
            color: #ffffff;
            border-radius: 20px;
            padding: 36px 40px;
            margin-bottom: 35px;
            box-shadow: 0 12px 30px rgba(31, 42, 68, 0.13);
        }

        .welcome-banner:after {
            content: "";
            position: absolute;
            width: 240px;
            height: 240px;
            border-radius: 50%;
            background-color: rgba(47, 111, 237, 0.25);
            right: -70px;
            top: -100px;
        }

        .welcome-banner:before {
            content: "";
            position: absolute;
            width: 130px;
            height: 130px;
            border-radius: 50%;
            background-color: rgba(255,255,255,0.05);
            right: 130px;
            bottom: -80px;
        }

        .welcome-content {
            position: relative;
            z-index: 1;
        }

        .welcome-label {
            display: block;
            color: #8fb3ff;
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }

        .welcome-title {
            display: block;
            color: #ffffff;
            font-size: 31px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .welcome-text {
            display: block;
            color: #c7d2e5;
            font-size: 15px;
        }

        .section-heading {
            margin-bottom: 18px;
        }

        .section-title {
            display: block;
            color: #1f2a44;
            font-size: 21px;
            font-weight: 700;
        }

        .section-text {
            display: block;
            color: #7a8495;
            font-size: 14px;
            margin-top: 6px;
        }

        .stats {
            display: flex;
            flex-wrap: wrap;
            gap: 18px;
            margin-bottom: 38px;
        }

        .stat-card {
            flex: 1;
            min-width: 210px;
            background-color: #ffffff;
            border: 1px solid #e8edf4;
            border-radius: 15px;
            padding: 23px;
            box-shadow: 0 5px 18px rgba(31, 42, 68, 0.05);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(31, 42, 68, 0.09);
        }

        .stat-top {
            margin-bottom: 13px;
        }

        .stat-title {
            display: block;
            color: #6b7280;
            font-size: 13px;
            font-weight: 600;
        }

        .count {
            display: block;
            color: #1f2a44;
            font-size: 31px;
            font-weight: 700;
            margin-bottom: 14px;
        }

        .stat-link {
            color: #2f6fed;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .stat-link:hover {
            text-decoration: underline;
        }

        .management-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .management-card {
            flex: 1;
            min-width: 300px;
            background-color: #ffffff;
            border: 1px solid #e8edf4;
            border-radius: 16px;
            padding: 27px;
            box-shadow: 0 5px 18px rgba(31, 42, 68, 0.05);
        }

        .management-title {
            display: block;
            color: #1f2a44;
            font-size: 19px;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .management-text {
            display: block;
            color: #7a8495;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 17px;
            background-color: #2f6fed;
            color: #ffffff;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
        }

        .btn:hover {
            background-color: #245dcc;
        }

        .footer-text {
            display: block;
            text-align: center;
            color: #9aa3b2;
            font-size: 12px;
            margin-top: 45px;
        }

        @media screen and (max-width: 700px) {
            .header {
                padding: 0 22px;
            }

            .admin-label {
                display: none;
            }

            .container {
                width: 92%;
                margin-top: 25px;
            }

            .welcome-banner {
                padding: 30px 25px;
            }

            .welcome-title {
                font-size: 26px;
            }

            .stats {
                display: block;
            }

            .stat-card {
                margin-bottom: 15px;
            }

            .management-grid {
                display: block;
            }

            .management-card {
                margin-bottom: 18px;
            }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <asp:Panel ID="pnlHeader" runat="server" CssClass="header">

        <asp:Panel ID="pnlLogo" runat="server" CssClass="logo">
            <asp:Label ID="lblCampus"
                runat="server"
                Text="Campus">
            </asp:Label><asp:Label ID="lblCare"
                runat="server"
                Text="Care"
                CssClass="logo-care">
            </asp:Label>
        </asp:Panel>

        <asp:Panel ID="pnlHeaderRight"
            runat="server"
            CssClass="header-right">

            <asp:Label ID="lblAdminPortal"
                runat="server"
                Text="Admin Portal"
                CssClass="admin-label">
            </asp:Label>

            <asp:LinkButton ID="btnLogout"
                runat="server"
                Text="Logout"
                CssClass="logout">
            </asp:LinkButton>

        </asp:Panel>

    </asp:Panel>


    <asp:Panel ID="pnlContainer"
        runat="server"
        CssClass="container">


        <asp:Panel ID="pnlWelcomeBanner"
            runat="server"
            CssClass="welcome-banner">

            <asp:Panel ID="pnlWelcomeContent"
                runat="server"
                CssClass="welcome-content">

                <asp:Label ID="lblDashboardType"
                    runat="server"
                    Text="Admin Dashboard"
                    CssClass="welcome-label">
                </asp:Label>

                <asp:Panel ID="pnlWelcomeTitle"
                    runat="server"
                    CssClass="welcome-title">

                    <asp:Label ID="lblWelcomeText"
                        runat="server"
                        Text="Welcome, ">
                    </asp:Label><asp:Label ID="lblAdminName"
                        runat="server">
                    </asp:Label><asp:Label ID="lblExclamation"
                        runat="server"
                        Text="!">
                    </asp:Label>

                </asp:Panel>

                <asp:Label ID="lblWelcomeDescription"
                    runat="server"
                    Text="Manage student issues and campus announcements."
                    CssClass="welcome-text">
                </asp:Label>

            </asp:Panel>

        </asp:Panel>


        <asp:Panel ID="pnlIssueOverviewHeading"
            runat="server"
            CssClass="section-heading">

            <asp:Label ID="lblIssueOverviewTitle"
                runat="server"
                Text="Issue Overview"
                CssClass="section-title">
            </asp:Label>

        </asp:Panel>


        <asp:Panel ID="pnlStats"
            runat="server"
            CssClass="stats">


            <asp:Panel ID="pnlTotalIssues"
                runat="server"
                CssClass="stat-card">

                <asp:Panel ID="pnlTotalTop"
                    runat="server"
                    CssClass="stat-top">

                    <asp:Label ID="lblTotalTitle"
                        runat="server"
                        Text="Total Issues"
                        CssClass="stat-title">
                    </asp:Label>

                </asp:Panel>

                <asp:Label ID="lblTotalCount"
                    runat="server"
                    Text="0"
                    CssClass="count">
                </asp:Label>

                <asp:HyperLink ID="lnkAllIssues"
                    runat="server"
                    NavigateUrl="AdminComplaints.aspx"
                    Text="View all issues"
                    CssClass="stat-link">
                </asp:HyperLink>

            </asp:Panel>


            <asp:Panel ID="pnlPendingIssues"
                runat="server"
                CssClass="stat-card">

                <asp:Panel ID="pnlPendingTop"
                    runat="server"
                    CssClass="stat-top">

                    <asp:Label ID="lblPendingTitle"
                        runat="server"
                        Text="Pending Issues"
                        CssClass="stat-title">
                    </asp:Label>

                </asp:Panel>

                <asp:Label ID="lblPendingCount"
                    runat="server"
                    Text="0"
                    CssClass="count">
                </asp:Label>

                <asp:HyperLink ID="lnkPendingIssues"
                    runat="server"
                    NavigateUrl="AdminComplaints.aspx?Status=Pending"
                    Text="View pending"
                    CssClass="stat-link">
                </asp:HyperLink>

            </asp:Panel>


            <asp:Panel ID="pnlProgressIssues"
                runat="server"
                CssClass="stat-card">

                <asp:Panel ID="pnlProgressTop"
                    runat="server"
                    CssClass="stat-top">

                    <asp:Label ID="lblProgressTitle"
                        runat="server"
                        Text="In Progress"
                        CssClass="stat-title">
                    </asp:Label>

                </asp:Panel>

                <asp:Label ID="lblProgressCount"
                    runat="server"
                    Text="0"
                    CssClass="count">
                </asp:Label>

                <asp:HyperLink ID="lnkProgressIssues"
                    runat="server"
                    NavigateUrl="AdminComplaints.aspx?Status=In Progress"
                    Text="View in progress"
                    CssClass="stat-link">
                </asp:HyperLink>

            </asp:Panel>


            <asp:Panel ID="pnlResolvedIssues"
                runat="server"
                CssClass="stat-card">

                <asp:Panel ID="pnlResolvedTop"
                    runat="server"
                    CssClass="stat-top">

                    <asp:Label ID="lblResolvedTitle"
                        runat="server"
                        Text="Resolved Issues"
                        CssClass="stat-title">
                    </asp:Label>

                </asp:Panel>

                <asp:Label ID="lblResolvedCount"
                    runat="server"
                    Text="0"
                    CssClass="count">
                </asp:Label>

                <asp:HyperLink ID="lnkResolvedIssues"
                    runat="server"
                    NavigateUrl="AdminComplaints.aspx?Status=Resolved"
                    Text="View resolved"
                    CssClass="stat-link">
                </asp:HyperLink>

            </asp:Panel>

        </asp:Panel>


        <asp:Panel ID="pnlManagementHeading"
            runat="server"
            CssClass="section-heading">

            <asp:Label ID="lblManagementTitle"
                runat="server"
                Text="Management"
                CssClass="section-title">
            </asp:Label>

            <asp:Label ID="lblManagementText"
                runat="server"
                Text="Manage issues, announcements and web service data."
                CssClass="section-text">
            </asp:Label>

        </asp:Panel>


        <asp:Panel ID="pnlManagementGrid"
            runat="server"
            CssClass="management-grid">


            <asp:Panel ID="pnlManageIssues"
                runat="server"
                CssClass="management-card">

                <asp:Label ID="lblManageIssuesTitle"
                    runat="server"
                    Text="Manage Issues"
                    CssClass="management-title">
                </asp:Label>

                <asp:Label ID="lblManageIssuesText"
                    runat="server"
                    Text="View student issues and update their status."
                    CssClass="management-text">
                </asp:Label>

                <asp:HyperLink ID="lnkManageIssues"
                    runat="server"
                    NavigateUrl="AdminComplaints.aspx"
                    Text="Manage Issues"
                    CssClass="btn">
                </asp:HyperLink>

            </asp:Panel>


            <asp:Panel ID="pnlManageAnnouncements"
                runat="server"
                CssClass="management-card">

                <asp:Label ID="lblManageAnnouncementsTitle"
                    runat="server"
                    Text="Announcements"
                    CssClass="management-title">
                </asp:Label>

                <asp:Label ID="lblManageAnnouncementsText"
                    runat="server"
                    Text="Post or remove campus announcements."
                    CssClass="management-text">
                </asp:Label>

                <asp:HyperLink ID="lnkManageAnnouncements"
                    runat="server"
                    NavigateUrl="AdminAnnouncements.aspx"
                    Text="Manage Announcements"
                    CssClass="btn">
                </asp:HyperLink>

            </asp:Panel>


            <asp:Panel ID="pnlWebService"
                runat="server"
                CssClass="management-card">

                <asp:Label ID="lblWebServiceTitle"
                    runat="server"
                    Text="Web Service"
                    CssClass="management-title">
                </asp:Label>

                <asp:Label ID="lblWebServiceText"
                    runat="server"
                    Text="View live issue statistics retrieved through the CampusCare Web Service."
                    CssClass="management-text">
                </asp:Label>

                <asp:HyperLink ID="lnkWebService"
                    runat="server"
                    NavigateUrl="WebServiceDashboard.aspx"
                    Text="View Web Service"
                    CssClass="btn">
                </asp:HyperLink>

            </asp:Panel>


        </asp:Panel>


        <asp:Label ID="lblFooter"
            runat="server"
            Text="CampusCare • Administration &amp; Student Support"
            CssClass="footer-text">
        </asp:Label>


    </asp:Panel>

</form>
</body>
</html>