using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayRollManagementSystemProject
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            showData();

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

                        Label1.Text = dr.GetValue(6).ToString();
                        Label2.Text = dr.GetValue(10).ToString();
                        Label1.Visible = false;
                        Label2.Visible = false;



                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

            


        }
        protected void Start(object sender, EventArgs e)
        {


            btnStart.Enabled = false;
            btnStop.Enabled = true;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Totalwork(member_id,Date,StartTime,EndTime,Salary) values(@member_id,@MyDate,@MyStartTime,@MyEndTime,@Salary)", con);
                cmd.Parameters.AddWithValue("@member_id", Label2.Text);
                cmd.Parameters.AddWithValue("@MyDate", DateTime.Now.ToString("dd/MM/yyyy"));
              
                cmd.Parameters.AddWithValue("@MyStartTime", DateTime.Now.ToString("HH:MM tt"));
                cmd.Parameters.AddWithValue("@MyEndTime", "pending");

                cmd.Parameters.AddWithValue("@Salary", Label1.Text);




                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }




        }
        protected void Stop(object sender, EventArgs e)
        {
            btnStop.Enabled = false;
            btnStart.Enabled = true;

           
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Totalwork SET EndTime=@MyEndTime WHERE EndTime='" + Label3.Text + "'", con);
                    cmd.Parameters.AddWithValue("@MyEndTime", DateTime.Now.ToString("HH:MM tt"));

                    cmd.ExecuteNonQuery();
                    con.Close();
                   

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
        }






       
    }
}