<%@ Page Title="Find Your Freelancer | SkillSync" Language="C#" MasterPageFile="client-side.Master" AutoEventWireup="true" CodeBehind="FindFreelancer.aspx.cs" Inherits="SkillSync.Pages.client.WebForm2" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-header-banner {
            background: linear-gradient(135deg, #2B1A12 0%, #4A2C1D 100%);
            color: #FFFAF3;
            padding: 50px 0;
            border-bottom: 4px solid #C99A5B;
        }

        .form-card {
            background: #FFFFFF;
            border-radius: 20px;
            padding: 40px;
            border: 1px solid #E5D6C5;
            box-shadow: 0 10px 30px rgba(43, 26, 18, 0.06);
            margin-top: -30px;
            margin-bottom: 80px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 28px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        .form-label {
            font-size: 14px;
            font-weight: 700;
            color: #2B1A12;
        }

        .form-control {
            padding: 14px 16px;
            border: 1px solid #E5D6C5;
            border-radius: 10px;
            font-size: 15px;
            background-color: #FAF7F2;
            color: #2B1A12;
            outline: none;
            font-family: inherit;
            transition: all 0.2s ease;
        }

        .form-control:focus {
            border-color: #C99A5B;
            background-color: #FFFFFF;
            box-shadow: 0 0 0 3px rgba(201, 154, 91, 0.15);
        }

        .radio-group label {
            margin-right: 20px;
            font-size: 14px;
            color: #4A2C1D;
            cursor: pointer;
        }

        .section-divider {
            grid-column: span 2;
            border-top: 1px solid #E5D6C5;
            margin: 10px 0;
            padding-top: 20px;
        }

        .preference-box {
            background: #FFFAF3;
            border: 1px solid #E5D6C5;
            padding: 24px;
            border-radius: 14px;
        }
    </style>
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- ================= PAGE BANNER ================= -->
    <div class="page-header-banner">
        <div class="container text-center" style="text-align: center;">
            <span class="badge badge-gold" style="margin-bottom: 12px;">Requirement Input</span>
            <h1 style="color: #FFFAF3; font-size: 38px; margin-bottom: 8px;">Find Your Freelancer</h1>
            <p style="color: #D9C6B5; font-size: 16px; max-width: 600px; margin: 0 auto;">
                Tell us your exact project details, skills, budget, and timeline to discover matched professionals.
            </p>
        </div>
    </div>

    <!-- ================= REQUIREMENT FORM ================= -->
    <div class="container">
        <div class="form-card">
            <h3 style="font-size: 22px; color: #2B1A12; margin-bottom: 24px; padding-bottom: 12px; border-bottom: 2px solid #F3E2CF;">
                Project Requirements &amp; Preferences
            </h3>

            <div class="form-grid">
                <!-- 1. Category -->
                <div class="form-group">
                    <asp:Label ID="lblCategory" runat="server" CssClass="form-label" Text="Project Category *" />
                    <asp:DropDownList ID="ddlFormCategory" runat="server" CssClass="form-control">
                        <asp:ListItem Text="-- Select Category --" Value="" />
                        <asp:ListItem Text="Web Development" Value="WebDev" Selected="True" />
                        <asp:ListItem Text="UI/UX Design" Value="UIUX" />
                        <asp:ListItem Text="Graphic Design" Value="Graphic" />
                        <asp:ListItem Text="Digital Marketing" Value="Marketing" />
                        <asp:ListItem Text="Content Writing" Value="Writing" />
                        <asp:ListItem Text="Video Editing" Value="Video" />
                    </asp:DropDownList>
                </div>

                <!-- 2. Required Skills -->
                <div class="form-group">
                    <asp:Label ID="lblSkills" runat="server" CssClass="form-label" Text="Required Skills (Comma Separated) *" />
                    <asp:TextBox ID="txtSkills" runat="server" CssClass="form-control" Text="ASP.NET, C#, SQL Server, HTML5" Placeholder="e.g. ASP.NET, C#, SQL Server" />
                </div>

                <!-- 3. Min Budget -->
                <div class="form-group">
                    <asp:Label ID="lblMinBudget" runat="server" CssClass="form-label" Text="Minimum Budget (&#8377;)" />
                    <asp:TextBox ID="txtMinBudget" runat="server" CssClass="form-control" Text="5000" Placeholder="e.g. 5000" />
                </div>

                <!-- 4. Max Budget -->
                <div class="form-group">
                    <asp:Label ID="lblMaxBudget" runat="server" CssClass="form-label" Text="Maximum Budget (&#8377;)" />
                    <asp:TextBox ID="txtMaxBudget" runat="server" CssClass="form-control" Text="15000" Placeholder="e.g. 15000" />
                </div>

                <!-- 5. Delivery Time -->
                <div class="form-group">
                    <asp:Label ID="lblDelivery" runat="server" CssClass="form-label" Text="Expected Delivery Time *" />
                    <asp:DropDownList ID="ddlDeliveryTime" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Within 3 Days" Value="3" />
                        <asp:ListItem Text="Within 1 Week" Value="7" Selected="True" />
                        <asp:ListItem Text="Within 2 Weeks" Value="14" />
                        <asp:ListItem Text="Within 1 Month" Value="30" />
                    </asp:DropDownList>
                </div>

                <!-- 6. Experience Required -->
                <div class="form-group">
                    <asp:Label ID="lblExperience" runat="server" CssClass="form-label" Text="Experience Required *" />
                    <asp:DropDownList ID="ddlExperience" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Any Experience" Value="Any" />
                        <asp:ListItem Text="1+ Years" Value="1Yr" />
                        <asp:ListItem Text="2+ Years" Value="2Yrs" Selected="True" />
                        <asp:ListItem Text="3+ Years" Value="3Yrs" />
                        <asp:ListItem Text="5+ Years" Value="5Yrs" />
                    </asp:DropDownList>
                </div>

                <!-- 7. Location -->
                <div class="form-group">
                    <asp:Label ID="lblLocation" runat="server" CssClass="form-label" Text="Preferred Location" />
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" Text="Mumbai" Placeholder="e.g. Mumbai, Pune, Remote" />
                </div>

                <!-- 8. Work Mode -->
                <div class="form-group">
                    <asp:Label ID="lblWorkMode" runat="server" CssClass="form-label" Text="Work Mode *" />
                    <asp:RadioButtonList ID="rblWorkMode" runat="server" RepeatDirection="Horizontal" CssClass="radio-group" style="margin-top: 10px;">
                        <asp:ListItem Text="Remote" Value="Remote" Selected="True" />
                        <asp:ListItem Text="In-Person" Value="InPerson" />
                        <asp:ListItem Text="Hybrid" Value="Hybrid" />
                    </asp:RadioButtonList>
                </div>

                <!-- 9. Priorities & Preferences -->
                <div class="form-group full-width">
                    <div class="section-divider"></div>
                    <div class="preference-box">
                        <asp:Label ID="lblPriority" runat="server" CssClass="form-label" Text="Primary Priority / Importance Filter" style="display: block; margin-bottom: 10px;" />
                        <p style="font-size: 13px; color: #7A685D; margin-bottom: 14px;">Indicate which factor matters most for your match calculation:</p>
                        
                        <asp:RadioButtonList ID="rblPriority" runat="server" RepeatDirection="Horizontal" CssClass="radio-group">
                            <asp:ListItem Text="Skill Match" Value="Skill" Selected="True" />
                            <asp:ListItem Text="Budget Fit" Value="Budget" />
                            <asp:ListItem Text="Experience" Value="Exp" />
                            <asp:ListItem Text="Delivery Time" Value="Delivery" />
                            <asp:ListItem Text="Location" Value="Location" />
                        </asp:RadioButtonList>
                    </div>
                </div>

                <!-- 10. Submit Button -->
                <div class="form-group full-width" style="margin-top: 20px; text-align: center;">
                    <asp:Button ID="btnSubmitRequirement" runat="server" Text="Find Matches" OnClick="btnSubmitRequirement_Click" CssClass="btn-primary" style="padding: 16px 48px; font-size: 16px; font-weight: 700; width: 100%; max-width: 380px;" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
