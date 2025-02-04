using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;




public partial class IncidentVA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Fetch the Data from Database  'ConfigurationManager.ConnectionStrings["MOCDocs"].ToString();
        string sConn = ConfigurationManager.ConnectionStrings["CherwellConnectionString"].ToString();
        SqlConnection objConn = new SqlConnection(sConn);
        objConn.Open();
        //Change MOC ID As needed for now
        string sTSQL = "SELECT TrebuchetAttach.RecID, TrebuchetAttach.CreatedDateTime, TrebuchetAttach.AttachType, TrebuchetAttach.AttachFlags, TrebuchetAttach.FilePath, TrebuchetAttach.FileContents, TrebuchetAttach.FileExt, TrebuchetAttach.LastModTimeStamp FROM TrebuchetAttach INNER JOIN TrebuchetShortcuts ON TrebuchetAttach.RecID = TrebuchetShortcuts.TargetRecId INNER JOIN Incident ON TrebuchetShortcuts.OwningBusObRecId = Incident.RecID where Incident.RecID = '" + Request.QueryString["RecID"] + "'";

        SqlCommand objCmd = new SqlCommand(sTSQL, objConn);
        objCmd.CommandType = CommandType.Text;
        DataTable dt = new DataTable();
        //SqlDataAdapter ada = new SqlDataAdapter(objCmd);
        //new code
        using (SqlDataAdapter sqlAdapter = new SqlDataAdapter(objCmd))
        {
            try
            {

                sqlAdapter.Fill(dt);
                objConn.Close();
                objCmd.Dispose();
            }
            catch (Exception exc)
            {
                string msg = exc.GetType().FullName + ": " + exc.Message;
            }
        }







        //Bind the Data into the html anchor tag which will call the handler with ID  
        if (dt.Rows.Count > 0)
        {
            string tbl = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string lastFragment = dt.Rows[i]["FilePath"].ToString().Split ('\\').Last();
                tbl += @"<li>  
    <a target='_blank' href='DocHandler.ashx?RecId=" + dt.Rows[i]["RecId"].ToString();
                tbl += @"' title='";
                tbl += @"' > " + lastFragment;
                tbl += @"</a>  
            </li>";
            }
            Response.Write(tbl);
        }
        else {
            Response.Write("This incident has no attachments");
        }
        
    }
}
