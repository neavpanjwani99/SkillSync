using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace SkillSync.Pages.admin
{
    public partial class ManageOrders : System.Web.UI.Page
    {
        // Connection string aur SqlCommand Practical 12 style me declare kar rahe hain
        SqlConnection cn = new SqlConnection(@"Data Source=NEAV;Initial Catalog=SkillSync;Integrated Security=True;TrustServerCertificate=True");
        SqlCommand co = new SqlCommand();

        // Page Load Event: Database Connection open karenge aur Orders list bind karenge
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            co.Connection = cn;

            if (!IsPostBack)
            {
                // Database se ORDERS list load kar rahe hain
                LoadOrders();
            }
        }

        // Database se ORDERS table fetch karke Repeater me bind karna (Practical 12 Style with SqlDataAdapter)
        private void LoadOrders()
        {
            SqlDataAdapter da = new SqlDataAdapter("select o.OrderID, o.OrderDate, o.TotalAmount, o.Status, c.FullName as ClientName, f.FullName as FreelancerName, s.ServiceTitle from ORDERS o left join USERS c on o.ClientID = c.UserID left join USERS f on o.FreelancerID = f.UserID left join SERVICES s on o.ServiceID = s.ServiceID order by o.OrderID desc", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptOrders.DataSource = dt;
            rptOrders.DataBind();

            co.CommandText = "select count(*) from ORDERS";
            lblTotalOrders.Text = "Total Orders: " + co.ExecuteScalar().ToString();
        }
    }
}


