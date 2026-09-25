<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Complaint.aspx.vb" Inherits="Complaint" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - Raise an Issue</title>
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
        .page {
            width: 90%;
            max-width: 900px;
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
            margin-bottom: 8px;
            font-size: 30px;
            font-weight: 700;
        }
        .page-subtitle {
            display: block;
            color: #7a8495;
            font-size: 15px;
        }
        .content {
            width: 100%;
        }
        .form-card {
            width: 100%;
            background-color: #ffffff;
            border-radius: 18px;
            padding: 32px;
            border: 1px solid #edf0f5;
            box-shadow: 0 8px 24px rgba(31, 42, 68, 0.06);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .label {
            display: block;
            color: #374151;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
        }
        .textbox,
        .dropdown {
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
        .textbox:focus,
        .dropdown:focus {
            border-color: #2f6fed;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(47, 111, 237, 0.10);
        }
        .description-box {
            min-height: 125px;
            resize: vertical;
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
        .button {
            width: 100%;
            height: 48px;
            margin-top: 6px;
            background-color: #2f6fed;
            color: #ffffff;
            border: none;
            border-radius: 9px;
            cursor: pointer;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            font-size: 15px;
            font-weight: 600;
            box-shadow: 0 6px 14px rgba(47, 111, 237, 0.20);
        }
        .button:hover {
            background-color: #245dcc;
        }
        .message {
            display: block;
            text-align: center;
            margin-top: 16px;
            font-size: 14px;
            font-weight: 600;
            color: #2f6fed;
        }
        @media screen and (max-width: 800px) {
            .header {
                padding: 0 22px;
            }
            .page {
                width: 92%;
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

    <asp:Panel ID="pnlPage"
        runat="server"
        CssClass="page">

        <asp:Panel ID="pnlPageHeading"
            runat="server"
            CssClass="page-heading">

            <asp:Label ID="lblSmallTitle"
                runat="server"
                Text="Student Support"
                CssClass="small-title">
            </asp:Label>

            <asp:Label ID="lblPageTitle"
                runat="server"
                Text="Raise an Issue"
                CssClass="page-title">
            </asp:Label>

            <asp:Label ID="lblPageSubtitle"
                runat="server"
                Text="Enter the details of the issue you want to report."
                CssClass="page-subtitle">
            </asp:Label>

        </asp:Panel>

        <asp:Panel ID="pnlContent"
            runat="server"
            CssClass="content">

            <asp:Panel ID="pnlFormCard"
                runat="server"
                CssClass="form-card">

                <asp:ValidationSummary ID="vsComplaint"
                    runat="server"
                    ValidationGroup="ComplaintValidation"
                    HeaderText="Please correct the following:"
                    DisplayMode="BulletList"
                    CssClass="validation-summary" />

                <asp:Panel ID="pnlTitleGroup"
                    runat="server"
                    CssClass="form-group">

                    <asp:Label ID="lblIssueTitle"
                        runat="server"
                        Text="Issue Title"
                        CssClass="label">
                    </asp:Label>

                    <asp:TextBox ID="txtTitle"
                        runat="server"
                        CssClass="textbox"
                        placeholder="Enter issue title">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvTitle"
                        runat="server"
                        ControlToValidate="txtTitle"
                        ErrorMessage="Issue title is required."
                        Text="Issue title is required."
                        ValidationGroup="ComplaintValidation"
                        Display="Dynamic"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </asp:Panel>

                <asp:Panel ID="pnlCategoryGroup"
                    runat="server"
                    CssClass="form-group">

                    <asp:Label ID="lblCategory"
                        runat="server"
                        Text="Category"
                        CssClass="label">
                    </asp:Label>

                    <asp:DropDownList ID="ddlCategory"
                        runat="server"
                        CssClass="dropdown">

                        <asp:ListItem Text="-- Select Category --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Infrastructure" Value="Infrastructure"></asp:ListItem>
                        <asp:ListItem Text="IT / Internet" Value="IT / Internet"></asp:ListItem>
                        <asp:ListItem Text="Cleanliness" Value="Cleanliness"></asp:ListItem>
                        <asp:ListItem Text="Hostel" Value="Hostel"></asp:ListItem>
                        <asp:ListItem Text="Library" Value="Library"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>

                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="rfvCategory"
                        runat="server"
                        ControlToValidate="ddlCategory"
                        InitialValue=""
                        ErrorMessage="Please select a category."
                        Text="Please select a category."
                        ValidationGroup="ComplaintValidation"
                        Display="Dynamic"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </asp:Panel>

                <asp:Panel ID="pnlDescriptionGroup"
                    runat="server"
                    CssClass="form-group">

                    <asp:Label ID="lblDescription"
                        runat="server"
                        Text="Description"
                        CssClass="label">
                    </asp:Label>

                    <asp:TextBox ID="txtDescription"
                        runat="server"
                        CssClass="textbox description-box"
                        TextMode="MultiLine"
                        Rows="5"
                        placeholder="Describe the issue">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvDescription"
                        runat="server"
                        ControlToValidate="txtDescription"
                        ErrorMessage="Description is required."
                        Text="Description is required."
                        ValidationGroup="ComplaintValidation"
                        Display="Dynamic"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </asp:Panel>

                <asp:Panel ID="pnlLocationGroup"
                    runat="server"
                    CssClass="form-group">

                    <asp:Label ID="lblLocation"
                        runat="server"
                        Text="Location"
                        CssClass="label">
                    </asp:Label>

                    <asp:TextBox ID="txtLocation"
                        runat="server"
                        CssClass="textbox"
                        placeholder="Enter the location">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvLocation"
                        runat="server"
                        ControlToValidate="txtLocation"
                        ErrorMessage="Location is required."
                        Text="Location is required."
                        ValidationGroup="ComplaintValidation"
                        Display="Dynamic"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </asp:Panel>

                <asp:Button ID="btnSubmit"
                    runat="server"
                    Text="Submit Issue"
                    CssClass="button"
                    ValidationGroup="ComplaintValidation" />

                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</form>
</body>
</html>