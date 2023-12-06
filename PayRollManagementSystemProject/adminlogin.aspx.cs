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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            System.Web.UI.HtmlControls.HtmlGenericControl currdiv = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("sidebar");
            currdiv.Style.Add("display", "none");
            System.Web.UI.HtmlControls.HtmlGenericControl curdiv = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("togbtn");
            curdiv.Style.Add("display", "none");

            LinkButton44.Click += new EventHandler(LinkButton44_Click);

        }

        protected void LinkButton44_Click(object sender, EventArgs e)
        {


            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from admin_tb where Admin_Username='" + TextBox1.Text.Trim() + "' AND Admin_Password='" + TextBox2.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Successful login');</script>");
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["role"] = "admin";
                        //Session["status"] = dr.GetValue(10).ToString();
                    }
                    Response.Redirect("admindashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }
    }
}