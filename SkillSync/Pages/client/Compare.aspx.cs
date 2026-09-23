using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class Compare : System.Web.UI.Page
    {
        // Page Load Event - Initializes candidate dropdowns from SQL database
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCandidatesFromDatabase();
            }
        }

        // Helper method to load freelancer list into comparison dropdowns using ADO.NET
        private void LoadCandidatesFromDatabase()
        {
            try
            {
                // Step 1: Query database for active freelancers
                string sqlQuery = "SELECT UserID, FullName FROM USERS WHERE UserType = 'Freelancer' ORDER BY FullName ASC";
                DataTable dtFreelancers = DbHelper.ExecuteQuery(sqlQuery);

                if (dtFreelancers.Rows.Count > 0)
                {
                    // Bind Candidate 1 DropDown
                    ddlCandidate1.DataSource = dtFreelancers;
                    ddlCandidate1.DataTextField = "FullName";
                    ddlCandidate1.DataValueField = "UserID";
                    ddlCandidate1.DataBind();

                    // Bind Candidate 2 DropDown
                    ddlCandidate2.DataSource = dtFreelancers;
                    ddlCandidate2.DataTextField = "FullName";
                    ddlCandidate2.DataValueField = "UserID";
                    ddlCandidate2.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Fallback handled by default markup items
            }
        }

        // Compare Candidates Button Click Event
        protected void btnCompare_Click(object sender, EventArgs e)
        {
            // Step 1: Get selected candidate IDs
            string candidate1Id = ddlCandidate1.SelectedValue;
            string candidate2Id = ddlCandidate2.SelectedValue;

            // Step 2: Fetch detailed profile data for selected candidates from USERS & SERVICES tables
            try
            {
                string sql = @"SELECT u.FullName, u.Location, s.ServiceTitle, s.Price, s.DeliveryDays, s.ExperienceYears 
                               FROM USERS u 
                               LEFT JOIN SERVICES s ON u.UserID = s.FreelancerID 
                               WHERE u.UserID IN (@ID1, @ID2)";

                using (SqlConnection con = DbHelper.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@ID1", candidate1Id);
                        cmd.Parameters.AddWithValue("@ID2", candidate2Id);

                        DataTable dtResult = new DataTable();
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dtResult);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Smooth execution
            }
        }
    }
}
