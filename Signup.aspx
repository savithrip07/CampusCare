<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Signup.aspx.vb" Inherits="CampusConnect.Signup" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - Sign Up</title>
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
        .page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 35px 20px;
        }
        .signup-wrapper {
            width: 950px;
            max-width: 100%;
            min-height: 700px;
            background-color: #ffffff;
            border-radius: 22px;
            box-shadow: 0 20px 50px rgba(31, 42, 68, 0.12);
            overflow: hidden;
            display: flex;
        }
        .brand-panel {
            width: 42%;
            background-color: #1f2a44;
            color: #ffffff;
            padding: 55px 45px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .brand-name {
            display: block;
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 14px;
        }
        .brand-tagline {
            display: block;
            font-size: 17px;
            line-height: 1.5;
            color: #dbe4f3;
            margin-bottom: 24px;
        }
        .brand-description {
            display: block;
            font-size: 14px;
            line-height: 1.7;
            color: #aebbd0;
        }
        .signup-panel {
            width: 58%;
            padding: 40px 55px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .small-title {
            display: block;
            color: #2f6fed;
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }
        .page-title {
            display: block;
            color: #1f2a44;
            font-size: 30px;
            font-weight: 700;
        }
        .subtitle {
            display: block;
            color: #7a8495;
            font-size: 14px;
            line-height: 1.6;
            margin-top: 10px;
            margin-bottom: 22px;
        }
        .form-group {
            margin-bottom: 13px;
        }
        .label {
            display: block;
            color: #374151;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 7px;
        }
        .textbox {
            width: 100%;
            height: 44px;
            padding: 0 15px;
            border: 1px solid #d8dee9;
            border-radius: 9px;
            background-color: #f9fbfd;
            color: #1f2937;
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            font-size: 14px;
            outline: none;
        }
        .textbox:focus {
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
            margin-bottom: 15px;
            font-size: 12px;
        }
        .button {
            width: 100%;
            height: 48px;
            margin-top: 5px;
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
            margin-top: 14px;
            font-size: 14px;
            font-weight: 600;
            color: #2f6fed;
        }
        .login-area {
            text-align: center;
            margin-top: 18px;
            padding-top: 18px;
            border-top: 1px solid #edf0f5;
            color: #7a8495;
            font-size: 14px;
        }
        .login-text {
            color: #7a8495;
            font-size: 14px;
        }
        .login {
            color: #2f6fed;
            font-weight: 600;
            text-decoration: none;
        }
        .login:hover {
            text-decoration: underline;
        }
        @media screen and (max-width: 760px) {
            .signup-wrapper {
                width: 500px;
                display: block;
            }
            .brand-panel {
                width: 100%;
                padding: 35px;
            }
            .brand-description {
                display: none;
            }
            .brand-name {
                font-size: 30px;
            }
            .signup-panel {
                width: 100%;
                padding: 40px 35px;
            }
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <asp:Panel ID="pnlPage" runat="server" CssClass="page">
        <asp:Panel ID="pnlSignupWrapper" runat="server" CssClass="signup-wrapper">
            <asp:Panel ID="pnlBrand" runat="server" CssClass="brand-panel">
                <asp:Label ID="lblBrandName"
                    runat="server"
                    Text="CampusCare"
                    CssClass="brand-name">
                </asp:Label>
                <asp:Label ID="lblBrandTagline"
                    runat="server"
                    Text="Student Support &amp; Issue Management System"
                    CssClass="brand-tagline">
                </asp:Label>
                <asp:Label ID="lblBrandDescription"
                    runat="server"
                    Text="Create an account to report issues, track their status and access campus announcements."
                    CssClass="brand-description">
                </asp:Label>
            </asp:Panel>
            <asp:Panel ID="pnlSignup" runat="server" CssClass="signup-panel">
                <asp:Label ID="lblSmallTitle"
                    runat="server"
                    Text="Student Support Portal"
                    CssClass="small-title">
                </asp:Label>
                <asp:Label ID="lblPageTitle"
                    runat="server"
                    Text="Create your account"
                    CssClass="page-title">
                </asp:Label>
                <asp:Label ID="lblSubtitle"
                    runat="server"
                    Text="Enter your details to get started with CampusCare."
                    CssClass="subtitle">
                </asp:Label>
                <asp:ValidationSummary ID="vsSignup"
                    runat="server"
                    ValidationGroup="SignupValidation"
                    HeaderText="Please correct the following:"
                    CssClass="validation-summary"
                    DisplayMode="BulletList" />
                <asp:Panel ID="pnlNameGroup"
                    runat="server"
                    CssClass="form-group">
                    <asp:Label ID="lblName"
                        runat="server"
                        Text="Full Name"
                        CssClass="label">
                    </asp:Label>
                    <asp:TextBox ID="txtName"
                        runat="server"
                        CssClass="textbox"
                        placeholder="Enter your full name">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName"
                        runat="server"
                        ControlToValidate="txtName"
                        ErrorMessage="Full name is required."
                        Text="Full name is required."
                        ValidationGroup="SignupValidation"
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </asp:Panel>
                <asp:Panel ID="pnlEmailGroup"
                    runat="server"
                    CssClass="form-group">
                    <asp:Label ID="lblEmail"
                        runat="server"
                        Text="Email Address"
                        CssClass="label">
                    </asp:Label>
                    <asp:TextBox ID="txtEmail"
                        runat="server"
                        CssClass="textbox"
                        placeholder="Enter your email">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email address is required."
                        Text="Email address is required."
                        ValidationGroup="SignupValidation"
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Enter a valid email address."
                        Text="Enter a valid email address."
                        ValidationGroup="SignupValidation"
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:RegularExpressionValidator>
                </asp:Panel>
                <asp:Panel ID="pnlPasswordGroup"
                    runat="server"
                    CssClass="form-group">
                    <asp:Label ID="lblPassword"
                        runat="server"
                        Text="Password"
                        CssClass="label">
                    </asp:Label>
                    <asp:TextBox ID="txtPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="textbox"
                        placeholder="Create a password">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        Text="Password is required."
                        ValidationGroup="SignupValidation"
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </asp:Panel>
                <asp:Panel ID="pnlConfirmPasswordGroup"
                    runat="server"
                    CssClass="form-group">
                    <asp:Label ID="lblConfirmPassword"
                        runat="server"
                        Text="Confirm Password"
                        CssClass="label">
                    </asp:Label>
                    <asp:TextBox ID="txtConfirmPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="textbox"
                        placeholder="Re-enter your password">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Confirm password is required."
                        Text="Confirm password is required."
                        ValidationGroup="SignupValidation"
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtPassword"
                        ErrorMessage="Passwords do not match."
                        Text="Passwords do not match."
                        ValidationGroup="SignupValidation"
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:CompareValidator>
                </asp:Panel>
                <asp:Panel ID="pnlDepartmentGroup"
                    runat="server"
                    CssClass="form-group">
                    <asp:Label ID="lblDepartment"
                        runat="server"
                        Text="Department"
                        CssClass="label">
                    </asp:Label>
                    <asp:TextBox ID="txtDepartment"
                        runat="server"
                        CssClass="textbox"
                        placeholder="Enter your department">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDepartment"
                        runat="server"
                        ControlToValidate="txtDepartment"
                        ErrorMessage="Department is required."
                        Text="Department is required."
                        ValidationGroup="SignupValidation"
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </asp:Panel>
                <asp:Panel ID="pnlYearGroup"
                    runat="server"
                    CssClass="form-group">
                    <asp:Label ID="lblYear"
                        runat="server"
                        Text="Year"
                        CssClass="label">
                    </asp:Label>
                    <asp:TextBox ID="txtYear"
                        runat="server"
                        CssClass="textbox"
                        placeholder="Enter your year">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvYear"
                        runat="server"
                        ControlToValidate="txtYear"
                        ErrorMessage="Year is required."
                        Text="Year is required."
                        ValidationGroup="SignupValidation"
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvYear"
                        runat="server"
                        ControlToValidate="txtYear"
                        MinimumValue="1"
                        MaximumValue="5"
                        Type="Integer"
                        ErrorMessage="Year must be between 1 and 5."
                        Text="Year must be between 1 and 5."
                        ValidationGroup="SignupValidation"
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:RangeValidator>
                </asp:Panel>
                <asp:Button ID="btnSignup"
                    runat="server"
                    Text="Create Account"
                    CssClass="button"
                    ValidationGroup="SignupValidation" />
                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>
                <asp:Panel ID="pnlLoginArea"
                    runat="server"
                    CssClass="login-area">
                    <asp:Label ID="lblLoginText"
                        runat="server"
                        Text="Already have an account? "
                        CssClass="login-text">
                    </asp:Label>
                    <asp:HyperLink ID="lnkLogin"
                        runat="server"
                        NavigateUrl="~/Login.aspx"
                        Text="Login"
                        CssClass="login">
                    </asp:HyperLink>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</form>
</body>
</html>