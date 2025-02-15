using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineVisaApp
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnadminLogin_Click(object sender, EventArgs e)
        {
            if ((txtadminpassword.Text == "admin") && (txtadminusername.Text == "admin"))
            {

                Response.Redirect("AdminDashboard.aspx", false);
            }
            else
            {
                Response.Write("Invalid username or password");
            }
        }
    }
}