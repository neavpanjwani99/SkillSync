<%@ Page Title="Login | SkillSync" Language="C#" MasterPageFile="client-side.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SkillSync.Pages.client.Login" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .login-section {
            padding: 70px 0 90px;
            background: linear-gradient(135deg, #FAF7F2 0%, #FFFAF3 100%);
            min-height: calc(100vh - 400px);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: #FFFFFF;
            border: 1px solid #E5D6C5;
            border-radius: 20px;
            padding: 44px 40px;
            width: 100%;
            max-width: 460px;
            margin: 0 auto;
            box-shadow: 0 12px 36px rgba(43, 26, 18, 0.08);
            position: relative;
        }

        .login-header {
            text-align: center;
            margin-bottom: 32px;
        }

        .login-title {
            font-size: 28px;
            font-weight: 800;
            color: #2B1A12;
            margin-bottom: 8px;
        }

        .login-subtitle {
            font-size: 14px;
            color: #7A685D;
        }

        .form-group-login {
            margin-bottom: 22px;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-label-login {
            font-size: 13px;
            font-weight: 700;
            color: #2B1A12;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-control-login {
            padding: 13px 16px;
            border: 1px solid #E5D6C5;
            border-radius: 10px;
            font-size: 15px;
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
            margin-bottom: 26px;
            font-size: 13px;
            color: #6E5A4F;
        }

        .btn-login-submit {
            width: 100%;
            padding: 15px;
            background-color: #5A321F;
            color: #FFFAF3 !important;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 6px 18px rgba(90, 50, 31, 0.25);
            transition: all 0.2s ease;
        }

        .btn-login-submit:hover {
            background-color: #2B1A12;
            transform: translateY(-2px);
            box-shadow: 0 8px 22px rgba(90, 50, 31, 0.35);
        }

        .login-footer-links {
            text-align: center;
            margin-top: 26px;
            padding-top: 20px;
            border-top: 1px solid #F3E2CF;
            font-size: 14px;
            color: #7A685D;
        }

        .login-footer-links a {
            color: #5A321F;
            font-weight: 600;
        }

        .login-footer-links a:hover {
            color: #C99A5B;
            text-decoration: underline;
        }
    </style>
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-section">
        <div class="login-card">
            
            <!-- HEADER -->
            <div class="login-header">
                <img src="../../images/main-logo.png" alt="SkillSync Logo" style="height: 75px; width: auto; margin: 0 auto 14px; display: block;" />
                <span class="badge badge-gold" style="margin-bottom: 10px;">Account Access</span>
                <h1 class="login-title">Welcome to SkillSync</h1>
                <p class="login-subtitle">Sign in to manage your projects or freelancer profile</p>
            </div>

            <!-- FEEDBACK MESSAGE -->
            <asp:Label ID="lblMessage" runat="server" Visible="false" style="display: block; padding: 10px 14px; background: #FCE8E6; border: 1px solid #F5C6CB; color: #C5221F; border-radius: 8px; font-size: 13px; margin-bottom: 20px; text-align: center;" />

            <!-- ROLE SELECTION -->
            <div class="form-group-login">
                <asp:Label ID="lblRole" runat="server" CssClass="form-label-login" Text="Select User Role *" />
                <asp:DropDownList ID="ddlUserRole" runat="server" CssClass="form-control-login">
                    <asp:ListItem Text="Client (Hire Talent)" Value="Client" Selected="True" />
                    <asp:ListItem Text="Freelancer (Offer Services)" Value="Freelancer" />
                    <asp:ListItem Text="Administrator (Admin Panel)" Value="Admin" />
                </asp:DropDownList>
            </div>

            <!-- EMAIL ADDRESS -->
            <div class="form-group-login">
                <asp:Label ID="lblEmail" runat="server" CssClass="form-label-login" Text="Email Address *" />
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control-login" Placeholder="e.g. client@example.com" Text="aarav@example.com" />
            </div>

            <!-- PASSWORD -->
            <div class="form-group-login">
                <asp:Label ID="lblPassword" runat="server" CssClass="form-label-login" Text="Password *" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control-login" Placeholder="Enter your password" Text="password123" />
            </div>

            <!-- OPTIONS -->
            <div class="login-options">
                <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                    <asp:CheckBox ID="chkRemember" runat="server" Checked="true" />
                    <span>Remember me</span>
                </label>
                <a href="#" onclick="alert('Password reset link sent to your registered email!'); return false;" style="color: #5A321F; font-weight: 500;">Forgot password?</a>
            </div>

            <!-- SUBMIT BUTTON -->
            <asp:Button ID="btnLogin" runat="server" Text="Sign In to SkillSync" OnClick="btnLogin_Click" CssClass="btn-login-submit" />

            <!-- FOOTER LINKS -->
            <div class="login-footer-links">
                Don't have an account? 
                <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Pages/client/FindFreelancer.aspx">Register Now</asp:HyperLink>
            </div>

        </div>
    </div>
</asp:Content>
