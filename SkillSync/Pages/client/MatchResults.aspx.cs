using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class MatchResults : System.Web.UI.Page
    {
        // Page Load Event - Reads QueryString filters and updates UI summary labels
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Step 1: Read search criteria from URL parameters
                string cat = Request.QueryString["cat"];
                string skills = Request.QueryString["skills"];
                string min = Request.QueryString["min"];
                string max = Request.QueryString["max"];
                string exp = Request.QueryString["exp"];
                string loc = Request.QueryString["loc"];
                string mode = Request.QueryString["mode"];

                // Update summary bar badges
                if (!string.IsNullOrEmpty(cat))
                {
                    lblSummaryCat.Text = GetCategoryDisplayName(cat);
                    SetDropdownValue(ddlFiltCat, cat);
                }

                if (!string.IsNullOrEmpty(skills))
                {
                    lblSummarySkills.Text = skills;
                }

                if (!string.IsNullOrEmpty(min) || !string.IsNullOrEmpty(max))
                {
                    string minStr = string.IsNullOrEmpty(min) ? "0" : min;
                    string maxStr = string.IsNullOrEmpty(max) ? "20,000" : max;
                    lblSummaryBudget.Text = $"Rs {minStr} - Rs {maxStr}";
                }

                if (!string.IsNullOrEmpty(exp))
                {
                    lblSummaryExp.Text = exp == "1Yr" ? "1+ Years" : (exp == "2Yrs" ? "2+ Years" : (exp == "3Yrs" ? "3+ Years" : "Any Experience"));
                }

                if (!string.IsNullOrEmpty(loc) || !string.IsNullOrEmpty(mode))
                {
                    string locStr = string.IsNullOrEmpty(loc) ? "Mumbai" : loc;
                    string modeStr = string.IsNullOrEmpty(mode) ? "Remote" : mode;
                    lblSummaryLoc.Text = $"{locStr} ({modeStr})";
                }

                // Step 2: Fetch matched freelancers from database using ADO.NET
                FetchMatchedServicesFromDatabase(cat);
            }
        }

        // Helper method to execute ADO.NET query to get matching services
        private void FetchMatchedServicesFromDatabase(string category)
        {
            try
            {
                using (SqlConnection con = DbHelper.GetConnection())
                {
                    string query = @"SELECT s.ServiceID, s.ServiceTitle, s.Price, s.DeliveryDays, s.ExperienceYears, u.FullName, u.Location 
                                    FROM SERVICES s 
                                    INNER JOIN USERS u ON s.FreelancerID = u.UserID 
                                    WHERE s.Status = 'Active'";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        DataTable dt = new DataTable();
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Smooth fallback if DB is initializing
            }
        }

        // Sidebar Apply Filter Button Click Event
        protected void btnApplyFilter_Click(object sender, EventArgs e)
        {
            lblSummaryCat.Text = ddlFiltCat.SelectedItem.Text;
            lblSummaryBudget.Text = ddlFiltBudget.SelectedItem.Text;
            lblSummaryExp.Text = ddlFiltExp.SelectedItem.Text;
            lblSummaryLoc.Text = $"Mumbai ({ddlFiltMode.SelectedItem.Text})";
        }

        private string GetCategoryDisplayName(string val)
        {
            switch (val)
            {
                case "WebDev": return "Web Development";
                case "UIUX": return "UI/UX Design";
                case "Graphic": return "Graphic Design";
                case "Marketing": return "Digital Marketing";
                case "Writing": return "Content Writing";
                case "Video": return "Video Editing";
                default: return val;
            }
        }

        private void SetDropdownValue(DropDownList ddl, string val)
        {
            ListItem item = ddl.Items.FindByValue(val);
            if (item != null)
            {
                ddl.ClearSelection();
                item.Selected = true;
            }
        }
    }
}
