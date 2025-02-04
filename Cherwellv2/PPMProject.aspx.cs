using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.Services;
using System.Web.UI;
using Telerik.Web.UI;

public partial class PPMProject : System.Web.UI.Page
{
    private string gridMessage = null;
    SqlDataService sqlDataService = new SqlDataService(ConfigurationManager.ConnectionStrings["CherwellConnectionString"].ConnectionString);

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];

        //populate statuses combobox
        RadComboBox comboBoxStatus = (RadComboBox)cmdItem.FindControl("rcbStatus");

        DataSet statuses = sqlDataService.ExecuteDataset("GetPPMProjectStatuses");

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

        //populate Owned By Teams combobox
        RadComboBox comboBoxOwnedByTeam = (RadComboBox)cmdItem.FindControl("rcbOwnedByTeam");

        DataSet ownedByTeams = sqlDataService.ExecuteDataset("GetPPMProjectOwnedByTeams");

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
        RadGrid1.DataSource = sqlDataService.ExecuteDataset("GetPPMProjects");
    }

    protected void SearchButton_OnClick(object sender, EventArgs e)
    {
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];

        RadTextBox rtbPPMProjectID = (RadTextBox)cmdItem.FindControl("rtbPPMProjectID");
        RadTextBox rtbName = (RadTextBox)cmdItem.FindControl("rtbName");
        RadTextBox rtbArea = (RadTextBox)cmdItem.FindControl("rtbArea");
        RadTextBox rtbPortfolioName = (RadTextBox)cmdItem.FindControl("rtbPortfolioName");
        RadTextBox rtbCreatedDateTime = (RadTextBox)cmdItem.FindControl("rtbCreatedDateTime");
        RadComboBox rcbOwnedByTeam = (RadComboBox)cmdItem.FindControl("rcbOwnedByTeam");
        RadTextBox rtbOwnedBy = (RadTextBox)cmdItem.FindControl("rtbOwnedBy");
        RadTextBox rtbOneLineProjectSummary = (RadTextBox)cmdItem.FindControl("rtbOneLineProjectSummary");
        RadTextBox rtbDescription = (RadTextBox)cmdItem.FindControl("rtbDescription");
        RadTextBox rtbLocation = (RadTextBox)cmdItem.FindControl("rtbLocation");
        RadTextBox rtbBudgetHealth = (RadTextBox)cmdItem.FindControl("rtbBudgetHealth");
        RadTextBox rtbScopeHealth = (RadTextBox)cmdItem.FindControl("rtbScopeHealth");
        RadTextBox rtbScheduleHealth = (RadTextBox)cmdItem.FindControl("rtbScheduleHealth");
        RadComboBox rcbStatus = (RadComboBox)cmdItem.FindControl("rcbStatus");

        string PPMProjectIDFilterText = rtbPPMProjectID.Text;
        string nameFilterText = rtbName.Text;
        string areaFilterText = rtbArea.Text;
        string portfolioNameFilterText = rtbPortfolioName.Text;
        string createdDateTimeFilterText = rtbCreatedDateTime.Text;
        string ownedByTeamFilterText = rcbOwnedByTeam.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbOwnedByTeam.Text;
        string ownedByFilterText = rtbOwnedBy.Text;
        string oneLineProjectSummaryFilterText = rtbOneLineProjectSummary.Text;
        string descriptionFilterText = rtbDescription.Text;
        string locationFilterText = rtbLocation.Text;
        string budgetHealthFilterText = rtbBudgetHealth.Text;
        string scopeHealthFilterText = rtbScopeHealth.Text;
        string scheduleHealthFilterText = rtbScheduleHealth.Text;
        string statusFilterText = rcbStatus.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbStatus.Text;


        List<string> values = new List<string>
        {
            PPMProjectIDFilterText,
            nameFilterText,
            areaFilterText,
            portfolioNameFilterText,
            createdDateTimeFilterText,
            ownedByTeamFilterText,
            ownedByFilterText,
            oneLineProjectSummaryFilterText,
            descriptionFilterText,
            locationFilterText,
            budgetHealthFilterText,
            scopeHealthFilterText,
            scheduleHealthFilterText,
            statusFilterText
        };

        RadGrid1.DataSource = sqlDataService.ExecuteDataset("SearchPPMProjects", Constants.PPMProjectsSearchParameterNames, values,
            Constants.PPMProjectsSearchParameterTypes);
        RadGrid1.DataBind();
    }
}
