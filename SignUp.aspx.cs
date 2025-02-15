using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace OnlineVisaApp
{
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SaveApplicantUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("name", txtName.Text);
            cmd.Parameters.AddWithValue("phoneno", txtPhoneNumber.Text);
            cmd.Parameters.AddWithValue("Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("username", txtUsername.Text);
            cmd.Parameters.AddWithValue("password", txtPassword.Text);
            cmd.Parameters.AddWithValue("Question1", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("Answer1", txtAnswer1.Text);
           int result= cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("Not added");
            }

        }
    }
}