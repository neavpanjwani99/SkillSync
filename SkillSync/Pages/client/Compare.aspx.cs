using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class Compare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCompare_Click(object sender, EventArgs e)
        {
            // Update matrix selections on postback
            string val1 = ddlCandidate1.SelectedValue;
            string val2 = ddlCandidate2.SelectedValue;
        }
    }
}
