<%@ Page Title="Manage Orders | SkillSync Admin" Language="C#" MasterPageFile="admin-side.Master" AutoEventWireup="true" CodeBehind="ManageOrders.aspx.cs" Inherits="SkillSync.Pages.admin.ManageOrders" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table-card {
            background: #FFFFFF;
            border: 1px solid #E5D6C5;
            border-radius: 16px;
            padding: 28px;
            box-shadow: 0 4px 18px rgba(43, 26, 18, 0.04);
        }

        .table-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
            gap: 16px;
        }

        .search-field {
            padding: 10px 16px;
            border: 1px solid #E5D6C5;
            border-radius: 8px;
            font-size: 14px;
            width: 300px;
            background-color: #FAF7F2;
            outline: none;
        }

        .orders-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            text-align: left;
        }

        .orders-table th, .orders-table td {
            padding: 14px 18px;
            border-bottom: 1px solid #F3E2CF;
        }

        .orders-table th {
            background-color: #FFFAF3;
            color: #2B1A12;
            font-weight: 700;
        }

        .orders-table tr:hover td {
            background-color: #FAF7F2;
        }

        .btn-action-sm {
            padding: 5px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            border: none;
        }

        .btn-view { background: #FFFAF3; color: #4A2C1D; border: 1px solid #E5D6C5; }
    </style>
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- HEADER -->
    <div style="margin-bottom: 28px;">
        <h1 style="font-size: 26px; color: #2B1A12; margin-bottom: 4px;">Manage Orders</h1>
        <p style="font-size: 14px; color: #7A685D;">Monitor, review and manage service order statuses and client transactions</p>
    </div>

    <!-- TABLE CARD -->
    <div class="table-card">
        <div class="table-toolbar">
            <input type="text" class="search-field" placeholder="Search orders by ID, client or freelancer..." />
            <div>
                <span style="font-size: 13px; color: #7A685D; font-weight: 600;">Total Orders: 5</span>
            </div>
        </div>

        <table class="orders-table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Client</th>
                    <th>Freelancer</th>
                    <th>Service</th>
                    <th>Order Date</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>ORD001</strong></td>
                    <td>Neha Shah</td>
                    <td>Aarav Mehta</td>
                    <td>ASP.NET Web Development</td>
                    <td>20 Sep 2026</td>
                    <td><strong>&#8377;8,000</strong></td>
                    <td><span class="status-badge-sm badge-completed">Completed</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-view" onclick="alert('View details for Order ORD001');">View Details</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>ORD002</strong></td>
                    <td>Rohan Joshi</td>
                    <td>Riya Shah</td>
                    <td>UI/UX Prototyping</td>
                    <td>21 Sep 2026</td>
                    <td><strong>&#8377;5,000</strong></td>
                    <td><span class="status-badge-sm badge-active">In Progress</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-view" onclick="alert('View details for Order ORD002');">View Details</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>ORD003</strong></td>
                    <td>Priya Nair</td>
                    <td>Vikram Malhotra</td>
                    <td>Full Stack Web Forms</td>
                    <td>22 Sep 2026</td>
                    <td><strong>&#8377;10,000</strong></td>
                    <td><span class="status-badge-sm badge-pending">Pending</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-view" onclick="alert('View details for Order ORD003');">View Details</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>ORD004</strong></td>
                    <td>Amit Patel</td>
                    <td>Ananya Verma</td>
                    <td>Brand &amp; Graphic Design</td>
                    <td>19 Sep 2026</td>
                    <td><strong>&#8377;6,500</strong></td>
                    <td><span class="status-badge-sm badge-cancelled">Cancelled</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-view" onclick="alert('View details for Order ORD004');">View Details</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>ORD005</strong></td>
                    <td>Sanya Gupta</td>
                    <td>Aarav Mehta</td>
                    <td>C# SQL Backend Optimization</td>
                    <td>23 Sep 2026</td>
                    <td><strong>&#8377;7,500</strong></td>
                    <td><span class="status-badge-sm badge-active">Accepted</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-view" onclick="alert('View details for Order ORD005');">View Details</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
