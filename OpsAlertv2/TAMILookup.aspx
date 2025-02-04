<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TAMILookup.aspx.cs" Inherits="TAMILookup" MasterPageFile="~/MasterPage.master" %>


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
                AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowMultiRowEdit="True"
                AllowPaging="True" DataSourceID="DataSource1" OnItemUpdated="RadGrid1_ItemUpdated" OnItemDeleted="RadGrid1_ItemDeleted"
                OnItemInserted="RadGrid1_ItemInserted" OnUpdateCommand="RadGrid1_UpdateCommand" OnInsertCommand="RadGrid1_InsertCommand" OnDataBound="RadGrid1_DataBound" AutoGenerateEditColumn="True" AllowSorting="True" AllowFilteringByColumn="True">
                <PagerStyle Mode="NextPrevAndNumeric" />
                <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="False" />
                <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="TopAndBottom" DataKeyNames="FieldName,FieldValue" DataSourceID="DataSource1" EditMode="PopUp" HorizontalAlign="NotSet" Width="100%">
                    <RowIndicatorColumn ShowNoSortIcon="False">                    
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn ShowNoSortIcon="False">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="FieldName" FilterControlAltText="Filter FieldName column" ReadOnly="True" HeaderText="FieldName" ShowNoSortIcon="False" SortExpression="FieldName" UniqueName="FieldName" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FieldValue" FilterControlAltText="Filter FieldValue column" HeaderText="FieldValue" ShowNoSortIcon="False" SortExpression="FieldValue" UniqueName="FieldValue" ShowFilterIcon="false" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
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
        <asp:SqlDataSource SelectCommand="SELECT [FieldName], [FieldValue] FROM [TAMI_Lookup]" UpdateCommand="SELECT [FieldName], [FieldValue] FROM [TAMI_Lookup]" InsertCommand="SELECT [FieldName], [FieldValue] FROM [TAMI_Lookup]" ConnectionString="<%$ ConnectionStrings:OPSALERTConnectionString %>" ProviderName="System.Data.SqlClient" ID="DataSource1" runat="server" OldValuesParameterFormatString="original_{0}">
        </asp:SqlDataSource>
</asp:Content>