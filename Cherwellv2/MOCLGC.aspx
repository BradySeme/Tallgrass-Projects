<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MOCLGC.aspx.cs" Inherits="MOCLGC" MasterPageFile="~/MasterPage.Master" %>

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
            width: 200px !important;
            text-align: right !important;
        }

        .RadComboBox .rcbLabel {
            width: 190px !important;
            text-align: right !important;
            padding-right: 10px !important;
        }

        .RadComboBox_Bootstrap {
            width: 400px !important;
        }

            .RadComboBox_Bootstrap .rcbReadOnly {
                width: 174px !important;
            }

        .buttonDiv {
            width: 278px !important;
            display: flex;
            justify-content: right;
        }
    </style>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowSorting="True"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowPaging="True" OnNeedDataSource="RadGrid1_NeedDataSource" OnDataBound="RadGrid1_DataBound" GridLines="Both" PageSize="50" Width="330%">
            <PagerStyle Mode="NextPrevAndNumeric" PageSizes="10;20;50;100" />
            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false" />
            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataKeyNames="MOCID" EditMode="EditForms" HorizontalAlign="NotSet" Width="100%" TableLayout="Fixed">
                <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToCsvButton="True" ShowExportToExcelButton="True" ShowExportToWordButton="True" ShowRefreshButton="False" />
                <RowIndicatorColumn ShowNoSortIcon="False">
                </RowIndicatorColumn>
                <ExpandCollapseColumn ShowNoSortIcon="False">
                </ExpandCollapseColumn>
                <CommandItemTemplate>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbMOCID" runat="server" Label="MOC ID: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbMOCType" Width="400px" AppendDataBoundItems="true" Label="MOC Type:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbRequestorLastName" runat="server" Label="Requestor Last Name: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbRequestorFirstName" runat="server" Label="Requestor First Name: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ToolTip="Format: YYYY-MM-DD" ID="rtbMOCDateCreated" runat="server" Label="MOC Date Created: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ToolTip="Format: YYYY-MM-DD" ID="rtbMOCEstStartDate" runat="server" Label="MOC Est Start Date: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbMOCSummary" runat="server" Label="MOC Summary: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbMOCDescription" runat="server" Label="MOC Description: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbCoordinatorLastName" runat="server" Label="Coordinator Last Name: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbCoordinatorFirstName" runat="server" Label="Coordinator First Name: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbMOCPriority" Width="400px" AppendDataBoundItems="true" Label="MOC Priority:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" ToolTip="Format: YYYY-MM-DD" Width="400px" ID="rtbMOCLastUpdate" runat="server" Label="MOC Last Update: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbMOCChangeType" Width="400px" AppendDataBoundItems="true" Label="MOC Change Type:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbMOCYear" Width="400px" AppendDataBoundItems="true" Label="MOC Year:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbMOCWorkOrder" runat="server" Label="MOC Work Order: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbMOCChangeReason" runat="server" Label="MOC Change Reason: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbMOCPropsExplain" runat="server" Label="MOC Props Explain: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbMOCPAndIDocs" runat="server" Label="MOC PAndIDocs: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbMOCProjCode" runat="server" Label="MOC Proj Code: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbLocation" runat="server" Label="Location: " InvalidStyleDuration="100" />
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbMOCStatus" Width="400px" AppendDataBoundItems="true" Label="MOC Status:"
                        runat="server" AutoPostBack="false">
                        <Items>
                            <telerik:RadComboBoxItem Text="All" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ID="rtbApprovedBy" runat="server" Label="Approved By: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ToolTip="Format: YYYY-MM-DD" ID="rtbMOCEstInServiceDate" runat="server" Label="MOC Est in Service Date: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ToolTip="Format: YYYY-MM-DD" ID="rtbMOCCompletionDate" runat="server" Label="MOC Completion Date: " InvalidStyleDuration="100" />
                    <telerik:RadTextBox RenderMode="Lightweight" Width="400px" ToolTip="Format: YYYY-MM-DD" ID="rtbMOCTerminationDate" runat="server" Label="MOC Termination Date: " InvalidStyleDuration="100" />
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
                    <telerik:GridBoundColumn DataField="MOCID" DataType="System.Int32" HeaderText="MOCID" ReadOnly="True" ShowNoSortIcon="False" SortExpression="MOCID" UniqueName="MOCID">
                        <HeaderStyle Width="110px" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCType" HeaderText="MOCType" ShowNoSortIcon="False" SortExpression="MOCType" UniqueName="MOCType">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RequestorLastName" HeaderText="Requestor Last Name" ShowNoSortIcon="False" SortExpression="RequestorLastName" UniqueName="RequestorLastName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RequestorFirstName" HeaderText="Requestor First Name" ShowNoSortIcon="False" SortExpression="RequestorFirstName" UniqueName="RequestorFirstName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCDateCreated" DataType="System.DateTime" HeaderText="MOCDateCreated" ShowNoSortIcon="False" SortExpression="MOCDateCreated" UniqueName="MOCDateCreated">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCEstStartDate" DataType="System.DateTime" HeaderText="MOCEstStartDate" ShowNoSortIcon="False" SortExpression="MOCEstStartDate" UniqueName="MOCEstStartDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCSummary" HeaderText="MOCSummary" ShowNoSortIcon="False" SortExpression="MOCSummary" UniqueName="MOCSummary">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="400px" DataField="MOCDesc" HeaderText="Description" ShowNoSortIcon="False" SortExpression="MOCDesc" UniqueName="MOCDesc">
                        <HeaderStyle Width="400px" />
                        <ItemStyle />
                        <ItemTemplate>
                            <asp:Label Style="display: inline-block; width: 370px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis" Width="400px" ID="lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MOCDesc") %>'></asp:Label>
                            <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip1" runat="server" TargetControlID="lbl" RelativeTo="Element"
                                Position="BottomCenter" RenderInPageRoot="true" Width="800px" ContentScrolling="Auto" Height="75px" HideEvent="LeaveToolTip">
                                <%# DataBinder.Eval(Container, "DataItem.MOCDesc")%>
                            </telerik:RadToolTip>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="CoordinatorLastName" HeaderText="Coordinator Last Name" ShowNoSortIcon="False" SortExpression="CoordinatorLastName" UniqueName="CoordinatorLastName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CoordinatorFirstName" HeaderText="Coordinator First Name" ShowNoSortIcon="False" SortExpression="CoordinatorFirstName" UniqueName="CoordinatorFirstName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCPriority" HeaderText="MOCPriority" ShowNoSortIcon="False" SortExpression="MOCPriority" UniqueName="MOCPriority">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCLastUpdate" DataType="System.DateTime" HeaderText="MOCLastUpdate" ShowNoSortIcon="False" SortExpression="MOCLastUpdate" UniqueName="MOCLastUpdate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCChangeType" HeaderText="MOCChangeType" ShowNoSortIcon="False" SortExpression="MOCChangeType" UniqueName="MOCChangeType">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCYear" DataType="System.Int16" HeaderText="MOCYear" ShowNoSortIcon="False" SortExpression="MOCYear" UniqueName="MOCYear">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCWorkOrder" HeaderText="MOCWorkOrder" ShowNoSortIcon="False" SortExpression="MOCWorkOrder" UniqueName="MOCWorkOrder">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCChangeReason" HeaderText="MOCChangeReason" ShowNoSortIcon="False" SortExpression="MOCChangeReason" UniqueName="MOCChangeReason">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCPropsExplain" HeaderText="MOCPropsExplain" ShowNoSortIcon="False" SortExpression="MOCPropsExplain" UniqueName="MOCPropsExplain">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCPAndIDocs" HeaderText="MOCPAndIDocs" ShowNoSortIcon="False" SortExpression="MOCPAndIDocs" UniqueName="MOCPAndIDocs">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCProjCode" HeaderText="MOCProjCode" ShowNoSortIcon="False" SortExpression="MOCProjCode" UniqueName="MOCProjCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loclongname" HeaderText="Location" ShowNoSortIcon="False" SortExpression="loclongname" UniqueName="loclongname">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCStatus" HeaderText="MOCStatus" ShowNoSortIcon="False" SortExpression="MOCStatus" UniqueName="MOCStatus">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn DataField="ApproverNames" HeaderText="Approved By" ShowNoSortIcon="False" SortExpression="ApproverNames" UniqueName="ApproverNames">
                        <HeaderStyle Width="400px" />
                        <ItemStyle />
                        <ItemTemplate>
                            <asp:Label Style="display: inline-block; width: 370px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis" Width="400px" ID="lbl2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ApproverNames") %>'></asp:Label>
                            <telerik:RadToolTip RenderMode="Lightweight" ID="RadToolTip2" runat="server" TargetControlID="lbl2" RelativeTo="Element"
                                Position="BottomCenter" RenderInPageRoot="true" Width="800px" ContentScrolling="Auto" Height="75px" HideEvent="LeaveToolTip">
                                <%# DataBinder.Eval(Container, "DataItem.ApproverNames")%>
                            </telerik:RadToolTip>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="MOCEstInServiceDate" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="MOCEstInServiceDate" ShowNoSortIcon="False" SortExpression="MOCEstInServiceDate" UniqueName="MOCEstInServiceDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCCompletionDate" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="MOCCompletionDate" ShowNoSortIcon="False" SortExpression="MOCCompletionDate" UniqueName="MOCCompletionDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MOCTerminationDate" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="MOCTerminationDate" ShowNoSortIcon="False" SortExpression="MOCTerminationDate" UniqueName="MOCTerminationDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="Attachments" HeaderText="Attachments" HeaderStyle-Width="125px">
                        <ItemTemplate>
                            <asp:HyperLink ID="AttachButton" runat="server" NavigateUrl='<%#"~/ViewAttachmentFolder/MOCLGCVA.aspx?MOCID=" + Eval("MOCID") %>' Text="Attachments" Target="_blank">
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
