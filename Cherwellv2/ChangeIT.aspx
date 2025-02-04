<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeIT.aspx.cs" Inherits="ChangeIT" MasterPageFile="~/MasterPage.Master" %>

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
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Width="120%" AllowPaging="True" OnDataBound="RadGrid1_DataBound"
            CellSpacing="-1" GridLines="Both" PageSize="50" OnNeedDataSource="RadGrid1_NeedDataSource">
            <PagerStyle Mode="NextPrevAndNumeric" PageSizes="10;20;50;100" />
            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false" />
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="RecID" EditMode="InPlace" HorizontalAlign="NotSet" TableLayout="Fixed" Width="100%" CommandItemDisplay="Top">
                <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToCsvButton="True" ShowExportToExcelButton="True" ShowExportToWordButton="True" ShowRefreshButton="False" />
                <RowIndicatorColumn ShowNoSortIcon="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn ShowNoSortIcon="False">
                </ExpandCollapseColumn>
                <CommandItemTemplate>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbChangeID" runat="server" Label="Change ID: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbService" Width="300px" AppendDataBoundItems="true" Label="Service:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbCategory" Width="300px" AppendDataBoundItems="true" Label="Category:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbsubCategory" runat="server" Label="Subcategory: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbType" runat="server" Label="Type: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbTitle" runat="server" Label="Title: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbOwnedByTeam" Width="300px" AppendDataBoundItems="true" Label="Owned By Team:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbOwnedBy" runat="server" Label="Owned By: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbRequestedBy" runat="server" Label="Requested By: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbStatus" Width="300px" AppendDataBoundItems="true" Label="Status: "
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="300px" ID="rtbApprovedBy" runat="server" Label="Approved By: " InvalidStyleDuration="100" />
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
                    <telerik:GridBoundColumn DataField="RecID" HeaderText="RecID" ShowNoSortIcon="False" SortExpression="RecID" UniqueName="RecID" ReadOnly="True" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ChangeID" HeaderText="ChangeID" ShowNoSortIcon="False" SortExpression="ChangeID" UniqueName="ChangeID">
                        <HeaderStyle Width="130px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Service" HeaderText="Service" ShowNoSortIcon="False" SortExpression="Service" UniqueName="Service">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Category" HeaderText="Category" ShowNoSortIcon="False" SortExpression="Category" UniqueName="Category">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Subcategory" HeaderText="Subcategory" ShowNoSortIcon="False" SortExpression="Subcategory" UniqueName="Subcategory">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Type" HeaderText="Type" ShowNoSortIcon="False" SortExpression="Type" UniqueName="Type">
                        <HeaderStyle Width="130px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Title" HeaderText="Title" ShowNoSortIcon="False" SortExpression="Title" UniqueName="Title">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OwnedByTeam" HeaderText="OwnedByTeam" ShowNoSortIcon="False" SortExpression="OwnedByTeam" UniqueName="OwnedByTeam">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OwnedBy" HeaderText="OwnedBy" ShowNoSortIcon="False" SortExpression="OwnedBy" UniqueName="OwnedBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RequestedBy" HeaderText="RequestedBy" ShowNoSortIcon="False" SortExpression="RequestedBy" UniqueName="RequestedBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" HeaderText="Status" ShowNoSortIcon="False" SortExpression="Status" UniqueName="Status">
                        <HeaderStyle Width="135px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="ApproverNames" HeaderText="Approved By" ShowNoSortIcon="False" SortExpression="ApproverNames" UniqueName="ApproverNames">
                        <HeaderStyle Width="400px" />
                        <ItemStyle />
                        <ItemTemplate>
                            <asp:Label Style="display: inline-block; width: 370px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis" Width="400px" ID="lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ApproverNames") %>'></asp:Label>
                            <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip1" runat="server" TargetControlID="lbl" RelativeTo="Element"
                                Position="BottomCenter" RenderInPageRoot="true" Width="800px" ContentScrolling="Auto" Height="75px" HideEvent="LeaveToolTip">
                                <%# DataBinder.Eval(Container, "DataItem.ApproverNames")%>
                            </telerik:RadToolTip>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Attachments" HeaderText="Attachments" HeaderStyle-Width="125px">
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
</asp:Content>
