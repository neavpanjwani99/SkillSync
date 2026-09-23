using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        // Connection string aur SqlCommand Practical 12 style me declare kar rahe hain
        SqlConnection cn = new SqlConnection(@"Data Source=NEAV;Initial Catalog=SkillSync;Integrated Security=True;TrustServerCertificate=True");
        SqlCommand co = new SqlCommand();

        // Page Load Event: Database Connection open karenge aur USERS table bind karenge
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            co.Connection = cn;

            if (!IsPostBack)
            {
                // Database se USERS table load kar rahe hain
                LoadUsers();
            }
        }

        // Database se USERS table fetch karke Repeater me bind karna (Practical 12 Style with SqlDataAdapter)
        private void LoadUsers()
        {
            SqlDataAdapter da = new SqlDataAdapter("select UserID, FullName, Email, UserType, Location, Status, CreatedDate from USERS order by UserID desc", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            // Repeater bind kar rahe hain
            rptUsers.DataSource = dt;
            rptUsers.DataBind();
        }

        // Repeater Row Commands (Edit aur Delete buttons)
        protected void rptUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string userId = e.CommandArgument.ToString();

            if (e.CommandName == "DeleteUser")
            {
                // Delete child records first to prevent FK constraint error, then delete user
                co.CommandText = "delete from FREELANCER_SKILLS where FreelancerID=" + userId + "; delete from ORDERS where ClientID=" + userId + " or FreelancerID=" + userId + "; delete from SERVICES where FreelancerID=" + userId + "; delete from USERS where UserID=" + userId;
                co.ExecuteNonQuery();

                lblMsg.Visible = false;

                // Close popups and reload table
                pnlEditUser.Visible = false;
                pnlAddFreelancer.Visible = false;
                LoadUsers();
            }
            else if (e.CommandName == "EditUser")
            {
                // Edit Panel me user details load kar rahe hain
                co.CommandText = "select UserID, FullName, Email, Location, Status from USERS where UserID=" + userId;
                SqlDataReader dr = co.ExecuteReader();

                if (dr.Read())
                {
                    txtEditUserId.Text = dr["UserID"].ToString();
                    txtEditName.Text = dr["FullName"].ToString();
                    txtEditEmail.Text = dr["Email"].ToString();
                    txtEditLocation.Text = dr["Location"].ToString();
                    
                    ListItem item = ddlEditStatus.Items.FindByValue(dr["Status"].ToString());
                    if (item != null)
                    {
                        ddlEditStatus.ClearSelection();
                        item.Selected = true;
                    }

                    pnlEditUser.Visible = true;
                    pnlAddFreelancer.Visible = false;
                    lblMsg.Visible = false;
                }
                dr.Close();
            }
        }

        // Save Edit Button Event: Database me User details Update karna
        protected void btnSaveUserEdit_Click(object sender, EventArgs e)
        {
            string userId = txtEditUserId.Text;
            string name = txtEditName.Text;
            string email = txtEditEmail.Text;
            string location = txtEditLocation.Text;
            string status = ddlEditStatus.SelectedValue;

            // Practical 12 style: SQL Update Query string set kar rahe hain
            string sql = "update USERS set FullName='" + name + "', Email='" + email + "', Location='" + location + "', Status='" + status + "' where UserID=" + userId;

            co.CommandText = sql;

            // Query execute karke record Update kar rahe hain
            co.ExecuteNonQuery();

            lblMsg.Visible = false;

            // Popups hide karke database table refresh kar rahe hain
            pnlEditUser.Visible = false;
            pnlAddFreelancer.Visible = false;
            LoadUsers();
        }

        // Cancel Edit/Close Button Event
        protected void btnCancelUserEdit_Click(object sender, EventArgs e)
        {
            pnlEditUser.Visible = false;
            pnlAddFreelancer.Visible = false;
            lblMsg.Visible = false;
        }

        // Toggle Add Freelancer Form Event
        protected void btnToggleAddForm_Click(object sender, EventArgs e)
        {
            pnlAddFreelancer.Visible = !pnlAddFreelancer.Visible;
            pnlEditUser.Visible = false;
            lblMsg.Visible = false;
        }

        // Add Freelancer Submit Button Event
        protected void btnAddFreelancerSubmit_Click(object sender, EventArgs e)
        {
            string name = txtFreeName.Text;
            string email = txtFreeEmail.Text;
            string password = txtFreePassword.Text;
            string location = txtFreeLocation.Text;

            // Dynamic UserID calculation using (select isnull(max(UserID), 0) + 1 from USERS)
            string sql = "insert into USERS (UserID, FullName, Email, Password, UserType, Location, Status, CreatedDate) values ((select isnull(max(UserID), 0) + 1 from USERS), '" + name + "', '" + email + "', '" + password + "', 'Freelancer', '" + location + "', 'Active', GETDATE())";

            co.CommandText = sql;
            co.ExecuteNonQuery();

            lblMsg.Visible = false;

            txtFreeName.Text = "";
            txtFreeEmail.Text = "";
            txtFreePassword.Text = "";
            txtFreeLocation.Text = "";
            pnlAddFreelancer.Visible = false;
            pnlEditUser.Visible = false;

            // Table refresh kar rahe hain
            LoadUsers();
        }
    }
}



