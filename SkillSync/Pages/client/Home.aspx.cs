using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // Connection string aur SqlCommand Practical 12 style me declare kar rahe hain
        SqlConnection cn = new SqlConnection(@"Data Source=NEAV;Initial Catalog=SkillSync;Integrated Security=True;TrustServerCertificate=True");
        SqlCommand co = new SqlCommand();

        // Page Load Event: Database Connection open karenge aur Categories Dropdown fill karenge
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            co.Connection = cn;

            if (!IsPostBack)
            {
                // Page pehli baar load hone par categories load karenge
                LoadCategories();
            }
        }

        // Database se Categories table ka data padh kar Dropdown list me bind karna
        private void LoadCategories()
        {
            // SQL SELECT Query run kar rahe hain
            co.CommandText = "select CategoryID, CategoryName from CATEGORIES order by CategoryName asc";
            SqlDataReader dr = co.ExecuteReader();

            ddlCategory.Items.Clear();
            ddlCategory.Items.Add(new ListItem("All Categories", "All"));

            // SqlDataReader se har row read karke dropdown me add kar rahe hain
            while (dr.Read())
            {
                ddlCategory.Items.Add(new ListItem(dr["CategoryName"].ToString(), dr["CategoryID"].ToString()));
            }

            dr.Close();
        }

        // Find Freelancers Button Click Event: QueryString se filters MatchResults page par bhejna
        protected void btnFind_Click(object sender, EventArgs e)
        {
            string category = ddlCategory.SelectedItem != null ? ddlCategory.SelectedItem.Text : "All";
            string req = txtRequirement.Text;

            // MatchResults page par search parameters bhej rahe hain
            Response.Redirect("MatchResults.aspx?cat=" + Server.UrlEncode(category) + "&skills=" + Server.UrlEncode(req));
        }
    }
}