using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Drawing;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private string gridMessage = null;



    protected void Page_Load(object sender, EventArgs e)
    {
        string connstring = ConfigurationManager.ConnectionStrings["CherwellConnectionString"].ConnectionString;

        string tststring = "Data Source=01btv-sqltst01;Initial Catalog=Cherwell;Persist Security Info=True;User ID=ERLAppAdmin;Password=ERL@dmin1";

        string prdstring = "Data Source=01bpv-sqlprd01;Initial Catalog=Cherwell;Persist Security Info=True;User ID=ERLAppAdmin;Password=ERL@dmin1";

        if (connstring == tststring)
        {
            RadLabel1.Text = "Environment: TEST";
            return;
        }
        if (connstring == prdstring)
        {
            RadLabel1.ForeColor = Color.LightGreen;
            RadLabel1.Text = "Environment: PROD";
            return;
        }
        else
        {
            RadLabel1.Text = "Environment: Unknown";
            return;
        }

    }

}
