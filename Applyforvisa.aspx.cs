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
    public partial class Applyforvisa : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCountryDropDown();
                PopulateVisatype();
                PopulateVisaDuration();
                PopulateCountryOfOrigin();

            }

        }
        private void PopulateCountryDropDown()
        {
            try
            {

                using (SqlCommand cmd = new SqlCommand("SELECT CountryID,CountryName FROM CountryMaster", con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    drpvisacountry.Items.Add(new ListItem("Select Country", ""));
                    while (reader.Read())
                    {
                        string countryName = reader["CountryName"].ToString();
                        string countryID = reader["CountryID"].ToString();
                        ListItem item = new ListItem(countryName, countryID);
                        drpvisacountry.Items.Add(item);
                    }
                    con.Close();
                }

            }
            catch (Exception ex)
            {
                // Handle exception
            }
        }
        private void PopulateCountryOfOrigin()
        {
            try
            {

                using (SqlCommand cmd = new SqlCommand("SELECT CountryID,CountryName FROM CountryMaster", con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    drpcountryoforigin.Items.Add(new ListItem("Select Country", ""));
                    while (reader.Read())
                    {
                        string countryName = reader["CountryName"].ToString();
                        string countryID = reader["CountryID"].ToString();
                        ListItem item = new ListItem(countryName, countryID);
                        drpcountryoforigin.Items.Add(item);
                    }
                    con.Close();
                }

            }
            catch (Exception ex)
            {
                // Handle exception
            }
        }

        private void PopulateVisaDuration()
        {
            try
            {

                using (SqlCommand cmd = new SqlCommand("select VisaDurationID,VisaDuration from VisaDurationMAster", con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    drpvisaduration.Items.Add(new ListItem("Select Visa Duration", ""));
                    while (reader.Read())
                    {
                        string countryName = reader["VisaDuration"].ToString();
                        string countryID = reader["VisaDurationID"].ToString();
                        ListItem item = new ListItem(countryName, countryID);
                        drpvisaduration.Items.Add(item);
                    }
                    con.Close();
                }

            }
            catch (Exception ex)
            {
                // Handle exception
            }
        }

        private void PopulateVisatype()
        {
            try
            {

                using (SqlCommand cmd = new SqlCommand("SELECT VisaTypeID,VisaTypeName FROM VisaTypeMaster", con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    drpvisatype.Items.Add(new ListItem("Select Visa Type", ""));
                    while (reader.Read())
                    {
                        string visatypname = reader["VisaTypeName"].ToString();
                        string visatypid = reader["VisaTypeID"].ToString();
                        ListItem item = new ListItem(visatypname, visatypid);
                        drpvisatype.Items.Add(item);
                    }
                    con.Close();
                }

            }
            catch (Exception ex)
            {
                // Handle exception
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                byte[] photoData = null;
                string photoextension = "";
                if (filephoto.HasFile)
                {
                    using (BinaryReader br = new BinaryReader(filephoto.PostedFile.InputStream))
                    {
                        photoData = br.ReadBytes(filephoto.PostedFile.ContentLength);
                    }
                    photoextension = Path.GetExtension(filephoto.FileName).ToLower();
                }
                byte[] passportfrontpage = null;
                string passportfrontpageextension = "";
                if (filepassportfronpage.HasFile)
                {
                    using (BinaryReader br = new BinaryReader(filepassportfronpage.PostedFile.InputStream))
                    {
                        passportfrontpage = br.ReadBytes(filepassportfronpage.PostedFile.ContentLength);
                    }
                    passportfrontpageextension = Path.GetExtension(filepassportfronpage.FileName).ToLower();
                }
                byte[] passportlastpage = null;
                string passportlastpageext = "";
                if (filepassportlastpage.HasFile)
                {
                    using (BinaryReader br = new BinaryReader(filepassportlastpage.PostedFile.InputStream))
                    {
                        passportlastpage = br.ReadBytes(filepassportlastpage.PostedFile.ContentLength);
                    }
                    passportlastpageext = Path.GetExtension(filepassportlastpage.FileName).ToLower();
                }
                byte[] Policeclearance = null;
                string policeclearanceext = "";
                if (filePoliceclearance.HasFile)
                {
                    using (BinaryReader br = new BinaryReader(filePoliceclearance.PostedFile.InputStream))
                    {
                        Policeclearance = br.ReadBytes(filePoliceclearance.PostedFile.ContentLength);
                    }
                    policeclearanceext = Path.GetExtension(filepassportlastpage.FileName).ToLower();
                }
                int ApplicationId = 0;
                SqlCommand cmd = new SqlCommand("InsertVisaInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ApplicationID", ApplicationId);
                cmd.Parameters.AddWithValue("@VisaCountryID", drpvisacountry.SelectedValue);
                cmd.Parameters.AddWithValue("@VisaTypeID", drpvisatype.SelectedValue);
                cmd.Parameters.AddWithValue("@VisaDurationID", drpvisaduration.SelectedValue);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@phoneno", txtPhonenumber.Text);
                cmd.Parameters.AddWithValue("@emailid", txtEmailId.Text);
                cmd.Parameters.AddWithValue("@dob", dtdob.Value);
                cmd.Parameters.AddWithValue("@gender", drpGender.SelectedValue);
                cmd.Parameters.AddWithValue("@maritalstatus", drpMaritalStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@fathername", txtFatherName.Text);
                cmd.Parameters.AddWithValue("@mothername", txtMotherName.Text);
                cmd.Parameters.AddWithValue("@streetaddr", txtStreetAddress.Text);
                cmd.Parameters.AddWithValue("@city", txtCity.Text);
                cmd.Parameters.AddWithValue("@state", txtState.Text);
                cmd.Parameters.AddWithValue("@countryID", drpcountryoforigin.SelectedValue);
                cmd.Parameters.AddWithValue("@zipcode", txtZipCode.Text);

                //PassportDetilas aparameter
                cmd.Parameters.AddWithValue("@passportno", txtPassportNumber.Text);
                cmd.Parameters.AddWithValue("@placeofissue", txtPlaceofIssue.Text);
                cmd.Parameters.AddWithValue("@passdateofissue", dtdateofissue.Value);
                cmd.Parameters.AddWithValue("@passportexpirydate", dtPassportExpirydate.Value);
                //traveldetails
                cmd.Parameters.AddWithValue("@travelfromdate", dtPtravelfromdate.Value);
                cmd.Parameters.AddWithValue("@traveltodate", dtPtraveltodate.Value);
                cmd.Parameters.AddWithValue("@travelcomments", txttravelcomments.Text);


                //DocumentDetails
                cmd.Parameters.AddWithValue("@photodocumentID", 1);
                cmd.Parameters.AddWithValue("@photodocumentbyte", photoData);
                cmd.Parameters.AddWithValue("@photodocumentext", photoextension);
                cmd.Parameters.AddWithValue("@passportfrontdocumentID", 2);
                cmd.Parameters.AddWithValue("@passportfrontdocumentbyte", passportfrontpage);
                cmd.Parameters.AddWithValue("@passportfrontdocumentext", passportfrontpageextension);
                cmd.Parameters.AddWithValue("@passportbackdocumentID", 3);
                cmd.Parameters.AddWithValue("@passportbackdocumentbyte", passportlastpage);
                cmd.Parameters.AddWithValue("@passportbackdocumentext", passportlastpageext);
                cmd.Parameters.AddWithValue("@policeclearancedocumentID", 4);
                cmd.Parameters.AddWithValue("@policeclearancedocumentbyte", Policeclearance);
                cmd.Parameters.AddWithValue("@policeclearancedocumentext", policeclearanceext);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Dashboard.aspx", false);
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}