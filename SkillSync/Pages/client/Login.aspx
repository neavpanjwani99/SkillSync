<%@ Page Title="Login & Register | SkillSync" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SkillSync.Pages.client.Login" %><!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login &amp; Register | SkillSync</title>
    <link href="../../css/StyleSheet1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            width: 100vw;
            background: linear-gradient(135deg, #FAF7F2 0%, #FFFAF3 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-section {
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: #FFFFFF;
            border: 1px solid #E5D6C5;
            border-radius: 20px;
            padding: 28px 36px;
            width: 100%;
            max-width: 440px;
            margin: 0 auto;
            box-shadow: 0 12px 36px rgba(43, 26, 18, 0.08);
            position: relative;
            box-sizing: border-box;
        }

        .login-header {
            text-align: center;
            margin-bottom: 18px;
        }

        .login-title {
            font-size: 24px;
            font-weight: 800;
            color: #2B1A12;
            margin: 4px 0 4px;
        }

        .login-subtitle {
            font-size: 13px;
            color: #7A685D;
            margin: 0;
        }

        .form-group-login {
            margin-bottom: 12px;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .form-label-login {
            font-size: 12px;
            font-weight: 700;
            color: #2B1A12;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-control-login {
            padding: 10px 14px;
            border: 1px solid #E5D6C5;
            border-radius: 8px;
            font-size: 14px;
            background-color: #FAF7F2;
            color: #2B1A12;
            outline: none;
            font-family: inherit;
            transition: all 0.2s ease;
        }

        .form-control-login:focus {
            border-color: #C99A5B;
            background-color: #FFFFFF;
            box-shadow: 0 0 0 3px rgba(201, 154, 91, 0.15);
        }

        .login-options {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 16px;
            font-size: 12px;
            color: #6E5A4F;
        }

        .btn-login-submit {
            width: 100%;
            padding: 12px;
            background-color: #5A321F;
            color: #FFFAF3 !important;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 4px 14px rgba(90, 50, 31, 0.22);
            transition: all 0.2s ease;
        }

        .btn-login-submit:hover {
            background-color: #2B1A12;
            transform: translateY(-1px);
        }

        .btn-toggle-link {
            background: none;
            border: none;
            color: #5A321F;
            font-weight: 700;
            cursor: pointer;
            text-decoration: underline;
            padding: 0;
            font-size: 13px;
            font-family: inherit;
        }

        .login-footer-links {
            text-align: center;
            margin-top: 16px;
            padding-top: 12px;
            border-top: 1px solid #F3E2CF;
            font-size: 13px;
            color: #7A685D;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="login-section">
        <div class="login-card">
            
            <!-- HEADER LOGO & TITLE -->
            <div class="login-header">
                <img src="../../images/main-logo.png" alt="SkillSync Logo" style="height: 58px; width: auto; margin: 0 auto 6px; display: block;" />
                <span class="badge badge-gold" style="margin-bottom: 4px; display: inline-block;">Account Access</span>
                <h1 class="login-title">SkillSync Portal</h1>
                <p class="login-subtitle">Access your account or register as a new Client</p>
            </div>

            <!-- FEEDBACK MESSAGE -->
            <asp:Label ID="lblMessage" runat="server" Visible="false" style="display: block; padding: 8px 12px; background: #FCE8E6; border: 1px solid #F5C6CB; color: #C5221F; border-radius: 6px; font-size: 12px; margin-bottom: 12px; text-align: center;" />

            <!-- ================= PANEL 1: LOGIN FORM ================= -->
            <asp:Panel ID="pnlLogin" runat="server" Visible="true">
                <!-- ROLE SELECTION -->
                <div class="form-group-login">
                    <asp:Label ID="lblRole" runat="server" CssClass="form-label-login" Text="Select User Role *" />
                    <asp:DropDownList ID="ddlUserRole" runat="server" CssClass="form-control-login">
                        <asp:ListItem Text="Client (Hire Talent)" Value="Client" Selected="True" />
                        <asp:ListItem Text="Administrator (Admin Panel)" Value="Admin" />
                    </asp:DropDownList>
                </div>

                <!-- EMAIL ADDRESS -->
                <div class="form-group-login">
                    <asp:Label ID="lblEmail" runat="server" CssClass="form-label-login" Text="Email Address *" />
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control-login" Placeholder="e.g. client@example.com" Text="rohit@gmail.com" />
                </div>

                <!-- PASSWORD -->
                <div class="form-group-login">
                    <asp:Label ID="lblPassword" runat="server" CssClass="form-label-login" Text="Password *" />
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control-login" Placeholder="Enter your password" Text="client123" />
                </div>

                <!-- OPTIONS -->
                <div class="login-options">
                    <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                        <asp:CheckBox ID="chkRemember" runat="server" Checked="true" />
                        <span>Remember me</span>
                    </label>
                    <a href="#" onclick="alert('Password reset link sent!'); return false;" style="color: #5A321F; font-weight: 500;">Forgot password?</a>
                </div>

                <!-- SUBMIT LOGIN BUTTON -->
                <asp:Button ID="btnLogin" runat="server" Text="Sign In to SkillSync" OnClick="btnLogin_Click" CssClass="btn-login-submit" />
            </asp:Panel>

            <!-- ================= PANEL 2: CLIENT REGISTRATION FORM ================= -->
            <asp:Panel ID="pnlRegister" runat="server" Visible="false">
                <div class="form-group-login">
                    <label class="form-label-login">Full Name *</label>
                    <asp:TextBox ID="txtRegName" runat="server" CssClass="form-control-login" Placeholder="e.g. Rahul Sharma" />
                </div>

                <div class="form-group-login">
                    <label class="form-label-login">Email Address *</label>
                    <asp:TextBox ID="txtRegEmail" runat="server" TextMode="Email" CssClass="form-control-login" Placeholder="e.g. rahul@gmail.com" />
                </div>

                <div class="form-group-login">
                    <label class="form-label-login">Password *</label>
                    <asp:TextBox ID="txtRegPassword" runat="server" TextMode="Password" CssClass="form-control-login" Placeholder="Create password" />
                </div>

                <div class="form-group-login">
                    <label class="form-label-login">City / Location *</label>
                    <asp:TextBox ID="txtRegLocation" runat="server" CssClass="form-control-login" Placeholder="e.g. Mumbai" />
                </div>

                <!-- SUBMIT REGISTER BUTTON -->
                <asp:Button ID="btnRegisterClient" runat="server" Text="Register New Client Account" OnClick="btnRegisterClient_Click" CssClass="btn-login-submit" style="background-color: #2B1A12; margin-top: 6px;" />
            </asp:Panel>

            <!-- TOGGLE MODE FOOTER -->
            <div class="login-footer-links">
                <asp:Button ID="btnToggleMode" runat="server" Text="Don't have an account? Register Now" OnClick="btnToggleMode_Click" CssClass="btn-toggle-link" />
            </div>

        </div>
    </div>
</form>
</body>
</html>
