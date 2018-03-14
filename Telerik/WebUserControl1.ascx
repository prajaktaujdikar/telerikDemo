<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="Telerik.WebUserControl1" %>

<div>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Id">ID</asp:Label><br />
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" ></asp:Label><br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Item Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtitemname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Item Status"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtitemstatus" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click"/>
            </td>

        </tr>
    </table>
</div>
