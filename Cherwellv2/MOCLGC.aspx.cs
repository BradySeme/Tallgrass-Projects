using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.UI;
using Telerik.Web.UI;

public partial class MOCLGC : System.Web.UI.Page
{
    private string gridMessage = null;
    SqlDataService sqlDataService = new SqlDataService(ConfigurationManager.ConnectionStrings["MOCLGCConnectionString"].ConnectionString);

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];

        //populate MOC Types combobox
        RadComboBox comboBoxMOCType = (RadComboBox)cmdItem.FindControl("rcbMOCType");

        DataSet mocTypes = sqlDataService.ExecuteDataset("GetMOCLGCMOCTypes");

        foreach (DataRow row in mocTypes.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string mocTypeString = row["MOCType"].ToString();
            item.Text = mocTypeString;
            item.Value = mocTypeString;
            comboBoxMOCType.Items.Add(item);
            item.DataBind();
        }
        comboBoxMOCType.SelectedValue = RadGrid1.MasterTableView.GetColumn("MOCType").CurrentFilterValue.ToString();

        // populate Statuses combobox
        RadComboBox comboBoxStatus = (RadComboBox)cmdItem.FindControl("rcbMOCStatus");

        DataSet statuses = sqlDataService.ExecuteDataset("GetMOCLGCStatuses");

        foreach (DataRow row in statuses.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string statusString = row["MOCStatus"].ToString();
            item.Text = statusString;
            item.Value = statusString;
            comboBoxStatus.Items.Add(item);
            item.DataBind();
        }
        comboBoxStatus.SelectedValue = RadGrid1.MasterTableView.GetColumn("MOCStatus").CurrentFilterValue.ToString();

        // populate MOC Priority combobox
        RadComboBox comboBoxMOCPriority = (RadComboBox)cmdItem.FindControl("rcbMOCPriority");

        DataSet mocPriorities = sqlDataService.ExecuteDataset("GetMOCLGCMOCPriorities");

        foreach (DataRow row in mocPriorities.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string mocPriorityString = row["MOCPriority"].ToString();
            item.Text = mocPriorityString;
            item.Value = mocPriorityString;
            comboBoxMOCPriority.Items.Add(item);
            item.DataBind();
        }
        comboBoxMOCPriority.SelectedValue = RadGrid1.MasterTableView.GetColumn("MOCPriority").CurrentFilterValue.ToString();

        // populate MOC Year combobox
        RadComboBox comboBoxMOCYear = (RadComboBox)cmdItem.FindControl("rcbMOCYear");

        DataSet mocYears = sqlDataService.ExecuteDataset("GetMOCLGCMOCYears");

        foreach (DataRow row in mocYears.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string mocYearString = row["MOCYear"].ToString();
            item.Text = mocYearString;
            item.Value = mocYearString;
            comboBoxMOCYear.Items.Add(item);
            item.DataBind();
        }
        comboBoxMOCYear.SelectedValue = RadGrid1.MasterTableView.GetColumn("MOCYear").CurrentFilterValue.ToString();

        // populate MOC Change Type combobox
        RadComboBox comboBoxMOCChangeType = (RadComboBox)cmdItem.FindControl("rcbMOCChangeType");

        DataSet mocChangeTypes = sqlDataService.ExecuteDataset("GetMOCLGCMOCChangeTypes");

        foreach (DataRow row in mocChangeTypes.Tables[0].Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();
            string mocChangeTypeString = row["MOCChangeType"].ToString();
            item.Text = mocChangeTypeString;
            item.Value = mocChangeTypeString;
            comboBoxMOCChangeType.Items.Add(item);
            item.DataBind();
        }
        comboBoxMOCChangeType.SelectedValue = RadGrid1.MasterTableView.GetColumn("MOCChangeType").CurrentFilterValue.ToString();
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
        RadGrid1.DataSource = sqlDataService.ExecuteDataset("GetMOCLGCMOCs");
    }

    protected void SearchButton_OnClick(object sender, EventArgs e)
    {
        GridCommandItem cmdItem = (GridCommandItem)RadGrid1.MasterTableView.GetItems(GridItemType.CommandItem)[0];

        RadTextBox rtbMOCID = (RadTextBox)cmdItem.FindControl("rtbMOCID");
        RadComboBox rcbMOCType = (RadComboBox)cmdItem.FindControl("rcbMOCType");
        RadTextBox rtbRequestorLastName = (RadTextBox)cmdItem.FindControl("rtbRequestorLastName");
        RadTextBox rtbRequestorFirstName = (RadTextBox)cmdItem.FindControl("rtbRequestorFirstName");
        RadTextBox rtbMOCDateCreated = (RadTextBox)cmdItem.FindControl("rtbMOCDateCreated");
        RadTextBox rtbMOCEstStartDate = (RadTextBox)cmdItem.FindControl("rtbMOCEstStartDate");
        RadTextBox rtbMOCSummary = (RadTextBox)cmdItem.FindControl("rtbMOCSummary");
        RadTextBox rtbMOCDescription = (RadTextBox)cmdItem.FindControl("rtbMOCDescription");
        RadTextBox rtbCoordinatorLastName = (RadTextBox)cmdItem.FindControl("rtbCoordinatorLastName");
        RadTextBox rtbCoordinatorFirstName = (RadTextBox)cmdItem.FindControl("rtbCoordinatorFirstName");
        RadComboBox rcbMOCPriority = (RadComboBox)cmdItem.FindControl("rcbMOCPriority");
        RadTextBox rtbMOCLastUpdate = (RadTextBox)cmdItem.FindControl("rtbMOCLastUpdate");
        RadComboBox rcbMOCChangeType = (RadComboBox)cmdItem.FindControl("rcbMOCChangeType");
        RadComboBox rcbMOCYear = (RadComboBox)cmdItem.FindControl("rcbMOCYear");
        RadTextBox rtbMOCWorkOrder = (RadTextBox)cmdItem.FindControl("rtbMOCWorkOrder");
        RadTextBox rtbMOCChangeReason = (RadTextBox)cmdItem.FindControl("rtbMOCChangeReason");
        RadTextBox rtbMOCPropsExplain = (RadTextBox)cmdItem.FindControl("rtbMOCPropsExplain");
        RadTextBox rtbMOCPAndIDocs = (RadTextBox)cmdItem.FindControl("rtbMOCPAndIDocs");
        RadTextBox rtbMOCProjCode = (RadTextBox)cmdItem.FindControl("rtbMOCProjCode");
        RadTextBox rtbLocation = (RadTextBox)cmdItem.FindControl("rtbLocation");
        RadComboBox rcbMOCStatus = (RadComboBox)cmdItem.FindControl("rcbMOCStatus");
        RadTextBox rtbApprovedBy = (RadTextBox)cmdItem.FindControl("rtbApprovedBy");
        RadTextBox rtbMOCEstInServiceDate = (RadTextBox)cmdItem.FindControl("rtbMOCEstInServiceDate");
        RadTextBox rtbMOCCompletionDate = (RadTextBox)cmdItem.FindControl("rtbMOCCompletionDate");
        RadTextBox rtbMOCTerminationDate = (RadTextBox)cmdItem.FindControl("rtbMOCTerminationDate");

        string MOCIDFilterText = rtbMOCID.Text;
        string MOCTypeFilterText = rcbMOCType.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbMOCType.Text;
        string requestorLastNameFilterText = rtbRequestorLastName.Text;
        string requestorFirstNameFilterText = rtbRequestorFirstName.Text;
        string MOCDateCreatedFilterText = rtbMOCDateCreated.Text;
        string MOCEstStartDateFilterText = rtbMOCEstStartDate.Text;
        string MOCSummaryFilterText = rtbMOCSummary.Text;
        string MOCDescriptionFilterText = rtbMOCDescription.Text;
        string coordinatorLastNameFilterText = rtbCoordinatorLastName.Text;
        string coordinatorFirstNameFilterText = rtbCoordinatorFirstName.Text;
        string MOCPriorityFilterText = rcbMOCPriority.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbMOCPriority.Text;
        string MOCLastUpdateFilterText = rtbMOCLastUpdate.Text;
        string MOCChangeTypeFilterText = rcbMOCChangeType.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbMOCChangeType.Text;
        string MOCYearFilterText = rcbMOCYear.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbMOCYear.Text;
        string MOCWorkOrderFilterText = rtbMOCWorkOrder.Text;
        string MOCChangeReasonFilterText = rtbMOCChangeReason.Text;
        string MOCPropsExplainFilterText = rtbMOCPropsExplain.Text;
        string MOCPAndIDocsFilterText = rtbMOCPAndIDocs.Text;
        string MOCProjCodeFilterText = rtbMOCProjCode.Text;
        string locationFilterText = rtbLocation.Text;
        string MOCStatusFilterText = rcbMOCStatus.Text == Constants.ComboBoxAllText ? Constants.EmptyString : rcbMOCStatus.Text;
        string approvedByFilterText = rtbApprovedBy.Text;
        string MOCEstInServiceDateFilterText = rtbMOCEstInServiceDate.Text;
        string MOCCompletionDateFilterText = rtbMOCCompletionDate.Text;
        string MOCTerminationDateFilterText = rtbMOCTerminationDate.Text;

        List<string> values = new List<string>
        {
            MOCIDFilterText,
            MOCTypeFilterText,
            requestorLastNameFilterText,
            requestorFirstNameFilterText,
            MOCDateCreatedFilterText,
            MOCEstStartDateFilterText,
            MOCSummaryFilterText,
            MOCDescriptionFilterText,
            coordinatorLastNameFilterText,
            coordinatorFirstNameFilterText,
            MOCPriorityFilterText,
            MOCLastUpdateFilterText,
            MOCChangeTypeFilterText,
            MOCYearFilterText,
            MOCWorkOrderFilterText,
            MOCChangeReasonFilterText,
            MOCPropsExplainFilterText,
            MOCPAndIDocsFilterText,
            MOCProjCodeFilterText,
            locationFilterText,
            MOCStatusFilterText,
            approvedByFilterText,
            MOCEstInServiceDateFilterText,
            MOCCompletionDateFilterText,
            MOCTerminationDateFilterText
        }; 

        RadGrid1.DataSource = sqlDataService.ExecuteDataset("SearchMOCLGCs", Constants.MOCsSearchParameterNames, values,
            Constants.MOCsSearchParameterTypes);
        RadGrid1.DataBind();
    }
}
