using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayRollManagementSystemProject
{
    public partial class WebForm20 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl currdiv = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("sidebar");
            currdiv.Style.Add("display", "none");
            System.Web.UI.HtmlControls.HtmlGenericControl curdiv = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("togbtn");
            curdiv.Style.Add("display", "none");

            LinkButton1.Click += new EventHandler(LinkButton1_Click);
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if(checkIfMemberExists()==true)
            {

                try
                {
                    var msg = new MailMessage();
                    msg.To.Add("aasthastha143@gmail.com");
                    msg.From = new MailAddress("payrollmanagement76@gmail.com", "Email Test");
                    msg.IsBodyHtml = true;
                    msg.Subject = "test";
                    msg.Body = "anything";
                    msg.Priority = MailPriority.High;
                    var smtp = new SmtpClient("smtp.gmail.com")
                    {
                        Port = 587,
                        Credentials = new NetworkCredential("payrollmanagement76@gmail.com", "vmxibktocdlacmnf"),
                        EnableSsl = true,
                    };
                    
                    smtp.Send(msg);
                    

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }


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

                SqlCommand cmd = new SqlCommand("SELECT * from employee_tbl where email='" + TextBox1.Text.Trim() + "';", con);
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


    }
}