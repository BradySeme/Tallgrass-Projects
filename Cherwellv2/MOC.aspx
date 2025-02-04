<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MOC.aspx.cs" Inherits="MOC" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowSorting="True"
                AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                AllowPaging="True" DataSourceID="DataSource1" OnItemUpdated="RadGrid1_ItemUpdated"
                AllowFilteringByColumn="True" OnItemDeleted="RadGrid1_ItemDeleted"
                OnItemInserted="RadGrid1_ItemInserted" OnDataBound="RadGrid1_DataBound" GridLines="Both" PageSize="50">
                <PagerStyle Mode="NextPrevAndNumeric" PageSizes="10;20;50;100" />
                <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false" />
                <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="RecID" DataSourceID="DataSource1" EditMode="EditForms" HorizontalAlign="NotSet" TableLayout="Fixed" Width="120%">
                    <CommandItemSettings ShowAddNewRecordButton="False" ShowRefreshButton="False" ShowExportToCsvButton="True" ShowExportToExcelButton="True" ShowExportToPdfButton="True" ShowExportToWordButton="True" />
                    <RowIndicatorColumn ShowNoSortIcon="False">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn ShowNoSortIcon="False">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="RecID" FilterControlAltText="Filter RecID column" HeaderText="RecID" ReadOnly="True" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="RecID" UniqueName="RecID" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ChangeID" FilterControlAltText="Filter ChangeID column" HeaderText="ChangeID" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="ChangeID" UniqueName="ChangeID" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="125px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Type" FilterControlAltText="Filter Type column" HeaderText="Type" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Type" UniqueName="Type" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="150px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Service" FilterControlAltText="Filter Service column" HeaderText="Service" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Service" UniqueName="Service" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="200px" />
                                <FilterTemplate >
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle1" DataSourceID="DataSource2" DataTextField="Service" 
                                    DataValueField="Service" Width="150px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Service").CurrentFilterValue %>'
                                    runat="server" OnClientSelectedIndexChanged="ServIndexChanged">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                    </telerik:RadComboBox>
                                    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                    <script type="text/javascript">
                                        function ServIndexChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("Service", args.get_item().get_value(), "EqualTo");
                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Pipeline" FilterControlAltText="Filter Pipeline column" HeaderText="Pipeline" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Pipeline" UniqueName="Pipeline" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="150px" />
                            <FilterTemplate >
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle2" DataSourceID="DataSource3" DataTextField="Pipeline" 
                                    DataValueField="Pipeline" Width="120px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Pipeline").CurrentFilterValue %>'
                                    runat="server" OnClientSelectedIndexChanged="PipeIndexChanged">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                    </telerik:RadComboBox>
                                    <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
                                    <script type="text/javascript">
                                        function PipeIndexChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("Pipeline", args.get_item().get_value(), "EqualTo");
                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ProposedStartDate" DataType="System.DateTime" FilterControlAltText="Filter ProposedStartDate column" HeaderText="ProposedStartDate" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="ProposedStartDate" UniqueName="ProposedStartDate" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ScheduledEndDate" DataType="System.DateTime" FilterControlAltText="Filter ScheduledEndDate column" HeaderText="ScheduledEndDate" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="ScheduledEndDate" UniqueName="ScheduledEndDate" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Title" UniqueName="Title" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RequestedBy" FilterControlAltText="Filter RequestedBy column" HeaderText="RequestedBy" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="RequestedBy" UniqueName="RequestedBy" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Status" UniqueName="Status" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="170px" />
                            <FilterTemplate >
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle4" DataSourceID="DataSource5" DataTextField="Status" 
                                    DataValueField="Status" Width="140px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Status").CurrentFilterValue %>'
                                    runat="server" OnClientSelectedIndexChanged="StatusIndexChanged">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                    </telerik:RadComboBox>
                                    <telerik:RadScriptBlock ID="RadScriptBlock4" runat="server">
                                    <script type="text/javascript">
                                        function StatusIndexChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("Status", args.get_item().get_value(), "EqualTo");
                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OwnedBy" FilterControlAltText="Filter OwnedBy column" HeaderText="OwnedBy" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="OwnedBy" UniqueName="OwnedBy" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="150px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OwnedByTeam" FilterControlAltText="Filter OwnedByTeam column" HeaderText="OwnedByTeam" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="OwnedByTeam" UniqueName="OwnedByTeam" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <FilterTemplate >
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle3" DataSourceID="DataSource4" DataTextField="OwnedByTeam" 
                                    DataValueField="OwnedByTeam" Width="150px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("OwnedByTeam").CurrentFilterValue %>'
                                    runat="server" OnClientSelectedIndexChanged="OBTIndexChanged">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                    </telerik:RadComboBox>
                                    <telerik:RadScriptBlock ID="RadScriptBlock3" runat="server">
                                    <script type="text/javascript">
                                        function OBTIndexChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("OwnedByTeam", args.get_item().get_value(), "EqualTo");
                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter Description column" HeaderText="Description" ShowNoSortIcon="False" SortExpression="Description" UniqueName="Description" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" >
                            <HeaderStyle Width="400px" />
                            <ItemStyle CssClass="wordEllipsis"  />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="Attachments" HeaderText="Attachments" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="125px" FilterControlWidth="98px">
                            <ItemTemplate>
                                <asp:HyperLink ID="AttachButton" runat="server" NavigateUrl='<%#"~/ViewAttachmentFolder/MOCVA.aspx?RecID=" + Eval("RecID") %>' Text="Attachments" Target="_blank">
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
        <asp:SqlDataSource SelectCommand="SELECT RecID, ChangeID, Type, Service, Pipeline, ProposedStartDate, ScheduledEndDate, Title, RequestedBy, Status, OwnedBy, OwnedByTeam, Description FROM ChangeRequest" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource1" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [Service] FROM [ChangeRequest] WHERE Service != ''" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource2" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [Pipeline] FROM [ChangeRequest] WHERE Pipeline != '' AND Pipeline != 'All'" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource3" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [OwnedByTeam] FROM [ChangeRequest] WHERE OwnedByTeam != ''" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource4" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [Status] FROM [ChangeRequest] WHERE Status != ''" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource5" runat="server"></asp:SqlDataSource>

</asp:Content>