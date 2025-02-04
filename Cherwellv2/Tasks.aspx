<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tasks.aspx.cs" Inherits="Tasks" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server" EnableScriptCombine="False">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1" RenderMode="Inline">
        <telerik:RadGrid OnNeedDataSource="RadGrid1_NeedDataSource" ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowSorting="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
            AllowPaging="True" OnDataBound="RadGrid1_DataBound" GridLines="Both" PageSize="50" Width="110%">
            <PagerStyle Mode="NextPrevAndNumeric" PageSizes="10;20;50;100" />
            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false" />
            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="RecID" EditMode="EditForms" HorizontalAlign="NotSet" Width="100%" TableLayout="Fixed">
                <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToCsvButton="True" ShowExportToExcelButton="True" ShowExportToWordButton="True" ShowRefreshButton="False" />
                <RowIndicatorColumn ShowNoSortIcon="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn ShowNoSortIcon="False">
                </ExpandCollapseColumn>
                <CommandItemTemplate>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbTaskID" runat="server" Label="Task ID: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbParentPublicID" runat="server" Label="Parent Public ID: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbService" Width="300px" AppendDataBoundItems="true" Label="Service:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbTitle" runat="server" Label="Title: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbOwnedByTeam" Width="340px" AppendDataBoundItems="true" Label="Owned By Team:"
                        runat="server">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbOwnedBy" runat="server" Label="Owned By: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbLocation" runat="server" Label="Location: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbCloseCode" Width="340px" AppendDataBoundItems="true" Label="Close Code:"
                        runat="server">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbCompletionDetails" runat="server" Label="Completion Details: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox ToolTip="Format: YYYY-MM-DD" RenderMode="Lightweight" Width="300px" ID="rtbClosedDateTime" runat="server" Label="Closed Date Time: " InvalidStyleDuration="100" />
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
                    <telerik:GridBoundColumn DataField="TaskID" HeaderText="TaskID" ShowNoSortIcon="False" SortExpression="TaskID" UniqueName="TaskID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ParentPublicID" HeaderText="ParentPublicID" ShowNoSortIcon="False" SortExpression="ParentPublicID" UniqueName="ParentPublicID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Service" HeaderText="Service" ShowNoSortIcon="False" SortExpression="Service" UniqueName="Service">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Title" HeaderText="Title" ShowNoSortIcon="False" SortExpression="Title" UniqueName="Title">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OwnedByTeam" HeaderText="OwnedByTeam" ShowNoSortIcon="False" SortExpression="OwnedByTeam" UniqueName="OwnedByTeam">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OwnedBy" HeaderText="OwnedBy" ShowNoSortIcon="False" SortExpression="OwnedBy" UniqueName="OwnedBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TaskLocation" HeaderText="Location" ShowNoSortIcon="False" SortExpression="TaskLocation" UniqueName="TaskLocation">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CloseCode" HeaderText="CloseCode" ShowNoSortIcon="False" SortExpression="CloseCode" UniqueName="CloseCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CompletionDetails" HeaderText="CompletionDetails" ShowNoSortIcon="False" SortExpression="CompletionDetails" UniqueName="CompletionDetails">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ClosedDateTime" HeaderText="ClosedDateTime" ShowNoSortIcon="False" SortExpression="ClosedDateTime" UniqueName="ClosedDateTime">
                    </telerik:GridBoundColumn>
                </Columns>
                <EditFormSettings>
                    <FormTableItemStyle Wrap="False" />
                    <FormCaptionStyle CssClass="EditFormHeader" />
                    <FormMainTableStyle BackColor="White" CellPadding="3" CellSpacing="0" GridLines="None" Width="100%" />
                    <FormTableStyle BackColor="White" CellPadding="2" CellSpacing="0" Height="110px" />
                    <FormTableAlternatingItemStyle Wrap="False" />
                    <EditColumn ButtonType="ImageButton" CancelText="Cancel edit" UniqueName="EditCommandColumn1">
                    </EditColumn>
                    <FormTableButtonRowStyle CssClass="EditFormButtonRow" HorizontalAlign="Right" />
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
    </telerik:RadAjaxPanel>
</asp:Content>
