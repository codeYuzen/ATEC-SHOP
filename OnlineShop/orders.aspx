<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="OnlineShop.orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- local css -->
    <link rel="stylesheet" href="css/admin.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="inputs" class="container-fluid">
        <div class="row g-2" style="margin-left: 4%; margin-top: 4%">
            <h1 class="text-light d-flex justify-content-center mb-5">Manage Orders</h1>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">OrderID</label>
                    <asp:TextBox ID="tb_orderID" placeholder="OrderID" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">ClientName</label>
                    <asp:TextBox ID="tb_clientName" placeholder="ClientName" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">ProductName</label>
                    <asp:DropDownList ID="ddl_productName" class="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Amount</label>
                    <asp:TextBox ID="tb_amount" placeholder="Amount" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Date</label>
                    <asp:TextBox ID="tb_date" placeholder="Date" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Status</label>
                    <asp:DropDownList ID="ddl_status" class="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <table class="componentTable">
            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">OrderID</th>
                    <th scope="col">ClientName</th>
                    <th scope="col">ProductName</th>
                    <th scope="col">Amount</th>
                    <th scope="col">Date</th>
                    <th scope="col">Status</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody id="tb"></tbody>
        </table>
    </div>
</asp:Content>
