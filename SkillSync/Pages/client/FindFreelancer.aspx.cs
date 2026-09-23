using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        // Connection string aur SqlCommand Practical 12 pattern me declare kar rahe hain
        SqlConnection cn = new SqlConnection(@"Data Source=NEAV;Initial Catalog=SkillSync;Integrated Security=True;TrustServerCertificate=True");
        SqlCommand co = new SqlCommand();

        // Page Load Event: Database Connection open karenge
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            co.Connection = cn;

            if (!IsPostBack)
            {
                // Categories DropDown fill kar rahe hain
                LoadCategories();
            }
        }

        // Database se Categories fetch karke Form dropdown fill kar rahe hain
        private void LoadCategories()
        {
            co.CommandText = "select CategoryID, CategoryName from CATEGORIES order by CategoryName asc";
            SqlDataReader dr = co.ExecuteReader();

            ddlFormCategory.Items.Clear();
            ddlFormCategory.Items.Add(new ListItem("-- Select Project Category --", "0"));

            while (dr.Read())
            {
                ddlFormCategory.Items.Add(new ListItem(dr["CategoryName"].ToString(), dr["CategoryID"].ToString()));
            }

            dr.Close();
        }

        // Submit Requirement Button Event: Database me project requirement insert karna
        protected void btnSubmitRequirement_Click(object sender, EventArgs e)
        {
            // Form inputs read kar rahe hain
            string catName = ddlFormCategory.SelectedItem != null ? ddlFormCategory.SelectedItem.Text : "Web Development";
            string catId = ddlFormCategory.SelectedValue != "0" ? ddlFormCategory.SelectedValue : "1";
            string skills = txtSkills.Text;
            string minBudget = txtMinBudget.Text == "" ? "0" : txtMinBudget.Text;
            string maxBudget = txtMaxBudget.Text == "" ? "10000" : txtMaxBudget.Text;
            string deliveryDays = ddlDeliveryTime.SelectedValue;

            if (deliveryDays == "3Days") deliveryDays = "3";
            if (deliveryDays == "1Week") deliveryDays = "7";
            if (deliveryDays == "2Weeks") deliveryDays = "14";
            if (deliveryDays == "1Month") deliveryDays = "30";
            if (deliveryDays == "" || deliveryDays == null) deliveryDays = "7";

            string exp = ddlExperience.SelectedValue;
            string loc = txtLocation.Text;
            string mode = rblWorkMode.SelectedValue;
            string priority = rblPriority.SelectedValue;

            // Practical 12 style: Dynamic RequirementID SQL Insert Query string banayein
            string sql = "insert into PROJECT_REQUIREMENTS (RequirementID, ClientID, CategoryID, RequiredSkills, MinBudget, MaxBudget, DeliveryDays, ExperienceRequired, Location, WorkMode, PriorityFilter) values ((select isnull(max(RequirementID), 0) + 1 from PROJECT_REQUIREMENTS), 1, " + catId + ", '" + skills + "', " + minBudget + ", " + maxBudget + ", " + deliveryDays + ", '" + exp + "', '" + loc + "', '" + mode + "', '" + priority + "')";

            co.CommandText = sql;

            // Query execute karke database me record insert kar rahe hain
            co.ExecuteNonQuery();

            // Login parameters retain karenge agar user logged in hai
            string userParam = Request.QueryString["user"];
            string loggedInParam = Request.QueryString["loggedIn"];
            string loginQuery = "";
            if (loggedInParam == "true") loginQuery = "&loggedIn=true";
            if (userParam != null && userParam != "") loginQuery += "&user=" + Server.UrlEncode(userParam);

            // Record insert hone ke baad MatchResults page par redirect kar rahe hain
            Response.Redirect("MatchResults.aspx?cat=" + Server.UrlEncode(catName) + "&skills=" + Server.UrlEncode(skills) + "&min=" + minBudget + "&max=" + maxBudget + "&exp=" + Server.UrlEncode(exp) + "&loc=" + Server.UrlEncode(loc) + "&mode=" + Server.UrlEncode(mode) + loginQuery);
        }
    }
}