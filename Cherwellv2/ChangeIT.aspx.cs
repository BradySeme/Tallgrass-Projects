using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.UI;
using Telerik.Web.UI;

public partial class ChangeIT : System.Web.UI.Page
{
    private string gridMessage = null;
    SqlDataService sqlDataService = new SqlDataService(ConfigurationManager.ConnectionStrings["CherwellConnectionString"].ConnectionString);

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];

        //populate services combobox
        RadComboBox comboBoxService = (RadComboBox)cmdItem.FindControl("rcbService");

        DataSet services = sqlDataService.ExecuteDataset("GetChangeServices");

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

        //populate categories combobox
        RadComboBox comboBoxCategory = (RadComboBox)cmdItem.FindControl("rcbCategory");

        DataSet categories = sqlDataService.ExecuteDataset("GetChangeCategories");

        foreach (DataRow row in categories.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string categoryString = row["Category"].ToString();
            item.Text = categoryString;
            item.Value = categoryString;
            comboBoxCategory.Items.Add(item);
            item.DataBind();
        }
        comboBoxCategory.SelectedValue = RadGrid1.MasterTableView.GetColumn("Category").CurrentFilterValue.ToString();

        //populate owned by teams combobox
        RadComboBox comboBoxOwnedByTeam = (RadComboBox)cmdItem.FindControl("rcbOwnedByTeam");

        DataSet ownedByTeams = sqlDataService.ExecuteDataset("GetChangeOwnedByTeams");

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

        //populate statuses combobox
        RadComboBox comboBoxStatus = (RadComboBox)cmdItem.FindControl("rcbStatus");

        DataSet statuses = sqlDataService.ExecuteDataset("GetChangeStatuses");

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
        RadGrid1.DataSource = sqlDataService.ExecuteDataset("GetChanges");
    }

    protected void SearchButton_OnClick(object sender, EventArgs e)
    {
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];

        RadTextBox rtbChangeID = (RadTextBox)cmdItem.FindControl("rtbChangeID");
        RadComboBox rcbService = (RadComboBox)cmdItem.FindControl("rcbService");
        RadComboBox rcbCategory = (RadComboBox)cmdItem.FindControl("rcbCategory");
        RadTextBox rtbSubcategory = (RadTextBox)cmdItem.FindControl("rtbSubcategory");
        RadTextBox rtbType = (RadTextBox)cmdItem.FindControl("rtbType");
        RadTextBox rtbTitle = (RadTextBox)cmdItem.FindControl("rtbTitle");
        RadComboBox rcbOwnedByTeam = (RadComboBox)cmdItem.FindControl("rcbOwnedByTeam");
        RadTextBox rtbOwnedBy = (RadTextBox)cmdItem.FindControl("rtbOwnedBy");
        RadTextBox rtbRequestedBy = (RadTextBox)cmdItem.FindControl("rtbRequestedBy");
        RadComboBox rcbStatus = (RadComboBox)cmdItem.FindControl("rcbStatus");
        RadTextBox rtbApprovedBy = (RadTextBox)cmdItem.FindControl("rtbApprovedBy");

        string changeIDFilterText = rtbChangeID.Text;
        string serviceFilterText = rcbService.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbService.Text;
        string categoryFilterText = rcbCategory.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbCategory.Text;
        string subcategoryFilterText = rtbSubcategory.Text;
        string typeFilterText = rtbType.Text;
        string titleFilterText = rtbTitle.Text;
        string ownedByTeamFilterText = rcbOwnedByTeam.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbOwnedByTeam.Text;
        string ownedByFilterText = rtbOwnedBy.Text;
        string requestedByFilterText = rtbRequestedBy.Text;
        string statusFilterText = rcbStatus.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbStatus.Text;
        string approvedByFilterText = rtbApprovedBy.Text;


        List<string> values = new List<string>
        {
            changeIDFilterText,
            serviceFilterText,
            categoryFilterText,
            subcategoryFilterText,
            typeFilterText,
            titleFilterText,
            ownedByFilterText,
            ownedByTeamFilterText,
            requestedByFilterText,
            statusFilterText,
            approvedByFilterText
        };

        RadGrid1.DataSource = sqlDataService.ExecuteDataset("SearchChanges", Constants.ChangesSearchParameterNames, values,
            Constants.ChangesSearchParameterTypes);
        RadGrid1.DataBind();
    }

}
