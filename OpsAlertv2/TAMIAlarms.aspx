<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TAMIAlarms.aspx.cs" Inherits="TAMIAlarms" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">

        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                var popUp;
                    function PopUpShowing(sender, eventArgs) {
                    popUp = eventArgs.get_popUp();
                    var gridWidth = sender.get_element().offsetWidth;
                    var gridHeight = sender.get_element().offsetHeight;
                    var popUpWidth = popUp.style.width.substr(0, popUp.style.width.indexOf("px"));
                    var popUpHeight = popUp.style.height.substr(0, popUp.style.height.indexOf("px"));
                    popUp.style.left = ((gridWidth - popUpWidth) / 2 + sender.get_element().offsetLeft).toString() + "px";
                    popUp.style.top = ((gridHeight - popUpHeight) / 2 + sender.get_element().offsetTop).toString() + "px";
                    }
            </script>
        </telerik:RadCodeBlock>

            <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True"
                AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                AllowPaging="True" DataSourceID="DataSource1" OnUpdateCommand="RadGrid1_UpdateCommand" OnItemUpdated="RadGrid1_ItemUpdated" OnItemDeleted="RadGrid1_ItemDeleted"
                OnItemInserted="RadGrid1_ItemInserted" OnDataBound="RadGrid1_DataBound" AutoGenerateEditColumn="True" OnNeedDataSource="RadGrid1_NeedDataSource1" AllowSorting="True" AllowFilteringByColumn="True">
                <PagerStyle Mode="NextPrevAndNumeric" />
                <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="False" />
                <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="TopAndBottom" DataKeyNames="AlarmID,EscalationList" DataSourceID="DataSource1" EditMode="PopUp" HorizontalAlign="NotSet" Width="100%">
                    <RowIndicatorColumn ShowNoSortIcon="False">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn ShowNoSortIcon="False">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="AlarmID" DataType="System.Int32" FilterControlAltText="Filter AlarmID column" HeaderText="AlarmID" ReadOnly="True" ShowNoSortIcon="False" SortExpression="AlarmID" UniqueName="AlarmID" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Pin" FilterControlAltText="Filter Pin column" HeaderText="Pin" ShowNoSortIcon="False" SortExpression="Pin" UniqueName="Pin" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Tag" FilterControlAltText="Filter Tag column" HeaderText="Tag" ShowNoSortIcon="False" SortExpression="Tag" UniqueName="Tag" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter Description column" HeaderText="Description" ShowNoSortIcon="False" SortExpression="Description" UniqueName="Description" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridDropDownColumn DataField="Disabled" FilterControlAltText="Filter Disabled column" HeaderText="Disabled" ShowNoSortIcon="False" SortExpression="Disabled" UniqueName="Disabled" ListTextField="Disabled" DataSourceID="SqlDataSource4" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                        </telerik:GridDropDownColumn>
                        <telerik:GridBoundColumn DataField="Limit_1" FilterControlAltText="Filter Limit_1 column" HeaderText="Limit_1" ShowNoSortIcon="False" SortExpression="Limit_1" UniqueName="Limit_1" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" AllowFiltering="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Limit_2" FilterControlAltText="Filter Limit_2 column" HeaderText="Limit_2" ShowNoSortIcon="False" SortExpression="Limit_2" UniqueName="Limit_2" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" AllowFiltering="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="EscalationList" FilterControlAltText="Filter EscalationList column" HeaderText="EscalationList" ShowNoSortIcon="False" SortExpression="EscalationList" UniqueName="EscalationList" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AlarmType" FilterControlAltText="Filter AlarmType column" HeaderText="AlarmType" ShowNoSortIcon="False" SortExpression="AlarmType" UniqueName="AlarmType" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="BlackoutHrs" DataType="System.Decimal" FilterControlAltText="Filter BlackoutHrs column" HeaderText="BlackoutHrs" ShowNoSortIcon="False" SortExpression="BlackoutHrs" UniqueName="BlackoutHrs" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Commodity" FilterControlAltText="Filter Commodity column" HeaderText="Commodity" ShowNoSortIcon="False" SortExpression="Commodity" UniqueName="Commodity" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" AllowFiltering="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UpdatedBy" FilterControlAltText="Filter UpdatedBy column" HeaderText="UpdatedBy" ShowNoSortIcon="False" SortExpression="UpdatedBy" UniqueName="UpdatedBy" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UpdateDate" DataType="System.DateTime" FilterControlAltText="Filter UpdateDate column" HeaderText="UpdateDate" ShowNoSortIcon="False" SortExpression="UpdateDate" UniqueName="UpdateDate" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings>
                        <FormTableItemStyle Wrap="False" />
                        <FormCaptionStyle CssClass="EditFormHeader" />
                        <FormMainTableStyle BackColor="White" CellPadding="3" CellSpacing="0" GridLines="None" Width="100%" />
                        <FormTableStyle BackColor="White" CellPadding="8" CellSpacing="0" Height="110px" />
                        <FormTableAlternatingItemStyle Wrap="False" />
                        <EditColumn ButtonType="ImageButton" CancelText="Cancel edit" UniqueName="EditCommandColumn1">
                        </EditColumn>
                        <FormTableButtonRowStyle CssClass="EditFormButtonRow" HorizontalAlign="Right" />
                    </EditFormSettings>
                </MasterTableView>

                <ClientSettings>
                    <ClientEvents OnPopUpShowing="PopUpShowing" />
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>

            </telerik:RadGrid>
            <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        </telerik:RadAjaxPanel>

        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:OPSALERTConnectionString %>" SelectCommand="SELECT [Disabled] FROM [TAMI_Alarms] WHERE [Disabled] = 'True' UNION SELECT [Disabled] FROM [TAMI_Alarms] WHERE [Disabled] = 'False'"> </asp:SqlDataSource>

        <asp:SqlDataSource SelectCommand="SELECT [AlarmID], [Pin], [Tag], [Description], [Disabled], [Limit_1], [Limit_2], [EscalationList], [AlarmType], [BlackoutHrs], [Commodity], [UpdatedBy], [UpdateDate] FROM [TAMI_Alarms]" UpdateCommand="SELECT [AlarmID], [Pin], [Tag], [Description], [Disabled], [Limit_1], [Limit_2], [EscalationList], [AlarmType], [BlackoutHrs], [Commodity], [UpdatedBy], [UpdateDate] FROM [TAMI_Alarms]" ConnectionString="<%$ ConnectionStrings:OPSALERTConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource1" runat="server" ConflictDetection="CompareAllValues" InsertCommand="SELECT [AlarmID], [Pin], [Tag], [Description], [Disabled], [Limit_1], [Limit_2], [EscalationList], [AlarmType], [BlackoutHrs], [Commodity], [UpdatedBy], [UpdateDate] FROM [TAMI_Alarms]" OldValuesParameterFormatString="original_{0}">
            <InsertParameters>
                <asp:Parameter Name="Pin" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Disabled" Type="String" />
                <asp:Parameter Name="Limit_1" Type="String" />
                <asp:Parameter Name="Limit_2" Type="String" />
                <asp:Parameter Name="EscalationList" Type="String" />
                <asp:Parameter Name="AlarmType" Type="String" />
                <asp:Parameter Name="BlackoutHrs" Type="Decimal" />
                <asp:Parameter Name="Commodity" Type="String" />
                <asp:Parameter Name="UpdatedBy" Type="String" />
                <asp:Parameter Name="UpdateDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Pin" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Disabled" Type="String" />
                <asp:Parameter Name="Limit_1" Type="String" />
                <asp:Parameter Name="Limit_2" Type="String" />
                <asp:Parameter Name="EscalationList" Type="String" />
                <asp:Parameter Name="AlarmType" Type="String" />
                <asp:Parameter Name="BlackoutHrs" Type="Decimal" />
                <asp:Parameter Name="Commodity" Type="String" />
                <asp:Parameter Name="UpdatedBy" Type="String" />
                <asp:Parameter Name="UpdateDate" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
