<%@ Page Title="Manage Services | SkillSync Admin" Language="C#" MasterPageFile="admin-side.Master" AutoEventWireup="true" CodeBehind="ManageServices.aspx.cs" Inherits="SkillSync.Pages.admin.ManageServices" %><asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        .services-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            text-align: left;
        }

        .services-table th, .services-table td {
            padding: 14px 18px;
            border-bottom: 1px solid #F3E2CF;
        }

        .services-table th {
            background-color: #FFFAF3;
            color: #2B1A12;
            font-weight: 700;
        }

        .services-table tr:hover td {
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
        <h1 style="font-size: 26px; color: #2B1A12; margin-bottom: 4px;">Manage Services</h1>
        <p style="font-size: 14px; color: #7A685D;">Manage freelancer service listings and categories</p>
    </div>

    <!-- TABLE CARD -->
    <div class="table-card">
        <div class="table-toolbar">
            <input type="text" class="search-field" placeholder="Search services by title or category..." />
            <button type="button" class="btn-primary" onclick="alert('Add Service placeholder!'); return false;">+ Add New Service</button>
        </div>

        <table class="services-table">
            <thead>
                <tr>
                    <th>Service ID</th>
                    <th>Service Name</th>
                    <th>Category</th>
                    <th>Freelancer</th>
                    <th>Price</th>
                    <th>Delivery Time</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>S001</strong></td>
                    <td>ASP.NET Web Development</td>
                    <td><span class="badge badge-gold">Development</span></td>
                    <td>Aarav Mehta</td>
                    <td><strong>&#8377;8,000</strong></td>
                    <td>7 Days</td>
                    <td><span class="status-badge-sm badge-completed">Active</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-edit" onclick="alert('Edit Service S001');">Edit</button>
                        <button type="button" class="btn-action-sm btn-delete" onclick="alert('Delete Service S001');">Delete</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>S002</strong></td>
                    <td>UI/UX Prototyping</td>
                    <td><span class="badge badge-brown">Design</span></td>
                    <td>Riya Shah</td>
                    <td><strong>&#8377;5,000</strong></td>
                    <td>5 Days</td>
                    <td><span class="status-badge-sm badge-completed">Active</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-edit" onclick="alert('Edit Service S002');">Edit</button>
                        <button type="button" class="btn-action-sm btn-delete" onclick="alert('Delete Service S002');">Delete</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>S003</strong></td>
                    <td>Full Stack Web Forms</td>
                    <td><span class="badge badge-gold">Development</span></td>
                    <td>Vikram Malhotra</td>
                    <td><strong>&#8377;10,000</strong></td>
                    <td>3 Days</td>
                    <td><span class="status-badge-sm badge-completed">Active</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-edit" onclick="alert('Edit Service S003');">Edit</button>
                        <button type="button" class="btn-action-sm btn-delete" onclick="alert('Delete Service S003');">Delete</button>
                    </td>
                </tr>

                <tr>
                    <td><strong>S004</strong></td>
                    <td>Brand &amp; Graphic Design</td>
                    <td><span class="badge badge-brown">Design</span></td>
                    <td>Ananya Verma</td>
                    <td><strong>&#8377;6,500</strong></td>
                    <td>6 Days</td>
                    <td><span class="status-badge-sm badge-completed">Active</span></td>
                    <td>
                        <button type="button" class="btn-action-sm btn-edit" onclick="alert('Edit Service S004');">Edit</button>
                        <button type="button" class="btn-action-sm btn-delete" onclick="alert('Delete Service S004');">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
