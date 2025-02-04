<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CherwellMOCs.aspx.cs" Inherits="CherwellMOCs" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <style type="text/css">
        .riLabel {
            width: 170px !important;
            text-align: right !important;
        }

        .RadComboBox .rcbLabel {
            width: 160px !important;
            text-align: right !important;
            padding-right: 10px !important;
        }

        .RadComboBox_Bootstrap {
            width: 400px !important;
        }

            .RadComboBox_Bootstrap .rcbReadOnly {
                width: 204px !important;
            }

        .buttonDiv {
            width: 248px !important;
            display: flex;
            justify-content: right;
        }
    </style>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" HorizontalAlign="NotSet" LoadingPanelID="RadAjaxLoadingPanel1">
        <telerik:RadGrid ID="RadGrid1" OnNeedDataSource="RadGrid1_NeedDataSource" runat="server" AllowAutomaticDeletes="True" AllowSorting="True"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True"
            OnDataBound="RadGrid1_DataBound" GridLines="Both" PageSize="50" Width="190%">
            <PagerStyle Mode="NextPrevAndNumeric" PageSizes="10;20;50;100" />
            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false" />
            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="RecID" EditMode="EditForms" HorizontalAlign="NotSet" TableLayout="Fixed" Width="100%">
                <CommandItemSettings ShowAddNewRecordButton="False" ShowRefreshButton="False" ShowExportToCsvButton="True" ShowExportToExcelButton="True" ShowExportToWordButton="True" />
                <RowIndicatorColumn ShowNoSortIcon="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn ShowNoSortIcon="False">
                </ExpandCollapseColumn>
                <CommandItemTemplate>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbChangeID" runat="server" Label="Change ID: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbService" Width="400px" AppendDataBoundItems="true" Label="Service:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbType" runat="server" Label="Type: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbPipeline" Width="400px" AppendDataBoundItems="true" Label="Pipeline:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" ToolTip="Format: YYYY-MM-DD" Width="400px" ID="rtbProposedStartDate" runat="server" Label="Proposed Start Date: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbTitle" runat="server" Label="Title: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbRequestedBy" runat="server" Label="Requested By: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbOwnedByTeam" Width="400px" AppendDataBoundItems="true" Label="Owned By Team:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbOwnedBy" runat="server" Label="Owned By: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbDescription" runat="server" Label="Description: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbLocation" runat="server" Label="Location: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbStatus" Width="400px" AppendDataBoundItems="true" Label="Status:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbApprovedBy" runat="server" Label="Approved By: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox ToolTip="Format: YYYY-MM-DD" RenderMode="Lightweight" Width="400px" ID="rtbScheduledEndDate" runat="server" Label="Scheduled End Date: " InvalidStyleDuration="100" />
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
                    <telerik:GridBoundColumn DataField="ChangeID" HeaderText="ChangeID" ShowNoSortIcon="False" SortExpression="ChangeID" UniqueName="ChangeID">
                        <HeaderStyle Width="125px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Service" HeaderText="Service" ShowNoSortIcon="False" SortExpression="Service" UniqueName="Service">
                        <HeaderStyle Width="200px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Type" HeaderText="Type" ShowNoSortIcon="False" SortExpression="Type" UniqueName="Type">
                        <HeaderStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Pipeline" HeaderText="Pipeline" ShowNoSortIcon="False" SortExpression="Pipeline" UniqueName="Pipeline">
                        <HeaderStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ProposedStartDate" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="ProposedStartDate" ShowNoSortIcon="False" SortExpression="ProposedStartDate" UniqueName="ProposedStartDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Title" HeaderText="Title" ShowNoSortIcon="False" SortExpression="Title" UniqueName="Title">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RequestedBy" HeaderText="RequestedBy" ShowNoSortIcon="False" SortExpression="RequestedBy" UniqueName="RequestedBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OwnedByTeam" HeaderText="OwnedByTeam" ShowNoSortIcon="False" SortExpression="OwnedByTeam" UniqueName="OwnedByTeam">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="OwnedBy" HeaderText="OwnedBy" ShowNoSortIcon="False" SortExpression="OwnedBy" UniqueName="OwnedBy">
                        <HeaderStyle Width="150px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="Description" HeaderText="Description" ShowNoSortIcon="False" SortExpression="Description" UniqueName="Description">
                        <HeaderStyle Width="400px" />
                        <ItemStyle />
                        <ItemTemplate>
                            <asp:Label ID="lbl" Style="display: inline-block; width: 370px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis" Width="400px" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'></asp:Label>
                            <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip1" runat="server" TargetControlID="lbl" RelativeTo="Element"
                                Position="BottomCenter" RenderInPageRoot="true" Width="800px" ContentScrolling="Auto" Height="75px" HideEvent="LeaveToolTip">
                                <%# DataBinder.Eval(Container, "DataItem.Description")%>
                            </telerik:RadToolTip>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="EnablonLocation" HeaderText="Location" ShowNoSortIcon="False" SortExpression="EnablonLocation" UniqueName="EnablonLocation">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" HeaderText="Status" ShowNoSortIcon="False" SortExpression="Status" UniqueName="Status">
                        <HeaderStyle Width="170px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="ApproverNames" HeaderText="Approved By" ShowNoSortIcon="False" SortExpression="ApproverNames" UniqueName="ApproverNames">
                        <HeaderStyle Width="400px" />
                        <ItemStyle />
                        <ItemTemplate>
                            <asp:Label Style="display: inline-block; width: 370px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis" Width="400px" ID="lblApprovers" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ApproverNames") %>'></asp:Label>
                            <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip2" runat="server" TargetControlID="lblApprovers" RelativeTo="Element"
                                Position="BottomCenter" RenderInPageRoot="true" Width="800px" ContentScrolling="Auto" Height="75px" HideEvent="LeaveToolTip">
                                <%# DataBinder.Eval(Container, "DataItem.ApproverNames")%>
                            </telerik:RadToolTip>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="ScheduledEndDate" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="ScheduledEndDate" ShowNoSortIcon="False" SortExpression="ScheduledEndDate" UniqueName="ScheduledEndDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="Attachments" HeaderText="Attachments" HeaderStyle-Width="125px">
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
</asp:Content>
