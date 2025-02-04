using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

public partial class Incident : Page {

    //Declare a global SqlConnection SqlConnection 
    public SqlConnection SqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CherwellConnectionString"].ConnectionString);
    //Declare a global SqlDataAdapter SqlDataAdapter 
    public SqlDataAdapter SqlDataAdapter = new SqlDataAdapter();
    //Declare a global SqlCommand SqlCommand 
    public SqlCommand SqlCommand = new SqlCommand();
    private string gridMessage = null;
    DataTable myDataTable = new DataTable();

    protected void Page_Load(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        if (!IsPostBack)
        {
            //RadGrid1.DataBind();
            //Here I want to declare datasource and bind the grid from aspx
            RadGrid1.DataSourceID = "DataSourceLoad";
            RadGrid1.DataBind();
        }
        //This is where I will bind with my offset query.
        RadGrid1.DataSourceID = "DataSourceLoad";
        RadGrid1.DataBind();
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        myDataTable = new DataTable();

        SqlConnection.Open();

        //Update Query to update the Datatable  
        SqlDataAdapter.SelectCommand = new SqlCommand("SELECT DISTINCT Incident.RecID, Incident.IncidentType, Incident.Service, Incident.Priority, Incident.OwnedBy, Incident.OwnedByTeam, Incident.IncidentID, Incident.CustomerDisplayName, Incident.CreatedBy, Incident.CreatedDateTime, Incident.ClosedDateTime, Incident.Status, STUFF((SELECT ', ' + Details FROM Journal WHERE Journal.ParentRecID=Incident.RecID FOR XML PATH('')), 1, 2, '') AS Details, Incident.Description, Incident.SLAResolveByDeadline FROM Incident INNER JOIN Journal ON Incident.RecID=Journal.ParentRecID ORDER BY Incident.RecID OFFSET 0 ROWS FETCH NEXT 200 ROWS ONLY;", SqlConnection);
        SqlDataAdapter.Fill(myDataTable);

        RadGrid1.DataSource = myDataTable;

        //Close the SqlConnection 
        SqlConnection.Close();

        RadGrid1.DataBind();
    }


    protected void RadGrid1_PageIndexChanged(object o, GridPageChangedEventArgs e)
    {

        int currentPageIndex = RadGrid1.CurrentPageIndex;

        int newPageIndex = e.NewPageIndex * 10;

        //if (e.CommandName == "Page")
        //{
        //    int newPageIndex = int.Parse(e.CommandArgument.ToString(), out clickedPage);
        //}

        //int maxPageIndex = currentPageIndex + 300;
        DataTable myDataTable = new DataTable();

        try
        {
            //Open the SqlConnection 
            SqlConnection.Open();

            //Update Query to update the Datatable  
            SqlDataAdapter.SelectCommand = new SqlCommand("SELECT DISTINCT Incident.RecID, Incident.IncidentType, Incident.Service, Incident.Priority, Incident.OwnedBy, Incident.OwnedByTeam, Incident.IncidentID, Incident.CustomerDisplayName, Incident.CreatedBy, Incident.CreatedDateTime, Incident.ClosedDateTime, Incident.Status, STUFF((SELECT ', ' + Details FROM Journal WHERE Journal.ParentRecID=Incident.RecID FOR XML PATH('')), 1, 2, '') AS Details, Incident.Description, Incident.SLAResolveByDeadline FROM Incident INNER JOIN Journal ON Incident.RecID=Journal.ParentRecID ORDER BY Incident.RecID OFFSET " + newPageIndex + " ROWS;", SqlConnection);
            SqlDataAdapter.Fill(myDataTable);

            RadGrid1.DataSource = myDataTable;

            //Close the SqlConnection 
            SqlConnection.Close();
        }
        catch (Exception ex)
        {
            RadGrid1.Controls.Add(new LiteralControl("Unable to update. Reason: " + ex.Message));
        }
        
        RadGrid1.DataBind();
    }

    //protected void RadGrid1_OnPreRender(object sender, EventArgs e)
    //{
    //    if (myDataTable)
    //    {
    //        myDataTable = new DataTable();

    //        SqlConnection.Open();

    //        //Update Query to update the Datatable  
    //        SqlDataAdapter.SelectCommand = new SqlCommand("SELECT DISTINCT Incident.RecID, Incident.IncidentType, Incident.Service, Incident.Priority, Incident.OwnedBy, Incident.OwnedByTeam, Incident.IncidentID, Incident.CustomerDisplayName, Incident.CreatedBy, Incident.CreatedDateTime, Incident.ClosedDateTime, Incident.Status, STUFF((SELECT ', ' + Details FROM Journal WHERE Journal.ParentRecID=Incident.RecID FOR XML PATH('')), 1, 2, '') AS Details, Incident.Description, Incident.SLAResolveByDeadline FROM Incident INNER JOIN Journal ON Incident.RecID=Journal.ParentRecID ORDER BY Incident.RecID OFFSET 0 ROWS FETCH NEXT 200 ROWS ONLY;", SqlConnection);
    //        SqlDataAdapter.Fill(myDataTable);

    //        RadGrid1.DataSource = myDataTable;

    //        //Close the SqlConnection 
    //        SqlConnection.Close();

    //        RadGrid1.DataBind();
    //    }

    //}

    //protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    //{
    //    GridPageChangedEventArgs editedItem = e.
    //    int currentPageIndex = e.

    //    String ConnString = ConfigurationManager.ConnectionStrings["CherwellConnectionString"].ConnectionString;
    //    SqlConnection conn = new SqlConnection(ConnString);
    //    SqlDataAdapter adapter = new SqlDataAdapter();
    //    adapter.SelectCommand = new SqlCommand("SELECT DISTINCT Incident.RecID, Incident.IncidentType, Incident.Service, Incident.Priority, Incident.OwnedBy, Incident.OwnedByTeam, Incident.IncidentID, Incident.CustomerDisplayName, Incident.CreatedBy, Incident.CreatedDateTime, Incident.ClosedDateTime, Incident.Status, STUFF((SELECT ', ' + Details FROM Journal WHERE Journal.ParentRecID=Incident.RecID FOR XML PATH('')), 1, 2, '') AS Details, Incident.Description, Incident.SLAResolveByDeadline FROM Incident INNER JOIN Journal ON Incident.RecID=Journal.ParentRecID ORDER BY Incident.RecID OFFSET " + currentPageIndex + " ROWS FETCH NEXT 300 ROWS ONLY;", conn);

    //    DataTable myDataTable = new DataTable();

    //    conn.Open();
    //    try
    //    {
    //        adapter.Fill(myDataTable);
    //    }
    //    finally
    //    {
    //        conn.Close();
    //    }

    //    RadGrid1.DataSource = myDataTable;
    //}

    protected void RadGrid1_DataBound(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(gridMessage))
        {
            DisplayMessage(gridMessage);
        }
    }

    protected void RadGrid1_ItemUpdated(object source, GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            SetMessage("Update failed. Reason: " + e.Exception.Message);
        }
        else
        {
            SetMessage("Item updated!");
        }
    }

    protected void RadGrid1_ItemInserted(object source, GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            SetMessage("Insert failed! Reason: " + e.Exception.Message);
        }
        else
        {
            SetMessage("New product is inserted!");
        }
    }

    protected void RadGrid1_ItemDeleted(object source, GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            SetMessage("Delete failed! Reason: " + e.Exception.Message);
        }
        else
        {
            SetMessage("Item deleted!");
        }
    }

    private void DisplayMessage(string text)
    {
        RadGrid1.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
    }

    private void SetMessage(string message)
    {
        gridMessage = message;
    }



}
