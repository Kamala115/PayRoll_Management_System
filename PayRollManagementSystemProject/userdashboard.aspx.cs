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
    public partial class WebForm13 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        public object Database { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            LinkButton44.Click += new EventHandler(LinkButton44_Click);
            LinkButton1.Click += new EventHandler(LinkButton1_Click);
            lblTime.Text = DateTime.Now.ToString("hh:mm:ss");
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

                        Label1.Text = dr.GetValue(0).ToString();


                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }
    

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("pay.aspx");
        } 
        protected void LinkButton44_Click(object sender, EventArgs e)
        {
            Response.Redirect("timeoff.aspx");
        }  
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("timecard1.aspx");
        }

        protected void TimerTime_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString("hh:mm:ss");
        }
    }
}