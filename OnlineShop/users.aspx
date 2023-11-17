<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="OnlineShop.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- local css -->
    <link rel="stylesheet" href="css/admin.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="inputs" class="container-fluid">
        <div class="row g-2" style="margin-left: 4%; margin-top: 4%">
            <h1 class="text-light d-flex justify-content-center mb-5">Manage Users</h1>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Name</label>
                    <asp:TextBox ID="tb_name" placeholder="Name" class="form-control" runat="server"></asp:TextBox>
                    <%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is required">Name is required</asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Email</label>
                    <asp:TextBox ID="tb_email" placeholder="Email" class="form-control" runat="server" TextMode="Email"></asp:TextBox>
                    <%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required">Email is required</asp:RequiredFieldValidator>--%>
                    <%--                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is incorrect" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email is incorrect</asp:RegularExpressionValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Address</label>
                    <asp:TextBox ID="tb_address" placeholder="Address" class="form-control" runat="server"></asp:TextBox>
                    <%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Address is required">Address is required</asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">City</label>
                    <asp:TextBox ID="tb_city" placeholder="City" class="form-control" runat="server"></asp:TextBox>
                    <%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="City is required">City is required</asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Zip Code</label>
                    <asp:TextBox ID="tb_zipCode" placeholder="Zip Code" class="form-control" runat="server"></asp:TextBox>
                    <%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Zip Code is required">Zip Code is required</asp:RequiredFieldValidator>--%>
                    <%--                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Zip Code is incorrect" ValidationExpression="^\d{4}(-\d{3})?$">Zip Code is incorrect</asp:RegularExpressionValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Phone</label>
                    <asp:TextBox ID="tb_phone" placeholder="Phone" class="form-control" runat="server"></asp:TextBox>
                    <%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Phone is required">Phone is required</asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">&nbsp;</label>
                    <br>
                    <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="SUBMIT"></asp:Button>
                    <!-- <i class="fa-solid fa-circle-plus"></i> -->
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <table class="componentTable">
            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">City</th>
                    <th scope="col">Zip Code</th>
                    <th scope="col">NIF</th>
                    <th scope="col">Active</th>
                    <th scope="col">Type</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody id="tb">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemCreated" OnItemCreated="Repeater1_ItemCreated">
                    <ItemTemplate>
                        <tr>
                            <td><button type="button" class="btn btn-secondary btn-sm" onclick="clickEditComponent(${component.id})"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            <td><asp:Label ID="lbl_name" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_email" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_address" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_city" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_zipcode" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_nif" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_User_active" runat="server"></asp:Label></td> 
                            <td><asp:Label ID="lbl_User_Type" runat="server"></asp:Label></td> <!-- Aparecer Admin ou User em vez de 1 ou 0 -->
                            <td><button type="button" class="btn btn-danger btn-sm" onclick="clickDeleteComponent(${component.id})"><i class="fa-solid fa-trash"></i></button></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineShopConnectionString %>"
                    SelectCommand="SELECT [name], [email], [address], [city], [zipcode], [nif], [User_active], [User_Type] FROM [Users]"></asp:SqlDataSource>
            </tbody>
        </table>
    </div>
</asp:Content>
