using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace SkillSync.Pages.admin
{
    public partial class ManageServices : System.Web.UI.Page
    {
        // Page Load Event - Checks admin authentication and loads services list
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
                // Load all services from database
                LoadServicesList();
            }
        }

        // Helper method to fetch all services joined with freelancers & categories using ADO.NET
        private void LoadServicesList()
        {
            try
            {
                // Step 1: SQL Join Query to get detailed service information
                string sqlQuery = @"SELECT s.ServiceID, s.ServiceTitle, s.Price, s.DeliveryDays, s.Status, 
                                           u.FullName AS FreelancerName, c.CategoryName 
                                    FROM SERVICES s 
                                    INNER JOIN USERS u ON s.FreelancerID = u.UserID 
                                    INNER JOIN CATEGORIES c ON s.CategoryID = c.CategoryID 
                                    ORDER BY s.ServiceID DESC";

                DataTable dtServices = DbHelper.ExecuteQuery(sqlQuery);
            }
            catch (Exception ex)
            {
                // Smooth rendering
            }
        }
    }
}
