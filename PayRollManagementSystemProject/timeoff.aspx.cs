using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayRollManagementSystemProject
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            Button1.Click += new EventHandler(Button1_Click);
            showData();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


          
               
                    checkDate();
                    signUpNewMember();
                    clearForm();
               
        }
        void checkDate()
        {
            TextBox10.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            TextBox7.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
        }

        public void showData()
        {

            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from employee_tbl where member_id='" + Session["full_name"] + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();



                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        Label22.Text = dr.GetValue(0).ToString();
                        Label11.Text = dr.GetValue(10).ToString();
                        Label3.Text = dr.GetValue(4).ToString();
                        



                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }



        // user defined method

        void signUpNewMember()
        {
            //Response.Write("<script>alert('Testing');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO timeoff(ID,Name,Department,Request_type,StartDate,EndDate,StartTime,Hours,Status) values(@ID,@full_name,@department,@leave,@StartDate,@EndDate,@StartTime,@Example_8,@account_status)", con);
                cmd.Parameters.AddWithValue("@ID", Label11.Text);
                cmd.Parameters.AddWithValue("@full_name", Label22.Text);
                cmd.Parameters.AddWithValue("@department", Label3.Text);
                cmd.Parameters.AddWithValue("@leave", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@StartDate", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@EndDate", TextBox7.Text.Trim());             
                cmd.Parameters.AddWithValue("@StartTime",TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Example_8", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");
            
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void clearForm()
        {
            
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox10.Text = "";


        }
    }
}