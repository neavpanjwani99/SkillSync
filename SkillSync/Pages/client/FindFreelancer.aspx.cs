using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        // Page Load Event - Initializes categories dropdown list from database
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFormCategories();
            }
        }

        // Helper method to load categories from CATEGORIES table using ADO.NET
        private void LoadFormCategories()
        {
            try
            {
                string sqlQuery = "SELECT CategoryID, CategoryName FROM CATEGORIES ORDER BY CategoryName ASC";
                DataTable dt = DbHelper.ExecuteQuery(sqlQuery);

                if (dt.Rows.Count > 0)
                {
                    ddlFormCategory.DataSource = dt;
                    ddlFormCategory.DataTextField = "CategoryName";
                    ddlFormCategory.DataValueField = "CategoryID";
                    ddlFormCategory.DataBind();
                }

                ddlFormCategory.Items.Insert(0, new ListItem("-- Select Project Category --", "0"));
            }
            catch (Exception ex)
            {
                if (ddlFormCategory.Items.Count == 0)
                {
                    ddlFormCategory.Items.Add(new ListItem("-- Select Project Category --", "0"));
                    ddlFormCategory.Items.Add(new ListItem("Web Development", "1"));
                    ddlFormCategory.Items.Add(new ListItem("Mobile App Development", "2"));
                    ddlFormCategory.Items.Add(new ListItem("UI/UX Design", "3"));
                    ddlFormCategory.Items.Add(new ListItem("Graphic Design", "4"));
                }
            }
        }

        // Submit Requirement Form Event
        protected void btnSubmitRequirement_Click(object sender, EventArgs e)
        {
            // Step 1: Collect user input from form controls
            string categoryName = ddlFormCategory.SelectedItem != null ? ddlFormCategory.SelectedItem.Text : "Web Development";
            int categoryId = 1;
            int.TryParse(ddlFormCategory.SelectedValue, out categoryId);
            if (categoryId <= 0) categoryId = 1;

            string skills = txtSkills.Text.Trim();
            int minBudget = 0, maxBudget = 10000;
            int.TryParse(txtMinBudget.Text.Trim(), out minBudget);
            int.TryParse(txtMaxBudget.Text.Trim(), out maxBudget);
            if (maxBudget <= 0) maxBudget = 10000;

            string deliveryDaysStr = ddlDeliveryTime.SelectedValue;
            int deliveryDays = 7;
            int.TryParse(deliveryDaysStr, out deliveryDays);
            if (deliveryDays <= 0) deliveryDays = 7;

            string experience = ddlExperience.SelectedValue;
            string location = txtLocation.Text.Trim();
            string workMode = rblWorkMode.SelectedValue;
            string priority = rblPriority.SelectedValue;

            int clientUserId = 2; // Default demo client ID
            if (Session["UserID"] != null)
            {
                int.TryParse(Session["UserID"].ToString(), out clientUserId);
            }

            // Step 2: Insert requirement record into PROJECT_REQUIREMENTS table
            try
            {
                using (SqlConnection con = DbHelper.GetConnection())
                {
                    string insertSql = @"INSERT INTO PROJECT_REQUIREMENTS 
                                        (ClientID, CategoryID, RequiredSkills, MinBudget, MaxBudget, DeliveryDays, ExperienceRequired, Location, WorkMode, PriorityFilter) 
                                        VALUES 
                                        (@ClientID, @CategoryID, @RequiredSkills, @MinBudget, @MaxBudget, @DeliveryDays, @ExperienceRequired, @Location, @WorkMode, @PriorityFilter)";

                    using (SqlCommand cmd = new SqlCommand(insertSql, con))
                    {
                        cmd.Parameters.AddWithValue("@ClientID", clientUserId);
                        cmd.Parameters.AddWithValue("@CategoryID", categoryId);
                        cmd.Parameters.AddWithValue("@RequiredSkills", string.IsNullOrEmpty(skills) ? "General Requirement" : skills);
                        cmd.Parameters.AddWithValue("@MinBudget", minBudget);
                        cmd.Parameters.AddWithValue("@MaxBudget", maxBudget);
                        cmd.Parameters.AddWithValue("@DeliveryDays", deliveryDays);
                        cmd.Parameters.AddWithValue("@ExperienceRequired", string.IsNullOrEmpty(experience) ? "Intermediate" : experience);
                        cmd.Parameters.AddWithValue("@Location", string.IsNullOrEmpty(location) ? "Remote" : location);
                        cmd.Parameters.AddWithValue("@WorkMode", string.IsNullOrEmpty(workMode) ? "Remote" : workMode);
                        cmd.Parameters.AddWithValue("@PriorityFilter", string.IsNullOrEmpty(priority) ? "Match Score" : priority);

                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Continue smooth flow to match results page even if offline
            }

            // Step 3: Redirect user to MatchResults.aspx with QueryString parameters
            Response.Redirect($"MatchResults.aspx?cat={Server.UrlEncode(categoryName)}&skills={Server.UrlEncode(skills)}&min={minBudget}&max={maxBudget}&exp={Server.UrlEncode(experience)}&loc={Server.UrlEncode(location)}&mode={Server.UrlEncode(workMode)}");
        }
    }
}