using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayRollManagementSystemProject
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                gvbind();
            }
            showData();
           

            if (checkIfMemberExists() == true)
            {
                
            }
            else
            {
                totalEarned();
            }


        }
        
        protected void gvbind()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("select o.member_id, o.Date, o.StartTime, o.EndTime, o.Salary from Totalwork o inner join Employee_tbl c on o.member_id = c.member_id where o.Date between c.paid_date and c.date  AND o.member_id='" + Session["full_name"] + "' ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count >= 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else { 
            }
           
          
        }




        decimal grandTotal = 0;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {


                DateTime d1 = DateTime.Parse(e.Row.Cells[1].Text.Trim());


                DateTime d2 = DateTime.Parse(e.Row.Cells[2].Text.Trim());
                TimeSpan ts = d2 - d1;


                decimal y = decimal.Parse(ts.TotalMinutes.ToString());



                decimal salary = decimal.Parse(e.Row.Cells[3].Text.Trim());
                decimal z = ((y / 60));
                Label Hour = e.Row.FindControl("lblHour") as Label;
                Hour.Text = z.ToString();





                decimal total = (z * salary);

                Label Total = e.Row.FindControl("lblTotal") as Label;
                Total.Text = total.ToString();



                grandTotal += total;







            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[4].Text = "Total";
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                Label Hour = e.Row.FindControl("lblGrandTotal") as Label;
                Hour.Text = grandTotal.ToString();
                Label4.Text = grandTotal.ToString();
                Label4.Visible = false;
            }


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
                SqlCommand cmd = new SqlCommand("select * from employee_tbl where member_id='" + Session["full_name"] + "' ", con);
                SqlDataReader dr = cmd.ExecuteReader();



                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        Label2.Text = dr.GetValue(0).ToString();
                        Label3.Text = dr.GetValue(10).ToString();

                        Label2.Visible = false;
                        Label3.Visible = false;




                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }
       

        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from payroll where member_id='" + Session["full_name"] + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }



        void totalEarned()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO payroll(member_id,full_name,total_earned,tax,benefit,retirement,take_home) values(@member_id,@full_name,@total_earned,@tax,@benefit,@retirement,@take_home)", con);
                cmd.Parameters.AddWithValue("@member_id", Label3.Text);
                cmd.Parameters.AddWithValue("@full_name", Label2.Text);
                cmd.Parameters.AddWithValue("@total_earned", Label4.Text);
                cmd.Parameters.AddWithValue("@tax", "pending");
                cmd.Parameters.AddWithValue("@benefit", "pending");
                cmd.Parameters.AddWithValue("@retirement", "pending");
                cmd.Parameters.AddWithValue("@take_home", "pending");



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