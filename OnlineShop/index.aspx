<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OnlineShop.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- local css -->
    <link rel="stylesheet" href="css/index.css">

    <div id="product_rows" class="container" style="position: relative">
        <div class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3 mb-3 mt-2">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="col hp">
                        <div class="card h-100 shadow-sm">
                            <div class="clearfix">
                                <span class="float-start badge rounded-pill text-black bg-warning">
                                    <asp:Label ID="lbl_category" runat="server"></asp:Label>
                                </span>
                                <span class="float-end badge rounded-pill text-black bg-warning bg-warning">
                                    <asp:Label ID="lbl_manufacturer" runat="server"></asp:Label>
                                </span>
                            </div>
                            <img src="images/productNotFound.jpg" class="card-img-top" alt="product.title" style="width: 100%; height: 200px; object-position: center" />
                            <div class="card-body">
                                <h5 class="card-title">
                                    <asp:Label ID="lbl_model" runat="server"></asp:Label>
                                </h5>
                                <div class="clearfix mb-2">
                                    <span class="float-start" style="font-size: 10px">
                                        <asp:Label ID="lbl_serial" runat="server"></asp:Label></span>
                                    <span class="float-end badge rounded-pill text-black bg-warning bg-success">PRICE: <asp:Label ID="lbl_price" runat="server"></asp:Label> €
                                    </span>
                                </div>
                                <div class="clearfix mb-1">
                                    <span class="float-start">
                                        Stock: <asp:Label ID="lbl_stock" runat="server"></asp:Label>
                                    </span>
                                    <span class="float-end">
                                        Color: <asp:Label ID="lbl_color" runat="server"></asp:Label>
                                    </span>
                                </div>
                                <div class="d-grid gap-2 my-4">
                                    <button class="btn btn-warning bold-btn">
                                        <i class="fas fa-shopping-cart me-2"></i>Add to cart
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineShopConnectionString %>" SelectCommand="SELECT [serial], [price], [category], [manufacturer], [model], [color], [stock] FROM [Products]"></asp:SqlDataSource>
        </div>
    </div>

    <div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cartModalLabel">Shopping Cart</h5>
                </div>
                <div class="modal-body">
                    <ul id="cart_items" class="list-group"></ul>
                </div>
                <div class="modal-footer">
                    <h6 id="cart_Price">Price: 0 €</h6>
                    <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Checkout</button> -->
                    <asp:Button ID="btn_close" runat="server" class="btn btn-secondary" data-bs-dismiss="modal" Text="Button" />
                    <asp:Button ID="btn_checkout" runat="server" class="btn btn-warning" data-bs-dismiss="modal" Text="Button" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
