<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TAMILastRun.aspx.cs" Inherits="TAMILastRun" MasterPageFile="~/MasterPage.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
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
                AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="DataSource1" OnItemUpdated="RadGrid1_ItemUpdated" OnItemDeleted="RadGrid1_ItemDeleted"
                OnItemInserted="RadGrid1_ItemInserted" OnDataBound="RadGrid1_DataBound" AutoGenerateEditColumn="True" OnUpdateCommand="RadGrid1_UpdateCommand" CellSpacing="-1" GridLines="Both">
                <PagerStyle Mode="NextPrevAndNumeric" />
                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True"></Selecting>
            </ClientSettings>
                <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="TopAndBottom" DataKeyNames="Commodity,DateProcessed" DataSourceID="DataSource1" EditMode="InPlace" HorizontalAlign="NotSet" Width="100%" BorderStyle="None">
                    <CommandItemSettings ShowAddNewRecordButton="False" />
                    <RowIndicatorColumn ShowNoSortIcon="False">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn ShowNoSortIcon="False">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="Commodity" FilterControlAltText="Filter Commodity column" HeaderText="Commodity" ShowNoSortIcon="False" SortExpression="Commodity" UniqueName="Commodity" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DateProcessed" DataType="System.DateTime" FilterControlAltText="Filter DateProcessed column" HeaderText="DateProcessed" ShowNoSortIcon="False" SortExpression="DateProcessed" UniqueName="DateProcessed">
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
        <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:OPSALERTConnectionString %>" ID="DataSource1" runat="server" SelectCommand="SELECT [Commodity], [DateProcessed] FROM [TAMI_LastRun]" UpdateCommand="SELECT [Commodity], [DateProcessed] FROM [TAMI_LastRun]" OldValuesParameterFormatString="original_{0}">
            <UpdateParameters>
                <asp:Parameter Name="Commodity" Type="String" />
                <asp:Parameter Name="DateProcessed" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Content>