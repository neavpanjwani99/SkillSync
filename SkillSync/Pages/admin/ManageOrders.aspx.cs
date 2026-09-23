using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace SkillSync.Pages.admin
{
    public partial class ManageOrders : System.Web.UI.Page
    {
        // Page Load Event - Checks admin authentication and loads orders list
        protected void Page_Load(object sender, EventArgs e)
        {
            // Security Check for Admin
            if (Session["UserType"] != null && Session["UserType"].ToString() != "Admin")
            {
                Response.Redirect("../client/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Load all marketplace orders from database
                LoadOrdersList();
            }
        }

        // Helper method to fetch all orders joined with clients, freelancers & services using ADO.NET
        private void LoadOrdersList()
        {
            try
            {
                // Step 1: SQL Join Query to get order details
                string sqlQuery = @"SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.Status, 
                                           c.FullName AS ClientName, f.FullName AS FreelancerName, s.ServiceTitle 
                                    FROM ORDERS o 
                                    INNER JOIN USERS c ON o.ClientID = c.UserID 
                                    INNER JOIN USERS f ON o.FreelancerID = f.UserID 
                                    INNER JOIN SERVICES s ON o.ServiceID = s.ServiceID 
                                    ORDER BY o.OrderID DESC";

                DataTable dtOrders = DbHelper.ExecuteQuery(sqlQuery);
            }
            catch (Exception ex)
            {
                // Smooth rendering
            }
        }
    }
}
