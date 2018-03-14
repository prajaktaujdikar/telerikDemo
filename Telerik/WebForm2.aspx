<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Telerik.WebForm2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="uc" TagName="usercontrol" Src="~/WebUserControl1.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">

        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadGrid1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1" />
                            <telerik:AjaxUpdatedControl ControlID="RadWindow1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>
            <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            </telerik:RadWindowManager>
            <telerik:RadWindow ID="RadWindow1" runat="server">
                <ContentTemplate>
                    <uc:usercontrol ID="usercontrol1" runat="server" />
                </ContentTemplate>
            </telerik:RadWindow>
            <telerik:RadGrid OnDetailTableDataBind="RadGrid1_DetailTableDataBind" ID="RadGrid1" runat="server" OnNeedDataSource="RadGrid1_NeedDataSource"
                AutoGenerateColumns="false" OnItemCommand="RadGrid1_ItemCommand" Style="margin: 100px; width: 50%;">
                <MasterTableView DataKeyNames="Id">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Id" UniqueName="ID" HeaderText="ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemName" UniqueName="ItemName" HeaderText="Item Name">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ItemStatus" UniqueName="ItemStatus" HeaderText="ItemStatus">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <asp:Button ID="Button1" Text="Edit" runat="server" OnClick="Button1_Click" />

                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" Text="Delete" OnClick="Button2_Click" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>

                    <DetailTables>
                        <telerik:GridTableView DataKeyNames="Id" AutoGenerateColumns="false" ShowHeader="false">
                            <Columns>
                                <telerik:GridTemplateColumn>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id")%>'></asp:Label><br /><br />
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ItemName")%>'></asp:Label><br /><br />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("ItemStatus")%>'></asp:Label><br /><br />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </telerik:GridTableView>
                    </DetailTables>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
