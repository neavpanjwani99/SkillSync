using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string role = ddlUserRole.SelectedValue;
            if (role == "Admin")
            {
                Response.Redirect("../admin/AdminDashboard.aspx");
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
    }
}
