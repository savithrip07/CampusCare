<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditComplaint.aspx.vb" Inherits="EditComplaint" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - Edit Issue</title>
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
            max-width: 1050px;
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
            display: flex;
            gap: 28px;
            align-items: flex-start;
        }
        .form-card {
            flex: 1;
            background-color: #ffffff;
            border-radius: 18px;
            padding: 32px;
            border: 1px solid #edf0f5;
            box-shadow: 0 8px 24px rgba(31, 42, 68, 0.06);
        }
        .info-card {
            width: 280px;
            background-color: #eef4ff;
            border: 1px solid #dbe7ff;
            border-radius: 18px;
            padding: 28px;
        }
        .info-title {
            display: block;
            margin-bottom: 12px;
            color: #1f2a44;
            font-size: 18px;
            font-weight: 700;
        }
        .info-text {
            display: block;
            color: #64748b;
            font-size: 14px;
            line-height: 1.7;
        }
        .info-item {
            margin-top: 18px;
            padding-top: 18px;
            border-top: 1px solid #d8e5ff;
        }
        .info-item-title {
            display: block;
            color: #2f6fed;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 4px;
        }
        .info-item-text {
            display: block;
            color: #64748b;
            font-size: 13px;
            line-height: 1.5;
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
        .input,
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
        .input {
            min-height: 46px;
        }
        .textarea {
            min-height: 125px;
            resize: vertical;
        }
        .input:focus,
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
        .actions {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-top: 8px;
        }
        .btn {
            padding: 12px 20px;
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
        .back {
            display: inline-block;
            padding: 11px 18px;
            color: #5f6b7a;
            background-color: #ffffff;
            border: 1px solid #dce2ea;
            border-radius: 9px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }
        .back:hover {
            color: #2f6fed;
            border-color: #2f6fed;
        }
        .message {
            display: block;
            margin-top: 15px;
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
            .content {
                display: block;
            }
            .info-card {
                width: 100%;
                margin-top: 20px;
            }
            .actions {
                display: block;
            }
            .back {
                margin-top: 10px;
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

        <asp:HyperLink ID="lnkMyIssuesTop"
            runat="server"
            NavigateUrl="MyComplaints.aspx"
            Text="Back to My Issues"
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
                Text="Issue Management"
                CssClass="small-title">
            </asp:Label>

            <asp:Label ID="lblPageTitle"
                runat="server"
                Text="Edit Issue"
                CssClass="page-title">
            </asp:Label>

            <asp:Label ID="lblPageSubtitle"
                runat="server"
                Text="Update the details of your submitted issue."
                CssClass="page-subtitle">
            </asp:Label>

        </asp:Panel>

        <asp:Panel ID="pnlContent"
            runat="server"
            CssClass="content">

            <asp:Panel ID="pnlFormCard"
                runat="server"
                CssClass="form-card">

                <asp:ValidationSummary ID="vsEditIssue"
                    runat="server"
                    ValidationGroup="EditIssueValidation"
                    HeaderText="Please correct the following:"
                    DisplayMode="BulletList"
                    CssClass="validation-summary" />

                <asp:Panel ID="pnlTitleGroup"
                    runat="server"
                    CssClass="form-group">

                    <asp:Label ID="lblTitle"
                        runat="server"
                        Text="Issue Title"
                        CssClass="label">
                    </asp:Label>

                    <asp:TextBox ID="txtTitle"
                        runat="server"
                        CssClass="input">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvTitle"
                        runat="server"
                        ControlToValidate="txtTitle"
                        ErrorMessage="Issue title is required."
                        Text="Issue title is required."
                        ValidationGroup="EditIssueValidation"
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
                        CssClass="input">

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
                        ValidationGroup="EditIssueValidation"
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
                        TextMode="MultiLine"
                        CssClass="textarea">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvDescription"
                        runat="server"
                        ControlToValidate="txtDescription"
                        ErrorMessage="Description is required."
                        Text="Description is required."
                        ValidationGroup="EditIssueValidation"
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
                        CssClass="input">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvLocation"
                        runat="server"
                        ControlToValidate="txtLocation"
                        ErrorMessage="Location is required."
                        Text="Location is required."
                        ValidationGroup="EditIssueValidation"
                        Display="Dynamic"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </asp:Panel>

                <asp:Panel ID="pnlActions"
                    runat="server"
                    CssClass="actions">

                    <asp:Button ID="btnUpdate"
                        runat="server"
                        Text="Update Issue"
                        CssClass="btn"
                        ValidationGroup="EditIssueValidation" />

                    <asp:HyperLink ID="lnkBack"
                        runat="server"
                        NavigateUrl="MyComplaints.aspx"
                        Text="Cancel"
                        CssClass="back">
                    </asp:HyperLink>

                </asp:Panel>

                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>

            </asp:Panel>

            <asp:Panel ID="pnlInfoCard"
                runat="server"
                CssClass="info-card">

                <asp:Label ID="lblInfoTitle"
                    runat="server"
                    Text="Editing your issue"
                    CssClass="info-title">
                </asp:Label>

                <asp:Label ID="lblInfoText"
                    runat="server"
                    Text="Make sure the information still clearly describes the problem before saving your changes."
                    CssClass="info-text">
                </asp:Label>

                <asp:Panel ID="pnlStatusInfo"
                    runat="server"
                    CssClass="info-item">

                    <asp:Label ID="lblStatusInfoTitle"
                        runat="server"
                        Text="Status stays unchanged"
                        CssClass="info-item-title">
                    </asp:Label>

                    <asp:Label ID="lblStatusInfoText"
                        runat="server"
                        Text="Editing the details will not change the current issue status."
                        CssClass="info-item-text">
                    </asp:Label>

                </asp:Panel>

                <asp:Panel ID="pnlTrackInfo"
                    runat="server"
                    CssClass="info-item">

                    <asp:Label ID="lblTrackInfoTitle"
                        runat="server"
                        Text="Need to track progress?"
                        CssClass="info-item-title">
                    </asp:Label>

                    <asp:Label ID="lblTrackInfoText"
                        runat="server"
                        Text="Return to My Issues to view the latest status set by the support team."
                        CssClass="info-item-text">
                    </asp:Label>

                </asp:Panel>

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</form>
</body>
</html>