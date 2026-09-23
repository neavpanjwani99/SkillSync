using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace SkillSync.Pages.admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        // Page Load Event - Checks admin authentication and loads user list
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
                // Load all registered users from database
                LoadUsersList();
            }
        }

        // Helper method to fetch all users from USERS table using ADO.NET
        private void LoadUsersList()
        {
            try
            {
                // Step 1: Select query to get user details
                string sqlQuery = "SELECT UserID, FullName, Email, UserType, Location, Status, CreatedDate FROM USERS ORDER BY UserID DESC";
                DataTable dtUsers = DbHelper.ExecuteQuery(sqlQuery);
            }
            catch (Exception ex)
            {
                // Smooth rendering
            }
        }
    }
}
