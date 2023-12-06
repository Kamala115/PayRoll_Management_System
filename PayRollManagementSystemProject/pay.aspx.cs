using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace PayRollManagementSystemProject
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            showData();
            calculateTotal();
            takeHome();
            gvbind();

            Series s = Chart1.Series.Add("pie");
            s.ChartType = SeriesChartType.Pie;
            s.IsValueShownAsLabel = true;
            for (int colindex = 1; colindex < GridView1.Columns.Count; colindex++)
            {
                s.Points.AddXY(GridView1.Columns[colindex].HeaderText,
                                GridView1.Rows[0].Cells[colindex].Text);
            }

        }
        protected void gvbind()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("select * from payroll  where member_id='" + Session["full_name"] + "' ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count >= 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
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
                SqlCommand cmd = new SqlCommand("select * from payroll where member_id='" + Session["full_name"] + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();



                if (dr.HasRows)
                {
                    while (dr.Read())
                    {


                        Label1.Text = dr.GetValue(2).ToString();
                       
                        Label1.Visible = true;
                       



                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }
        
        private void calculateTotal()
        {
            double total = Convert.ToDouble(Label1.Text);
            double tax = (0.13 * total);
            Label2.Text =tax.ToString();
            double benefit = (0.03 * total);
            Label3.Text = benefit.ToString();
            Label4.Text = benefit.ToString();
            double takehome = (total - benefit - tax - benefit);
            Label6.Text = takehome.ToString();

        }


        void takeHome()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE payroll SET tax=@tax, benefit=@benefit, retirement=@retirement, take_home=@take_home WHERE member_id='" + Session["full_name"] + "'", con);

                cmd.Parameters.AddWithValue("@tax", Label2.Text);
                cmd.Parameters.AddWithValue("@benefit", Label3.Text);
                cmd.Parameters.AddWithValue("@retirement", Label4.Text);
                cmd.Parameters.AddWithValue("@take_home", Label6.Text);




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