using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSync.Pages.client
{
    public partial class MatchResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Read incoming search criteria from QueryString
                string cat = Request.QueryString["cat"];
                string skills = Request.QueryString["skills"];
                string min = Request.QueryString["min"];
                string max = Request.QueryString["max"];
                string exp = Request.QueryString["exp"];
                string loc = Request.QueryString["loc"];
                string mode = Request.QueryString["mode"];

                if (!string.IsNullOrEmpty(cat))
                {
                    lblSummaryCat.Text = GetCategoryDisplayName(cat);
                    SetDropdownValue(ddlFiltCat, cat);
                }

                if (!string.IsNullOrEmpty(skills))
                {
                    lblSummarySkills.Text = skills;
                }

                if (!string.IsNullOrEmpty(min) || !string.IsNullOrEmpty(max))
                {
                    string minStr = string.IsNullOrEmpty(min) ? "0" : min;
                    string maxStr = string.IsNullOrEmpty(max) ? "20,000" : max;
                    lblSummaryBudget.Text = $"Rs {minStr} - Rs {maxStr}";
                }

                if (!string.IsNullOrEmpty(exp))
                {
                    lblSummaryExp.Text = exp == "1Yr" ? "1+ Years" : (exp == "2Yrs" ? "2+ Years" : (exp == "3Yrs" ? "3+ Years" : "Any Experience"));
                }

                if (!string.IsNullOrEmpty(loc) || !string.IsNullOrEmpty(mode))
                {
                    string locStr = string.IsNullOrEmpty(loc) ? "Mumbai" : loc;
                    string modeStr = string.IsNullOrEmpty(mode) ? "Remote" : mode;
                    lblSummaryLoc.Text = $"{locStr} ({modeStr})";
                }
            }
        }

        protected void btnApplyFilter_Click(object sender, EventArgs e)
        {
            lblSummaryCat.Text = ddlFiltCat.SelectedItem.Text;
            lblSummaryBudget.Text = ddlFiltBudget.SelectedItem.Text;
            lblSummaryExp.Text = ddlFiltExp.SelectedItem.Text;
            lblSummaryLoc.Text = $"Mumbai ({ddlFiltMode.SelectedItem.Text})";
        }

        private string GetCategoryDisplayName(string val)
        {
            switch (val)
            {
                case "WebDev": return "Web Development";
                case "UIUX": return "UI/UX Design";
                case "Graphic": return "Graphic Design";
                case "Marketing": return "Digital Marketing";
                case "Writing": return "Content Writing";
                case "Video": return "Video Editing";
                default: return val;
            }
        }

        private void SetDropdownValue(DropDownList ddl, string val)
        {
            ListItem item = ddl.Items.FindByValue(val);
            if (item != null)
            {
                ddl.ClearSelection();
                item.Selected = true;
            }
        }
    }
}
