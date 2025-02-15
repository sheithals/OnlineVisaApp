using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineVisaApp
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateTable();
            }
        }
        private void PopulateTable()
        {

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }


            SqlCommand cmd2 = new SqlCommand("GetDashboard", con);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("UserId", Convert.ToInt32(Session["UserID"].ToString()));
            SqlDataAdapter da = new SqlDataAdapter(cmd2);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();


        }
        private System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
        {
            using (MemoryStream ms = new MemoryStream(byteArrayIn))
            {
                System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
                return returnImage;
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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
    }
}