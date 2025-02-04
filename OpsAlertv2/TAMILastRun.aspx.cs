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

public partial class TAMILastRun : System.Web.UI.Page
{
    private string gridMessage = null;

    //Declare a global SqlConnection SqlConnection 
    public SqlConnection SqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OPSALERTConnectionString"].ConnectionString);
    //Declare a global SqlDataAdapter SqlDataAdapter 
    public SqlDataAdapter SqlDataAdapter = new SqlDataAdapter();
    //Declare a global SqlCommand SqlCommand 
    public SqlCommand SqlCommand = new SqlCommand();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RadGrid1.DataBind();
        }

    }

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

    protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        //Get the GridEditableItem of the RadGrid 
        GridEditableItem editedItem = e.Item as GridEditableItem;
        //Get the primary key value using the DataKeyValue. 
        string Commodity = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["Commodity"].ToString();
        //Access the textbox from the edit form template and store the values in string variables. 
        string DateProcessed = (editedItem["DateProcessed"].Controls[0] as TextBox).Text;

        try
        {
            //Open the SqlConnection 
            SqlConnection.Open();

            //Update Query to update the Datatable  
            string updateQuery = "UPDATE [TAMI_LastRun] set [DateProcessed]='" + DateProcessed + "' where [Commodity]='" + Commodity + "'";
            SqlCommand.CommandText = updateQuery;
            SqlCommand.Connection = SqlConnection;
            SqlCommand.ExecuteNonQuery();
            //Close the SqlConnection 
            SqlConnection.Close();

        }
        catch (Exception ex)
        {
            RadGrid1.Controls.Add(new LiteralControl("Unable to update. Reason: " + ex.Message));
            e.Canceled = true;
        }
    }

    protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
    {
        //Get the GridEditFormInsertItem of the RadGrid 
        GridEditableItem insertedItem = e.Item as GridEditableItem;

        //Access the textbox from the insert form template and store the values in string variables. 
        string Commodity = (insertedItem["Commodity"].Controls[0] as TextBox).Text;
        string DateProcessed = (insertedItem["DateProcessed"].Controls[0] as TextBox).Text;

        try
        {
            //Open the SqlConnection 
            SqlConnection.Open();
            //Update Query to insert into  the database  
            string insertQuery = "INSERT INTO [TAMI_LastRun] ([Commodity], [DateProcessed]) VALUES ('" + Commodity + "','" + DateProcessed + "')";
            SqlCommand.CommandText = insertQuery;
            SqlCommand.Connection = SqlConnection;
            SqlCommand.ExecuteNonQuery();
            //Close the SqlConnection 
            SqlConnection.Close();
        }
        catch (Exception ex)
        {
            RadGrid1.Controls.Add(new LiteralControl("Unable to insert. Reason: " + ex.Message));
            e.Canceled = true;
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
            SetMessage("Item inserted!");
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
