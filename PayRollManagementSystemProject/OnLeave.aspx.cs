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
    public partial class WebForm11 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvbind();
                
            }
        
        }

        protected void gvbind()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("Select * from timeoff where Status='Pending'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                GridView1.DataSource = ds;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }

        }

        
        public void GridView1_RowDeleting(Object sender, GridViewDeleteEventArgs e)
        {

            // Get the country/region of the record being deleted.
            GridViewRow row = GridView1.Rows[e.RowIndex];
            String region = row.Cells[0].Text;
            SqlConnection con = new SqlConnection(strcon);

            con.Open();

            SqlCommand cmd = new SqlCommand("Delete timeoff where ID='" + region + "'", con);
           
            cmd.ExecuteNonQuery();
            con.Close();

            gvbind();

        }
       
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            row.Visible = false;
            String region = row.Cells[0].Text;
            SqlConnection con = new SqlConnection(strcon);

            con.Open();
            SqlCommand cmd = new SqlCommand("Update timeoff SET Status=@account_status where ID='" + region + "'", con);
            cmd.Parameters.AddWithValue("@account_status", "Leave");
           
            cmd.ExecuteNonQuery();
            con.Close();


            gvbind();


        }

        protected void LnkHide_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            clickedRow.Visible = false;
        }
    }
}