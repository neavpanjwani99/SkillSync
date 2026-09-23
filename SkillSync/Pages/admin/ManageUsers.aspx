<%@ Page Title="Manage Users | SkillSync Admin" Language="C#" MasterPageFile="admin-side.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="SkillSync.Pages.admin.ManageUsers" %>
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
            padding: 6px 14px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            margin-right: 4px;
            transition: all 0.2s;
        }

        .btn-edit { background: #E8F0FE; color: #1A73E8; }
        .btn-edit:hover { background: #D2E3FC; }
        .btn-delete { background: #FCE8E6; color: #C5221F; }
        .btn-delete:hover { background: #FAD2CF; }

        /* MODAL OVERLAY STYLING FOR EDIT & ADD POPUPS */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(20, 10, 5, 0.55);
            backdrop-filter: blur(4px);
            z-index: 9999;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-box {
            background: #FFFFFF;
            border: 1px solid #E5D6C5;
            border-radius: 16px;
            padding: 30px;
            width: 540px;
            max-width: 92%;
            box-shadow: 0 20px 40px rgba(43, 26, 18, 0.25);
        }

        .form-grid-admin {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 20px;
        }

        .form-control-admin {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #E5D6C5;
            border-radius: 8px;
            font-size: 14px;
            background-color: #FAF7F2;
            box-sizing: border-box;
            outline: none;
        }
        .form-control-admin:focus {
            border-color: #5A321F;
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- HEADER -->
    <div style="margin-bottom: 28px;">
        <h1 style="font-size: 26px; color: #2B1A12; margin-bottom: 4px;">Manage Users &amp; Freelancers</h1>
        <p style="font-size: 14px; color: #7A685D;">Real-time database user records with Edit &amp; Delete popup management</p>
    </div>

    <!-- FEEDBACK MESSAGE -->
    <asp:Label ID="lblMsg" runat="server" Visible="false" style="display: block; padding: 12px 18px; background: #E6F4EA; border: 1px solid #CEEAD6; color: #137333; border-radius: 8px; font-size: 14px; margin-bottom: 20px; font-weight: 600;" />

    <!-- TABLE CARD -->
    <div class="table-card">
        <div class="table-toolbar">
            <input type="text" class="search-field" placeholder="Search users by name, email or location..." />
            <asp:Button ID="btnToggleAddForm" runat="server" Text="+ Add New Freelancer" OnClick="btnToggleAddForm_Click" CssClass="btn-primary" style="padding: 10px 20px; background-color: #5A321F; color: #FFFAF3; border: none; border-radius: 8px; font-weight: 600; cursor: pointer;" />
        </div>

        <!-- ADD NEW FREELANCER POPUP MODAL -->
        <asp:Panel ID="pnlAddFreelancer" runat="server" Visible="false" CssClass="modal-overlay">
            <div class="modal-box">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h3 style="margin: 0; color: #2B1A12; font-size: 20px; font-weight: 700;">Register New Freelancer</h3>
                    <asp:Button runat="server" Text="&times;" OnClick="btnCancelUserEdit_Click" style="background: none; border: none; font-size: 24px; color: #7A685D; cursor: pointer;" />
                </div>
                <div class="form-grid-admin">
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Freelancer Name *</label>
                        <asp:TextBox ID="txtFreeName" runat="server" CssClass="form-control-admin" Placeholder="e.g. Vikas Gupta" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Email Address *</label>
                        <asp:TextBox ID="txtFreeEmail" runat="server" TextMode="Email" CssClass="form-control-admin" Placeholder="e.g. vikas@skillsync.com" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Password *</label>
                        <asp:TextBox ID="txtFreePassword" runat="server" TextMode="Password" CssClass="form-control-admin" Placeholder="Create password" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Location / City *</label>
                        <asp:TextBox ID="txtFreeLocation" runat="server" CssClass="form-control-admin" Placeholder="e.g. Mumbai" />
                    </div>
                </div>
                <div style="display: flex; gap: 12px; justify-content: flex-end; margin-top: 10px;">
                    <asp:Button ID="btnCancelAddFreelancer" runat="server" Text="Cancel" OnClick="btnCancelUserEdit_Click" style="padding: 10px 20px; background-color: #E5D6C5; color: #2B1A12; border: none; border-radius: 8px; font-weight: 600; cursor: pointer;" />
                    <asp:Button ID="btnAddFreelancerSubmit" runat="server" Text="Save Freelancer" OnClick="btnAddFreelancerSubmit_Click" CssClass="btn-primary" style="padding: 10px 24px; background-color: #2B1A12; color: #FFFAF3; border: none; border-radius: 8px; font-weight: 700; cursor: pointer;" />
                </div>
            </div>
        </asp:Panel>

        <!-- EDIT USER POPUP MODAL (Name, Email, Location, Status) -->
        <asp:Panel ID="pnlEditUser" runat="server" Visible="false" CssClass="modal-overlay">
            <div class="modal-box">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h3 style="margin: 0; color: #2B1A12; font-size: 20px; font-weight: 700;">Edit User Account Details</h3>
                    <asp:Button runat="server" Text="&times;" OnClick="btnCancelUserEdit_Click" style="background: none; border: none; font-size: 24px; color: #7A685D; cursor: pointer;" />
                </div>
                <asp:TextBox ID="txtEditUserId" runat="server" Visible="false" />
                <div class="form-grid-admin">
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Full Name *</label>
                        <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control-admin" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Email Address *</label>
                        <asp:TextBox ID="txtEditEmail" runat="server" TextMode="Email" CssClass="form-control-admin" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Location / City *</label>
                        <asp:TextBox ID="txtEditLocation" runat="server" CssClass="form-control-admin" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Account Status *</label>
                        <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-control-admin">
                            <asp:ListItem Text="Active" Value="Active" />
                            <asp:ListItem Text="Inactive" Value="Inactive" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div style="display: flex; gap: 12px; justify-content: flex-end; margin-top: 10px;">
                    <asp:Button ID="btnCancelUserEdit" runat="server" Text="Cancel" OnClick="btnCancelUserEdit_Click" style="padding: 10px 20px; background-color: #E5D6C5; color: #2B1A12; border: none; border-radius: 8px; font-weight: 600; cursor: pointer;" />
                    <asp:Button ID="btnSaveUserEdit" runat="server" Text="Update Details" OnClick="btnSaveUserEdit_Click" CssClass="btn-primary" style="padding: 10px 24px; background-color: #5A321F; color: #FFFAF3; border: none; border-radius: 8px; font-weight: 700; cursor: pointer;" />
                </div>
            </div>
        </asp:Panel>

        <!-- DYNAMIC DATABASE REPEATER USER TABLE -->
        <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
            <HeaderTemplate>
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
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><strong>US<%# Eval("UserID") %></strong></td>
                    <td><%# Eval("FullName") %></td>
                    <td><%# Eval("Email") %></td>
                    <td>
                        <span class='<%# Eval("UserType").ToString() == "Admin" ? "badge badge-gold" : (Eval("UserType").ToString() == "Freelancer" ? "badge badge-brown" : "badge badge-gold") %>'>
                            <%# Eval("UserType") %>
                        </span>
                    </td>
                    <td><%# Eval("Location") %></td>
                    <td>
                        <span class='<%# Eval("Status").ToString() == "Active" ? "status-badge-sm badge-completed" : "status-badge-sm badge-cancelled" %>'>
                            <%# Eval("Status") %>
                        </span>
                    </td>
                    <td>
                        <asp:Button ID="btnEdit" runat="server" CommandName="EditUser" CommandArgument='<%# Eval("UserID") %>' Text="Edit" CssClass="btn-action-sm btn-edit" />
                        <asp:Button ID="btnDelete" runat="server" CommandName="DeleteUser" CommandArgument='<%# Eval("UserID") %>' Text="Delete" CssClass="btn-action-sm btn-delete" OnClientClick="return confirm('Are you sure you want to delete this user account from database?');" />
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

