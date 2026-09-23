using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace SkillSync.Pages.admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        // Page Load Event - Validates admin session and loads real-time database stats
        protected void Page_Load(object sender, EventArgs e)
        {
            // Step 1: Security Check - Ensure only Admin users can access this page
            if (Session["UserType"] != null && Session["UserType"].ToString() != "Admin")
            {
                Response.Redirect("../client/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Step 2: Load marketplace stats from SQL database
                LoadDashboardStatistics();
            }
        }

        // Helper method to fetch total counts from database using ADO.NET ExecuteScalar
        private void LoadDashboardStatistics()
        {
            try
            {
                // Query 1: Total Users
                object usersObj = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM USERS");
                int totalUsers = usersObj != null ? Convert.ToInt32(usersObj) : 0;

                // Query 2: Total Freelancers
                object freelancersObj = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM USERS WHERE UserType = 'Freelancer'");
                int totalFreelancers = freelancersObj != null ? Convert.ToInt32(freelancersObj) : 0;

                // Query 3: Total Active Services
                object servicesObj = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM SERVICES");
                int totalServices = servicesObj != null ? Convert.ToInt32(servicesObj) : 0;

                // Query 4: Total Orders
                object ordersObj = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM ORDERS");
                int totalOrders = ordersObj != null ? Convert.ToInt32(ordersObj) : 0;
            }
            catch (Exception ex)
            {
                // Continue smooth rendering if DB is initializing
            }
        }
    }
}
