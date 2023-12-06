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
    public partial class WebForm4 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            totalEmployee();
            totalproject();
            employeeOnLeave();
            Bindchart();
           
        }
        void totalEmployee()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                string ActiveUsers = "SELECT * FROM Employee_tbl ";
                SqlCommand cmd = new SqlCommand(ActiveUsers, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                Label3.Text = ds.Tables[0].Rows.Count.ToString();

            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
       
        private void Bindchart()
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("select type, sum(Amount) as TotAmount from images group by type", con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            da.Fill(dt);
            con.Close();
            //storing total rows count to loop on each Record    
            string[] X = new string[dt.Rows.Count];
            int[] Y= new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                //storing Values for X axis    
                X[i] = dt.Rows[0].ToString();
                //storing values for Y Axis    
                Y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            //binding chart control    
            Chart1.Series[0].Points.DataBindXY(X, Y);

            //Setting width of line    
            Chart1.Series[0].BorderWidth = 10;
            //setting Chart type     
            Chart1.Series[0].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.StackedColumn;
            // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;    
            //Hide or show chart back GridLines    
            //Chart1.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;    
            //Chart1.ChartAreas["ChartArea1"].AxisY.MajorGrid.Enabled = false;   
            //Enabled 3D    
           
            
        }
        void totalproject()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                string ActiveUsers = "SELECT * FROM project";
                SqlCommand cmd = new SqlCommand(ActiveUsers, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                Label2.Text = ds.Tables[0].Rows.Count.ToString();

            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void employeeOnLeave()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                string ActiveUsers = "SELECT * FROM timeoff WHERE Status='" + "Leave" + "'";

                SqlCommand cmd = new SqlCommand(ActiveUsers, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                con.Close();

                Label1.Text = ds.Tables[0].Rows.Count.ToString();

            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}