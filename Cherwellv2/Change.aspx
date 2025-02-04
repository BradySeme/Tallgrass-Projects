<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Change.aspx.cs" Inherits="Change" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowSorting="True"
                AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                AllowPaging="True" DataSourceID="DataSource1" OnDataBound="RadGrid1_DataBound" AllowFilteringByColumn="True" CellSpacing="-1" GridLines="Both" PageSize="50">
                <PagerStyle Mode="NextPrevAndNumeric" PageSizes="10;20;50;100" />
                <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false" />
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="RecID" DataSourceID="DataSource1" EditMode="InPlace" HorizontalAlign="NotSet" TableLayout="Fixed" Width="100%" CommandItemDisplay="Top">
                    <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToCsvButton="True" ShowExportToExcelButton="True" ShowExportToPdfButton="True" ShowExportToWordButton="True" ShowRefreshButton="False" />
                    <RowIndicatorColumn ShowNoSortIcon="False">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn ShowNoSortIcon="False">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="RecID" FilterControlAltText="Filter RecID column" HeaderText="RecID" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="RecID" UniqueName="RecID" ReadOnly="True" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ChangeID" FilterControlAltText="Filter ChangeID column" HeaderText="ChangeID" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="ChangeID" UniqueName="ChangeID" FilterControlWidth="100px" CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="130px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Type" FilterControlAltText="Filter Type column" HeaderText="Type" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Type" UniqueName="Type" FilterControlWidth="100px" CurrentFilterFunction="StartsWith" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="130px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Status" UniqueName="Status" FilterControlWidth="105px" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                            <HeaderStyle Width="135px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Title" UniqueName="Title" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OwnedBy" FilterControlAltText="Filter OwnedBy column" HeaderText="OwnedBy" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="OwnedBy" UniqueName="OwnedBy" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OwnedByTeam" FilterControlAltText="Filter OwnedByTeam column" HeaderText="OwnedByTeam" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="OwnedByTeam" UniqueName="OwnedByTeam" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                <FilterTemplate >
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle1" DataSourceID="DataSource2" DataTextField="OwnedByTeam" 
                                    DataValueField="OwnedByTeam" Width="150px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("OwnedByTeam").CurrentFilterValue %>'
                                    runat="server" OnClientSelectedIndexChanged="OBTIndexChanged">
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
                        <telerik:GridBoundColumn DataField="RequestedBy" FilterControlAltText="Filter RequestedBy column" HeaderText="RequestedBy" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="RequestedBy" UniqueName="RequestedBy" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Service" FilterControlAltText="Filter Service column" HeaderText="Service" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Service" UniqueName="Service" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                <FilterTemplate >
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle2" DataSourceID="DataSource3" DataTextField="Service" 
                                    DataValueField="Service" Width="150px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Service").CurrentFilterValue %>'
                                    runat="server" OnClientSelectedIndexChanged="ServIndexChanged">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                    </telerik:RadComboBox>
                                    <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
                                    <script type="text/javascript">
                                        function ServIndexChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("Service", args.get_item().get_value(), "EqualTo");
                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Category" FilterControlAltText="Filter Category column" HeaderText="Category" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Category" UniqueName="Category" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                                <FilterTemplate >
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle3" DataSourceID="DataSource4" DataTextField="Category" 
                                    DataValueField="Category" Width="150px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Category").CurrentFilterValue %>'
                                    runat="server" OnClientSelectedIndexChanged="CatIndexChanged">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                    </telerik:RadComboBox>
                                    <telerik:RadScriptBlock ID="RadScriptBlock3" runat="server">
                                    <script type="text/javascript">
                                        function CatIndexChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                        tableView.filter("Category", args.get_item().get_value(), "EqualTo");
                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Subcategory" FilterControlAltText="Filter Subcategory column" HeaderText="Subcategory" ShowNoSortIcon="False" ShowFilterIcon="false" SortExpression="Subcategory" UniqueName="Subcategory" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="Attachments" HeaderText="Attachments" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" HeaderStyle-Width="125px" FilterControlWidth="98px">
                            <ItemTemplate>
                                <asp:HyperLink ID="AttachButton" runat="server" NavigateUrl='<%#"~/ViewAttachmentFolder/ChangeVA.aspx?RecID=" + Eval("RecID") %>' Text="Attachments" Target="_blank">
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
        <asp:SqlDataSource SelectCommand="SELECT [RecID], [Type], [Status], [Title], [OwnedBy], [OwnedByTeam], [RequestedBy], [Service], [Category], [Subcategory], [ChangeID] FROM [Change]" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ID="DataSource1" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [OwnedByTeam] FROM [Change] WHERE OwnedByTeam != ''" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource2" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [Service] FROM [Change] WHERE Service != ''" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource3" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource SelectCommand="SELECT DISTINCT [Category] FROM [Change] WHERE Category != ''" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource4" runat="server"></asp:SqlDataSource>
</asp:Content>