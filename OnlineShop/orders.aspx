﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="OnlineShop.orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- local css -->
    <link rel="stylesheet" href="css/admin.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="inputs" class="container-fluid">
        <div class="row g-2" style="margin-left: 4%; margin-top: 4%">
            <h1 class="text-light d-flex justify-content-center mb-5">Manage Orders</h1>
        </div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
            <HeaderTemplate>
            <table id="users" border="1" width="1500" bgcolor="white">
                <tr style="background-color: white">
                    <td><b>ID</b></td>
                    <td><b>Client Name</b></td>
                    <td><b>Product Name</b></td>
                    <td><b>Amoun</b></td>
                    <td><b>Date</b></td>
                    <td><b>Zip Code</b></td>
                    <td>
                        <asp:ImageButton ID="btn_saveAll" runat="server" ImageUrl="~/images/saveAll.jpg" OnClick="btn_saveAll_Click" />
                    </td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="lbl_id" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tb_clientName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_productName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_amount" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_date" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_zipcode" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:ImageButton ID="btn_save" runat="server" ImageUrl="~/images/save.png" CommandName="btn_save" />
                    <asp:ImageButton ID="btn_delete" runat="server" ImageUrl="~/images/delete.jpg" CommandName="btn_delete" />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="lbl_id" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tb_clientName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_productName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_amount" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_date" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="tb_zipcode" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:ImageButton ID="btn_save" runat="server" ImageUrl="~/images/save.png" CommandName="btn_save" />
                    <asp:ImageButton ID="btn_delete" runat="server" ImageUrl="~/images/delete.jpg" CommandName="btn_delete" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineShopConnectionString %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
    </div>
</asp:Content>
