<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="OnlineShop.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    	<!-- local css -->
    <link rel="stylesheet" href="css/admin.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="inputs" class="container-fluid">
        <div class="row g-2" style="margin-left: 4%; margin-top: 4%">
            <h1 class="text-light d-flex justify-content-center mb-5">Admin Control Panel</h1>
        </div>
    </div>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
        <HeaderTemplate>
            <table id="users" border="1" width="1500" bgcolor="white">
                <tr style="background-color: white">
                    <td><b>ID</b></td>
                    <td><b>Email</b></td>
                    <td><b>Password</b></td>
                    <td><b>First Name</b></td>
                    <td><b>Last Name</b></td>
                    <td><b>Address</b></td>
                    <td><b>Postal Code</b></td>
                    <td><b>Region</b></td>
                    <td><b>Active</b></td>
                    <td><b>Type</b></td>
                    <td>
                        <asp:ImageButton ID="btn_saveAll" runat="server" ImageUrl="~/images/saveAll.jpg" OnClick="btn_saveAll_Click"/>
                    </td>
                </tr>
           
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="lbl_id" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tb_email" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_password" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_firstName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_lastName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_address" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_postalCode" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_region" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_active" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_type" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:ImageButton ID="btn_save" runat="server" ImageUrl="~/images/save.png" CommandName="btn_save"/>
                    <asp:ImageButton ID="btn_delete" runat="server" ImageUrl="~/images/delete.jpg" CommandName="btn_delete"/>
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="lbl_id" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tb_email" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_password" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_firstName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_lastName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_address" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_postalCode" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_region" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_active" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_type" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:ImageButton ID="btn_save" runat="server" ImageUrl="~/images/save.png" CommandName="btn_save"/>
                    <asp:ImageButton ID="btn_delete" runat="server" ImageUrl="~/images/delete.jpg" CommandName="btn_delete"/>
                </td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
             </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineShopConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
</asp:Content>
