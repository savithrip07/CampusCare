<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MyComplaints.aspx.vb" Inherits="MyComplaints" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - My Issues</title>
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
            width: 94%;
            max-width: 1400px;
            margin: 38px auto 60px auto;
        }
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 25px;
        }
        .page-heading-left {
            display: block;
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
            margin-bottom: 7px;
            font-size: 30px;
            font-weight: 700;
        }
        .welcome {
            color: #7a8495;
            display: block;
            font-size: 14px;
        }
        .raise-button {
            display: inline-block;
            padding: 11px 18px;
            background-color: #2f6fed;
            color: #ffffff;
            text-decoration: none;
            border-radius: 9px;
            font-size: 14px;
            font-weight: 600;
            box-shadow: 0 5px 12px rgba(47, 111, 237, 0.18);
        }
        .raise-button:hover {
            background-color: #245dcc;
        }
        .info-bar {
            background-color: #eef4ff;
            border: 1px solid #dbe7ff;
            border-radius: 12px;
            padding: 14px 18px;
            color: #52647f;
            font-size: 13px;
            margin-bottom: 20px;
        }
        .info-title {
            color: #2f6fed;
            font-weight: 700;
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
            min-width: 1100px;
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
            display: inline-block;
            padding: 6px 11px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 12px;
            white-space: nowrap;
        }
        .status-pending {
            background-color: #fff5d9;
            color: #946200;
        }
        .status-progress {
            background-color: #e4f2ff;
            color: #1769aa;
        }
        .status-resolved {
            background-color: #e3f7eb;
            color: #207a45;
        }
        .action-button {
            padding: 7px 12px;
            margin: 2px 4px 2px 0;
            background-color: #eef4ff;
            color: #2f6fed;
            border: 1px solid #d8e5ff;
            border-radius: 7px;
            cursor: pointer;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            font-size: 12px;
            font-weight: 600;
        }
        .action-button:hover {
            background-color: #2f6fed;
            color: #ffffff;
            border-color: #2f6fed;
        }
        .delete-button {
            padding: 7px 12px;
            margin: 2px 0;
            background-color: #fff0f0;
            color: #c44747;
            border: 1px solid #f4d1d1;
            border-radius: 7px;
            cursor: pointer;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            font-size: 12px;
            font-weight: 600;
        }
        .delete-button:hover {
            background-color: #c44747;
            color: #ffffff;
            border-color: #c44747;
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
            .page-header {
                display: block;
            }
            .raise-button {
                margin-top: 18px;
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
            </asp:Label>
            <asp:Label ID="lblCare"
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

        <asp:Panel ID="pnlPageHeader"
            runat="server"
            CssClass="page-header">

            <asp:Panel ID="pnlPageHeadingLeft"
                runat="server"
                CssClass="page-heading-left">

                <asp:Label ID="lblSmallTitle"
                    runat="server"
                    Text="Issue Tracking"
                    CssClass="small-title">
                </asp:Label>

                <asp:Label ID="lblPageTitle"
                    runat="server"
                    Text="My Issues"
                    CssClass="page-title">
                </asp:Label>

                <asp:Label ID="lblWelcome"
                    runat="server"
                    CssClass="welcome">
                </asp:Label>

            </asp:Panel>

            <asp:Panel ID="pnlRaiseIssueAction"
                runat="server">

                <asp:HyperLink ID="lnkRaiseNewIssue"
                    runat="server"
                    NavigateUrl="Complaint.aspx"
                    Text="Raise New Issue"
                    CssClass="raise-button">
                </asp:HyperLink>

            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="pnlInfoBar"
            runat="server"
            CssClass="info-bar">

            <asp:Label ID="lblInfoTitle"
                runat="server"
                Text="Track your requests: "
                CssClass="info-title">
            </asp:Label>

            <asp:Label ID="lblInfoText"
                runat="server"
                Text="Check the current status of your submitted issues. You can also edit or delete an issue when required.">
            </asp:Label>

        </asp:Panel>

        <asp:Panel ID="pnlTableCard"
            runat="server"
            CssClass="table-card">

            <asp:GridView ID="gvComplaints"
                runat="server"
                AutoGenerateColumns="False"
                EmptyDataText="You have not submitted any issues yet."
                CssClass="grid"
                GridLines="None">

                <Columns>

                    <asp:BoundField
                        DataField="ComplaintID"
                        HeaderText="Issue ID" />

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

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus"
                                runat="server"
                                Text='<%# Eval("Status") %>'
                                CssClass='<%# GetStatusClass(Eval("Status").ToString()) %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField
                        DataField="ComplaintDate"
                        HeaderText="Date"
                        DataFormatString="{0:dd-MM-yyyy hh:mm tt}" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>

                            <asp:Button ID="btnEdit"
                                runat="server"
                                Text="Edit"
                                CommandName="EditComplaint"
                                CommandArgument='<%# Eval("ComplaintID") %>'
                                CssClass="action-button" />

                            <asp:Button ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CommandName="DeleteComplaint"
                                CommandArgument='<%# Eval("ComplaintID") %>'
                                CssClass="delete-button"
                                OnClientClick="return confirm('Are you sure you want to delete this issue?');" />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </asp:Panel>

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