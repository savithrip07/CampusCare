<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Announcements.aspx.vb" Inherits="Announcements" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - Announcements</title>
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
        .back-top {
            color: #5f6b7a;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            padding: 9px 16px;
            border: 1px solid #dce2ea;
            border-radius: 8px;
        }
        .back-top:hover {
            color: #2f6fed;
            border-color: #2f6fed;
        }
        .container {
            width: 90%;
            max-width: 1050px;
            margin: 38px auto 60px auto;
        }
        .page-heading {
            margin-bottom: 28px;
        }
        .small-title {
            display: block;
            color: #2f6fed;
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 7px;
        }
        .page-title {
            display: block;
            color: #1f2a44;
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 8px;
        }
        .page-subtitle {
            display: block;
            color: #7a8495;
            font-size: 15px;
        }
        .announcement-card {
            width: 100%;
            background-color: #ffffff;
            border: 1px solid #e8edf4;
            border-radius: 15px;
            padding: 24px 26px;
            margin-bottom: 18px;
            box-shadow: 0 5px 18px rgba(31, 42, 68, 0.05);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .announcement-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 9px 24px rgba(31, 42, 68, 0.08);
        }
        .announcement-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 12px;
        }
        .announcement-title {
            display: block;
            color: #1f2a44;
            font-size: 18px;
            font-weight: 700;
            line-height: 1.4;
        }
        .announcement-date {
            display: block;
            color: #8b95a5;
            font-size: 12px;
            white-space: nowrap;
            padding-top: 3px;
        }
        .announcement-text {
            display: block;
            color: #5f6b7a;
            font-size: 14px;
            line-height: 1.7;
        }
        .empty-message {
            display: block;
            background-color: #ffffff;
            border: 1px solid #e8edf4;
            border-radius: 15px;
            padding: 30px;
            color: #7a8495;
            text-align: center;
            font-size: 14px;
        }
        .footer-area {
            margin-top: 25px;
        }
        .back {
            display: inline-block;
            padding: 10px 17px;
            color: #5f6b7a;
            background-color: #ffffff;
            border: 1px solid #dce2ea;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
        }
        .back:hover {
            color: #2f6fed;
            border-color: #2f6fed;
        }
        @media screen and (max-width: 700px) {
            .header {
                padding: 0 22px;
            }
            .container {
                width: 94%;
                margin-top: 25px;
            }
            .announcement-header {
                display: block;
            }
            .announcement-date {
                margin-top: 7px;
            }
        }
    </style>
</head>
<body>
<form id="form1" runat="server">

    <asp:Panel ID="pnlHeader"
        runat="server"
        CssClass="header">

        <asp:Panel ID="pnlLogo"
            runat="server"
            CssClass="logo">

            <asp:Label ID="lblCampus"
                runat="server"
                Text="Campus">
            </asp:Label><asp:Label ID="lblCare"
                runat="server"
                Text="Care"
                CssClass="logo-care">
            </asp:Label>

        </asp:Panel>

        <asp:HyperLink ID="lnkDashboardTop"
            runat="server"
            NavigateUrl="Dashboard.aspx"
            Text="Back to Dashboard"
            CssClass="back-top">
        </asp:HyperLink>

    </asp:Panel>

    <asp:Panel ID="pnlContainer"
        runat="server"
        CssClass="container">

        <asp:Panel ID="pnlPageHeading"
            runat="server"
            CssClass="page-heading">

            <asp:Label ID="lblSmallTitle"
                runat="server"
                Text="Student Updates"
                CssClass="small-title">
            </asp:Label>

            <asp:Label ID="lblPageTitle"
                runat="server"
                Text="Announcements"
                CssClass="page-title">
            </asp:Label>

            <asp:Label ID="lblPageSubtitle"
                runat="server"
                Text="View important campus notices and updates."
                CssClass="page-subtitle">
            </asp:Label>

        </asp:Panel>

        <asp:Repeater ID="rptAnnouncements"
            runat="server">

            <ItemTemplate>

                <asp:Panel ID="pnlAnnouncementCard"
                    runat="server"
                    CssClass="announcement-card">

                    <asp:Panel ID="pnlAnnouncementHeader"
                        runat="server"
                        CssClass="announcement-header">

                        <asp:Label ID="lblAnnouncementTitle"
                            runat="server"
                            Text='<%# Eval("Title") %>'
                            CssClass="announcement-title">
                        </asp:Label>

                        <asp:Label ID="lblAnnouncementDate"
                            runat="server"
                            Text='<%# Eval("AnnouncementDate", "{0:dd-MM-yyyy hh:mm tt}") %>'
                            CssClass="announcement-date">
                        </asp:Label>

                    </asp:Panel>

                    <asp:Label ID="lblAnnouncementDescription"
                        runat="server"
                        Text='<%# Eval("Description") %>'
                        CssClass="announcement-text">
                    </asp:Label>

                </asp:Panel>

            </ItemTemplate>

        </asp:Repeater>

        <asp:Label ID="lblNoAnnouncements"
            runat="server"
            Text="No announcements are available at the moment."
            CssClass="empty-message"
            Visible="False">
        </asp:Label>

        <asp:Panel ID="pnlFooterArea"
            runat="server"
            CssClass="footer-area">

            <asp:HyperLink ID="lnkDashboard"
                runat="server"
                NavigateUrl="Dashboard.aspx"
                Text="Back to Dashboard"
                CssClass="back">
            </asp:HyperLink>

        </asp:Panel>

    </asp:Panel>

</form>
</body>
</html>