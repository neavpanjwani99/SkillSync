<%@ Page Title="Match Results | SkillSync" Language="C#" MasterPageFile="client-side.Master" AutoEventWireup="true" CodeBehind="MatchResults.aspx.cs" Inherits="SkillSync.Pages.client.MatchResults" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .summary-bar {
            background: #2B1A12;
            color: #FFFAF3;
            padding: 24px;
            border-radius: 16px;
            margin-top: 30px;
            margin-bottom: 36px;
            box-shadow: 0 6px 20px rgba(43, 26, 18, 0.1);
        }

        .summary-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            align-items: center;
            justify-content: space-between;
        }

        .summary-item {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .summary-item label {
            font-size: 11px;
            text-transform: uppercase;
            color: #C99A5B;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .summary-item span {
            font-size: 14px;
            font-weight: 600;
            color: #FFFAF3;
        }

        .results-container {
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 32px;
            margin-bottom: 80px;
        }

        /* Filter Sidebar */
        .filter-sidebar {
            background: #FFFFFF;
            border: 1px solid #E5D6C5;
            border-radius: 16px;
            padding: 24px;
            height: fit-content;
            box-shadow: 0 4px 18px rgba(43, 26, 18, 0.04);
        }

        .filter-title {
            font-size: 18px;
            font-weight: 700;
            color: #2B1A12;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #F3E2CF;
        }

        .filter-group {
            margin-bottom: 20px;
        }

        .filter-group label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            color: #4A2C1D;
            margin-bottom: 8px;
        }

        .filter-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #E5D6C5;
            border-radius: 8px;
            font-size: 13px;
            background-color: #FAF7F2;
            color: #2B1A12;
            font-family: inherit;
        }

        /* Match Result Card */
        .match-card {
            background: #FFFFFF;
            border: 1px solid #E5D6C5;
            border-radius: 16px;
            padding: 28px;
            margin-bottom: 24px;
            box-shadow: 0 6px 24px rgba(43, 26, 18, 0.05);
            display: grid;
            grid-template-columns: 180px 1fr 180px;
            gap: 24px;
            position: relative;
            transition: all 0.3s ease;
        }

        .match-card:hover {
            border-color: #C99A5B;
            box-shadow: 0 10px 30px rgba(43, 26, 18, 0.12);
        }

        .match-avatar-col {
            text-align: center;
        }

        .match-avatar-img {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #F3E2CF;
            margin-bottom: 10px;
        }

        .match-score-badge {
            background: #E6F4EA;
            color: #137333;
            font-size: 18px;
            font-weight: 800;
            padding: 6px 14px;
            border-radius: 20px;
            display: inline-block;
            border: 1px solid #CEEAD6;
        }

        .match-info-col {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .match-why-box {
            background: #FFFAF3;
            border: 1px solid #E5D6C5;
            border-radius: 10px;
            padding: 12px 16px;
            margin-top: 12px;
        }

        .match-why-item {
            font-size: 12px;
            color: #4A3B32;
            display: flex;
            align-items: center;
            gap: 6px;
            margin-bottom: 4px;
        }

        .match-why-item:last-child {
            margin-bottom: 0;
        }

        .check-mark {
            color: #137333;
            font-weight: 700;
        }

        .match-action-col {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: flex-end;
            text-align: right;
            border-left: 1px solid #F3E2CF;
            padding-left: 20px;
        }

        .match-price {
            font-size: 22px;
            font-weight: 800;
            color: #2B1A12;
        }

        /* Modal Popup */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(43, 26, 18, 0.65);
            backdrop-filter: blur(4px);
            z-index: 2000;
            align-items: center;
            justify-content: center;
        }

        .modal-container {
            background: #FFFFFF;
            border-radius: 20px;
            width: 90%;
            max-width: 650px;
            padding: 32px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
            position: relative;
            max-height: 85vh;
            overflow-y: auto;
        }

        .modal-close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background: #FAF7F2;
            border: 1px solid #E5D6C5;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 18px;
            font-weight: 700;
            color: #2B1A12;
        }
    </style>
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <!-- ================= SUMMARY BAR ================= -->
        <div class="summary-bar">
            <div class="summary-grid">
                <div class="summary-item">
                    <label>Category</label>
                    <asp:Label ID="lblSummaryCat" runat="server" Text="Web Development" />
                </div>
                <div class="summary-item">
                    <label>Required Skills</label>
                    <asp:Label ID="lblSummarySkills" runat="server" Text="ASP.NET, C#, SQL Server" />
                </div>
                <div class="summary-item">
                    <label>Budget Range</label>
                    <asp:Label ID="lblSummaryBudget" runat="server" Text="&#8377;5,000 - &#8377;15,000" />
                </div>
                <div class="summary-item">
                    <label>Experience</label>
                    <asp:Label ID="lblSummaryExp" runat="server" Text="2+ Years" />
                </div>
                <div class="summary-item">
                    <label>Location / Mode</label>
                    <asp:Label ID="lblSummaryLoc" runat="server" Text="Mumbai (Remote)" />
                </div>
                <div>
                    <asp:HyperLink ID="hlEditReq" runat="server" NavigateUrl="~/Pages/client/FindFreelancer.aspx" CssClass="btn-secondary" style="color: #FFFAF3 !important; border-color: #C99A5B; font-size: 13px; padding: 8px 16px;">
                        Edit Requirement
                    </asp:HyperLink>
                </div>
            </div>
        </div>

        <h2 style="font-size: 28px; color: #2B1A12; margin-bottom: 24px;">Freelancers Matching Your Requirements</h2>

        <!-- ================= RESULTS MAIN LAYOUT ================= -->
        <div class="results-container">

            <!-- SIDEBAR FILTERS -->
            <aside class="filter-sidebar">
                <div class="filter-title">Filter Results</div>

                <div class="filter-group">
                    <label>Category</label>
                    <asp:DropDownList ID="ddlFiltCat" runat="server" CssClass="filter-control">
                        <asp:ListItem Text="Web Development" Selected="True" />
                        <asp:ListItem Text="UI/UX Design" />
                        <asp:ListItem Text="Graphic Design" />
                    </asp:DropDownList>
                </div>

                <div class="filter-group">
                    <label>Max Budget (&#8377;)</label>
                    <asp:DropDownList ID="ddlFiltBudget" runat="server" CssClass="filter-control">
                        <asp:ListItem Text="Any Budget" />
                        <asp:ListItem Text="Under &#8377;5,000" />
                        <asp:ListItem Text="Under &#8377;10,000" Selected="True" />
                        <asp:ListItem Text="Under &#8377;15,000" />
                    </asp:DropDownList>
                </div>

                <div class="filter-group">
                    <label>Experience</label>
                    <asp:DropDownList ID="ddlFiltExp" runat="server" CssClass="filter-control">
                        <asp:ListItem Text="Any Experience" />
                        <asp:ListItem Text="2+ Years" Selected="True" />
                        <asp:ListItem Text="3+ Years" />
                    </asp:DropDownList>
                </div>

                <div class="filter-group">
                    <label>Work Mode</label>
                    <asp:DropDownList ID="ddlFiltMode" runat="server" CssClass="filter-control">
                        <asp:ListItem Text="All Modes" />
                        <asp:ListItem Text="Remote" Selected="True" />
                        <asp:ListItem Text="In-Person" />
                    </asp:DropDownList>
                </div>

                <asp:Button ID="btnApplyFilter" runat="server" Text="Apply Filters" CssClass="btn-secondary" style="width: 100%; margin-top: 10px;" />
            </aside>

            <!-- RESULT CARDS GRID -->
            <div>

                <!-- CARD 1 (94% Match) -->
                <div class="match-card">
                    <div class="match-avatar-col">
                        <asp:Image ID="imgM1" runat="server" ImageUrl="~/images/freelancer1.jpg" CssClass="match-avatar-img" AlternateText="Aarav Mehta" />
                        <div class="match-score-badge">94% Match</div>
                    </div>

                    <div class="match-info-col">
                        <div>
                            <span class="badge badge-gold" style="margin-bottom: 6px;">Best Skill Match</span>
                            <h3 style="font-size: 20px; color: #2B1A12; margin-bottom: 4px;">Aarav Mehta</h3>
                            <p style="font-size: 14px; color: #5A321F; font-weight: 600; margin-bottom: 8px;">ASP.NET &amp; C# Senior Developer</p>
                            
                            <div class="skill-tags">
                                <span class="skill-tag">ASP.NET</span>
                                <span class="skill-tag">C#</span>
                                <span class="skill-tag">SQL Server</span>
                                <span class="skill-tag">Web Forms</span>
                            </div>
                        </div>

                        <!-- Why This Match -->
                        <div class="match-why-box">
                            <div style="font-size: 12px; font-weight: 700; color: #2B1A12; margin-bottom: 4px;">Why This Match?</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> Strong skill match (ASP.NET, C#, SQL Server)</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> Fits your budget (&#8377;8,000 within &#8377;5k-15k)</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> Meets experience requirement (3 Years)</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> Same location &amp; work mode (Mumbai / Remote)</div>
                        </div>
                    </div>

                    <div class="match-action-col">
                        <div>
                            <div class="match-price">&#8377;8,000</div>
                            <div style="font-size: 12px; color: #7A685D;">Est. Delivery: 7 Days</div>
                            <div style="font-size: 13px; color: #C99A5B; font-weight: 600; margin-top: 4px;">Rating: 4.9 / 5.0</div>
                        </div>

                        <div style="display: flex; flex-direction: column; gap: 8px; width: 100%;">
                            <button type="button" class="btn-primary" style="padding: 9px; font-size: 13px;" onclick="openProfileModal('Aarav Mehta', 'ASP.NET & C# Senior Developer', '3+ Years', 'Rs 8,000', '4.9 / 5.0', 'ASP.NET, C#, SQL Server, Web Forms', 'Experienced Web Forms developer specializing in college and enterprise project architecture.', '../../images/freelancer1.jpg')">View Profile</button>
                            <asp:HyperLink ID="hlComp1" runat="server" NavigateUrl="~/Pages/client/Compare.aspx" CssClass="btn-secondary" style="padding: 8px; font-size: 13px; text-align: center;">Compare</asp:HyperLink>
                        </div>
                    </div>
                </div>

                <!-- CARD 2 (87% Match) -->
                <div class="match-card">
                    <div class="match-avatar-col">
                        <asp:Image ID="imgM2" runat="server" ImageUrl="~/images/freelancer2.jpg" CssClass="match-avatar-img" AlternateText="Riya Shah" />
                        <div class="match-score-badge" style="background: #E8F0FE; color: #1A73E8; border-color: #D2E3FC;">87% Match</div>
                    </div>

                    <div class="match-info-col">
                        <div>
                            <span class="badge badge-brown" style="margin-bottom: 6px;">Best Budget Fit</span>
                            <h3 style="font-size: 20px; color: #2B1A12; margin-bottom: 4px;">Riya Shah</h3>
                            <p style="font-size: 14px; color: #5A321F; font-weight: 600; margin-bottom: 8px;">Senior UI/UX &amp; Web Designer</p>
                            
                            <div class="skill-tags">
                                <span class="skill-tag">Figma</span>
                                <span class="skill-tag">UI Design</span>
                                <span class="skill-tag">HTML5/CSS3</span>
                            </div>
                        </div>

                        <!-- Why This Match -->
                        <div class="match-why-box">
                            <div style="font-size: 12px; font-weight: 700; color: #2B1A12; margin-bottom: 4px;">Why This Match?</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> Excellent budget fit (&#8377;5,000 lowest rate)</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> Exceeds experience requirement (4 Years)</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> Fast 5-day delivery commitment</div>
                        </div>
                    </div>

                    <div class="match-action-col">
                        <div>
                            <div class="match-price">&#8377;5,000</div>
                            <div style="font-size: 12px; color: #7A685D;">Est. Delivery: 5 Days</div>
                            <div style="font-size: 13px; color: #C99A5B; font-weight: 600; margin-top: 4px;">Rating: 4.8 / 5.0</div>
                        </div>

                        <div style="display: flex; flex-direction: column; gap: 8px; width: 100%;">
                            <button type="button" class="btn-primary" style="padding: 9px; font-size: 13px;" onclick="openProfileModal('Riya Shah', 'Senior UI/UX Designer', '4+ Years', 'Rs 5,000', '4.8 / 5.0', 'Figma, UI Design, HTML5, CSS3', 'Passionate designer crafting modern, accessible web interfaces.', '../../images/freelancer2.jpg')">View Profile</button>
                            <asp:HyperLink ID="hlComp2" runat="server" NavigateUrl="~/Pages/client/Compare.aspx" CssClass="btn-secondary" style="padding: 8px; font-size: 13px; text-align: center;">Compare</asp:HyperLink>
                        </div>
                    </div>
                </div>

                <!-- CARD 3 (82% Match) -->
                <div class="match-card">
                    <div class="match-avatar-col">
                        <asp:Image ID="imgM3" runat="server" ImageUrl="~/images/freelancer3.jpg" CssClass="match-avatar-img" AlternateText="Vikram Malhotra" />
                        <div class="match-score-badge" style="background: #FEF7E0; color: #B06000; border-color: #FCE8E6;">82% Match</div>
                    </div>

                    <div class="match-info-col">
                        <div>
                            <span class="badge badge-gold" style="margin-bottom: 6px;">Fastest Delivery</span>
                            <h3 style="font-size: 20px; color: #2B1A12; margin-bottom: 4px;">Vikram Malhotra</h3>
                            <p style="font-size: 14px; color: #5A321F; font-weight: 600; margin-bottom: 8px;">Full Stack Web Developer</p>
                            
                            <div class="skill-tags">
                                <span class="skill-tag">Web Forms</span>
                                <span class="skill-tag">C#</span>
                                <span class="skill-tag">JavaScript</span>
                            </div>
                        </div>

                        <!-- Why This Match -->
                        <div class="match-why-box">
                            <div style="font-size: 12px; font-weight: 700; color: #2B1A12; margin-bottom: 4px;">Why This Match?</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> Superfast 3-day turnaround</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> High 5-year experience background</div>
                        </div>
                    </div>

                    <div class="match-action-col">
                        <div>
                            <div class="match-price">&#8377;10,000</div>
                            <div style="font-size: 12px; color: #7A685D;">Est. Delivery: 3 Days</div>
                            <div style="font-size: 13px; color: #C99A5B; font-weight: 600; margin-top: 4px;">Rating: 4.7 / 5.0</div>
                        </div>

                        <div style="display: flex; flex-direction: column; gap: 8px; width: 100%;">
                            <button type="button" class="btn-primary" style="padding: 9px; font-size: 13px;" onclick="openProfileModal('Vikram Malhotra', 'Full Stack Web Developer', '5+ Years', 'Rs 10,000', '4.7 / 5.0', 'Web Forms, C#, JavaScript, SQL', 'Full stack engineer with rapid prototype delivery record.', '../../images/freelancer3.jpg')">View Profile</button>
                            <asp:HyperLink ID="hlComp3" runat="server" NavigateUrl="~/Pages/client/Compare.aspx" CssClass="btn-secondary" style="padding: 8px; font-size: 13px; text-align: center;">Compare</asp:HyperLink>
                        </div>
                    </div>
                </div>

                <!-- CARD 4 (78% Match) -->
                <div class="match-card">
                    <div class="match-avatar-col">
                        <asp:Image ID="imgM4" runat="server" ImageUrl="~/images/freelancer4.jpg" CssClass="match-avatar-img" AlternateText="Ananya Verma" />
                        <div class="match-score-badge" style="background: #FCE8E6; color: #C5221F; border-color: #FAD2CF;">78% Match</div>
                    </div>

                    <div class="match-info-col">
                        <div>
                            <span class="badge badge-brown" style="margin-bottom: 6px;">Best Nearby Match</span>
                            <h3 style="font-size: 20px; color: #2B1A12; margin-bottom: 4px;">Ananya Verma</h3>
                            <p style="font-size: 14px; color: #5A321F; font-weight: 600; margin-bottom: 8px;">Graphic &amp; Front-End Designer</p>
                            
                            <div class="skill-tags">
                                <span class="skill-tag">Photoshop</span>
                                <span class="skill-tag">CSS3</span>
                                <span class="skill-tag">Branding</span>
                            </div>
                        </div>

                        <!-- Why This Match -->
                        <div class="match-why-box">
                            <div style="font-size: 12px; font-weight: 700; color: #2B1A12; margin-bottom: 4px;">Why This Match?</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> Same city location (Mumbai)</div>
                            <div class="match-why-item"><span class="check-mark">[x]</span> Affordable pricing (&#8377;6,500)</div>
                        </div>
                    </div>

                    <div class="match-action-col">
                        <div>
                            <div class="match-price">&#8377;6,500</div>
                            <div style="font-size: 12px; color: #7A685D;">Est. Delivery: 6 Days</div>
                            <div style="font-size: 13px; color: #C99A5B; font-weight: 600; margin-top: 4px;">Rating: 4.9 / 5.0</div>
                        </div>

                        <div style="display: flex; flex-direction: column; gap: 8px; width: 100%;">
                            <button type="button" class="btn-primary" style="padding: 9px; font-size: 13px;" onclick="openProfileModal('Ananya Verma', 'Graphic & Front-End Designer', '2+ Years', 'Rs 6,500', '4.9 / 5.0', 'Photoshop, CSS3, Branding', 'Creative designer specializing in visual identity and web interfaces.', '../../images/freelancer4.jpg')">View Profile</button>
                            <asp:HyperLink ID="hlComp4" runat="server" NavigateUrl="~/Pages/client/Compare.aspx" CssClass="btn-secondary" style="padding: 8px; font-size: 13px; text-align: center;">Compare</asp:HyperLink>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- ================= FREELANCER PROFILE POPUP MODAL ================= -->
    <div id="profileModal" class="modal-overlay">
        <div class="modal-container">
            <button type="button" class="modal-close-btn" onclick="closeProfileModal()">&times;</button>
            
            <div style="display: flex; gap: 20px; align-items: center; margin-bottom: 24px; padding-bottom: 20px; border-bottom: 1px solid #E5D6C5;">
                <img id="mAvatar" src="" alt="Freelancer Photo" style="width: 90px; height: 90px; border-radius: 50%; object-fit: cover; border: 2px solid #C99A5B;" />
                <div>
                    <h3 id="mName" style="font-size: 22px; color: #2B1A12; margin-bottom: 2px;">Freelancer Name</h3>
                    <p id="mRole" style="font-size: 14px; color: #5A321F; font-weight: 600;">Professional Role</p>
                    <span id="mRating" class="badge badge-gold" style="margin-top: 6px;">Rating: 4.9</span>
                </div>
            </div>

            <div style="margin-bottom: 20px;">
                <h4 style="font-size: 15px; color: #2B1A12; margin-bottom: 6px;">About Professional</h4>
                <p id="mAbout" style="font-size: 13px; color: #4A3B32; line-height: 1.6;">Detailed description of freelancer background and expertise.</p>
            </div>

            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-bottom: 20px; background: #FFFAF3; padding: 16px; border-radius: 12px; border: 1px solid #E5D6C5;">
                <div>
                    <span style="font-size: 11px; text-transform: uppercase; color: #7A685D; font-weight: 700;">Experience</span>
                    <div id="mExp" style="font-size: 14px; font-weight: 700; color: #2B1A12;">3+ Years</div>
                </div>

                <div>
                    <span style="font-size: 11px; text-transform: uppercase; color: #7A685D; font-weight: 700;">Starting Price</span>
                    <div id="mRate" style="font-size: 14px; font-weight: 700; color: #5A321F;">Rs 8,000</div>
                </div>
            </div>

            <div style="margin-bottom: 24px;">
                <h4 style="font-size: 15px; color: #2B1A12; margin-bottom: 8px;">Key Skills</h4>
                <div id="mSkills" class="skill-tags">
                    <span class="skill-tag">ASP.NET</span>
                </div>
            </div>

            <div style="display: flex; gap: 12px; border-top: 1px solid #E5D6C5; padding-top: 20px;">
                <a href="Compare.aspx" class="btn-secondary" style="flex: 1; text-align: center;">Compare Candidate</a>
                <a href="#" class="btn-primary" style="flex: 1; text-align: center;" onclick="alert('Shortlist feature recorded for prototype!'); return false;">Hire Freelancer</a>
            </div>
        </div>
    </div>

    <!-- JavaScript Modal Handler -->
    <script type="text/javascript">
        function openProfileModal(name, role, exp, rate, rating, skills, about, img) {
            document.getElementById('mName').innerText = name;
            document.getElementById('mRole').innerText = role;
            document.getElementById('mExp').innerText = exp;
            document.getElementById('mRate').innerText = rate;
            document.getElementById('mRating').innerText = 'Rating: ' + rating;
            document.getElementById('mAbout').innerText = about;
            document.getElementById('mAvatar').src = img;

            var skillsArr = skills.split(',');
            var skillsHtml = '';
            for (var i = 0; i < skillsArr.length; i++) {
                skillsHtml += '<span class="skill-tag">' + skillsArr[i].trim() + '</span>';
            }
            document.getElementById('mSkills').innerHTML = skillsHtml;

            document.getElementById('profileModal').style.display = 'flex';
        }

        function closeProfileModal() {
            document.getElementById('profileModal').style.display = 'none';
        }
    </script>
</asp:Content>
