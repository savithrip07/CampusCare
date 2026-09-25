<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="CampusConnect.CampusConnectLogin" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CampusCare - Login</title>
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
            padding: 40px 20px;
        }
        .login-wrapper {
            width: 900px;
            max-width: 100%;
            min-height: 540px;
            background-color: #ffffff;
            border-radius: 22px;
            box-shadow: 0 20px 50px rgba(31, 42, 68, 0.12);
            overflow: hidden;
            display: flex;
        }
        .brand-panel {
            width: 45%;
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
        .login-panel {
            width: 55%;
            padding: 55px 55px;
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
            margin-bottom: 28px;
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
        .textbox {
            width: 100%;
            height: 48px;
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
            margin-bottom: 16px;
            font-size: 12px;
        }
        .remember-area {
            margin-top: -2px;
            margin-bottom: 18px;
            color: #5f6b7a;
            font-size: 13px;
        }
        .remember {
            vertical-align: middle;
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
            color: #c0392b;
            font-size: 14px;
            font-weight: 600;
            margin-top: 15px;
        }
        .signup-area {
            text-align: center;
            margin-top: 24px;
            padding-top: 22px;
            border-top: 1px solid #edf0f5;
            color: #7a8495;
            font-size: 14px;
        }
        .signup-text {
            color: #7a8495;
            font-size: 14px;
        }
        .signup {
            color: #2f6fed;
            font-weight: 600;
            text-decoration: none;
        }
        .signup:hover {
            text-decoration: underline;
        }
        @media screen and (max-width: 760px) {
            .login-wrapper {
                width: 480px;
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
            .login-panel {
                width: 100%;
                padding: 40px 35px;
            }
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <asp:Panel ID="pnlPage" runat="server" CssClass="page">
        <asp:Panel ID="pnlLoginWrapper" runat="server" CssClass="login-wrapper">
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
                    Text="Report campus issues, track their status and view important announcements."
                    CssClass="brand-description">
                </asp:Label>
            </asp:Panel>
            <asp:Panel ID="pnlLogin" runat="server" CssClass="login-panel">
                <asp:Label ID="lblSmallTitle"
                    runat="server"
                    Text="Student Support Portal"
                    CssClass="small-title">
                </asp:Label>
                <asp:Label ID="lblPageTitle"
                    runat="server"
                    Text="Welcome back"
                    CssClass="page-title">
                </asp:Label>
                <asp:Label ID="lblSubtitle"
                    runat="server"
                    Text="Login to access your CampusCare account."
                    CssClass="subtitle">
                </asp:Label>
                <asp:ValidationSummary ID="vsLogin"
                    runat="server"
                    ValidationGroup="LoginValidation"
                    HeaderText="Please correct the following:"
                    DisplayMode="BulletList"
                    CssClass="validation-summary" />
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
                        ValidationGroup="LoginValidation"
                        Display="Dynamic"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Enter a valid email address."
                        Text="Enter a valid email address."
                        ValidationGroup="LoginValidation"
                        Display="Dynamic"
                        CssClass="validator">
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
                        placeholder="Enter your password">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        Text="Password is required."
                        ValidationGroup="LoginValidation"
                        Display="Dynamic"
                        CssClass="validator">
                    </asp:RequiredFieldValidator>
                </asp:Panel>
                <asp:Panel ID="pnlRememberArea"
                    runat="server"
                    CssClass="remember-area">
                    <asp:CheckBox ID="chkRememberEmail"
                        runat="server"
                        Text=" Remember email"
                        CssClass="remember" />
                </asp:Panel>
                <asp:Button ID="btnLogin"
                    runat="server"
                    Text="Login to CampusCare"
                    CssClass="button"
                    ValidationGroup="LoginValidation">
                </asp:Button>
                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>
                <asp:Panel ID="pnlSignupArea"
                    runat="server"
                    CssClass="signup-area">
                    <asp:Label ID="lblSignupText"
                        runat="server"
                        Text="Don't have an account? "
                        CssClass="signup-text">
                    </asp:Label>
                    <asp:HyperLink ID="lnkSignup"
                        runat="server"
                        NavigateUrl="~/Signup.aspx"
                        Text="Create an account"
                        CssClass="signup">
                    </asp:HyperLink>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</form>
</body>
</html>