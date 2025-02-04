using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.UI;
using Telerik.Web.UI;

public partial class Tasks : System.Web.UI.Page 
{
    private string gridMessage = null;
    SqlDataService sqlDataService = new SqlDataService(ConfigurationManager.ConnectionStrings["CherwellConnectionString"].ConnectionString);

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        //Populate Close code combobox
        DataSet closeCodes = sqlDataService.ExecuteDataset("GetTaskCloseCodes");
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];
        RadComboBox comboBoxIncidentType = (RadComboBox)cmdItem.FindControl("rcbCloseCode");

        foreach (DataRow row in closeCodes.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string closeCodeString = row["CloseCode"].ToString();
            item.Text = closeCodeString;
            item.Value = closeCodeString;

            comboBoxIncidentType.Items.Add(item);

            item.DataBind();
        }
        //populate owned by teams combobox
        DataSet ownedByTeams = sqlDataService.ExecuteDataset("GetTaskOwnedByTeams");
        RadComboBox comboBoxOwnedByTeam = (RadComboBox)cmdItem.FindControl("rcbOwnedByTeam");

        foreach (DataRow row in ownedByTeams.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string ownedByTeamString = row["OwnedByTeam"].ToString();
            item.Text = ownedByTeamString;
            item.Value = ownedByTeamString;

            comboBoxOwnedByTeam.Items.Add(item);

            item.DataBind();
        }
        //populate owned by Service combobox
        DataSet services = sqlDataService.ExecuteDataset("GetTaskServices");
        RadComboBox comboBoxService = (RadComboBox)cmdItem.FindControl("rcbService");

        foreach (DataRow row in services.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string serviceString = row["Service"].ToString();
            item.Text = serviceString;
            item.Value = serviceString;

            comboBoxService.Items.Add(item);

            item.DataBind();
        }
    }

    protected void RadGrid1_DataBound(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(gridMessage))
        {
            DisplayMessage(gridMessage);
        }
    }
    private void DisplayMessage(string text)
    {
        RadGrid1.Controls.Add(new LiteralControl(string.Format(Constants.DisplayMessageFormat, text)));
    }

    protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        RadGrid1.DataSource = sqlDataService.ExecuteDataset("GetTasks");
    }

    protected void SearchButton_OnClick(object sender, EventArgs e)
    {
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];

        RadTextBox rtbTaskID = (RadTextBox)cmdItem.FindControl("rtbTaskID");
        RadTextBox rtbParentPublicID = (RadTextBox)cmdItem.FindControl("rtbParentPublicID");
        RadComboBox rcbService = (RadComboBox)cmdItem.FindControl("rcbService");
        RadTextBox rtbTitle = (RadTextBox)cmdItem.FindControl("rtbTitle");
        RadComboBox rcbOwnedByTeam = (RadComboBox)cmdItem.FindControl("rcbOwnedByTeam");
        RadTextBox rtbOwnedBy = (RadTextBox)cmdItem.FindControl("rtbOwnedBy");
        RadTextBox rtbLocation = (RadTextBox)cmdItem.FindControl("rtbLocation");
        RadComboBox rcbCloseCode = (RadComboBox)cmdItem.FindControl("rcbCloseCode");
        RadTextBox rtbCompletionDetails = (RadTextBox)cmdItem.FindControl("rtbCompletionDetails");
        RadTextBox rtbClosedDateTime = (RadTextBox)cmdItem.FindControl("rtbClosedDateTime");

        string taskIDFilterText = rtbTaskID.Text;
        string parentPublicIDFilterText = rtbParentPublicID.Text;
        string serviceFilterText = rcbService.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbService.Text;
        string titleFilterText = rtbTitle.Text;
        string ownedByTeamFilterText = rcbOwnedByTeam.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbOwnedByTeam.Text;
        string ownedByFilterText = rtbOwnedBy.Text;
        string locationFilterText = rtbLocation.Text;
        string closeCodeFilterText = rcbCloseCode.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbCloseCode.Text;
        string completionDetailsFilterText = rtbCompletionDetails.Text;
        string closedDateTimeFilterText = rtbClosedDateTime.Text;

        List<string> values = new List<string>
        {
            taskIDFilterText,
            parentPublicIDFilterText,
            serviceFilterText,
            titleFilterText,
            ownedByTeamFilterText,
            ownedByFilterText,
            locationFilterText,
            closeCodeFilterText,
            completionDetailsFilterText,
            closedDateTimeFilterText,
        };

        RadGrid1.DataSource = sqlDataService.ExecuteDataset("SearchTasks", Constants.TasksSearchParameterNames, values,
            Constants.TasksSearchParameterTypes);
        RadGrid1.DataBind();
    }
}
