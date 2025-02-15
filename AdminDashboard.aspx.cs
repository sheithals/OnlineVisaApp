using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Net.Mail;
using System.Net;

namespace OnlineVisaApp
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateTable();
            }
        }
        private void PopulateTable()
        {

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }


            SqlCommand cmd2 = new SqlCommand("GetAdminDashboard", conn);
            cmd2.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd2);
            DataSet ds = new DataSet();
            da.Fill(ds);
            conn.Close();
            grdadmin.DataSource = ds;
            grdadmin.DataBind();


        }

        protected void grdadmin_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get the index of the column that contains the image data (assuming it's in the last column)
                int photoColumnIndex = e.Row.Cells.Count - 1; // Adjust this index if needed

                // Retrieve the byte array representing the image data from the DataItem
                byte[] imageData = (byte[])DataBinder.Eval(e.Row.DataItem, "PassportPhoto");

                // Set the image data to the Image control
                if (imageData != null && imageData.Length > 0)
                {
                    System.Drawing.Image image = byteArrayToImage(imageData);
                    ((System.Web.UI.WebControls.Image)e.Row.Cells[photoColumnIndex].FindControl("PassportPhoto")).ImageUrl = "data:image;base64," + Convert.ToBase64String(imageData);
                }
            }
        }
        private System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
        {
            using (MemoryStream ms = new MemoryStream(byteArrayIn))
            {
                System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
                return returnImage;
            }
        }
        protected void chkApprove_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkApprove = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chkApprove.NamingContainer;
            int index = row.RowIndex;
            int applicationId = Convert.ToInt32(grdadmin.DataKeys[row.RowIndex].Values[0].ToString());
            string email = row.Cells[3].Text;
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }


            SqlCommand cmd = new SqlCommand("UpdateApplication", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter ApplicantId = new SqlParameter("@Id", SqlDbType.VarChar);
            cmd.Parameters.Add(ApplicantId).Value = applicationId;
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            SendEmail(email, applicationId);
            PopulateTable();
        }
        private void SendEmail(string email, int applicationId)
        {
            // Configure the SMTP client
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com"); // Gmail SMTP server address
            smtpClient.Port = 587; // Gmail SMTP port
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("testeswatini123@gmail.com", "nhmvpsltjawiegba"); // Gmail credentials
            smtpClient.EnableSsl = true;

            // Create the email message
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("nvr.reach@gmail.com"); // Replace with your email address
            mailMessage.To.Add(email); // Add the recipient's email address
            mailMessage.Subject = "Visa Approved";
            mailMessage.Body = "Your visa has been Approved Application Id is  VST000" + applicationId;

            // Send the email
            try
            {
                // Attempt to send the email
                smtpClient.Send(mailMessage);
                // Email sent successfully
            }
            catch (SmtpException ex)
            {

            }
        }

    }
}