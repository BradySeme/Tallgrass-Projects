<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Incident.aspx.cs" Inherits="Incident" MasterPageFile="~/MasterPage.Master" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <script>
        function Configure(sender, args) {
            sender._popupBehavior.set_keepInScreenBounds(false);
        }
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxPanel1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadAjaxPanel1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxLoadingPanel1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" HorizontalAlign="NotSet">

        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowSorting="True"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Width="100%" AllowPaging="True" CellSpacing="-1"
            GridLines="Both" OnNeedDataSource="RadGrid1_NeedDataSource" OnDetailTableDataBind="RadGrid1_DetailTableDataBind">
            <PagerStyle Mode="NumericPages" />
            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false" />
            <ExportSettings ExportOnlyData="True">
            </ExportSettings>
            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="RecID" EditMode="InPlace" HorizontalAlign="NotSet" TableLayout="Fixed" Width="100%" ShowHeadersWhenNoRecords="True" EnableNoRecordsTemplate="True">
                <DetailTables>
                    <telerik:GridTableView AllowPaging="True" AutoGenerateColumns="False" Width="100%" ShowHeadersWhenNoRecords="True" EnableNoRecordsTemplate="True">
                        <Columns>
                            <telerik:GridBoundColumn SortExpression="Details" HeaderText="Details" HeaderButtonType="TextButton"
                                DataField="Details">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToCsvButton="True" ShowExportToExcelButton="True" ShowExportToWordButton="True" ShowRefreshButton="False" />
                <RowIndicatorColumn ShowNoSortIcon="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn ShowNoSortIcon="False">
                </ExpandCollapseColumn>
                <CommandItemTemplate>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbIncidentID" runat="server" Label="Incident ID: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbIncidentType" Width="340px" AppendDataBoundItems="true" Label="Incident Type:" runat="server">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbService" Width="300px" AppendDataBoundItems="true" Label="Service:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbCreatedBy" runat="server" Label="Created By: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox ToolTip="Format: YYYY-MM-DD" RenderMode="Lightweight" Width="300px" ID="rtbCreatedDateTime" runat="server" Label="Created Date Time: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbOwnedByTeam" Width="340px" AppendDataBoundItems="true" Label="Owned By Team:"
                        runat="server">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbOwnedBy" runat="server" Label="Owned By: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbCustomerName" runat="server" Label="Customer Name: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbDescription" runat="server" Label="Description: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbLocation" runat="server" Label="Location: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbStatus" Width="340px" AppendDataBoundItems="true" Label="Status:"
                        runat="server">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbApprover" runat="server" Label="Approved By: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox ToolTip="Format: YYYY-MM-DD" RenderMode="Lightweight" Width="300px" ID="rtbClosedDateTime" runat="server" Label="Closed Date Time: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbDetails" runat="server" Label="Details: " InvalidStyleDuration="100" />
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
                    <telerik:GridBoundColumn DataField="RecID" HeaderText="RecID" ShowNoSortIcon="False" SortExpression="RecID" UniqueName="RecID" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IncidentID" HeaderText="IncidentID" ShowNoSortIcon="False" SortExpression="IncidentID" UniqueName="IncidentID">
                        <HeaderStyle Width="105px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="IncidentType" DataField="IncidentType" HeaderText="IncidentType"
                        HeaderStyle-Width="130px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Service" HeaderText="Service" ShowNoSortIcon="False" SortExpression="Service" UniqueName="Service">
                        <HeaderStyle Width="145px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CreatedBy" HeaderText="CreatedBy" ShowNoSortIcon="False" SortExpression="CreatedBy" UniqueName="CreatedBy">
                        <HeaderStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CreatedDateTime" DataType="System.DateTime" HeaderText="CreatedDateTime" ShowNoSortIcon="False" SortExpression="CreatedDateTime" UniqueName="CreatedDateTime">
                        <HeaderStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="OwnedByTeam" DataField="OwnedByTeam" HeaderText="OwnedByTeam"
                        HeaderStyle-Width="145px">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OwnedBy" HeaderText="OwnedBy" ShowNoSortIcon="False" SortExpression="OwnedBy" UniqueName="OwnedBy">
                        <HeaderStyle Width="135px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustomerDisplayName" HeaderText="Customer Name" ShowNoSortIcon="False" SortExpression="CustomerDisplayName" UniqueName="CustomerDisplayName">
                        <HeaderStyle Width="150px" />
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
                        <HeaderStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" HeaderText="Status" ShowNoSortIcon="False" SortExpression="Status" UniqueName="Status">
                        <HeaderStyle Width="130px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ApproverName" HeaderText="Approved By" ShowNoSortIcon="False" SortExpression="ApproverName" UniqueName="ApproverName">
                        <HeaderStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ClosedDateTime" DataType="System.DateTime" HeaderText="ClosedDateTime" ShowNoSortIcon="False" SortExpression="ClosedDateTime" UniqueName="ClosedDateTime">
                        <HeaderStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="Attachments" HeaderText="Attachments" HeaderStyle-Width="125px">
                        <ItemTemplate>
                            <asp:HyperLink ID="AttachButton" runat="server" NavigateUrl='<%#"~/ViewAttachmentFolder/IncidentVA.aspx?RecID=" + Eval("RecID") %>' Text="Attachments" Target="_blank">
                            </asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle Width="125px" />
                    </telerik:GridTemplateColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn ShowNoSortIcon="False">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>

    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Modal="true">

        <asp:Label ID="Label2" runat="server" ForeColor="Red">Loading... </asp:Label>

    </telerik:RadAjaxLoadingPanel>
</asp:Content>
