<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="Dashboard" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - Student Dashboard</title>
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
            gap: 20px;
        }
        .student-label {
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
            max-width: 1150px;
            margin: 38px auto 60px auto;
        }
        .welcome-banner {
            background-color: #1f2a44;
            border-radius: 20px;
            padding: 38px 42px;
            color: #ffffff;
            box-shadow: 0 12px 30px rgba(31, 42, 68, 0.13);
            margin-bottom: 38px;
            position: relative;
            overflow: hidden;
        }
        .welcome-banner:after {
            content: "";
            position: absolute;
            width: 230px;
            height: 230px;
            border-radius: 50%;
            background-color: rgba(47, 111, 237, 0.25);
            right: -65px;
            top: -90px;
        }
        .welcome-banner:before {
            content: "";
            position: absolute;
            width: 130px;
            height: 130px;
            border-radius: 50%;
            background-color: rgba(255,255,255,0.05);
            right: 125px;
            bottom: -75px;
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
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .welcome-text {
            display: block;
            color: #c7d2e5;
            font-size: 15px;
        }
        .section-heading {
            margin-bottom: 22px;
        }
        .section-title {
            display: block;
            color: #1f2a44;
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 6px;
        }
        .section-text {
            display: block;
            color: #7a8495;
            font-size: 14px;
        }
        .cards {
            display: flex;
            flex-wrap: wrap;
            gap: 22px;
        }
        .card {
            flex: 1;
            min-width: 260px;
            background-color: #ffffff;
            padding: 28px;
            border-radius: 16px;
            border: 1px solid #edf0f5;
            box-shadow: 0 5px 18px rgba(31, 42, 68, 0.05);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 28px rgba(31, 42, 68, 0.10);
        }
        .card-title {
            display: block;
            color: #1f2a44;
            font-size: 19px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .card-text {
            display: block;
            color: #7a8495;
            font-size: 14px;
            line-height: 1.6;
            min-height: 68px;
            margin-bottom: 22px;
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
            .student-label {
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
            .cards {
                display: block;
            }
            .card {
                margin-bottom: 18px;
            }
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <asp:Panel ID="pnlHeader" runat="server" CssClass="header">
        <asp:Panel ID="pnlLogo" runat="server" CssClass="logo">
            <asp:Label ID="lblCampus" runat="server" Text="Campus"></asp:Label><asp:Label ID="lblCare" runat="server" Text="Care" CssClass="logo-care"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="pnlHeaderRight" runat="server" CssClass="header-right">
            <asp:Label ID="lblStudentPortal"
                runat="server"
                Text="Student Portal"
                CssClass="student-label">
            </asp:Label>
            <asp:LinkButton ID="btnLogout"
                runat="server"
                CssClass="logout"
                Text="Logout">
            </asp:LinkButton>
        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="pnlContainer" runat="server" CssClass="container">
        <asp:Panel ID="pnlWelcomeBanner" runat="server" CssClass="welcome-banner">
            <asp:Panel ID="pnlWelcomeContent" runat="server" CssClass="welcome-content">
                <asp:Label ID="lblDashboardType"
                    runat="server"
                    Text="Student Dashboard"
                    CssClass="welcome-label">
                </asp:Label>
                <asp:Panel ID="pnlWelcomeTitle" runat="server" CssClass="welcome-title">
                    <asp:Label ID="lblWelcomeText"
                        runat="server"
                        Text="Welcome, ">
                    </asp:Label>
                    <asp:Label ID="lblUserName"
                        runat="server">
                    </asp:Label>
                    <asp:Label ID="lblExclamation"
                        runat="server"
                        Text="!">
                    </asp:Label>
                </asp:Panel>
                <asp:Label ID="lblTagline"
                    runat="server"
                    Text="Your campus. Your voice. Your support."
                    CssClass="welcome-text">
                </asp:Label>
            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="pnlSectionHeading" runat="server" CssClass="section-heading">
            <asp:Label ID="lblSectionTitle"
                runat="server"
                Text="What would you like to do?"
                CssClass="section-title">
            </asp:Label>
            <asp:Label ID="lblSectionText"
                runat="server"
                Text="Access your support services and stay updated with CampusCare."
                CssClass="section-text">
            </asp:Label>
        </asp:Panel>
        <asp:Panel ID="pnlCards" runat="server" CssClass="cards">
            <asp:Panel ID="pnlRaiseIssue" runat="server" CssClass="card">
                <asp:Label ID="lblRaiseIssueTitle"
                    runat="server"
                    Text="Raise an Issue"
                    CssClass="card-title">
                </asp:Label>
                <asp:Label ID="lblRaiseIssueText"
                    runat="server"
                    Text="Report a campus issue or request assistance from the support team."
                    CssClass="card-text">
                </asp:Label>
                <asp:HyperLink ID="lnkRaiseIssue"
                    runat="server"
                    NavigateUrl="Complaint.aspx"
                    Text="Raise Issue"
                    CssClass="btn">
                </asp:HyperLink>
            </asp:Panel>
            <asp:Panel ID="pnlMyIssues" runat="server" CssClass="card">
                <asp:Label ID="lblMyIssuesTitle"
                    runat="server"
                    Text="My Issues"
                    CssClass="card-title">
                </asp:Label>
                <asp:Label ID="lblMyIssuesText"
                    runat="server"
                    Text="View your submitted issues, make changes and track their current status."
                    CssClass="card-text">
                </asp:Label>
                <asp:HyperLink ID="lnkMyIssues"
                    runat="server"
                    NavigateUrl="MyComplaints.aspx"
                    Text="View My Issues"
                    CssClass="btn">
                </asp:HyperLink>
            </asp:Panel>
            <asp:Panel ID="pnlAnnouncements" runat="server" CssClass="card">
                <asp:Label ID="lblAnnouncementsTitle"
                    runat="server"
                    Text="Announcements"
                    CssClass="card-title">
                </asp:Label>
                <asp:Label ID="lblAnnouncementsText"
                    runat="server"
                    Text="Stay informed about important campus notices and student support updates."
                    CssClass="card-text">
                </asp:Label>
                <asp:HyperLink ID="lnkAnnouncements"
                    runat="server"
                    NavigateUrl="Announcements.aspx"
                    Text="View Announcements"
                    CssClass="btn">
                </asp:HyperLink>
            </asp:Panel>
        </asp:Panel>
        <asp:Label ID="lblFooter"
            runat="server"
            Text="CampusCare • Student Support &amp; Issue Management System"
            CssClass="footer-text">
        </asp:Label>
    </asp:Panel>
</form>
</body>
</html>