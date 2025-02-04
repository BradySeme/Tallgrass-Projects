using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.UI;
using Telerik.Web.UI;

public partial class Incident : Page
{
    private string gridMessage = null;
    SqlDataService sqlDataService = new SqlDataService(ConfigurationManager.ConnectionStrings["CherwellConnectionString"].ConnectionString);

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        //Populate incident types combobox
        DataSet incidentTypes = sqlDataService.ExecuteDataset("GetIncidentTypes");
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];
        RadComboBox comboBoxIncidentType = (RadComboBox)cmdItem.FindControl("rcbIncidentType");

        foreach (DataRow row in incidentTypes.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string incidentTypeString = row["IncidentType"].ToString();
            item.Text = incidentTypeString;
            item.Value = incidentTypeString;

            comboBoxIncidentType.Items.Add(item);

            item.DataBind();
        }
        //populate owned by teams combobox
        DataSet ownedByTeams = sqlDataService.ExecuteDataset("GetIncidentOwnedByTeams");
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
        DataSet services = sqlDataService.ExecuteDataset("GetIncidentServices");
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
        //populate owned by Status combobox
        DataSet statuses = sqlDataService.ExecuteDataset("GetIncidentStatuses");
        RadComboBox comboBoxStatus = (RadComboBox)cmdItem.FindControl("rcbStatus");

        foreach (DataRow row in statuses.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string statusString = row["Status"].ToString();
            item.Text = statusString;
            item.Value = statusString;

            comboBoxStatus.Items.Add(item);

            item.DataBind();
        }
    }

    protected void RadGrid1_DetailTableDataBind(object sender, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
    {
        var nestedViewItem = e.DetailTableView.NamingContainer as GridNestedViewItem;
        var parentRow = nestedViewItem.ParentItem as GridDataItem;


        string RecID = parentRow.GetDataKeyValue("RecID").ToString();

        DataSet dataSet = sqlDataService.ExecuteDataset("GetDetailsByIncident", "RecID", RecID, "VARCHAR");

        foreach (DataRow row in dataSet.Tables[0].Rows)
        {
            row[1] = Server.HtmlEncode(row[1].ToString());
        }

        e.DetailTableView.DataSource = dataSet;
    }

    protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        RadGrid1.DataSource = sqlDataService.ExecuteDataset("GetTop100Incidents");
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

    protected void SearchButton_OnClick(object sender, EventArgs e)
    {
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];

        RadTextBox rtbIncidentID = (RadTextBox)cmdItem.FindControl("rtbIncidentID");
        RadComboBox rcbService = (RadComboBox)cmdItem.FindControl("rcbService");
        RadComboBox rcbIncidentType = (RadComboBox)cmdItem.FindControl("rcbIncidentType");
        RadTextBox rtbOwnedBy = (RadTextBox)cmdItem.FindControl("rtbOwnedBy");
        RadComboBox rcbOwnedByTeam = (RadComboBox)cmdItem.FindControl("rcbOwnedByTeam");
        RadTextBox rtbCustomerName = (RadTextBox)cmdItem.FindControl("rtbCustomerName");
        RadTextBox rtbCreatedBy = (RadTextBox)cmdItem.FindControl("rtbCreatedBy");
        RadTextBox rtbCreatedDateTime = (RadTextBox)cmdItem.FindControl("rtbCreatedDateTime");
        RadTextBox rtbClosedDateTime = (RadTextBox)cmdItem.FindControl("rtbClosedDateTime");
        RadComboBox rcbStatus = (RadComboBox)cmdItem.FindControl("rcbStatus");
        RadTextBox rtbDetails = (RadTextBox)cmdItem.FindControl("rtbDetails");
        RadTextBox rtbDescription = (RadTextBox)cmdItem.FindControl("rtbDescription");
        RadTextBox rtbApprover = (RadTextBox)cmdItem.FindControl("rtbApprover");
        RadTextBox rtbLocation = (RadTextBox)cmdItem.FindControl("rtbLocation");


        string incidentIDFilterText = rtbIncidentID.Text;
        string serviceFilterText = rcbService.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbService.Text;
        string incidentTypeFilterText = rcbIncidentType.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbIncidentType.Text;
        string ownedByFilterText = rtbOwnedBy.Text;
        string ownedByTeamFilterText = rcbOwnedByTeam.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbOwnedByTeam.Text;
        string customerNameFilterText = rtbCustomerName.Text;
        string createdByFilterText = rtbCreatedBy.Text;
        string createdDateTimeFilterText = rtbCreatedDateTime.Text;
        string closedDateTimeFilterText = rtbClosedDateTime.Text;
        string statusFilterText = rcbStatus.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbStatus.Text;
        string detailsFilterText = rtbDetails.Text;
        string descriptionFilterText = rtbDescription.Text;
        string approverFilterText = rtbApprover.Text;
        string locationFilterText = rtbLocation.Text;

        List<string> values = new List<string>
        {
            incidentIDFilterText,
            serviceFilterText,
            incidentTypeFilterText,
            ownedByFilterText,
            ownedByTeamFilterText,
            customerNameFilterText,
            createdByFilterText,
            createdDateTimeFilterText,
            closedDateTimeFilterText,
            statusFilterText,
            detailsFilterText,
            descriptionFilterText,
            approverFilterText,
            locationFilterText
        };

        RadGrid1.DataSource = sqlDataService.ExecuteDataset("SearchIncidents", Constants.IncidentsSearchParameterNames, values,
            Constants.IncidentsSearchParameterTypes);
        RadGrid1.DataBind();
    }
}
