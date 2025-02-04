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

public partial class ListCategory : Page
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
        //Get the primary key value using the DataKeyValue.
        string lstcat_listid = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["lstcat_listid"].ToString();
        string lstcat_catid = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["lstcat_catid"].ToString();
        //Access the textbox from the edit form template and store the values in string variables. 
        string lstcat_name = (editedItem["lstcat_name"].Controls[0] as TextBox).Text;
        string lstcat_description = (editedItem["lstcat_description"].Controls[0] as RadEditor).Content;
        string lstcat_level = (editedItem["lstcat_level"].Controls[0] as TextBox).Text;
        string lstcat_sortorder = (editedItem["lstcat_sortorder"].Controls[0] as TextBox).Text;
        string lstcat_attributes = (editedItem["lstcat_attributes"].Controls[0] as RadEditor).Content;

        try
        {
            //Open the SqlConnection 
            SqlConnection.Open();


            //Update Query to update the Datatable  
            string updateQuery = "UPDATE [tbl_ListCategory] set [lstcat_name]='" + lstcat_name + "', [lstcat_description]='" + lstcat_description + "', [lstcat_level]='" + lstcat_level + "', [lstcat_sortorder]='" + lstcat_sortorder + "', [lstcat_attributes]='" + lstcat_attributes + "' where [lstcat_listid]='" + lstcat_listid + "' and [lstcat_catid] ='" + lstcat_catid + "'";
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

    protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
    {
        //Get the GridEditFormInsertItem of the RadGrid 
        GridEditableItem insertedItem = e.Item as GridEditableItem;

        ////Incrementing IDs

        SqlConnection.Open();
        object maxcatid = new SqlCommand("SELECT MAX(lstcat_catid) + 1 FROM tbl_ListCategory", SqlConnection).ExecuteScalar();
        object maxlistid = new SqlCommand("SELECT MAX(lstcat_listid) FROM tbl_ListCategory", SqlConnection).ExecuteScalar();
        SqlConnection.Close();

        //Access the textbox from the insert form template and store the values in string variables. 
        string lstcat_listid = maxlistid.ToString();
        string lstcat_catid = maxcatid.ToString();
        string lstcat_name = (insertedItem["lstcat_name"].Controls[0] as TextBox).Text;
        string lstcat_description = (insertedItem["lstcat_description"].Controls[0] as RadEditor).Content;
        string lstcat_level = (insertedItem["lstcat_level"].Controls[0] as TextBox).Text;
        string lstcat_sortorder = (insertedItem["lstcat_sortorder"].Controls[0] as TextBox).Text;
        string lstcat_attributes = (insertedItem["lstcat_attributes"].Controls[0] as RadEditor).Content;

        try
        {
            //Open the SqlConnection 
            SqlConnection.Open();
            //Update Query to insert into  the database  
            string insertQuery = "INSERT INTO [tbl_ListCategory] ([lstcat_listid], [lstcat_catid], [lstcat_name], [lstcat_description], [lstcat_level], [lstcat_sortorder], [lstcat_attributes]) VALUES ('" + lstcat_listid + "','" + lstcat_catid + "','" + lstcat_name + "','" + lstcat_description + "', '" + lstcat_level + "','" + lstcat_sortorder + "', '" + lstcat_attributes + "')";
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

    protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {

    }

}
