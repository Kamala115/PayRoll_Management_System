using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayRollManagementSystemProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl currdiv = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("sidebar");
            currdiv.Style.Add("display", "none");

            System.Web.UI.HtmlControls.HtmlGenericControl curdiv = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("togbtn");
            curdiv.Style.Add("display", "none");

            Session["role"] = "back";






        }
    }
}