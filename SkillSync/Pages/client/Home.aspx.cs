using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            string category = ddlCategory.SelectedValue;
            string req = txtRequirement.Text.Trim();
            Response.Redirect($"MatchResults.aspx?cat={Server.UrlEncode(category)}&skills={Server.UrlEncode(req)}");
        }
    }
}