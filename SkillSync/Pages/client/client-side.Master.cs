using System;
using System.Web.UI;

namespace SkillSync
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        // Page Load Event for Master Page
        protected void Page_Load(object sender, EventArgs e)
        {
            // User login status QueryString parameters se check kar rahe hain
            string userParam = Request.QueryString["user"];
            string loggedInParam = Request.QueryString["loggedIn"];

            if ((userParam != null && userParam != "") || loggedInParam == "true")
            {
                // User logged in hai -> Login button hide karo, Logout button dikhao
                LoginLink.Visible = false;
                LogoutLink.Visible = true;

                // Navigation links me login query parameters carry forward karenge
                string queryStr = "?loggedIn=true";
                if (userParam != null && userParam != "")
                {
                    queryStr += "&user=" + Server.UrlEncode(userParam);
                }

                HomeLink.NavigateUrl = "~/Pages/client/Home.aspx" + queryStr;
                FindLink.NavigateUrl = "~/Pages/client/FindFreelancer.aspx" + queryStr;
                MatchLink.NavigateUrl = "~/Pages/client/MatchResults.aspx" + queryStr;
                CompareLink.NavigateUrl = "~/Pages/client/Compare.aspx" + queryStr;
                LogoLink.NavigateUrl = "~/Pages/client/Home.aspx" + queryStr;
                FooterLogoLink.NavigateUrl = "~/Pages/client/Home.aspx" + queryStr;
            }
            else
            {
                // User logged in nahi hai -> Login button dikhao, Logout button hide karo
                LoginLink.Visible = true;
                LogoutLink.Visible = false;
            }
        }
    }
}