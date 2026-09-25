<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdminComplaints.aspx.vb" Inherits="AdminComplaints" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - Manage Issues</title>
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
        .header-right {
            display: flex;
            gap: 16px;
            align-items: center;
        }
        .container {
            width: 96%;
            max-width: 1500px;
            margin: 38px auto 60px auto;
        }
        .page-header {
            margin-bottom: 24px;
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
        .description {
            display: block;
            color: #7a8495;
            font-size: 14px;
        }
        .filter-box {
            background-color: #eef4ff;
            border: 1px solid #dbe7ff;
            color: #52647f;
            padding: 14px 18px;
            border-radius: 12px;
            margin-bottom: 20px;
        }
        .filter-label {
            color: #52647f;
            font-size: 14px;
        }
        .filter-title {
            color: #2f6fed;
            font-size: 14px;
            font-weight: 700;
        }
        .message {
            display: block;
            color: #207a45;
            background-color: #e3f7eb;
            border: 1px solid #ccebd8;
            padding: 11px 14px;
            border-radius: 9px;
            margin-bottom: 18px;
            font-size: 13px;
            font-weight: 600;
        }
        .message:empty {
            display: none;
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
            min-width: 1250px;
            border-collapse: collapse;
            background-color: #ffffff;
            border: none;
        }
        .grid th {
            background-color: #f8faff;
            color: #526075;
            padding: 15px 13px;
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
            padding: 15px 13px;
            border: none;
            border-bottom: 1px solid #edf0f5;
            vertical-align: middle;
            font-size: 13px;
            line-height: 1.5;
        }
        .grid tr:last-child td {
            border-bottom: none;
        }
        .grid tr:hover td {
            background-color: #fafcff;
        }
        .status {
            min-width: 115px;
            height: 38px;
            padding: 0 10px;
            border: 1px solid #d8dee9;
            border-radius: 8px;
            background-color: #f9fbfd;
            color: #374151;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            font-size: 13px;
            outline: none;
        }
        .status:focus {
            border-color: #2f6fed;
            box-shadow: 0 0 0 3px rgba(47, 111, 237, 0.10);
            background-color: #ffffff;
        }
        .btn {
            padding: 8px 12px;
            background-color: #2f6fed;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            font-size: 12px;
            font-weight: 600;
            white-space: nowrap;
        }
        .btn:hover {
            background-color: #245dcc;
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
                width: 96%;
                margin-top: 25px;
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
            </asp:Label>

            <asp:Label ID="lblCare"
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

        <asp:Panel ID="pnlPageHeader"
            runat="server"
            CssClass="page-header">

            <asp:Label ID="lblSmallTitle"
                runat="server"
                Text="Issue Management"
                CssClass="small-title">
            </asp:Label>

            <asp:Label ID="lblPageTitle"
                runat="server"
                Text="Manage Issues"
                CssClass="page-title">
            </asp:Label>

            <asp:Label ID="lblDescription"
                runat="server"
                Text="Review student issues and update their current support status."
                CssClass="description">
            </asp:Label>

        </asp:Panel>

        <asp:Panel ID="pnlFilterBox"
            runat="server"
            CssClass="filter-box">

            <asp:Label ID="lblViewing"
                runat="server"
                Text="Viewing: "
                CssClass="filter-label">
            </asp:Label>

            <asp:Label ID="lblTitle"
                runat="server"
                CssClass="filter-title">
            </asp:Label>

        </asp:Panel>

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

        <asp:Panel ID="pnlTableCard"
            runat="server"
            CssClass="table-card">

            <asp:GridView ID="gvComplaints"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="grid"
                GridLines="None"
                EmptyDataText="No issues found.">

                <Columns>

                    <asp:BoundField
                        DataField="ComplaintID"
                        HeaderText="Issue ID" />

                    <asp:BoundField
                        DataField="StudentName"
                        HeaderText="Student" />

                    <asp:BoundField
                        DataField="Title"
                        HeaderText="Title" />

                    <asp:BoundField
                        DataField="Category"
                        HeaderText="Category" />

                    <asp:BoundField
                        DataField="Description"
                        HeaderText="Description" />

                    <asp:BoundField
                        DataField="Location"
                        HeaderText="Location" />

                    <asp:BoundField
                        DataField="ComplaintDate"
                        HeaderText="Date"
                        DataFormatString="{0:dd-MM-yyyy hh:mm tt}" />

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>

                            <asp:DropDownList ID="ddlStatus"
                                runat="server"
                                CssClass="status"
                                SelectedValue='<%# Eval("Status") %>'>

                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                <asp:ListItem Text="Resolved" Value="Resolved"></asp:ListItem>

                            </asp:DropDownList>

                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>

                            <asp:Button ID="btnUpdateStatus"
                                runat="server"
                                Text="Update"
                                CommandName="UpdateStatus"
                                CommandArgument='<%# Eval("ComplaintID") %>'
                                CssClass="btn" />

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