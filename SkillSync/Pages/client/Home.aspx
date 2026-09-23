<%@ Page Title="SkillSync | Find the Right Freelancer" Language="C#" MasterPageFile="client-side.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SkillSync.Pages.client.WebForm1" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, #FFFAF3 0%, #F3E2CF 100%);
            padding: 80px 0 90px;
            border-bottom: 1px solid #E5D6C5;
            text-align: center;
        }

        .hero-title {
            font-size: 48px;
            font-weight: 800;
            color: #2B1A12;
            margin-bottom: 20px;
            line-height: 1.25;
        }

        .hero-subtitle {
            font-size: 18px;
            color: #6E5A4F;
            max-width: 680px;
            margin: 0 auto 40px;
            line-height: 1.6;
        }

        .search-box-card {
            background: #FFFFFF;
            padding: 16px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(43, 26, 18, 0.1);
            max-width: 860px;
            margin: 0 auto;
            display: flex;
            gap: 12px;
            border: 1px solid #E5D6C5;
            align-items: center;
        }

        .search-select, .search-input {
            padding: 14px 18px;
            border: 1px solid #E5D6C5;
            border-radius: 10px;
            font-size: 15px;
            outline: none;
            color: #2B1A12;
            font-family: inherit;
        }

        .search-select {
            width: 220px;
            background-color: #FAF7F2;
        }

        .search-input {
            flex: 1;
        }

        /* Section Commons */
        .section-padding {
            padding: 80px 0;
        }

        .section-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-title {
            font-size: 34px;
            color: #2B1A12;
            margin-bottom: 12px;
        }

        .section-desc {
            font-size: 16px;
            color: #7A685D;
            max-width: 600px;
            margin: 0 auto;
        }

        /* Categories Grid */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(190px, 1fr));
            gap: 20px;
        }

        .category-card {
            background: #FFFFFF;
            padding: 28px 20px;
            border-radius: 14px;
            text-align: center;
            border: 1px solid #E5D6C5;
            box-shadow: 0 4px 16px rgba(43, 26, 18, 0.04);
            transition: all 0.3s ease;
        }

        .category-card:hover {
            transform: translateY(-5px);
            border-color: #C99A5B;
            box-shadow: 0 10px 24px rgba(43, 26, 18, 0.1);
        }

        .category-icon-box {
            width: 54px;
            height: 54px;
            background: #FFFAF3;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 16px;
            border: 1px solid #E5D6C5;
            font-weight: 700;
            color: #5A321F;
        }

        /* Smart Match Flow */
        .match-flow-container {
            background: #FFFFFF;
            border-radius: 20px;
            padding: 40px;
            border: 1px solid #E5D6C5;
            box-shadow: 0 8px 30px rgba(43, 26, 18, 0.05);
        }

        .flow-steps {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            margin-top: 30px;
        }

        .flow-step-box {
            flex: 1;
            background: #FAF7F2;
            padding: 24px;
            border-radius: 14px;
            border: 1px solid #E5D6C5;
            text-align: center;
        }

        .flow-arrow {
            font-size: 24px;
            color: #C99A5B;
            font-weight: 700;
        }

        /* Featured Cards */
        .freelancers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
            gap: 28px;
        }

        .freelancer-card {
            background: #FFFFFF;
            border-radius: 16px;
            border: 1px solid #E5D6C5;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(43, 26, 18, 0.05);
            transition: all 0.3s ease;
        }

        .freelancer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(43, 26, 18, 0.12);
            border-color: #C99A5B;
        }

        .card-header-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #E5D6C5;
        }

        .card-body {
            padding: 20px;
        }

        .freelancer-name {
            font-size: 18px;
            font-weight: 700;
            color: #2B1A12;
            margin-bottom: 4px;
        }

        .freelancer-role {
            font-size: 14px;
            color: #5A321F;
            margin-bottom: 14px;
            font-weight: 500;
        }

        .skill-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            margin-bottom: 16px;
        }

        .skill-tag {
            background: #FFFAF3;
            color: #4A2C1D;
            border: 1px solid #E5D6C5;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }

        .card-meta {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-top: 14px;
            border-top: 1px solid #F3E2CF;
            margin-top: 14px;
            font-size: 13px;
            color: #7A685D;
        }

        /* How it works */
        .steps-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 24px;
        }

        .step-card {
            background: #FFFFFF;
            padding: 30px 24px;
            border-radius: 16px;
            border: 1px solid #E5D6C5;
            position: relative;
        }

        .step-num {
            font-size: 32px;
            font-weight: 800;
            color: #C99A5B;
            margin-bottom: 12px;
        }

        /* CTA Banner */
        .cta-banner {
            background: linear-gradient(135deg, #2B1A12 0%, #4A2C1D 100%);
            color: #FFFAF3;
            border-radius: 24px;
            padding: 60px 40px;
            text-align: center;
            margin-top: 40px;
            box-shadow: 0 12px 40px rgba(43, 26, 18, 0.2);
        }
    </style>
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- ================= HERO SECTION ================= -->
    <section class="hero-section">
        <div class="container">
            <h1 class="hero-title">Find the Right Freelancer<br />for Your Next Project</h1>
            <p class="hero-subtitle">
                Tell us what you need, discover suitable freelancers, compare your options and choose the right professional for your business.
            </p>

            <div class="search-box-card">
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="search-select">
                    <asp:ListItem Text="Select Category" Value="" />
                    <asp:ListItem Text="Web Development" Value="WebDev" />
                    <asp:ListItem Text="UI/UX Design" Value="UIUX" />
                    <asp:ListItem Text="Graphic Design" Value="Graphic" />
                    <asp:ListItem Text="Digital Marketing" Value="Marketing" />
                    <asp:ListItem Text="Content Writing" Value="Writing" />
                    <asp:ListItem Text="Video Editing" Value="Video" />
                </asp:DropDownList>

                <asp:TextBox ID="txtRequirement" runat="server" CssClass="search-input" Placeholder="Enter skills or project requirement (e.g. ASP.NET, Figma, SEO)..." />

                <asp:Button ID="btnFind" runat="server" Text="Find Freelancer" CssClass="btn-primary" OnClick="btnFind_Click" style="padding: 14px 30px; font-size: 15px;" />
            </div>
        </div>
    </section>

    <!-- ================= POPULAR CATEGORIES ================= -->
    <section class="section-padding">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Popular Service Categories</h2>
                <p class="section-desc">Browse top-rated freelance services tailored to your project requirements</p>
            </div>

            <div class="categories-grid">
                <div class="category-card">
                    <div class="category-icon-box">DEV</div>
                    <h3 style="font-size: 16px; margin-bottom: 6px;">Web Development</h3>
                    <p style="font-size: 13px; color: #7A685D;">ASP.NET, C#, React, SQL</p>
                </div>

                <div class="category-card">
                    <div class="category-icon-box">DES</div>
                    <h3 style="font-size: 16px; margin-bottom: 6px;">UI/UX Design</h3>
                    <p style="font-size: 13px; color: #7A685D;">Figma, Wireframing, Prototypes</p>
                </div>

                <div class="category-card">
                    <div class="category-icon-box">ART</div>
                    <h3 style="font-size: 16px; margin-bottom: 6px;">Graphic Design</h3>
                    <p style="font-size: 13px; color: #7A685D;">Branding, Logos, Illustrations</p>
                </div>

                <div class="category-card">
                    <div class="category-icon-box">MKT</div>
                    <h3 style="font-size: 16px; margin-bottom: 6px;">Digital Marketing</h3>
                    <p style="font-size: 13px; color: #7A685D;">SEO, Social Media, PPC</p>
                </div>

                <div class="category-card">
                    <div class="category-icon-box">TXT</div>
                    <h3 style="font-size: 16px; margin-bottom: 6px;">Content Writing</h3>
                    <p style="font-size: 13px; color: #7A685D;">Blogs, Technical Docs, Copy</p>
                </div>

                <div class="category-card">
                    <div class="category-icon-box">VID</div>
                    <h3 style="font-size: 16px; margin-bottom: 6px;">Video Editing</h3>
                    <p style="font-size: 13px; color: #7A685D;">Reels, Animations, VFX</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= SMART MATCHING SHOWCASE ================= -->
    <section class="section-padding" style="background: #FAF7F2; border-top: 1px solid #E5D6C5; border-bottom: 1px solid #E5D6C5;">
        <div class="container">
            <div class="section-header">
                <span class="badge badge-gold" style="margin-bottom: 12px;">Core Marketplace Feature</span>
                <h2 class="section-title">Find Freelancers That Fit Your Requirements</h2>
                <p class="section-desc">SkillSync analyzes your criteria to calculate an accurate Match Percentage</p>
            </div>

            <div class="match-flow-container">
                <div class="flow-steps">
                    <div class="flow-step-box">
                        <h4 style="color: #2B1A12; margin-bottom: 8px;">1. Your Requirements</h4>
                        <p style="font-size: 13px; color: #7A685D;">Category, Skills, Budget, Experience, Location &amp; Work Mode</p>
                    </div>

                    <div class="flow-arrow">&rarr;</div>

                    <div class="flow-step-box" style="background: #FFFAF3; border-color: #C99A5B;">
                        <h4 style="color: #5A321F; margin-bottom: 8px;">2. Smart Match Engine</h4>
                        <p style="font-size: 13px; color: #7A685D;">Calculates Match Score &amp; Justification Checklist</p>
                    </div>

                    <div class="flow-arrow">&rarr;</div>

                    <div class="flow-step-box">
                        <h4 style="color: #2B1A12; margin-bottom: 8px;">3. Suitable Freelancers</h4>
                        <p style="font-size: 13px; color: #7A685D;">Side-by-side comparison &amp; profile details</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= FEATURED FREELANCERS ================= -->
    <section class="section-padding">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Featured Freelancers</h2>
                <p class="section-desc">Handpicked professionals ready for immediate project assignment</p>
            </div>

            <div class="freelancers-grid">
                <!-- Card 1 -->
                <div class="freelancer-card">
                    <asp:Image ID="imgFree1" runat="server" ImageUrl="~/images/freelancer1.jpg" CssClass="card-header-img" AlternateText="Aarav Mehta" />
                    <div class="card-body">
                        <div class="freelancer-name">Aarav Mehta</div>
                        <div class="freelancer-role">ASP.NET &amp; C# Specialist</div>
                        <div class="skill-tags">
                            <span class="skill-tag">ASP.NET</span>
                            <span class="skill-tag">C#</span>
                            <span class="skill-tag">SQL Server</span>
                        </div>
                        <div class="card-meta">
                            <span>Rating: 4.9 (42 reviews)</span>
                            <strong style="color: #2B1A12;">From &#8377;8,000</strong>
                        </div>
                        <div style="margin-top: 14px;">
                            <asp:HyperLink ID="hlView1" runat="server" NavigateUrl="~/Pages/client/MatchResults.aspx" CssClass="btn-secondary" style="width: 100%; text-align: center;">View Match Details</asp:HyperLink>
                        </div>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="freelancer-card">
                    <asp:Image ID="imgFree2" runat="server" ImageUrl="~/images/freelancer2.jpg" CssClass="card-header-img" AlternateText="Riya Shah" />
                    <div class="card-body">
                        <div class="freelancer-name">Riya Shah</div>
                        <div class="freelancer-role">Senior UI/UX Designer</div>
                        <div class="skill-tags">
                            <span class="skill-tag">Figma</span>
                            <span class="skill-tag">UI Design</span>
                            <span class="skill-tag">Prototypes</span>
                        </div>
                        <div class="card-meta">
                            <span>Rating: 4.8 (38 reviews)</span>
                            <strong style="color: #2B1A12;">From &#8377;5,000</strong>
                        </div>
                        <div style="margin-top: 14px;">
                            <asp:HyperLink ID="hlView2" runat="server" NavigateUrl="~/Pages/client/MatchResults.aspx" CssClass="btn-secondary" style="width: 100%; text-align: center;">View Match Details</asp:HyperLink>
                        </div>
                    </div>
                </div>

                <!-- Card 3 -->
                <div class="freelancer-card">
                    <asp:Image ID="imgFree3" runat="server" ImageUrl="~/images/freelancer3.jpg" CssClass="card-header-img" AlternateText="Vikram Malhotra" />
                    <div class="card-body">
                        <div class="freelancer-name">Vikram Malhotra</div>
                        <div class="freelancer-role">Full Stack Developer</div>
                        <div class="skill-tags">
                            <span class="skill-tag">Web Forms</span>
                            <span class="skill-tag">JavaScript</span>
                            <span class="skill-tag">CSS3</span>
                        </div>
                        <div class="card-meta">
                            <span>Rating: 4.7 (29 reviews)</span>
                            <strong style="color: #2B1A12;">From &#8377;10,000</strong>
                        </div>
                        <div style="margin-top: 14px;">
                            <asp:HyperLink ID="hlView3" runat="server" NavigateUrl="~/Pages/client/MatchResults.aspx" CssClass="btn-secondary" style="width: 100%; text-align: center;">View Match Details</asp:HyperLink>
                        </div>
                    </div>
                </div>

                <!-- Card 4 -->
                <div class="freelancer-card">
                    <asp:Image ID="imgFree4" runat="server" ImageUrl="~/images/freelancer4.jpg" CssClass="card-header-img" AlternateText="Ananya Verma" />
                    <div class="card-body">
                        <div class="freelancer-name">Ananya Verma</div>
                        <div class="freelancer-role">Brand &amp; Graphic Designer</div>
                        <div class="skill-tags">
                            <span class="skill-tag">Photoshop</span>
                            <span class="skill-tag">Illustrator</span>
                            <span class="skill-tag">Branding</span>
                        </div>
                        <div class="card-meta">
                            <span>Rating: 4.9 (51 reviews)</span>
                            <strong style="color: #2B1A12;">From &#8377;4,500</strong>
                        </div>
                        <div style="margin-top: 14px;">
                            <asp:HyperLink ID="hlView4" runat="server" NavigateUrl="~/Pages/client/MatchResults.aspx" CssClass="btn-secondary" style="width: 100%; text-align: center;">View Match Details</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= HOW IT WORKS ================= -->
    <section class="section-padding" style="background: #FAF7F2; border-top: 1px solid #E5D6C5; border-bottom: 1px solid #E5D6C5;">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">How SkillSync Works</h2>
                <p class="section-desc">Four simple steps from project requirement to hiring</p>
            </div>

            <div class="steps-grid">
                <div class="step-card">
                    <div class="step-num">01</div>
                    <h3 style="font-size: 18px; margin-bottom: 8px;">Tell Us What You Need</h3>
                    <p style="font-size: 14px; color: #7A685D;">Specify your category, required skills, budget range, and timeline.</p>
                </div>

                <div class="step-card">
                    <div class="step-num">02</div>
                    <h3 style="font-size: 18px; margin-bottom: 8px;">Discover Matches</h3>
                    <p style="font-size: 14px; color: #7A685D;">Review freelancers ranked with match scores and clear justifications.</p>
                </div>

                <div class="step-card">
                    <div class="step-num">03</div>
                    <h3 style="font-size: 18px; margin-bottom: 8px;">Compare Freelancers</h3>
                    <p style="font-size: 14px; color: #7A685D;">Use side-by-side comparison matrix to evaluate candidate profiles.</p>
                </div>

                <div class="step-card">
                    <div class="step-num">04</div>
                    <h3 style="font-size: 18px; margin-bottom: 8px;">Choose Your Freelancer</h3>
                    <p style="font-size: 14px; color: #7A685D;">Select the best candidate and begin your project with confidence.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ================= FINAL CTA ================= -->
    <section class="container" style="padding-bottom: 80px;">
        <div class="cta-banner">
            <h2 style="color: #FFFAF3; font-size: 36px; margin-bottom: 16px;">Ready to Find the Right Freelancer?</h2>
            <p style="color: #D9C6B5; font-size: 17px; max-width: 580px; margin: 0 auto 32px;">
                Describe your project requirements now and get matched with top rated professionals.
            </p>
            <asp:HyperLink ID="btnCta" runat="server" NavigateUrl="~/Pages/client/FindFreelancer.aspx" CssClass="btn-primary" style="background: #C99A5B; color: #2B1A12 !important; padding: 16px 36px; font-size: 16px; font-weight: 700;">
                Find a Freelancer Now
            </asp:HyperLink>
        </div>
    </section>
</asp:Content>