using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace SkillSync.Pages.client
{
    public partial class Login : System.Web.UI.Page
    {
        // Practical 12 style: Connection string aur SqlCommand declare kar rahe hain
        SqlConnection cn = new SqlConnection(@"Data Source=NEAV;Initial Catalog=SkillSync;Integrated Security=True;TrustServerCertificate=True");
        SqlCommand co = new SqlCommand();

        // Page Load Event: Database Connection open karenge
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            co.Connection = cn;

            if (!IsPostBack)
            {
                lblMessage.Visible = false;
            }
        }

        // Login Button Click Event: Credentials verify karke redirect karenge
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string selectedRole = ddlUserRole.SelectedValue;

            if (email == "" || password == "")
            {
                lblMessage.Text = "Please enter both Email and Password.";
                lblMessage.Visible = true;
                return;
            }

            // SQL Select Query string query set kar rahe hain
            co.CommandText = "select * from USERS where Email='" + email + "' and Password='" + password + "' and UserType='" + selectedRole + "'";

            // SqlDataReader run karke record verify kar rahe hain
            SqlDataReader dr = co.ExecuteReader();

            if (dr.Read())
            {
                // User matching mil gaya - Admin ya Client Home page par direct redirect with login status
                if (selectedRole == "Admin")
                {
                    Response.Redirect("../admin/AdminDashboard.aspx");
                }
                else
                {
                    Response.Redirect("Home.aspx?loggedIn=true&user=" + Server.UrlEncode(email));
                }
            }
            else
            {
                lblMessage.Text = "Invalid Email, Password or Role selection.";
                lblMessage.Visible = true;
            }
        }

        // Toggle Button Event: Login Form aur Register Form ke beech switch karne ke liye
        protected void btnToggleMode_Click(object sender, EventArgs e)
        {
            if (pnlLogin.Visible)
            {
                pnlLogin.Visible = false;
                pnlRegister.Visible = true;
                btnToggleMode.Text = "Already have an account? Sign In";
            }
            else
            {
                pnlLogin.Visible = true;
                pnlRegister.Visible = false;
                btnToggleMode.Text = "Don't have an account? Register Now";
            }

            lblMessage.Visible = false;
        }

        // Register New Client Account Button Event: Client user ko USERS table me insert karna
        protected void btnRegisterClient_Click(object sender, EventArgs e)
        {
            string name = txtRegName.Text;
            string email = txtRegEmail.Text;
            string password = txtRegPassword.Text;
            string location = txtRegLocation.Text;

            if (location == "")
            {
                location = "Mumbai";
            }

            if (name == "" || email == "" || password == "")
            {
                lblMessage.Text = "Please fill in all required registration fields.";
                lblMessage.Visible = true;
                return;
            }

            // Practical 12 style SQL Insert Query string set kar rahe hain (UserType = 'Client')
            string sql = "insert into USERS (UserID, FullName, Email, Password, UserType, Location, Status, CreatedDate) values ((select isnull(max(UserID), 0) + 1 from USERS), '" + name + "', '" + email + "', '" + password + "', 'Client', '" + location + "', 'Active', GETDATE())";

            co.CommandText = sql;

            // Query execute karke database me record insert kar rahe hain
            co.ExecuteNonQuery();

            // Successful registration message & direct redirect to Home Page
            Response.Redirect("Home.aspx?loggedIn=true&user=" + Server.UrlEncode(email));
        }
    }
}
