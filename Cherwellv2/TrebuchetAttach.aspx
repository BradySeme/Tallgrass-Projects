<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TrebuchetAttach.aspx.cs" Inherits="Cherwellv2.TrebuchetAttach" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
                AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
                AllowPaging="True" DataSourceID="DataSource1" CellSpacing="-1" GridLines="Both">
                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="RecID" DataSourceID="DataSource1" EditMode="InPlace" HorizontalAlign="NotSet" Width="100%">
                    <RowIndicatorColumn ShowNoSortIcon="False">
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn ShowNoSortIcon="False">
                    </ExpandCollapseColumn>

                    <Columns>
                        <telerik:GridBoundColumn DataField="RecID" FilterControlAltText="Filter RecID column" HeaderText="RecID" ShowNoSortIcon="False" SortExpression="RecID" UniqueName="RecID" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FilePath" FilterControlAltText="Filter FilePath column" HeaderText="FilePath" ShowNoSortIcon="False" SortExpression="FilePath" UniqueName="FilePath">
                        </telerik:GridBoundColumn>

                        <telerik:GridAttachmentColumn SortExpression="FileContents" Text="view attachment" DataSourceID="DataSource1" MaxFileSize="1048576" HeaderText="Attachments" AttachmentDataField="FileContents" AttachmentKeyFields="RecID" FileNameTextField="FileContents" DataTextField="FileContents" UniqueName="AttachmentColumn">
                        </telerik:GridAttachmentColumn>

                        <telerik:GridBoundColumn DataField="FileExt" FilterControlAltText="Filter FileExt column" HeaderText="FileExt" ShowNoSortIcon="False" SortExpression="FileExt" UniqueName="FileExt">
                        </telerik:GridBoundColumn>
                    </Columns>

                </MasterTableView>
            </telerik:RadGrid>
            <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        </telerik:RadAjaxPanel>
        <asp:SqlDataSource SelectCommand="SELECT RecID, FilePath, FileContents, FileExt FROM TrebuchetAttach" ConnectionString="<%$ ConnectionStrings:CherwellConnectionString %>" ID="DataSource1" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
