using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace SkillSync.Pages.admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        // Connection string aur SqlCommand Practical 12 style me declare kar rahe hain
        SqlConnection cn = new SqlConnection(@"Data Source=NEAV;Initial Catalog=SkillSync;Integrated Security=True;TrustServerCertificate=True");
        SqlCommand co = new SqlCommand();

        // Page Load Event: Database Connection open karenge aur statistics load karenge
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            co.Connection = cn;

            if (!IsPostBack)
            {
                // Database se statistics aur lists load kar rahe hain
                LoadCounts();
                LoadCategoryBreakdown();
                LoadOrderStatusCounts();
                LoadRecentActivity();
            }
        }

        // Practical 12 style: ExecuteScalar se total counts fetch kar rahe hain
        private void LoadCounts()
        {
            // Query 1: Total Users Count
            co.CommandText = "select count(*) from USERS";
            lblTotalUsers.Text = co.ExecuteScalar().ToString();

            // Query 2: Total Freelancers Count
            co.CommandText = "select count(*) from USERS where UserType='Freelancer'";
            lblTotalFreelancers.Text = co.ExecuteScalar().ToString();

            // Query 3: Total Active Services Count
            co.CommandText = "select count(*) from SERVICES";
            lblTotalServices.Text = co.ExecuteScalar().ToString();

            // Query 4: Total Orders Count
            co.CommandText = "select count(*) from ORDERS";
            lblTotalOrders.Text = co.ExecuteScalar().ToString();
        }

        // Database se category wise service breakdown fetch karna
        private void LoadCategoryBreakdown()
        {
            SqlDataAdapter da = new SqlDataAdapter("select c.CategoryName, count(s.ServiceID) as ServiceCount, isnull(avg(s.Price), 0) as AvgPrice from CATEGORIES c left join SERVICES s on c.CategoryID = s.CategoryID group by c.CategoryName order by ServiceCount desc", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptTopCategories.DataSource = dt;
            rptTopCategories.DataBind();
        }

        // Database se order status counts fetch karna
        private void LoadOrderStatusCounts()
        {
            co.CommandText = "select count(*) from ORDERS where Status='Pending'";
            lblPendingOrders.Text = co.ExecuteScalar().ToString();

            co.CommandText = "select count(*) from ORDERS where Status in ('Active', 'In Progress', 'Accepted')";
            lblInProgressOrders.Text = co.ExecuteScalar().ToString();

            co.CommandText = "select count(*) from ORDERS where Status='Completed'";
            lblCompletedOrders.Text = co.ExecuteScalar().ToString();

            co.CommandText = "select count(*) from ORDERS where Status='Cancelled'";
            lblCancelledOrders.Text = co.ExecuteScalar().ToString();
        }

        // Database se top recent users fetch karke activity log me bind karna
        private void LoadRecentActivity()
        {
            SqlDataAdapter da = new SqlDataAdapter("select top 5 FullName, Email, UserType, Location, CreatedDate from USERS order by UserID desc", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptRecentActivity.DataSource = dt;
            rptRecentActivity.DataBind();
        }
    }
}


