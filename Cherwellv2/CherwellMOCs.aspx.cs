using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.UI;
using Telerik.Web.UI;

public partial class CherwellMOCs : System.Web.UI.Page 
{
    private string gridMessage = null;
    SqlDataService sqlDataService = new SqlDataService(ConfigurationManager.ConnectionStrings["CherwellConnectionString"].ConnectionString);

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];

        //populate services combobox
        RadComboBox comboBoxService = (RadComboBox)cmdItem.FindControl("rcbService");

        DataSet services = sqlDataService.ExecuteDataset("GetCherwellMOCServices");

        foreach (DataRow row in services.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string serviceString = row["Service"].ToString();
            item.Text = serviceString;
            item.Value = serviceString;
            comboBoxService.Items.Add(item);
            item.DataBind();
        }
        comboBoxService.SelectedValue = RadGrid1.MasterTableView.GetColumn("Service").CurrentFilterValue.ToString();


        //populate pipeline combobox
        RadComboBox comboBoxPipeline = (RadComboBox)cmdItem.FindControl("rcbPipeline");

        DataSet pipelines = sqlDataService.ExecuteDataset("GetCherwellMOCPipelines");

        foreach (DataRow row in pipelines.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string pipelineString = row["Pipeline"].ToString();
            item.Text = pipelineString;
            item.Value = pipelineString;
            comboBoxPipeline.Items.Add(item);
            item.DataBind();
        }
        comboBoxPipeline.SelectedValue = RadGrid1.MasterTableView.GetColumn("Pipeline").CurrentFilterValue.ToString();

        //populate owned by team combobox
        RadComboBox comboBoxOwnedByTeam = (RadComboBox)cmdItem.FindControl("rcbOwnedByTeam");

        DataSet ownedByTeams = sqlDataService.ExecuteDataset("GetCherwellMOCOwnedByTeams");

        foreach (DataRow row in ownedByTeams.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string ownedByTeamString = row["OwnedByTeam"].ToString();
            item.Text = ownedByTeamString;
            item.Value = ownedByTeamString;
            comboBoxOwnedByTeam.Items.Add(item);
            item.DataBind();
        }
        comboBoxOwnedByTeam.SelectedValue = RadGrid1.MasterTableView.GetColumn("OwnedByTeam").CurrentFilterValue.ToString();

        //populate status combobox
        RadComboBox comboBoxStatus = (RadComboBox)cmdItem.FindControl("rcbStatus");

        DataSet statuses = sqlDataService.ExecuteDataset("GetCherwellMOCStatuses");

        foreach (DataRow row in statuses.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string statusString = row["Status"].ToString();
            item.Text = statusString;
            item.Value = statusString;
            comboBoxStatus.Items.Add(item);
            item.DataBind();
        }
        comboBoxStatus.SelectedValue = RadGrid1.MasterTableView.GetColumn("Status").CurrentFilterValue.ToString();
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
        RadGrid1.DataSource = sqlDataService.ExecuteDataset("GetCherwellMOCs");
    }

    protected void SearchButton_OnClick(object sender, EventArgs e)
    {
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];

        RadTextBox rtbChangeID = (RadTextBox)cmdItem.FindControl("rtbChangeID");
        RadComboBox rcbService = (RadComboBox)cmdItem.FindControl("rcbService");
        RadTextBox rtbType = (RadTextBox)cmdItem.FindControl("rtbType");
        RadComboBox rcbPipeline = (RadComboBox)cmdItem.FindControl("rcbPipeline");
        RadTextBox rtbProposedStartDate = (RadTextBox)cmdItem.FindControl("rtbProposedStartDate");
        RadTextBox rtbTitle = (RadTextBox)cmdItem.FindControl("rtbTitle");
        RadTextBox rtbRequestedBy = (RadTextBox)cmdItem.FindControl("rtbRequestedBy");
        RadComboBox rcbOwnedByTeam = (RadComboBox)cmdItem.FindControl("rcbOwnedByTeam");
        RadTextBox rtbOwnedBy = (RadTextBox)cmdItem.FindControl("rtbOwnedBy");
        RadTextBox rtbDescription = (RadTextBox)cmdItem.FindControl("rtbDescription");
        RadTextBox rtbLocation = (RadTextBox)cmdItem.FindControl("rtbLocation");
        RadComboBox rcbStatus = (RadComboBox)cmdItem.FindControl("rcbStatus");
        RadTextBox rtbApprovedBy = (RadTextBox)cmdItem.FindControl("rtbApprovedBy");
        RadTextBox rtbScheduledEndDate = (RadTextBox)cmdItem.FindControl("rtbScheduledEndDate");

        string changeIDFilterText = rtbChangeID.Text;
        string serviceFilterText = rcbService.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbService.Text;
        string typeFilterText = rtbType.Text;
        string pipelineFilterText = rcbPipeline.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbPipeline.Text;
        string proposedStartDateFilterText = rtbProposedStartDate.Text;
        string titleFilterText = rtbTitle.Text;
        string requestedByFilterText = rtbRequestedBy.Text;
        string ownedByTeamFilterText = rcbOwnedByTeam.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbOwnedByTeam.Text;
        string ownedByFilterText = rtbOwnedBy.Text;
        string descriptionFilterText = rtbDescription.Text;
        string locationFilterText = rtbLocation.Text;
        string statusFilterText = rcbStatus.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbStatus.Text;
        string approvedByFilterText = rtbApprovedBy.Text;
        string scheduledEndDateFilterText = rtbScheduledEndDate.Text;

        List<string> values = new List<string>
        {
            changeIDFilterText,
            serviceFilterText,
            typeFilterText,
            pipelineFilterText,
            proposedStartDateFilterText,
            titleFilterText,
            requestedByFilterText,
            ownedByTeamFilterText,
            ownedByFilterText,
            descriptionFilterText,
            locationFilterText,
            statusFilterText,
            approvedByFilterText,
            scheduledEndDateFilterText,
        };

        RadGrid1.DataSource = sqlDataService.ExecuteDataset("SearchCherwellMOCs", Constants.CherwellMOCsSearchParameterNames, values,
            Constants.CherwellMOCsSearchParameterTypes);
        RadGrid1.DataBind();
    }
}
