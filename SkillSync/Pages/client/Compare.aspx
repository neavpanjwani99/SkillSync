<%@ Page Title="Compare Freelancers | SkillSync" Language="C#" MasterPageFile="client-side.Master" AutoEventWireup="true" CodeBehind="Compare.aspx.cs" Inherits="SkillSync.Pages.client.Compare" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .compare-header-banner {
            background: linear-gradient(135deg, #2B1A12 0%, #4A2C1D 100%);
            color: #FFFAF3;
            padding: 45px 0;
            border-bottom: 4px solid #C99A5B;
        }

        .compare-table-card {
            background: #FFFFFF;
            border-radius: 20px;
            border: 1px solid #E5D6C5;
            box-shadow: 0 10px 30px rgba(43, 26, 18, 0.08);
            margin-top: -30px;
            margin-bottom: 80px;
            overflow: hidden;
        }

        .compare-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .compare-table th, .compare-table td {
            padding: 18px 24px;
            border-bottom: 1px solid #F3E2CF;
            vertical-align: middle;
        }

        .compare-table th {
            background-color: #FFFAF3;
            color: #2B1A12;
            font-size: 15px;
            font-weight: 700;
            width: 200px;
            border-right: 1px solid #E5D6C5;
        }

        .compare-table tr:last-child td, .compare-table tr:last-child th {
            border-bottom: none;
        }

        .compare-table tr:nth-child(even) td {
            background-color: #FAF7F2;
        }

        .col-freelancer {
            text-align: center;
            width: 28%;
            border-right: 1px solid #E5D6C5;
        }

        .col-freelancer:last-child {
            border-right: none;
        }

        .comp-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #C99A5B;
            margin-bottom: 8px;
        }

        .comp-name {
            font-size: 17px;
            font-weight: 700;
            color: #2B1A12;
        }

        .comp-role {
            font-size: 13px;
            color: #5A321F;
            font-weight: 500;
        }
    </style>
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- BANNER -->
    <div class="compare-header-banner">
        <div class="container text-center" style="text-align: center;">
            <span class="badge badge-gold" style="margin-bottom: 12px;">Side-by-Side Analysis</span>
            <h1 style="color: #FFFAF3; font-size: 36px; margin-bottom: 8px;">Compare Matched Freelancers</h1>
            <p style="color: #D9C6B5; font-size: 15px; max-width: 550px; margin: 0 auto;">
                Evaluate candidate skills, ratings, pricing, and timelines side-by-side before hiring.
            </p>
        </div>
    </div>

    <!-- COMPARISON MATRIX CARD -->
    <div class="container">
        <!-- SELECTOR BAR -->
        <div style="background: #FFFFFF; border: 1px solid #E5D6C5; border-radius: 16px; padding: 20px 28px; margin-bottom: 24px; display: flex; align-items: center; justify-content: space-between; gap: 20px;">
            <div style="font-weight: 700; color: #2B1A12; font-size: 16px;">Select Candidates to Compare:</div>
            
            <div style="display: flex; align-items: center; gap: 16px;">
                <asp:DropDownList ID="ddlCandidate1" runat="server" CssClass="form-control" style="width: 220px; padding: 10px;">
                    <asp:ListItem Text="Aarav Mehta (94% Match)" Value="1" Selected="True" />
                    <asp:ListItem Text="Riya Shah (87% Match)" Value="2" />
                    <asp:ListItem Text="Vikram Malhotra (82% Match)" Value="3" />
                    <asp:ListItem Text="Ananya Verma (78% Match)" Value="4" />
                </asp:DropDownList>

                <span style="font-weight: 700; color: #C99A5B;">VS</span>

                <asp:DropDownList ID="ddlCandidate2" runat="server" CssClass="form-control" style="width: 220px; padding: 10px;">
                    <asp:ListItem Text="Aarav Mehta (94% Match)" Value="1" />
                    <asp:ListItem Text="Riya Shah (87% Match)" Value="2" Selected="True" />
                    <asp:ListItem Text="Vikram Malhotra (82% Match)" Value="3" />
                    <asp:ListItem Text="Ananya Verma (78% Match)" Value="4" />
                </asp:DropDownList>

                <asp:Button ID="btnCompare" runat="server" Text="Update Matrix" OnClick="btnCompare_Click" CssClass="btn-primary" style="padding: 10px 20px; font-size: 14px;" />
            </div>
        </div>

        <div class="compare-table-card">
            <table class="compare-table">
                <!-- ROW 1: PROFILE HEADER -->
                <tr>
                    <th>Freelancer Profile</th>
                    <td class="col-freelancer">
                        <asp:Image ID="imgC1" runat="server" ImageUrl="~/images/freelancer1.jpg" CssClass="comp-avatar" AlternateText="Aarav Mehta" />
                        <div class="comp-name">Aarav Mehta</div>
                        <div class="comp-role">ASP.NET &amp; C# Specialist</div>
                    </td>
                    <td class="col-freelancer">
                        <asp:Image ID="imgC2" runat="server" ImageUrl="~/images/freelancer2.jpg" CssClass="comp-avatar" AlternateText="Riya Shah" />
                        <div class="comp-name">Riya Shah</div>
                        <div class="comp-role">Senior UI/UX Designer</div>
                    </td>
                    <td class="col-freelancer">
                        <asp:Image ID="imgC3" runat="server" ImageUrl="~/images/freelancer3.jpg" CssClass="comp-avatar" AlternateText="Vikram Malhotra" />
                        <div class="comp-name">Vikram Malhotra</div>
                        <div class="comp-role">Full Stack Developer</div>
                    </td>
                </tr>

                <!-- ROW 2: MATCH SCORE -->
                <tr>
                    <th>Match Percentage</th>
                    <td class="col-freelancer">
                        <span class="badge badge-match" style="font-size: 15px; padding: 6px 14px;">94% Match</span>
                    </td>
                    <td class="col-freelancer">
                        <span class="badge" style="background: #E8F0FE; color: #1A73E8; font-size: 15px; padding: 6px 14px; border: 1px solid #D2E3FC;">87% Match</span>
                    </td>
                    <td class="col-freelancer">
                        <span class="badge" style="background: #FEF7E0; color: #B06000; font-size: 15px; padding: 6px 14px; border: 1px solid #FCE8E6;">82% Match</span>
                    </td>
                </tr>

                <!-- ROW 3: SKILLS -->
                <tr>
                    <th>Key Skills</th>
                    <td class="col-freelancer" style="font-size: 13px; font-weight: 500;">ASP.NET, C#, SQL Server, Web Forms</td>
                    <td class="col-freelancer" style="font-size: 13px; font-weight: 500;">Figma, UI Design, Wireframing</td>
                    <td class="col-freelancer" style="font-size: 13px; font-weight: 500;">Web Forms, JavaScript, C#</td>
                </tr>

                <!-- ROW 4: EXPERIENCE -->
                <tr>
                    <th>Experience</th>
                    <td class="col-freelancer" style="font-weight: 600;">3+ Years</td>
                    <td class="col-freelancer" style="font-weight: 600;">4+ Years</td>
                    <td class="col-freelancer" style="font-weight: 600;">5+ Years</td>
                </tr>

                <!-- ROW 5: RATING -->
                <tr>
                    <th>Client Rating</th>
                    <td class="col-freelancer" style="color: #C99A5B; font-weight: 700;">4.9 / 5.0 (42 reviews)</td>
                    <td class="col-freelancer" style="color: #C99A5B; font-weight: 700;">4.8 / 5.0 (38 reviews)</td>
                    <td class="col-freelancer" style="color: #C99A5B; font-weight: 700;">4.7 / 5.0 (29 reviews)</td>
                </tr>

                <!-- ROW 6: PRICE -->
                <tr>
                    <th>Starting Price</th>
                    <td class="col-freelancer" style="font-size: 18px; font-weight: 800; color: #2B1A12;">&#8377;8,000</td>
                    <td class="col-freelancer" style="font-size: 18px; font-weight: 800; color: #2B1A12;">&#8377;5,000</td>
                    <td class="col-freelancer" style="font-size: 18px; font-weight: 800; color: #2B1A12;">&#8377;10,000</td>
                </tr>

                <!-- ROW 7: DELIVERY TIME -->
                <tr>
                    <th>Est. Delivery Time</th>
                    <td class="col-freelancer" style="font-weight: 600;">7 Days</td>
                    <td class="col-freelancer" style="font-weight: 600;">5 Days</td>
                    <td class="col-freelancer" style="font-weight: 600; color: #137333;">3 Days (Fastest)</td>
                </tr>

                <!-- ROW 8: LOCATION -->
                <tr>
                    <th>Location</th>
                    <td class="col-freelancer">Mumbai</td>
                    <td class="col-freelancer">Pune</td>
                    <td class="col-freelancer">Mumbai</td>
                </tr>

                <!-- ROW 9: WORK MODE -->
                <tr>
                    <th>Work Mode</th>
                    <td class="col-freelancer"><span class="badge badge-brown">Remote</span></td>
                    <td class="col-freelancer"><span class="badge badge-brown">Remote</span></td>
                    <td class="col-freelancer"><span class="badge badge-brown">Hybrid</span></td>
                </tr>

                <!-- ROW 10: AVAILABILITY -->
                <tr>
                    <th>Availability</th>
                    <td class="col-freelancer" style="color: #137333; font-weight: 600;">Immediate</td>
                    <td class="col-freelancer" style="color: #137333; font-weight: 600;">Immediate</td>
                    <td class="col-freelancer" style="color: #B06000; font-weight: 600;">Next Week</td>
                </tr>

                <!-- ROW 11: ACTIONS -->
                <tr>
                    <th>Action</th>
                    <td class="col-freelancer">
                        <asp:HyperLink ID="hlHire1" runat="server" NavigateUrl="#" CssClass="btn-primary" style="width: 100%; text-align: center; font-size: 13px;">Choose Aarav</asp:HyperLink>
                    </td>
                    <td class="col-freelancer">
                        <asp:HyperLink ID="hlHire2" runat="server" NavigateUrl="#" CssClass="btn-primary" style="width: 100%; text-align: center; font-size: 13px;">Choose Riya</asp:HyperLink>
                    </td>
                    <td class="col-freelancer">
                        <asp:HyperLink ID="hlHire3" runat="server" NavigateUrl="#" CssClass="btn-primary" style="width: 100%; text-align: center; font-size: 13px;">Choose Vikram</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
