using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmitRequirement_Click(object sender, EventArgs e)
        {
            string cat = ddlFormCategory.SelectedValue;
            string skills = txtSkills.Text.Trim();
            string min = txtMinBudget.Text.Trim();
            string max = txtMaxBudget.Text.Trim();
            string exp = ddlExperience.SelectedValue;
            string loc = txtLocation.Text.Trim();
            string mode = rblWorkMode.SelectedValue;

            Response.Redirect($"MatchResults.aspx?cat={Server.UrlEncode(cat)}&skills={Server.UrlEncode(skills)}&min={Server.UrlEncode(min)}&max={Server.UrlEncode(max)}&exp={Server.UrlEncode(exp)}&loc={Server.UrlEncode(loc)}&mode={Server.UrlEncode(mode)}");
        }
    }
}