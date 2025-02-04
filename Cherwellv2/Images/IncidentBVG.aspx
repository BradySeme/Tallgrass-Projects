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
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" HorizontalAlign="NotSet">

            <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowSorting="True"
                AllowAutomaticInserts="True" DataSourceID="DataSource1" AllowAutomaticUpdates="True"
                AllowPaging="True" OnItemUpdated="RadGrid1_ItemUpdated" AllowFilteringByColumn="True" CellSpacing="-1" GridLines="Both">
                <PagerStyle Mode="NumericPages" />
                <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false" />
                <ExportSettings ExportOnlyData="True">
                </ExportSettings>
                <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="RecID" EditMode="InPlace" HorizontalAlign="NotSet" TableLayout="Fixed" Width="100%" ShowHeadersWhenNoRecords="True" EnableNoRecordsTemplate="True">
                    <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToCsvButton="True" ShowExportToExcelButton="True" ShowExportToWordButton="True" ShowRefreshButton="False" />
                    <RowIndicatorColumn ShowNoSortIcon="False">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn ShowNoSortIcon="False">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="RecID" FilterControlAltText="Filter RecID column" HeaderText="RecID" ShowNoSortIcon="False" SortExpression="RecID" UniqueName="RecID" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IncidentID" FilterControlAltText="Filter IncidentID column" HeaderText="IncidentID" ShowNoSortIcon="False" SortExpression="IncidentID" UniqueName="IncidentID" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" FilterControlWidth="80px">
                            <HeaderStyle Width="105px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Service" FilterControlAltText="Filter Service column" HeaderText="Service" ShowNoSortIcon="False" SortExpression="Service" UniqueName="Service" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="145px" />
                                <FilterTemplate >
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle3" DataSourceID="DataSource4" DataTextField="Service" 
                                    DataValueField="Service" Width="120px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Service").CurrentFilterValue %>'
                                    runat="server" OnClientSelectedIndexChanged="ServIndexChanged" OnSelectedIndexChanged="RadComboBoxTitle3_OnSelectedIndexChanged">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                    </telerik:RadComboBox>
                                    <telerik:RadScriptBlock ID="RadScriptBlock3" runat="server">
                                    <script type="text/javascript">
                                        function ServIndexChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("Service", args.get_item().get_value(), "EqualTo");
                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="IncidentType" DataField="IncidentType" HeaderText="IncidentType"
                            HeaderStyle-Width="130px">
                            <FilterTemplate >
                                <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle" DataSourceID="DataSource2" DataTextField="IncidentType" 
                                DataValueField="IncidentType" Width="105px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("IncidentType").CurrentFilterValue %>'
                                runat="server" OnClientSelectedIndexChanged="ITIndexChanged">
                                <Items>
                                    <telerik:RadComboBoxItem Text="All" />
                                </Items>
                            </telerik:RadComboBox>
                                <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
                                <script type="text/javascript">
                                    function ITIndexChanged(sender, args) {
                                        var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                    tableView.filter("IncidentType", args.get_item().get_value(), "EqualTo");
                                    }
                                </script>
                            </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OwnedBy" FilterControlAltText="Filter OwnedBy column" HeaderText="OwnedBy" ShowNoSortIcon="False" SortExpression="OwnedBy" UniqueName="OwnedBy" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" FilterControlWidth="110px">
                            <HeaderStyle Width="135px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="OwnedByTeam" DataField="OwnedByTeam" HeaderText="OwnedByTeam"
                            HeaderStyle-Width="145px">
                            <FilterTemplate>
                                <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle1" DataSourceID="DataSource3" DataTextField="OwnedByTeam"
                                DataValueField="OwnedByTeam" Width="120px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("OwnedByTeam").CurrentFilterValue %>'
                                runat="server" OnClientSelectedIndexChanged="OBTIndexChanged" on>
                                <Items>
                                    <telerik:RadComboBoxItem Text="All" />
                                </Items>
                            </telerik:RadComboBox>
                                <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                <script type="text/javascript">
                                    function OBTIndexChanged(sender, args) {
                                        var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                    tableView.filter("OwnedByTeam", args.get_item().get_value(), "EqualTo");
                                    }
                                </script>
                            </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CustomerDisplayName" FilterControlAltText="Filter CustomerDisplayName column" HeaderText="Customer Name" ShowNoSortIcon="False" SortExpression="CustomerDisplayName" UniqueName="CustomerDisplayName" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" FilterControlWidth="120px">
                            <HeaderStyle Width="150px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CreatedBy" FilterControlAltText="Filter CreatedBy column" HeaderText="CreatedBy" ShowNoSortIcon="False" SortExpression="CreatedBy" UniqueName="CreatedBy" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" FilterControlWidth="120px">
                            <HeaderStyle Width="150px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CreatedDateTime" DataType="System.DateTime" FilterControlAltText="Filter CreatedDateTime column" HeaderText="CreatedDateTime" ShowNoSortIcon="False" SortExpression="CreatedDateTime" UniqueName="CreatedDateTime" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" FilterControlWidth="120px">
                            <HeaderStyle Width="150px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ClosedDateTime" DataType="System.DateTime" FilterControlAltText="Filter ClosedDateTime column" HeaderText="ClosedDateTime" ShowNoSortIcon="False" SortExpression="ClosedDateTime" UniqueName="ClosedDateTime" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" FilterControlWidth="120px">
                            <HeaderStyle Width="150px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" ShowNoSortIcon="False" SortExpression="Status" UniqueName="Status" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" FilterControlWidth="75px">
                            <HeaderStyle Width="130px" />
                            <FilterTemplate>
                                <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle4" DataSourceID="DataSource5" DataTextField="Status"
                                DataValueField="Status" Width="100px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Status").CurrentFilterValue %>'
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
                        <telerik:GridBoundColumn DataField="Details" FilterControlAltText="Filter Details column" HeaderText="Details" ShowNoSortIcon="False" SortExpression="Details" UniqueName="Details" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="400px" />
                            <ItemStyle CssClass="wordEllipsis"  />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter Description column" HeaderText="Description" ShowNoSortIcon="False" SortExpression="Description" UniqueName="Description" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="400px" />
                            <ItemStyle CssClass="wordEllipsis"  />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="Attachments" HeaderText="Attachments" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="125px" FilterControlWidth="98px">
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
        <asp:SqlDataSource SelectCommand="SELECT Incident.RecID, Incident.IncidentType, Incident.Service, Incident.Priority, Incident.OwnedBy, Incident.OwnedByTeam, Incident.IncidentID, Incident.CustomerDisplayName, Incident.CreatedBy, Incident.CreatedDateTime, Incident.ClosedDateTime, Incident.Status, STUFF((SELECT ', ' + Details FROM Journal WHERE Journal.ParentRecID=Incident.RecID FOR XML PATH('')), 1, 2, '') AS Details, Incident.Description, Incident.SLAResolveByDeadline FROM Incident INNER JOIN Journal ON Incident.RecID=Journal.ParentRecID" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource1" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [IncidentType] FROM [Incident] WHERE IncidentType != ''" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource2" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [OwnedByTeam] FROM [Incident] WHERE OwnedByTeam != ''" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource3" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [Service] FROM [Incident] WHERE Service != ''" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource4" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [Status] FROM [Incident] WHERE Status != ''" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource5" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT Incident.RecID, Incident.IncidentType, Incident.Service, Incident.Priority, Incident.OwnedBy, Incident.OwnedByTeam, Incident.IncidentID, Incident.CustomerDisplayName, Incident.CreatedBy, Incident.CreatedDateTime, Incident.ClosedDateTime, Incident.Status, STUFF((SELECT ', ' + Details FROM Journal WHERE Journal.ParentRecID=Incident.RecID FOR XML PATH('')), 1, 2, '') AS Details, Incident.Description, Incident.SLAResolveByDeadline FROM Incident INNER JOIN Journal ON Incident.RecID=Journal.ParentRecID ORDER BY Incident.RecID OFFSET 0 ROWS FETCH NEXT 50 ROWS ONLY;" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSourceLoad" runat="server"></asp:SqlDataSource>

</asp:Content>