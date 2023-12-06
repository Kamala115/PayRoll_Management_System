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
    public partial class WebForm5 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {



            Button2.Click += new EventHandler(Button2_Click);
            Button3.Click += new EventHandler(Button3_Click);

            LinkButton4.Click += new EventHandler(LinkButton4_Click);



        }
        //Go button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {

            getMemberByID();
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateMember();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
            clearForm();
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

                SqlCommand cmd = new SqlCommand("SELECT * from employee_tbl where member_id='" + TextBox1.Text.Trim() + "';", con);
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

        void deleteMemberByID()
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from employee_tbl WHERE member_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member Deleted Successfully');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }


        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from employee_tbl where member_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(0).ToString();
                        TextBox8.Text = dr.GetValue(1).ToString();
                        TextBox3.Text = dr.GetValue(2).ToString();
                        TextBox4.Text = dr.GetValue(3).ToString();
                        
                        TextBox10.Text = dr.GetValue(5).ToString();
                        TextBox11.Text = dr.GetValue(6).ToString();
                        
                       
                        TextBox6.Text = dr.GetValue(9).ToString();


                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateMember()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE employee_tbl SET full_name=@Full_Name,contact_no=@Contact_No,email=@Email_ID,department=@Department,Position=@Position,Salary=@Salary,state=@State,full_address=@Full_Address WHERE member_id='" + TextBox1.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@Full_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_No", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Email_ID", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Department", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Position", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@Salary", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@State", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Full_Address", TextBox6.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated Successfully');</script>");

                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox8.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox6.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            

        }


    }    

    
}