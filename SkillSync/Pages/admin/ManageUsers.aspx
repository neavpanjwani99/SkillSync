<%@ Page Title="Manage Users | SkillSync Admin" Language="C#" MasterPageFile="admin-side.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="SkillSync.Pages.admin.ManageUsers" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        .user-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            text-align: left;
        }

        .user-table th, .user-table td {
            padding: 14px 18px;
            border-bottom: 1px solid #F3E2CF;
        }

        .user-table th {
            background-color: #FFFAF3;
            color: #2B1A12;
            font-weight: 700;
        }

        .user-table tr:hover td {
            background-color: #FAF7F2;
        }

        .btn-action-sm {
            padding: 5px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            margin-right: 4px;
        }

        .btn-edit { background: #E8F0FE; color: #1A73E8; }
        .btn-delete { background: #FCE8E6; color: #C5221F; }
    </style>
</asp:Content><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- HEADER -->
    <div style="margin-bottom: 28px;">
        <h1 style="font-size: 26px; color: #2B1A12; margin-bottom: 4px;">Manage Users</h1>
        <p style="font-size: 14px; color: #7A685D;">View, add, edit and manage client &amp; freelancer accounts</p>
    </div>

    <!-- TABLE CARD -->
    <div class="table-card">
        <div class="table-toolbar">
            <input type="text" class="search-field" placeholder="Search users by name, email or location..." />
            <button type="button" class="btn-primary" onclick="alert('Add User form placeholder!'); return false;">+ Add New User</button>
        </div>

        <table class="user-table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>User Name</th>
                    <th>Email Address</th>
                    <th>User Type</th>
                    <th>Location</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>US001</strong></td>
                    <td>Aarav Mehta</td>
                    <td>aarav@example.com</td>
                    <td><span class="badge badge-brown">Freelancer</span></td>
                    <td>Mumbai</td>
                    <td><span class="status-badge-sm badge-completed">Active</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-edit" onclick="alert('Edit User US001');">Edit</button>
                        <button type="button" class="btn-action-sm btn-delete" onclick="alert('Delete User US001');">Delete</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>US002</strong></td>
                    <td>Riya Shah</td>
                    <td>riya@example.com</td>
                    <td><span class="badge badge-gold">Client</span></td>
                    <td>Pune</td>
                    <td><span class="status-badge-sm badge-completed">Active</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-edit" onclick="alert('Edit User US002');">Edit</button>
                        <button type="button" class="btn-action-sm btn-delete" onclick="alert('Delete User US002');">Delete</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>US003</strong></td>
                    <td>Vikram Malhotra</td>
                    <td>vikram@example.com</td>
                    <td><span class="badge badge-brown">Freelancer</span></td>
                    <td>Mumbai</td>
                    <td><span class="status-badge-sm badge-completed">Active</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-edit" onclick="alert('Edit User US003');">Edit</button>
                        <button type="button" class="btn-action-sm btn-delete" onclick="alert('Delete User US003');">Delete</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>US004</strong></td>
                    <td>Ananya Verma</td>
                    <td>ananya@example.com</td>
                    <td><span class="badge badge-brown">Freelancer</span></td>
                    <td>Mumbai</td>
                    <td><span class="status-badge-sm badge-completed">Active</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-edit" onclick="alert('Edit User US004');">Edit</button>
                        <button type="button" class="btn-action-sm btn-delete" onclick="alert('Delete User US004');">Delete</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>US005</strong></td>
                    <td>Neha Shah</td>
                    <td>neha@example.com</td>
                    <td><span class="badge badge-gold">Client</span></td>
                    <td>Delhi</td>
                    <td><span class="status-badge-sm badge-cancelled">Inactive</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-edit" onclick="alert('Edit User US005');">Edit</button>
                        <button type="button" class="btn-action-sm btn-delete" onclick="alert('Delete User US005');">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
