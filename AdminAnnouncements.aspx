<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdminAnnouncements.aspx.vb" Inherits="AdminAnnouncements" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - Manage Announcements</title>
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
            gap: 16px;
        }
        .admin-tag {
            color: #7a8495;
            font-size: 13px;
            background-color: #f3f6fb;
            padding: 8px 14px;
            border-radius: 20px;
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
            width: 92%;
            max-width: 1150px;
            margin: 38px auto 60px auto;
        }
        .page-heading {
            margin-bottom: 25px;
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
        .subtitle {
            display: block;
            color: #7a8495;
            font-size: 14px;
        }
        .form-card {
            width: 100%;
            background-color: #ffffff;
            border: 1px solid #e8edf4;
            border-radius: 17px;
            padding: 28px;
            box-shadow: 0 8px 24px rgba(31, 42, 68, 0.06);
            margin-bottom: 34px;
        }
        .form-title {
            display: block;
            color: #1f2a44;
            font-size: 21px;
            font-weight: 700;
            margin-bottom: 8px;
        }
        .form-intro {
            display: block;
            color: #7a8495;
            font-size: 13px;
            margin-bottom: 24px;
        }
        .form-group {
            margin-bottom: 18px;
        }
        .label {
            display: block;
            color: #374151;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
        }
        .textbox,
        .textarea {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #d8dee9;
            border-radius: 9px;
            background-color: #f9fbfd;
            color: #1f2937;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            font-size: 14px;
            outline: none;
        }
        .textbox {
            min-height: 46px;
        }
        .textarea {
            min-height: 125px;
            resize: vertical;
        }
        .textbox:focus,
        .textarea:focus {
            border-color: #2f6fed;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(47, 111, 237, 0.10);
        }
        .validator {
            display: block;
            color: #c44747;
            font-size: 12px;
            margin-top: 5px;
        }
        .validation-summary {
            color: #b03a2e;
            background-color: #fff4f4;
            border: 1px solid #f1d0d0;
            border-radius: 8px;
            padding: 10px 14px;
            margin-bottom: 18px;
            font-size: 12px;
        }
        .btn {
            padding: 11px 18px;
            background-color: #2f6fed;
            color: #ffffff;
            border: none;
            border-radius: 9px;
            cursor: pointer;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            font-size: 14px;
            font-weight: 600;
            box-shadow: 0 5px 12px rgba(47, 111, 237, 0.18);
        }
        .btn:hover {
            background-color: #245dcc;
        }
        .message {
            display: block;
            margin-top: 15px;
            color: #207a45;
            font-size: 13px;
            font-weight: 600;
        }
        .section-heading {
            margin-bottom: 18px;
        }
        .section-title {
            display: block;
            color: #1f2a44;
            font-size: 21px;
            font-weight: 700;
            margin-bottom: 6px;
        }
        .section-text {
            display: block;
            color: #7a8495;
            font-size: 14px;
        }
        .table-card {
            width: 100%;
            background-color: #ffffff;
            border: 1px solid #e8edf4;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(31, 42, 68, 0.06);
            overflow-x: auto;
        }
        .grid {
            width: 100%;
            min-width: 900px;
            border-collapse: collapse;
            background-color: #ffffff;
            border: none;
        }
        .grid th {
            background-color: #f8faff;
            color: #526075;
            padding: 15px 14px;
            text-align: left;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            border: none;
            border-bottom: 1px solid #e8edf4;
        }
        .grid td {
            color: #4b5563;
            padding: 16px 14px;
            border: none;
            border-bottom: 1px solid #edf0f5;
            vertical-align: top;
            font-size: 13px;
            line-height: 1.6;
        }
        .grid tr:last-child td {
            border-bottom: none;
        }
        .grid tr:hover td {
            background-color: #fafcff;
        }
        .delete-btn {
            padding: 7px 12px;
            background-color: #fff0f0;
            color: #c44747;
            border: 1px solid #f4d1d1;
            border-radius: 7px;
            cursor: pointer;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            font-size: 12px;
            font-weight: 600;
        }
        .delete-btn:hover {
            background-color: #c44747;
            color: #ffffff;
            border-color: #c44747;
        }
        .footer-area {
            margin-top: 24px;
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
        @media screen and (max-width: 800px) {
            .header {
                padding: 0 22px;
            }
            .admin-tag {
                display: none;
            }
            .container {
                width: 94%;
                margin-top: 25px;
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
                CssClass="admin-tag">
            </asp:Label>

            <asp:HyperLink ID="lnkDashboardTop"
                runat="server"
                NavigateUrl="AdminDashboard.aspx"
                Text="Back to Dashboard"
                CssClass="back-top">
            </asp:HyperLink>

        </asp:Panel>

    </asp:Panel>

    <asp:Panel ID="pnlContainer"
        runat="server"
        CssClass="container">

        <asp:Panel ID="pnlPageHeading"
            runat="server"
            CssClass="page-heading">

            <asp:Label ID="lblSmallTitle"
                runat="server"
                Text="Campus Communication"
                CssClass="small-title">
            </asp:Label>

            <asp:Label ID="lblPageTitle"
                runat="server"
                Text="Manage Announcements"
                CssClass="page-title">
            </asp:Label>

            <asp:Label ID="lblPageSubtitle"
                runat="server"
                Text="Post and manage campus announcements."
                CssClass="subtitle">
            </asp:Label>

        </asp:Panel>

        <asp:Panel ID="pnlFormCard"
            runat="server"
            CssClass="form-card">

            <asp:Label ID="lblFormTitle"
                runat="server"
                Text="Create Announcement"
                CssClass="form-title">
            </asp:Label>

            <asp:Label ID="lblFormIntro"
                runat="server"
                Text="Enter the announcement details below."
                CssClass="form-intro">
            </asp:Label>

            <asp:ValidationSummary ID="vsAnnouncement"
                runat="server"
                ValidationGroup="AnnouncementValidation"
                HeaderText="Please correct the following:"
                DisplayMode="BulletList"
                CssClass="validation-summary" />

            <asp:Panel ID="pnlTitleGroup"
                runat="server"
                CssClass="form-group">

                <asp:Label ID="lblTitle"
                    runat="server"
                    Text="Title"
                    CssClass="label">
                </asp:Label>

                <asp:TextBox ID="txtTitle"
                    runat="server"
                    CssClass="textbox"
                    placeholder="Enter announcement title">
                </asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvTitle"
                    runat="server"
                    ControlToValidate="txtTitle"
                    ErrorMessage="Announcement title is required."
                    Text="Announcement title is required."
                    ValidationGroup="AnnouncementValidation"
                    Display="Dynamic"
                    CssClass="validator">
                </asp:RequiredFieldValidator>

            </asp:Panel>

            <asp:Panel ID="pnlDescriptionGroup"
                runat="server"
                CssClass="form-group">

                <asp:Label ID="lblDescription"
                    runat="server"
                    Text="Announcement"
                    CssClass="label">
                </asp:Label>

                <asp:TextBox ID="txtDescription"
                    runat="server"
                    TextMode="MultiLine"
                    CssClass="textarea"
                    placeholder="Enter announcement details">
                </asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvDescription"
                    runat="server"
                    ControlToValidate="txtDescription"
                    ErrorMessage="Announcement details are required."
                    Text="Announcement details are required."
                    ValidationGroup="AnnouncementValidation"
                    Display="Dynamic"
                    CssClass="validator">
                </asp:RequiredFieldValidator>

            </asp:Panel>

            <asp:Button ID="btnPost"
                runat="server"
                Text="Post Announcement"
                CssClass="btn"
                ValidationGroup="AnnouncementValidation" />

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </asp:Panel>

        <asp:Panel ID="pnlSectionHeading"
            runat="server"
            CssClass="section-heading">

            <asp:Label ID="lblSectionTitle"
                runat="server"
                Text="Posted Announcements"
                CssClass="section-title">
            </asp:Label>

            <asp:Label ID="lblSectionText"
                runat="server"
                Text="View or delete existing announcements."
                CssClass="section-text">
            </asp:Label>

        </asp:Panel>

        <asp:Panel ID="pnlTableCard"
            runat="server"
            CssClass="table-card">

            <asp:GridView ID="gvAnnouncements"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="grid"
                GridLines="None"
                EmptyDataText="No announcements have been posted yet.">

                <Columns>

                    <asp:BoundField
                        DataField="AnnouncementID"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="Title"
                        HeaderText="Title" />

                    <asp:BoundField
                        DataField="Description"
                        HeaderText="Announcement" />

                    <asp:BoundField
                        DataField="AnnouncementDate"
                        HeaderText="Date"
                        DataFormatString="{0:dd-MM-yyyy hh:mm tt}" />

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>

                            <asp:Button ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CommandName="DeleteAnnouncement"
                                CommandArgument='<%# Eval("AnnouncementID") %>'
                                CssClass="delete-btn"
                                CausesValidation="False"
                                OnClientClick="return confirm('Are you sure you want to delete this announcement?');" />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </asp:Panel>

        <asp:Panel ID="pnlFooterArea"
            runat="server"
            CssClass="footer-area">

            <asp:HyperLink ID="lnkBack"
                runat="server"
                NavigateUrl="AdminDashboard.aspx"
                Text="Back to Admin Dashboard"
                CssClass="back">
            </asp:HyperLink>

        </asp:Panel>

    </asp:Panel>

</form>
</body>
</html>