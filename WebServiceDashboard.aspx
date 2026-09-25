<%@ Page Language="VB" AutoEventWireup="false" CodeFile="WebServiceDashboard.aspx.vb" Inherits="WebServiceDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - Web Service Dashboard</title>

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

        .back-link {
            color: #5f6b7a;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            padding: 9px 16px;
            border: 1px solid #dce2ea;
            border-radius: 8px;
        }

        .back-link:hover {
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

        .stat-title {
            display: block;
            color: #6b7280;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 13px;
        }

        .count {
            display: block;
            color: #1f2a44;
            font-size: 31px;
            font-weight: 700;
        }

        .service-card {
            background-color: #ffffff;
            border: 1px solid #e8edf4;
            border-radius: 16px;
            padding: 27px;
            box-shadow: 0 5px 18px rgba(31, 42, 68, 0.05);
        }

        .service-title {
            display: block;
            color: #1f2a44;
            font-size: 19px;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .service-text {
            display: block;
            color: #7a8495;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .method-list {
            background-color: #f8faff;
            border: 1px solid #e8edf4;
            border-radius: 10px;
            padding: 18px 20px;
            margin-bottom: 20px;
        }

        .method {
            display: block;
            color: #5f6b7a;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .method:last-child {
            margin-bottom: 0;
        }

        .method-name {
            color: #1f2a44;
            font-weight: 600;
        }

        .btn {
            display: inline-block;
            padding: 10px 17px;
            background-color: #2f6fed;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #245dcc;
        }

        .success-message {
            display: block;
            color: #6b7280;
            font-size: 13px;
            margin-top: 15px;
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
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="header">

        <div class="logo">
            Campus<span class="logo-care">Care</span>
        </div>

        <div class="header-right">
            <span class="admin-label">Admin Portal</span>

            <asp:HyperLink ID="lnkDashboard"
                runat="server"
                NavigateUrl="AdminDashboard.aspx"
                Text="Back to Dashboard"
                CssClass="back-link">
            </asp:HyperLink>
        </div>

    </div>

    <div class="container">

        <div class="welcome-banner">

            <div class="welcome-content">

                <span class="welcome-label">
                    Web Service
                </span>

                <span class="welcome-title">
                    Web Service Dashboard
                </span>

                <span class="welcome-text">
                    View live issue statistics retrieved through the CampusCare Web Service.
                </span>

            </div>

        </div>

        <div class="section-heading">

            <span class="section-title">
                Issue Overview
            </span>

            <span class="section-text">
                Current issue statistics returned by the web service.
            </span>

        </div>

        <div class="stats">

            <div class="stat-card">
                <span class="stat-title">Total Issues</span>

                <asp:Label ID="lblTotal"
                    runat="server"
                    Text="0"
                    CssClass="count">
                </asp:Label>
            </div>

            <div class="stat-card">
                <span class="stat-title">Pending Issues</span>

                <asp:Label ID="lblPending"
                    runat="server"
                    Text="0"
                    CssClass="count">
                </asp:Label>
            </div>

            <div class="stat-card">
                <span class="stat-title">In Progress</span>

                <asp:Label ID="lblInProgress"
                    runat="server"
                    Text="0"
                    CssClass="count">
                </asp:Label>
            </div>

            <div class="stat-card">
                <span class="stat-title">Resolved Issues</span>

                <asp:Label ID="lblResolved"
                    runat="server"
                    Text="0"
                    CssClass="count">
                </asp:Label>
            </div>

        </div>

        <div class="section-heading">

            <span class="section-title">
                Service Information
            </span>

            <span class="section-text">
                Operations provided by the CampusCare XML Web Service.
            </span>

        </div>

        <div class="service-card">

            <span class="service-title">
                CampusCare Web Service
            </span>

            <span class="service-text">
                The service retrieves real-time issue statistics from the CampusCare database.
            </span>

            <div class="method-list">

                <span class="method">
                    <span class="method-name">Service:</span>
                    CampusCareService.asmx
                </span>

                <span class="method">
                    <span class="method-name">Method:</span>
                    GetTotalIssues()
                </span>

                <span class="method">
                    <span class="method-name">Method:</span>
                    GetPendingIssues()
                </span>

                <span class="method">
                    <span class="method-name">Method:</span>
                    GetInProgressIssues()
                </span>

                <span class="method">
                    <span class="method-name">Method:</span>
                    GetResolvedIssues()
                </span>

            </div>

            <asp:Button ID="btnRefresh"
                runat="server"
                Text="Refresh Service Data"
                CssClass="btn" />

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="success-message">
            </asp:Label>

        </div>

        <span class="footer-text">
            CampusCare • Administration &amp; Student Support
        </span>

    </div>

</form>
</body>
</html>