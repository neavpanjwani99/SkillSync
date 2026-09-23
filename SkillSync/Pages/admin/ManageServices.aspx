<%@ Page Title="Manage Services | SkillSync Admin" Language="C#" MasterPageFile="admin-side.Master" AutoEventWireup="true" CodeBehind="ManageServices.aspx.cs" Inherits="SkillSync.Pages.admin.ManageServices" %>
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
            width: 580px;
            max-width: 92%;
            box-shadow: 0 20px 40px rgba(43, 26, 18, 0.25);
        }

        .form-grid-admin {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 16px;
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
        <h1 style="font-size: 26px; color: #2B1A12; margin-bottom: 4px;">Manage Services</h1>
        <p style="font-size: 14px; color: #7A685D;">Real-time database service listings with Edit &amp; Delete popup management</p>
    </div>

    <!-- FEEDBACK MESSAGE -->
    <asp:Label ID="lblMsg" runat="server" Visible="false" style="display: block; padding: 12px 18px; background: #E6F4EA; border: 1px solid #CEEAD6; color: #137333; border-radius: 8px; font-size: 14px; margin-bottom: 20px; font-weight: 600;" />

    <!-- TABLE CARD -->
    <div class="table-card">
        <div class="table-toolbar">
            <input type="text" class="search-field" placeholder="Search services by title or category..." />
            <asp:Button ID="btnToggleAddService" runat="server" Text="+ Add New Service" OnClick="btnToggleAddService_Click" CssClass="btn-primary" style="padding: 10px 20px; background-color: #5A321F; color: #FFFAF3; border: none; border-radius: 8px; font-weight: 600; cursor: pointer;" />
        </div>

        <!-- ADD NEW SERVICE POPUP MODAL -->
        <asp:Panel ID="pnlAddService" runat="server" Visible="false" CssClass="modal-overlay">
            <div class="modal-box">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h3 style="margin: 0; color: #2B1A12; font-size: 20px; font-weight: 700;">Add New Service Listing</h3>
                    <asp:Button runat="server" Text="&times;" OnClick="btnCancelServiceEdit_Click" style="background: none; border: none; font-size: 24px; color: #7A685D; cursor: pointer;" />
                </div>
                <div class="form-grid-admin">
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Select Freelancer *</label>
                        <asp:DropDownList ID="ddlAddServiceFreelancer" runat="server" CssClass="form-control-admin" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Category *</label>
                        <asp:DropDownList ID="ddlAddServiceCategory" runat="server" CssClass="form-control-admin" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Service Title *</label>
                        <asp:TextBox ID="txtAddServiceTitle" runat="server" CssClass="form-control-admin" Placeholder="e.g. Custom ASP.NET Web App" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Price (Rs) *</label>
                        <asp:TextBox ID="txtAddServicePrice" runat="server" TextMode="Number" CssClass="form-control-admin" Placeholder="e.g. 8500" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Delivery Days *</label>
                        <asp:TextBox ID="txtAddServiceDays" runat="server" TextMode="Number" CssClass="form-control-admin" Placeholder="e.g. 5" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Experience (Years) *</label>
                        <asp:TextBox ID="txtAddServiceExp" runat="server" TextMode="Number" CssClass="form-control-admin" Placeholder="e.g. 3" />
                    </div>
                </div>
                <div style="margin-bottom: 20px;">
                    <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Description *</label>
                    <asp:TextBox ID="txtAddServiceDesc" runat="server" CssClass="form-control-admin" TextMode="MultiLine" Rows="2" Placeholder="Short description of service offered..." />
                </div>
                <div style="display: flex; gap: 12px; justify-content: flex-end;">
                    <asp:Button ID="btnCancelAddService" runat="server" Text="Cancel" OnClick="btnCancelServiceEdit_Click" style="padding: 10px 20px; background-color: #E5D6C5; color: #2B1A12; border: none; border-radius: 8px; font-weight: 600; cursor: pointer;" />
                    <asp:Button ID="btnAddServiceSubmit" runat="server" Text="Save Service" OnClick="btnAddServiceSubmit_Click" CssClass="btn-primary" style="padding: 10px 24px; background-color: #2B1A12; color: #FFFAF3; border: none; border-radius: 8px; font-weight: 700; cursor: pointer;" />
                </div>
            </div>
        </asp:Panel>

        <!-- EDIT SERVICE POPUP MODAL -->
        <asp:Panel ID="pnlEditService" runat="server" Visible="false" CssClass="modal-overlay">
            <div class="modal-box">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h3 style="margin: 0; color: #2B1A12; font-size: 20px; font-weight: 700;">Edit Service Details</h3>
                    <asp:Button runat="server" Text="&times;" OnClick="btnCancelServiceEdit_Click" style="background: none; border: none; font-size: 24px; color: #7A685D; cursor: pointer;" />
                </div>
                <asp:TextBox ID="txtEditServiceId" runat="server" Visible="false" />
                <div class="form-grid-admin">
                    <div style="grid-column: span 2;">
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Service Title *</label>
                        <asp:TextBox ID="txtEditServiceTitle" runat="server" CssClass="form-control-admin" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Price (Rs) *</label>
                        <asp:TextBox ID="txtEditServicePrice" runat="server" TextMode="Number" CssClass="form-control-admin" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Delivery Days *</label>
                        <asp:TextBox ID="txtEditServiceDays" runat="server" TextMode="Number" CssClass="form-control-admin" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Experience Years *</label>
                        <asp:TextBox ID="txtEditServiceExp" runat="server" TextMode="Number" CssClass="form-control-admin" />
                    </div>
                    <div>
                        <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Status *</label>
                        <asp:DropDownList ID="ddlEditServiceStatus" runat="server" CssClass="form-control-admin">
                            <asp:ListItem Text="Active" Value="Active" />
                            <asp:ListItem Text="Inactive" Value="Inactive" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div style="margin-bottom: 20px;">
                    <label style="font-size: 12px; font-weight: 700; color: #2B1A12; text-transform: uppercase;">Description *</label>
                    <asp:TextBox ID="txtEditServiceDesc" runat="server" CssClass="form-control-admin" TextMode="MultiLine" Rows="2" />
                </div>
                <div style="display: flex; gap: 12px; justify-content: flex-end;">
                    <asp:Button ID="btnCancelServiceEdit" runat="server" Text="Cancel" OnClick="btnCancelServiceEdit_Click" style="padding: 10px 20px; background-color: #E5D6C5; color: #2B1A12; border: none; border-radius: 8px; font-weight: 600; cursor: pointer;" />
                    <asp:Button ID="btnSaveServiceEdit" runat="server" Text="Update Service" OnClick="btnSaveServiceEdit_Click" CssClass="btn-primary" style="padding: 10px 24px; background-color: #5A321F; color: #FFFAF3; border: none; border-radius: 8px; font-weight: 700; cursor: pointer;" />
                </div>
            </div>
        </asp:Panel>

        <!-- DYNAMIC DATABASE REPEATER SERVICES TABLE -->
        <asp:Repeater ID="rptServices" runat="server" OnItemCommand="rptServices_ItemCommand">
            <HeaderTemplate>
                <table class="services-table">
                    <thead>
                        <tr>
                            <th>Service ID</th>
                            <th>Service Title</th>
                            <th>Category</th>
                            <th>Freelancer</th>
                            <th>Price</th>
                            <th>Delivery Time</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><strong>S00<%# Eval("ServiceID") %></strong></td>
                    <td><%# Eval("ServiceTitle") %></td>
                    <td><span class="badge badge-gold"><%# Eval("CategoryName") %></span></td>
                    <td><%# Eval("FreelancerName") %></td>
                    <td><strong>&#8377;<%# String.Format("{0:N0}", Eval("Price")) %></strong></td>
                    <td><%# Eval("DeliveryDays") %> Days</td>
                    <td>
                        <span class='<%# Eval("Status").ToString() == "Active" ? "status-badge-sm badge-completed" : "status-badge-sm badge-cancelled" %>'>
                            <%# Eval("Status") %>
                        </span>
                    </td>
                    <td>
                        <asp:Button ID="btnEdit" runat="server" CommandName="EditService" CommandArgument='<%# Eval("ServiceID") %>' Text="Edit" CssClass="btn-action-sm btn-edit" />
                        <asp:Button ID="btnDelete" runat="server" CommandName="DeleteService" CommandArgument='<%# Eval("ServiceID") %>' Text="Delete" CssClass="btn-action-sm btn-delete" OnClientClick="return confirm('Are you sure you want to delete this service listing from database?');" />
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

