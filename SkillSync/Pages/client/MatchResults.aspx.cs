using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class MatchResults : System.Web.UI.Page
    {
        // Connection string aur SqlCommand Practical 12 style me declare kar rahe hain
        SqlConnection cn = new SqlConnection(@"Data Source=NEAV;Initial Catalog=SkillSync;Integrated Security=True;TrustServerCertificate=True");
        SqlCommand co = new SqlCommand();

        // Page Load Event: Database Connection open karenge aur URL se filters padhenge
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            co.Connection = cn;

            if (!IsPostBack)
            {
                // Freelancer identification dropdown fill karenge
                LoadSelectFreelancerDropdown();

                // URL Parameters (QueryString) se search values read kar rahe hain
                string cat = Request.QueryString["cat"];
                string skills = Request.QueryString["skills"];
                string min = Request.QueryString["min"];
                string max = Request.QueryString["max"];
                string exp = Request.QueryString["exp"];
                string loc = Request.QueryString["loc"];
                string mode = Request.QueryString["mode"];

                // UI Summary Badges update kar rahe hain
                if (cat != null && cat != "")
                {
                    lblSummaryCat.Text = GetCategoryDisplayName(cat);
                    SetDropdownValue(ddlFiltCat, cat);
                }

                if (skills != null && skills != "")
                {
                    lblSummarySkills.Text = skills;
                }

                if ((min != null && min != "") || (max != null && max != ""))
                {
                    string minStr = (min == null || min == "") ? "0" : min;
                    string maxStr = (max == null || max == "") ? "20,000" : max;
                    lblSummaryBudget.Text = "Rs " + minStr + " - Rs " + maxStr;
                }

                if (exp != null && exp != "")
                {
                    lblSummaryExp.Text = exp == "1Yr" ? "1+ Years" : (exp == "2Yrs" ? "2+ Years" : (exp == "3Yrs" ? "3+ Years" : "Any Experience"));
                }

                if ((loc != null && loc != "") || (mode != null && mode != ""))
                {
                    string locStr = (loc == null || loc == "") ? "Mumbai" : loc;
                    string modeStr = (mode == null || mode == "") ? "Remote" : mode;
                    lblSummaryLoc.Text = locStr + " (" + modeStr + ")";
                }

                // Database se matched services aur freelancers fetch karke display karenge
                LoadServicesData();
            }
        }

        // Database se Freelancer Users fetch karke DropDown me identification ke sath display karna
        private void LoadSelectFreelancerDropdown()
        {
            co.CommandText = "select UserID, FullName, Email from USERS where UserType='Freelancer' order by UserID asc";
            SqlDataReader dr = co.ExecuteReader();

            ddlSelectFreelancerID.Items.Clear();
            ddlSelectFreelancerID.Items.Add(new ListItem("-- Select Freelancer by Identification --", "0"));

            while (dr.Read())
            {
                string id = dr["UserID"].ToString();
                string name = dr["FullName"].ToString();
                string email = dr["Email"].ToString();
                ddlSelectFreelancerID.Items.Add(new ListItem("ID: FL-00" + id + " - " + name + " (" + email + ")", id));
            }

            dr.Close();
        }

        // Database se SERVICES aur FREELANCERS data fetch karke Repeater me bind karna (Practical 12 SqlDataAdapter Style)
        private void LoadServicesData()
        {
            string whereClause = " where u.UserType='Freelancer' and s.Status='Active'";

            // Agar dropdown se particular Freelancer ID selected hai
            if (ddlSelectFreelancerID.SelectedValue != null && ddlSelectFreelancerID.SelectedValue != "0")
            {
                whereClause += " and u.UserID=" + ddlSelectFreelancerID.SelectedValue;
            }
            else if (ddlFiltCat.SelectedValue != null && ddlFiltCat.SelectedValue != "All" && ddlFiltCat.SelectedValue != "")
            {
                whereClause += " and c.CategoryName='" + ddlFiltCat.SelectedValue + "'";
            }

            string sql = "select u.UserID, u.FullName, u.Email, u.Location, u.Status, s.ServiceID, s.ServiceTitle, s.Description, s.Price, s.DeliveryDays, s.ExperienceYears, c.CategoryName from USERS u inner join SERVICES s on u.UserID = s.FreelancerID inner join CATEGORIES c on s.CategoryID = c.CategoryID" + whereClause + " order by u.UserID asc";

            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            dt.Columns.Add("MatchScore", typeof(int));
            int baseScore = 94;
            foreach (DataRow dr in dt.Rows)
            {
                dr["MatchScore"] = baseScore;
                baseScore -= 6;
                if (baseScore < 76) baseScore = 88;
            }

            rptMatchResults.DataSource = dt;
            rptMatchResults.DataBind();
        }

        // Dropdown Index Change Event: Specific Freelancer select karne par table filter karna
        protected void ddlSelectFreelancerID_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlHireSuccess.Visible = false;
            LoadServicesData();
        }

        // Apply Filter Button Event
        protected void btnApplyFilter_Click(object sender, EventArgs e)
        {
            pnlHireSuccess.Visible = false;
            lblSummaryCat.Text = ddlFiltCat.SelectedItem.Text;
            lblSummaryBudget.Text = ddlFiltBudget.SelectedItem.Text;
            lblSummaryExp.Text = ddlFiltExp.SelectedItem.Text;
            lblSummaryLoc.Text = "Mumbai (" + ddlFiltMode.SelectedItem.Text + ")";
            LoadServicesData();
        }

        // Repeater Row Command Event: User client side se specific Freelancer select & hire karke ORDER place kar sakta hai
        protected void rptMatchResults_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "HireFreelancer")
            {
                string[] parts = e.CommandArgument.ToString().Split('|');
                string freelancerId = parts[0];
                string serviceId = parts[1];
                string price = parts[2];
                string freelancerName = parts[3];

                // Client ID 3 (Rohit Sharma) ke liye database me Order Insert query execute karenge
                string sql = "insert into ORDERS (OrderID, ClientID, FreelancerID, ServiceID, OrderDate, TotalAmount, Status) values ((select isnull(max(OrderID), 0) + 1 from ORDERS), 3, " + freelancerId + ", " + serviceId + ", GETDATE(), " + price + ", 'Pending')";

                co.CommandText = sql;
                co.ExecuteNonQuery();

                lblHireMsg.Text = "Successfully selected & hired Freelancer ID: FL-00" + freelancerId + " (" + freelancerName + ")! Order placed for Rs " + price + ".";
                pnlHireSuccess.Visible = true;
            }
        }

        // Avatar images generator helper
        public string GetAvatarUrl(int index)
        {
            string[] avatars = new string[] {
                "../../images/freelancer1.jpg",
                "../../images/freelancer2.jpg",
                "../../images/freelancer3.jpg",
                "../../images/freelancer4.jpg"
            };
            return avatars[index % avatars.Length];
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
