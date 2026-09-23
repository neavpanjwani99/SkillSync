using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.admin
{
    public partial class ManageServices : System.Web.UI.Page
    {
        // Connection string aur SqlCommand Practical 12 style me declare kar rahe hain
        SqlConnection cn = new SqlConnection(@"Data Source=NEAV;Initial Catalog=SkillSync;Integrated Security=True;TrustServerCertificate=True");
        SqlCommand co = new SqlCommand();

        // Page Load Event: Database Connection open karenge
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            co.Connection = cn;

            if (!IsPostBack)
            {
                // Dropdowns aur Services list load kar rahe hain
                LoadDropdowns();
                LoadServices();
            }
        }

        // Database se Freelancers aur Categories dropdown populate kar rahe hain
        private void LoadDropdowns()
        {
            // 1. Populate Freelancers DropDown
            co.CommandText = "select UserID, FullName from USERS where UserType='Freelancer' order by FullName asc";
            SqlDataReader dr1 = co.ExecuteReader();

            ddlAddServiceFreelancer.Items.Clear();
            while (dr1.Read())
            {
                ddlAddServiceFreelancer.Items.Add(new ListItem(dr1["FullName"].ToString(), dr1["UserID"].ToString()));
            }
            dr1.Close();

            // 2. Populate Categories DropDown
            co.CommandText = "select CategoryID, CategoryName from CATEGORIES order by CategoryName asc";
            SqlDataReader dr2 = co.ExecuteReader();

            ddlAddServiceCategory.Items.Clear();
            while (dr2.Read())
            {
                ddlAddServiceCategory.Items.Add(new ListItem(dr2["CategoryName"].ToString(), dr2["CategoryID"].ToString()));
            }
            dr2.Close();
        }

        // Database se SERVICES table fetch karke Repeater me bind karna (Practical 12 Style SqlDataAdapter Query)
        private void LoadServices()
        {
            // SQL Select Query joining SERVICES, USERS and CATEGORIES
            SqlDataAdapter da = new SqlDataAdapter("select s.ServiceID, s.ServiceTitle, s.Description, s.Price, s.DeliveryDays, s.ExperienceYears, s.Status, u.FullName as FreelancerName, c.CategoryName from SERVICES s inner join USERS u on s.FreelancerID = u.UserID inner join CATEGORIES c on s.CategoryID = c.CategoryID order by s.ServiceID desc", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptServices.DataSource = dt;
            rptServices.DataBind();
        }

        // Repeater Row Commands (Edit aur Delete buttons for Services)
        protected void rptServices_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string serviceId = e.CommandArgument.ToString();

            if (e.CommandName == "DeleteService")
            {
                // Delete referenced orders first, then delete service
                co.CommandText = "delete from ORDERS where ServiceID=" + serviceId + "; delete from SERVICES where ServiceID=" + serviceId;
                co.ExecuteNonQuery();

                lblMsg.Visible = false;

                // Close popups and reload services table
                pnlEditService.Visible = false;
                pnlAddService.Visible = false;
                LoadServices();
            }
            else if (e.CommandName == "EditService")
            {
                // Edit Panel me service details load kar rahe hain
                co.CommandText = "select ServiceID, ServiceTitle, Description, Price, DeliveryDays, ExperienceYears, Status from SERVICES where ServiceID=" + serviceId;
                SqlDataReader dr = co.ExecuteReader();

                if (dr.Read())
                {
                    txtEditServiceId.Text = dr["ServiceID"].ToString();
                    txtEditServiceTitle.Text = dr["ServiceTitle"].ToString();
                    txtEditServicePrice.Text = dr["Price"].ToString();
                    txtEditServiceDays.Text = dr["DeliveryDays"].ToString();
                    txtEditServiceExp.Text = dr["ExperienceYears"].ToString();
                    txtEditServiceDesc.Text = dr["Description"].ToString();

                    ListItem item = ddlEditServiceStatus.Items.FindByValue(dr["Status"].ToString());
                    if (item != null)
                    {
                        ddlEditServiceStatus.ClearSelection();
                        item.Selected = true;
                    }

                    pnlEditService.Visible = true;
                    pnlAddService.Visible = false;
                    lblMsg.Visible = false;
                }
                dr.Close();
            }
        }

        // Save Service Edit Event: Database me Service details Update karna
        protected void btnSaveServiceEdit_Click(object sender, EventArgs e)
        {
            string serviceId = txtEditServiceId.Text;
            string title = txtEditServiceTitle.Text;
            string price = txtEditServicePrice.Text;
            string days = txtEditServiceDays.Text;
            string exp = txtEditServiceExp.Text;
            string desc = txtEditServiceDesc.Text;
            string status = ddlEditServiceStatus.SelectedValue;

            // Practical 12 style: SQL Update Query for SERVICES table
            string sql = "update SERVICES set ServiceTitle='" + title + "', Description='" + desc + "', Price=" + price + ", DeliveryDays=" + days + ", ExperienceYears=" + exp + ", Status='" + status + "' where ServiceID=" + serviceId;

            co.CommandText = sql;
            co.ExecuteNonQuery();

            lblMsg.Visible = false;

            // Close popups and reload services table
            pnlEditService.Visible = false;
            pnlAddService.Visible = false;
            LoadServices();
        }

        // Cancel Service Edit Event / Close button
        protected void btnCancelServiceEdit_Click(object sender, EventArgs e)
        {
            pnlEditService.Visible = false;
            pnlAddService.Visible = false;
            lblMsg.Visible = false;
        }

        // Toggle Add Service Form Event
        protected void btnToggleAddService_Click(object sender, EventArgs e)
        {
            pnlAddService.Visible = !pnlAddService.Visible;
            pnlEditService.Visible = false;
            lblMsg.Visible = false;
        }

        // Add Service Submit Event: Admin side se naya Service SERVICES table me insert karna
        protected void btnAddServiceSubmit_Click(object sender, EventArgs e)
        {
            string freelancerId = ddlAddServiceFreelancer.SelectedValue;
            string categoryId = ddlAddServiceCategory.SelectedValue;
            string title = txtAddServiceTitle.Text;
            string desc = txtAddServiceDesc.Text;
            string price = txtAddServicePrice.Text;
            string days = txtAddServiceDays.Text;
            string exp = txtAddServiceExp.Text;

            // Practical 12 style: Dynamic ServiceID calculation insert for SERVICES table
            string sql = "insert into SERVICES (ServiceID, FreelancerID, CategoryID, ServiceTitle, Description, Price, DeliveryDays, ExperienceYears, Status) values ((select isnull(max(ServiceID), 0) + 1 from SERVICES), " + freelancerId + ", " + categoryId + ", '" + title + "', '" + desc + "', " + price + ", " + days + ", " + exp + ", 'Active')";

            co.CommandText = sql;
            co.ExecuteNonQuery();

            lblMsg.Visible = false;

            // Clear fields and hide panel
            txtAddServiceTitle.Text = "";
            txtAddServiceDesc.Text = "";
            txtAddServicePrice.Text = "";
            txtAddServiceDays.Text = "";
            txtAddServiceExp.Text = "";
            pnlAddService.Visible = false;
            pnlEditService.Visible = false;

            // Table reload kar rahe hain
            LoadServices();
        }
    }
}




