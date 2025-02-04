<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListCategory.aspx.cs" Inherits="ListCategory" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="mainContent">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" HorizontalAlign="NotSet">

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

            <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowSorting="True"
                AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                AllowPaging="True" DataSourceID="DataSource1" OnUpdateCommand="RadGrid1_UpdateCommand" OnItemUpdated="RadGrid1_ItemUpdated" OnItemDeleted="RadGrid1_ItemDeleted" OnInsertCommand="RadGrid1_InsertCommand"
                OnItemInserted="RadGrid1_ItemInserted" OnDataBound="RadGrid1_DataBound" AutoGenerateEditColumn="True" CellSpacing="-1" GridLines="Both" AllowFilteringByColumn="True" AllowMultiRowEdit="True" >
                <PagerStyle Mode="NextPrevAndNumeric" />
                <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="False" />
                <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="TopAndBottom" DataKeyNames="lstcat_listid, lstcat_catid" DataSourceID="DataSource1" EditMode="PopUp" HorizontalAlign="NotSet" Width="100%" BorderStyle="None">
                    <RowIndicatorColumn ShowNoSortIcon="False">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn ShowNoSortIcon="False">
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="lstcat_listid" DataType="System.Int32" FilterControlAltText="Filter lstcat_listid column" HeaderText="lstcat_listid" ReadOnly="True" ShowNoSortIcon="False" SortExpression="lstcat_listid" UniqueName="lstcat_listid" HeaderStyle-Width="120px" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                            <HeaderStyle Width="120px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lstcat_catid" DataType="System.Int32" FilterControlAltText="Filter lstcat_catid column" HeaderText="lstcat_catid" ReadOnly="True" ShowNoSortIcon="False" SortExpression="lstcat_catid" UniqueName="lstcat_catid" HeaderStyle-Width="120px" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                            <HeaderStyle Width="120px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lstcat_name" FilterControlAltText="Filter lstcat_name column" HeaderText="lstcat_name" ShowNoSortIcon="False" SortExpression="lstcat_name" UniqueName="lstcat_name" HeaderStyle-Width="250" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                            <HeaderStyle Width="250px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridHTMLEditorColumn DataField="lstcat_description" FilterControlAltText="Filter lstcat_description column" HeaderText="lstcat_description" ShowNoSortIcon="False" SortExpression="lstcat_description" UniqueName="lstcat_description" HeaderStyle-Width="520px" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                            <HeaderStyle Width="520px" />
                        </telerik:GridHTMLEditorColumn>
                        <telerik:GridBoundColumn DataField="lstcat_level" DataType="System.Int32" FilterControlAltText="Filter lstcat_level column" HeaderText="lstcat_level" ShowNoSortIcon="False" SortExpression="lstcat_level" UniqueName="lstcat_level" HeaderStyle-Width="150px" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                            <HeaderStyle Width="150px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lstcat_sortorder" DataType="System.Int32" FilterControlAltText="Filter lstcat_sortorder column" HeaderText="lstcat_sortorder" ShowNoSortIcon="False" SortExpression="lstcat_sortorder" UniqueName="lstcat_sortorder" HeaderStyle-Width="150px" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                            <HeaderStyle Width="150px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridHTMLEditorColumn DataField="lstcat_attributes" FilterControlAltText="Filter lstcat_attributes column" HeaderText="lstcat_attributes" ShowNoSortIcon="False" SortExpression="lstcat_attributes" UniqueName="lstcat_attributes" HeaderStyle-Width="420px" ShowFilterIcon="False" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True">
                            <HeaderStyle Width="420px" />
                        </telerik:GridHTMLEditorColumn>
                    </Columns>
                    <EditFormSettings>            
                        <PopUpSettings Width="670px" />
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
        <asp:SqlDataSource SelectCommand="SELECT [lstcat_listid], [lstcat_catid], [lstcat_name], [lstcat_description], [lstcat_level], [lstcat_sortorder], [lstcat_attributes] FROM [tbl_ListCategory]" ConnectionString="<%$ ConnectionStrings:OPSALERTConnectionString %>" ID="DataSource1" runat="server" ConflictDetection="CompareAllValues" InsertCommand="SELECT [lstcat_listid], [lstcat_catid], [lstcat_name], [lstcat_description], [lstcat_level], [lstcat_sortorder], [lstcat_attributes] FROM [tbl_ListCategory]" OldValuesParameterFormatString="original_{0}" UpdateCommand="SELECT [lstcat_listid], [lstcat_catid], [lstcat_name], [lstcat_description], [lstcat_level], [lstcat_sortorder], [lstcat_attributes] FROM [tbl_ListCategory]">
            <InsertParameters>
                <asp:Parameter Name="lstcat_listid" Type="Int32" />
                <asp:Parameter Name="lstcat_catid" Type="Int32" />
                <asp:Parameter Name="lstcat_name" Type="String" />
                <asp:Parameter Name="lstcat_description" Type="String" />
                <asp:Parameter Name="lstcat_level" Type="Int32" />
                <asp:Parameter Name="lstcat_sortorder" Type="Int32" />
                <asp:Parameter Name="lstcat_attributes" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="lstcat_name" Type="String" />
                <asp:Parameter Name="lstcat_description" Type="String" />
                <asp:Parameter Name="lstcat_level" Type="Int32" />
                <asp:Parameter Name="lstcat_sortorder" Type="Int32" />
                <asp:Parameter Name="lstcat_attributes" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
