using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class Compare : System.Web.UI.Page
    {
        // Connection string aur SqlCommand Practical 12 style me declare kar rahe hain
        SqlConnection cn = new SqlConnection(@"Data Source=NEAV;Initial Catalog=SkillSync;Integrated Security=True;TrustServerCertificate=True");
        SqlCommand co = new SqlCommand();

        // Page Load Event: Database Connection open karenge aur Candidate dropdown fill karenge
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            co.Connection = cn;

            if (!IsPostBack)
            {
                // Candidates DropDown list fill kar rahe hain
                LoadCandidates();
            }
        }

        // Database se Freelancer users read karke dropdown list me bind kar rahe hain
        private void LoadCandidates()
        {
            co.CommandText = "select UserID, FullName from USERS where UserType='Freelancer' order by FullName asc";
            SqlDataReader dr = co.ExecuteReader();

            ddlCandidate1.Items.Clear();
            ddlCandidate2.Items.Clear();

            while (dr.Read())
            {
                string id = dr["UserID"].ToString();
                string name = dr["FullName"].ToString();

                ddlCandidate1.Items.Add(new ListItem(name, id));
                ddlCandidate2.Items.Add(new ListItem(name, id));
            }

            dr.Close();
        }

        // Compare Candidates Button Click Event
        protected void btnCompare_Click(object sender, EventArgs e)
        {
            string cand1Id = ddlCandidate1.SelectedValue;
            string cand2Id = ddlCandidate2.SelectedValue;

            // Candidate details query run kar rahe hain
            co.CommandText = "select * from USERS where UserID=" + cand1Id;
            SqlDataReader dr = co.ExecuteReader();
            dr.Close();
        }
    }
}
