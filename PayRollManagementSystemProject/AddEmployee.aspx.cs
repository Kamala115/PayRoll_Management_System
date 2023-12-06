using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayRollManagementSystemProject
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Click += new EventHandler(Button1_Click);

            UpdateMember();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

                if (checkBlankField() && checkCorrectData())
                {

                }
                else
                {
                    signUpNewMember();
                    clearForm();

                }

           

        }

           


            bool checkCorrectData()
            {
                if (!Regex.Match(TextBox1.Text, "^[A-Z][a-zA-Z]*$").Success)
                {

                    Label1.Text = "Blank Field";
                    Label1.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                if (!Regex.Match(TextBox3.Text, @"^[1-9]\d{2}-[1-9]\d{2}-\d{4}$").Success)
                {
                    Label3.Text = "Blank Field";
                    Label3.ForeColor = System.Drawing.Color.Red;
                    return true;

                }
                if (!Regex.Match(TextBox7.Text, @"^[1-9]\d{2}-[1-9]\d{2}-\d{4}$").Success)
                {
                    Label7.Text = "Blank Field";
                    Label7.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                if (!Regex.Match(TextBox5.Text, @"^[0-9]+\s+([a-zA-Z]+|[a-zA-Z]+\s[a-zA-Z]+)$").Success)
                {
                    Label5.Text = "Blank Field";
                    Label5.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                return false;
            }
            bool checkBlankField()
            {
                if (TextBox1.Text == "")
                {
                    Label1.Text = "Blank Field";
                    Label1.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                if (TextBox2.Text == "")
                {
                    Label2.Text = "Blank Field";
                    Label2.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                if (TextBox3.Text == "")
                {
                    Label3.Text = "Blank Field";
                    Label3.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                if (TextBox4.Text == "")
                {
                    Label4.Text = "Blank Field";
                    Label4.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                if (TextBox5.Text == "")
                {
                    Label5.Text = "Blank Field";
                    Label5.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
              

                if (TextBox7.Text == "")
                {
                    Label7.Text = "Blank Field";
                    Label7.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                if (TextBox8.Text == "")
                {
                    Label8.Text = "Blank Field";
                    Label8.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                if (TextBox9.Text == "")
                {
                    Label9.Text = "Blank Field";
                    Label9.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                if (TextBox10.Text == "")
                {
                    Label10.Text = "Blank Field";
                    Label10.ForeColor = System.Drawing.Color.Red;
                    return true;
                }
                return false;
            }

            // user defined method

            void signUpNewMember()
            {
                //Response.Write("<script>alert('Testing');</script>");
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("INSERT INTO employee_tbl(full_name,dob,contact_no,email,department,Position,Salary,state,paid_date,full_address,member_id,password,date) values(@full_name,@dob,@contact_no,@email,@department,@Position,@Salary,@state,@city,@full_address,@member_id,@password,@date)", con);
                    cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@department", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Position", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@Salary", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@city", DateTime.Now.ToString("dd/MM/yyyy"));
                    cmd.Parameters.AddWithValue("@full_address", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_id", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("dd/MM/yyyy"));
                    cmd.ExecuteNonQuery();
                    con.Close();

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
                SqlCommand cmd = new SqlCommand("UPDATE employee_tbl SET date=@date", con);
                cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("dd/MM/yyyy"));
               ;

                cmd.ExecuteNonQuery();
                con.Close();
               

             

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
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";
                TextBox10.Text = "";


            }

        
    }

}
