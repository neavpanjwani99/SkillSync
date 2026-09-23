<%@ Page Title="Admin Dashboard | SkillSync" Language="C#" MasterPageFile="admin-side.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="SkillSync.Pages.admin.AdminDashboard" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .dash-header {
            margin-bottom: 28px;
        }

        .dash-title {
            font-size: 26px;
            color: #2B1A12;
            margin-bottom: 4px;
        }

        .dash-subtitle {
            font-size: 14px;
            color: #7A685D;
        }

        /* Stat Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-bottom: 32px;
        }

        .stat-card {
            background: #FFFFFF;
            border: 1px solid #E5D6C5;
            border-radius: 14px;
            padding: 24px;
            box-shadow: 0 4px 16px rgba(43, 26, 18, 0.04);
            border-left: 4px solid #C99A5B;
        }

        .stat-label {
            font-size: 12px;
            text-transform: uppercase;
            color: #7A685D;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .stat-value {
            font-size: 30px;
            font-weight: 800;
            color: #2B1A12;
        }

        .dashboard-layout {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 28px;
        }

        .panel-card {
            background: #FFFFFF;
            border: 1px solid #E5D6C5;
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 4px 16px rgba(43, 26, 18, 0.04);
            margin-bottom: 28px;
        }

        .panel-title {
            font-size: 18px;
            font-weight: 700;
            color: #2B1A12;
            margin-bottom: 18px;
            padding-bottom: 10px;
            border-bottom: 1px solid #F3E2CF;
        }

        .activity-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .activity-item {
            padding: 12px 0;
            border-bottom: 1px solid #FAF7F2;
            font-size: 13px;
            color: #4A3B32;
            display: flex;
            justify-content: space-between;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .status-badge-sm {
            padding: 3px 10px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 700;
        }

        .badge-pending { background: #FFF4E5; color: #B06000; }
        .badge-active { background: #E8F0FE; color: #1A73E8; }
        .badge-completed { background: #E6F4EA; color: #137333; }
        .badge-cancelled { background: #FCE8E6; color: #C5221F; }

        .admin-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .admin-table th, .admin-table td {
            padding: 12px 14px;
            text-align: left;
            border-bottom: 1px solid #F3E2CF;
        }

        .admin-table th {
            background: #FFFAF3;
            color: #2B1A12;
            font-weight: 700;
        }
    </style>
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- HEADER -->
    <div class="dash-header">
        <h1 class="dash-title">Admin Dashboard</h1>
        <p class="dash-subtitle">Overview of SkillSync marketplace activity and statistics</p>
    </div>

    <!-- STATS CARDS GRID -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-label">Total Users</div>
            <div class="stat-value">1,248</div>
            <span style="font-size: 12px; color: #137333;">+12% this month</span>
        </div>

        <div class="stat-card" style="border-left-color: #5A321F;">
            <div class="stat-label">Total Freelancers</div>
            <div class="stat-value">386</div>
            <span style="font-size: 12px; color: #137333;">+8% this month</span>
        </div>

        <div class="stat-card" style="border-left-color: #4A2C1D;">
            <div class="stat-label">Total Services</div>
            <div class="stat-value">24</div>
            <span style="font-size: 12px; color: #7A685D;">Active Categories</span>
        </div>

        <div class="stat-card" style="border-left-color: #137333;">
            <div class="stat-label">Total Orders</div>
            <div class="stat-value">572</div>
            <span style="font-size: 12px; color: #137333;">94% Completion Rate</span>
        </div>
    </div>

    <!-- LAYOUT PANELS -->
    <div class="dashboard-layout">
        
        <!-- LEFT COLUMN: TOP SERVICES & ORDER OVERVIEW -->
        <div>
            <!-- Top Services Table -->
            <div class="panel-card">
                <div class="panel-title">Top Performing Services</div>
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Service Category</th>
                            <th>Active Orders</th>
                            <th>Avg. Price</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><strong>Web Development</strong></td>
                            <td>214 Orders</td>
                            <td>&#8377;8,500</td>
                            <td><span class="status-badge-sm badge-completed">Active</span></td>
                        </tr>
                        <tr>
                            <td><strong>UI/UX Design</strong></td>
                            <td>168 Orders</td>
                            <td>&#8377;5,200</td>
                            <td><span class="status-badge-sm badge-completed">Active</span></td>
                        </tr>
                        <tr>
                            <td><strong>Graphic Design</strong></td>
                            <td>94 Orders</td>
                            <td>&#8377;4,000</td>
                            <td><span class="status-badge-sm badge-completed">Active</span></td>
                        </tr>
                        <tr>
                            <td><strong>Digital Marketing</strong></td>
                            <td>62 Orders</td>
                            <td>&#8377;6,000</td>
                            <td><span class="status-badge-sm badge-completed">Active</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Order Overview Breakdown -->
            <div class="panel-card">
                <div class="panel-title">Order Status Overview</div>
                <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; text-align: center;">
                    <div style="background: #FFF4E5; padding: 16px; border-radius: 10px; border: 1px solid #FFE0B2;">
                        <div style="font-size: 20px; font-weight: 800; color: #B06000;">14</div>
                        <div style="font-size: 12px; color: #7A685D; font-weight: 600;">Pending</div>
                    </div>
                    <div style="background: #E8F0FE; padding: 16px; border-radius: 10px; border: 1px solid #D2E3FC;">
                        <div style="font-size: 20px; font-weight: 800; color: #1A73E8;">42</div>
                        <div style="font-size: 12px; color: #7A685D; font-weight: 600;">In Progress</div>
                    </div>
                    <div style="background: #E6F4EA; padding: 16px; border-radius: 10px; border: 1px solid #CEEAD6;">
                        <div style="font-size: 20px; font-weight: 800; color: #137333;">504</div>
                        <div style="font-size: 12px; color: #7A685D; font-weight: 600;">Completed</div>
                    </div>
                    <div style="background: #FCE8E6; padding: 16px; border-radius: 10px; border: 1px solid #FAD2CF;">
                        <div style="font-size: 20px; font-weight: 800; color: #C5221F;">12</div>
                        <div style="font-size: 12px; color: #7A685D; font-weight: 600;">Cancelled</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- RIGHT COLUMN: RECENT ACTIVITY FEED -->
        <div>
            <div class="panel-card">
                <div class="panel-title">Recent Activity Log</div>
                <ul class="activity-list">
                    <li class="activity-item">
                        <div>
                            <strong>New Freelancer Registered</strong><br />
                            <span style="color: #7A685D;">Aarav Mehta (Mumbai)</span>
                        </div>
                        <span style="font-size: 11px; color: #A9907E;">10m ago</span>
                    </li>

                    <li class="activity-item">
                        <div>
                            <strong>Order ORD001 Completed</strong><br />
                            <span style="color: #7A685D;">Client Neha Shah</span>
                        </div>
                        <span style="font-size: 11px; color: #A9907E;">1h ago</span>
                    </li>

                    <li class="activity-item">
                        <div>
                            <strong>New Service Listing</strong><br />
                            <span style="color: #7A685D;">ASP.NET Web Development</span>
                        </div>
                        <span style="font-size: 11px; color: #A9907E;">3h ago</span>
                    </li>

                    <li class="activity-item">
                        <div>
                            <strong>New Client Registered</strong><br />
                            <span style="color: #7A685D;">Riya Shah (Pune)</span>
                        </div>
                        <span style="font-size: 11px; color: #A9907E;">5h ago</span>
                    </li>

                    <li class="activity-item">
                        <div>
                            <strong>Match Engine Calculation</strong><br />
                            <span style="color: #7A685D;">94% Match Generated</span>
                        </div>
                        <span style="font-size: 11px; color: #A9907E;">1d ago</span>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</asp:Content>
