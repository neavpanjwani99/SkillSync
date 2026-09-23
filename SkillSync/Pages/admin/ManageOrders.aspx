<%@ Page Title="Manage Orders | SkillSync Admin" Language="C#" MasterPageFile="admin-side.Master" AutoEventWireup="true" CodeBehind="ManageOrders.aspx.cs" Inherits="SkillSync.Pages.admin.ManageOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- HEADER -->
    <div style="margin-bottom: 28px;">
        <h1 style="font-size: 26px; color: #2B1A12; margin-bottom: 4px;">Manage Orders</h1>
        <p style="font-size: 14px; color: #7A685D;">Monitor, review and manage service order statuses and client transactions</p>
    </div>

    <!-- FEEDBACK MESSAGE -->
    <asp:Label ID="lblMsg" runat="server" Visible="false" style="display: block; padding: 12px 18px; background: #E6F4EA; border: 1px solid #CEEAD6; color: #137333; border-radius: 8px; font-size: 14px; margin-bottom: 20px; font-weight: 600;" />

    <!-- TABLE CARD -->
    <div class="table-card">
        <div class="table-toolbar">
            <input type="text" class="search-field" placeholder="Search orders by ID, client or freelancer..." />
            <div>
                <asp:Label ID="lblTotalOrders" runat="server" style="font-size: 14px; color: #7A685D; font-weight: 700;" Text="Total Orders: 0" />
            </div>
        </div>

        <asp:Repeater ID="rptOrders" runat="server">
            <HeaderTemplate>
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
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><strong>ORD00<%# Eval("OrderID") %></strong></td>
                    <td><%# Eval("ClientName") %></td>
                    <td><%# Eval("FreelancerName") %></td>
                    <td><%# Eval("ServiceTitle") %></td>
                    <td><%# String.Format("{0:dd MMM yyyy}", Eval("OrderDate")) %></td>
                    <td><strong>&#8377;<%# String.Format("{0:N0}", Eval("TotalAmount")) %></strong></td>
                    <td>
                        <span class='<%# Eval("Status").ToString() == "Completed" ? "status-badge-sm badge-completed" : (Eval("Status").ToString() == "Cancelled" ? "status-badge-sm badge-cancelled" : (Eval("Status").ToString() == "Pending" ? "status-badge-sm badge-pending" : "status-badge-sm badge-active")) %>'>
                            <%# Eval("Status") %>
                        </span>
                    </td>
                    <td>
                        <button type="button" class="btn-action-sm btn-view" onclick="alert('Viewing details for Order ORD00<%# Eval("OrderID") %> - Client: <%# Eval("ClientName") %>');">View Details</button>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

