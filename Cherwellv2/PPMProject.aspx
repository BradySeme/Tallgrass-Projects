<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PPMProject.aspx.cs" Inherits="PPMProject" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <style type="text/css">
        .riLabel {
            width: 210px !important;
            text-align: right !important;
        }

        .RadComboBox .rcbLabel {
            width: 200px !important;
            text-align: right !important;
            padding-right: 10px !important;
        }

        .RadComboBox_Bootstrap {
            width: 410px !important;
        }

            .RadComboBox_Bootstrap .rcbReadOnly {
                width: 164px !important;
            }

        .buttonDiv {
            width: 288px !important;
            display: flex;
            justify-content: right;
        }
    </style>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Width="16px">
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowSorting="True"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
            OnDataBound="RadGrid1_DataBound" PageSize="50" OnNeedDataSource="RadGrid1_NeedDataSource">
            <PagerStyle Mode="NextPrevAndNumeric" PageSizes="10;20;50;100" />
            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false" />
            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="RecID" EditMode="InPlace" HorizontalAlign="NotSet" GridLines="Both" TableLayout="Fixed" Width="100%">
                <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToCsvButton="True" ShowExportToExcelButton="True" ShowExportToWordButton="True" ShowRefreshButton="False" />
                <RowIndicatorColumn ShowNoSortIcon="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn ShowNoSortIcon="False">
                </ExpandCollapseColumn>
                <CommandItemTemplate>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbPPMProjectID" runat="server" Label="PPM Project ID: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbName" runat="server" Label="Name: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbArea" runat="server" Label="Area: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbPortfolioName" runat="server" Label="Portfolio Name: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox ToolTip="Format: YYYY-MM-DD" RenderMode="Lightweight" Width="400px" ID="rtbCreatedDateTime" runat="server" Label="Created Date Time: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbOwnedByTeam" Width="400px" AppendDataBoundItems="true" Label="Owned By Team:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbOwnedBy" runat="server" Label="Owned By: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbOneLineProjectSummary" runat="server" Label="One Line Project Summary: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbDescription" runat="server" Label="Description: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbLocation" runat="server" Label="Location: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbBudgetHealth" runat="server" Label="Budget Health: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbScopeHealth" runat="server" Label="Scope Health: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbScheduleHealth" runat="server" Label="Schedule Health: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbStatus" Width="400px" AppendDataBoundItems="true" Label="Status:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <div style="width: 100%; overflow: hidden; padding-top: 4px">
                        <div class="buttonDiv" style="width: 600px; float: left;">
                            <telerik:RadButton RenderMode="Lightweight" Primary="true" ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_OnClick" />
                        </div>
                        <div style="float: right;">
                            <telerik:RadButton ID="RadButton1" Text="Export to CSV" runat="server" CommandName="ExportToCsv" />
                            <telerik:RadButton ID="RadButton2" Text="Export to Excel" runat="server" CommandName="ExportToExcel" />
                            <telerik:RadButton ID="RadButton3" Text="Export to Word" runat="server" CommandName="ExportToWord" />
                        </div>
                    </div>
                </CommandItemTemplate>
                <Columns>
                    <telerik:GridBoundColumn DataField="RecID" HeaderText="RecID" ReadOnly="True" ShowNoSortIcon="False" SortExpression="RecID" UniqueName="RecID" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PPMProjectID" HeaderText="PPMProjectID" ShowNoSortIcon="False" SortExpression="PPMProjectID" UniqueName="PPMProjectID">
                        <HeaderStyle Width="155px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Name" HeaderText="Name" ShowNoSortIcon="False" SortExpression="Name" UniqueName="Name">
                        <HeaderStyle Width="210px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Area" HeaderText="Area" ShowNoSortIcon="False" SortExpression="Area" UniqueName="Area">
                        <HeaderStyle Width="155px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PortfolioName" HeaderText="PortfolioName" ShowNoSortIcon="False" SortExpression="PortfolioName" UniqueName="PortfolioName">
                        <HeaderStyle Width="155px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CreatedDateTime" DataType="System.DateTime" HeaderText="CreatedDateTime" ShowNoSortIcon="False" SortExpression="CreatedDateTime" UniqueName="CreatedDateTime">
                        <HeaderStyle Width="155px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OwnedByTeam" HeaderText="OwnedByTeam" ShowNoSortIcon="False" SortExpression="OwnedByTeam" UniqueName="OwnedByTeam">
                        <HeaderStyle Width="155px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OwnedBy" HeaderText="OwnedBy" ShowNoSortIcon="False" SortExpression="OwnedBy" UniqueName="OwnedBy">
                        <HeaderStyle Width="155px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OneLineProjectSummary" HeaderText="OneLineProjectSummary" ShowNoSortIcon="False" SortExpression="OneLineProjectSummary" UniqueName="OneLineProjectSummary">
                        <HeaderStyle Width="300px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="400px" DataField="Description" HeaderText="Description" ShowNoSortIcon="False" SortExpression="Description" UniqueName="Description">
                        <HeaderStyle Width="400px" />
                        <ItemStyle />
                        <ItemTemplate>
                            <asp:Label Style="display: inline-block; width: 370px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis" Width="400px" ID="lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'></asp:Label>
                            <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip1" runat="server" TargetControlID="lbl" RelativeTo="Element"
                                Position="BottomCenter" RenderInPageRoot="true" Width="800px" ContentScrolling="Auto" Height="75px" HideEvent="LeaveToolTip">
                                <%# DataBinder.Eval(Container, "DataItem.Description")%>
                            </telerik:RadToolTip>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="Location" HeaderText="Location" ShowNoSortIcon="False" SortExpression="Location" UniqueName="Location">
                        <HeaderStyle Width="155px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BudgetHealth" HeaderText="BudgetHealth" ShowNoSortIcon="False" SortExpression="BudgetHealth" UniqueName="BudgetHealth">
                        <HeaderStyle Width="155px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ScopeHealth" HeaderText="ScopeHealth" ShowNoSortIcon="False" SortExpression="ScopeHealth" UniqueName="ScopeHealth">
                        <HeaderStyle Width="155px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ScheduleHealth" HeaderText="ScheduleHealth" ShowNoSortIcon="False" SortExpression="ScheduleHealth" UniqueName="ScheduleHealth">
                        <HeaderStyle Width="155px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" HeaderText="Status" ShowNoSortIcon="False" SortExpression="Status" UniqueName="Status">
                        <HeaderStyle Width="130px" />
                    </telerik:GridBoundColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn ShowNoSortIcon="False">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
    </telerik:RadAjaxPanel>
</asp:Content>
