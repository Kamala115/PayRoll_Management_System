using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayRollManagementSystemProject
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        public static Stopwatch sw;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString("hh:mm:ss");
            lblDateToday.Text = DateTime.Now.ToString("dd/MM/yyyy");

            if (!IsPostBack)
            {
                btnStop.Enabled = false;
                sw = new Stopwatch();
            }
            showData();
        }

        protected void Start(object sender, EventArgs e)
        {

            sw.Start();
            btnStart.Enabled = false;
            btnStop.Enabled = true;
            
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

                        Label2.Text = dr.GetValue(6).ToString();
                        Label3.Text = dr.GetValue(10).ToString();
                        Label2.Visible = false;



                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }


        protected void Stop(object sender, EventArgs e)
        {
            sw.Stop();
            btnStop.Enabled = false;
            btnStart.Enabled = true;



            totalTime();

            sw.Reset();
            
        }

        void totalTime()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO worktime(member_id,Date,Hours,Salary) values(@member_id,@MyDate,@MyStartTime,@Salary)", con);
                cmd.Parameters.AddWithValue("@member_id", Label3.Text);
                cmd.Parameters.AddWithValue("@MyDate", DateTime.Now.ToString("dd/MM/yyyy"));
                cmd.Parameters.AddWithValue("@MyStartTime", Label1.Text);
                cmd.Parameters.AddWithValue("@Salary", Label2.Text);




                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void tm1_Tick(object sender, EventArgs e)
        {
            try
            {

                long sec = sw.Elapsed.Seconds;
                long min = sw.Elapsed.Minutes;
                long hour = sw.Elapsed.Hours;

                if (hour < 10)
                    Label1.Text = "0" + hour;
                else
                    Label1.Text = hour.ToString();
                Label1.Text += " : ";

                if (min < 10)
                    Label1.Text = "0" + min;
                else
                    Label1.Text = min.ToString();
                Label1.Text += " : ";
                if (sec < 10)
                    Label1.Text += "0" + sec;
                else
                    Label1.Text += sec.ToString();

            }
            catch { };
        }

        protected void TimerTime_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString("hh:mm:ss");
            lblDateToday.Text = DateTime.Now.ToString("dd/MM/yyyy");

        }


        
    }
}