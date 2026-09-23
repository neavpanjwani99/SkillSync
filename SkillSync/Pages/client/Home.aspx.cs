using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // Page Load Event - Initializes category dropdown list from SQL database
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load categories only on first load, not on button clicks
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        // Helper method to fetch categories from CATEGORIES table using ADO.NET
        private void LoadCategories()
        {
            try
            {
                // Step 1: Execute SQL query to get active categories
                string sqlQuery = "SELECT CategoryID, CategoryName FROM CATEGORIES ORDER BY CategoryName ASC";
                DataTable dtCategories = DbHelper.ExecuteQuery(sqlQuery);

                if (dtCategories.Rows.Count > 0)
                {
                    // Step 2: Bind data to ddlCategory control
                    ddlCategory.DataSource = dtCategories;
                    ddlCategory.DataTextField = "CategoryName";
                    ddlCategory.DataValueField = "CategoryID";
                    ddlCategory.DataBind();
                }

                // Add default top item
                ddlCategory.Items.Insert(0, new ListItem("All Categories", "All"));
            }
            catch (Exception ex)
            {
                // Fallback items if database is initializing
                if (ddlCategory.Items.Count == 0)
                {
                    ddlCategory.Items.Add(new ListItem("All Categories", "All"));
                    ddlCategory.Items.Add(new ListItem("Web Development", "Web Development"));
                    ddlCategory.Items.Add(new ListItem("Mobile App Development", "Mobile App Development"));
                    ddlCategory.Items.Add(new ListItem("UI/UX Design", "UI/UX Design"));
                    ddlCategory.Items.Add(new ListItem("Graphic Design", "Graphic Design"));
                }
            }
        }

        // Find Freelancers Button Click Event
        protected void btnFind_Click(object sender, EventArgs e)
        {
            // Step 1: Read category and requirement search input
            string selectedCat = ddlCategory.SelectedItem != null ? ddlCategory.SelectedItem.Text : "All";
            string reqText = txtRequirement.Text.Trim();

            // Step 2: Pass search criteria to MatchResults.aspx via QueryString
            Response.Redirect($"MatchResults.aspx?cat={Server.UrlEncode(selectedCat)}&skills={Server.UrlEncode(reqText)}");
        }
    }
}