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
using System.Collections;

public partial class TAMILookup : Page
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

    protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        //Get the GridEditableItem of the RadGrid 
        GridEditableItem editedItem = e.Item as GridEditableItem;

        string oldValue = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["FieldValue"].ToString();

        string FieldValue = (editedItem["FieldValue"].Controls[0] as TextBox).Text;


        //Get the primary key value using the DataKeyValue. 
        string FieldName = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["FieldName"].ToString();
        //Access the textbox from the edit form template and store the values in string variables. 
        

        try
        {
            //Open the SqlConnection 
            SqlConnection.Open();

            //Update Query to update the Datatable  
            string updateQuery = "UPDATE [TAMI_Lookup] set [FieldValue]='" + FieldValue + "' where [FieldValue]='" + oldValue + "'";
            SqlCommand.CommandText = updateQuery;
            SqlCommand.Connection = SqlConnection;
            SqlCommand.ExecuteNonQuery();
            //Close the SqlConnection 
            SqlConnection.Close();

            //Updating TAMIAlarms.aspx
            SqlConnection.Open();

            //Update Query to update the Datatable  
            updateQuery = "UPDATE [TAMI_Alarms] set [EscalationList]='" + FieldValue + "' where [EscalationList]='" + oldValue + "'";
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

    protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
    {
        //Get the GridEditFormInsertItem of the RadGrid 
        GridEditableItem insertedItem = e.Item as GridEditableItem;

        //Access the textbox from the insert form template and store the values in string variables. 
        string FieldName = "Escalation";
        string FieldValue = (insertedItem["FieldValue"].Controls[0] as TextBox).Text;

        try
        {
            //Open the SqlConnection 
            SqlConnection.Open();
            //Update Query to insert into  the database  
            string insertQuery = "INSERT INTO [TAMI_Lookup] ([FieldName], [FieldValue]) VALUES ('" + FieldName + "','" + FieldValue + "')";
            SqlCommand.CommandText = insertQuery;
            SqlCommand.Connection = SqlConnection;
            SqlCommand.ExecuteNonQuery();
            //Close the SqlConnection 
            SqlConnection.Close();
        }
        catch (Exception ex)
        {
            RadGrid1.Controls.Add(new LiteralControl("Unable to insert Customers. Reason: " + ex.Message));
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
