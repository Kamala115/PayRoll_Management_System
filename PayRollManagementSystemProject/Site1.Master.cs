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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            LinkButton1.Click += new EventHandler(LinkButton1_Click);
            LinkButton2.Click += new EventHandler(LinkButton2_Click);
            LinkButton3.Click += new EventHandler(LinkButton3_Click);
            LinkButton7.Click += new EventHandler(LinkButton7_Click);
            LinkButton4.Click += new EventHandler(LinkButton4_Click);
            LinkButton6.Click += new EventHandler(LinkButton6_Click);
            LinkButton11.Click += new EventHandler(LinkButton11_Click);
            LinkButton12.Click += new EventHandler(LinkButton11_Click);
            LinkButton15.Click += new EventHandler(LinkButton15_Click);
            LinkButton16.Click += new EventHandler(LinkButton16_Click);
          


            //multiuser login
            try
            {
                if (Session["role"].Equals("back"))
                {
                    LinkButton15.Visible = true; // user login link button
                    LinkButton16.Visible = true; // sign up link button
                   



                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; //admin dashboard
                    LinkButton2.Visible = true; //employeee dashboard
                    LinkButton12.Visible = true; 
                    LinkButton12.Visible = true; 
                    LinkButton21.Visible = false; 
                    LinkButton9.Visible = false; 
                    
                    
                    showData();


                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = true;//admindashboard 
                    LinkButton3.Visible = true;
                    LinkButton7.Visible = true;
                    LinkButton4.Visible = true;
                    LinkButton6.Visible = true;
                    LinkButton21.Visible = true;
                    
                   
                    adminName();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("admindashboard.aspx");
        }  
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userdashboard.aspx");
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEmployee.aspx");
        }
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageEmployee.aspx");
        }
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProjectManagement.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProject.aspx");
        } 
      
        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");

        }
        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("clock1.aspx");
        }
        protected void LinkButton15_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }
        protected void LinkButton21_Click(object sender, EventArgs e)
        {
            Response.Redirect("payroll.aspx");
        } 
        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("OnLeave.aspx");
        }
        protected void LinkButton16_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
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
                        Label2.Text = dr.GetValue(5).ToString();


                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }


        void adminName()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlDataReader myReader = null;
                SqlCommand myCommand = new SqlCommand("select * from admin_tb", con);

                myReader = myCommand.ExecuteReader();
                while (myReader.Read())
                {
                    Label1.Text = myReader["Admin_Username"].ToString();


                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }


        }
    }
}