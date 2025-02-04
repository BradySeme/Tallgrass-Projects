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

public partial class MasterPage : System.Web.UI.MasterPage
{
    private string gridMessage = null;

 

    protected void Page_Load(object sender, EventArgs e)
    {
        string connstring = ConfigurationManager.ConnectionStrings["OPSALERTConnectionString"].ConnectionString;

        string tststring = "Data Source=01btv-sqltst01;Initial Catalog=OPSALERT;Persist Security Info=True;User ID=OpsAppUser;Password=LfsfRXh5gKpTtO62qs7I";

        string prdstring = "Data Source=01bpv-sqlprd01;Initial Catalog=OPSALERT;Persist Security Info=True;User ID=OpsAppUser;Password=LfsfRXh5gKpTtO62qs7I";

        if (connstring == tststring)
        {
            RadLabel1.Text = "Environment: TEST";
            return;
        }
        if (connstring == prdstring)
        {
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
