using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayRollManagementSystemProject
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            row.Visible = false;
            String region = row.Cells[0].Text;
            SqlConnection con = new SqlConnection(strcon);

            con.Open();
            SqlCommand cmd = new SqlCommand("Update Employee_tbl SET paid_date=@padid where member_id='" + region + "'", con);
            cmd.Parameters.AddWithValue("@paid_date", DateTime.Now.ToString("dd/MM/yyyy"));

            cmd.ExecuteNonQuery();
            con.Close();
            




        }
    }
}