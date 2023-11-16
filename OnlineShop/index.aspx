<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OnlineShop.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    	<!-- local css -->
	<link rel="stylesheet" href="css/index.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- carousel beginning -->
    <div class="container">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1">
                </button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2">
                </button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3">
                </button>
            </div>
            <!-- carousel items -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://storage-asset.msi.com/event/mb/2017/4k_video/images/b_11.jpg"
                        style="height: 450px; object-fit: cover; object-position: center;" class="d-block w-100"
                        alt="carousel1" />
                </div>
                <div class="carousel-item">
                    <img src="https://i.insider.com/6012fda01d2df20018b71640?width=1000&format=jpeg&auto=webp"
                        style="height: 450px; object-fit: cover; object-position: center;" class="d-block w-100"
                        alt="carousel2" />
                </div>
                <div class="carousel-item">
                    <img src="https://img.freepik.com/free-photo/high-angle-hard-drive-components-laptop_23-2149417053.jpg?w=1380&t=st=1688302595~exp=1688303195~hmac=e815ecb41f9c652ae5da4ce104700ec2724532c92de364aa0ba0c5d9ce307292"
                        style="height: 450px; object-fit: cover; object-position: center;" class="d-block w-100"
                        alt="carousel3" />
                </div>
            </div>
            <!-- carousel controls -->
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- carousel end -->

    <!-- <div id="product_rows" class="container" style="position: relative">All Products</div> -->
    <asp:DropDownList ID="ddl_sort" class="form-control" runat="server"></asp:DropDownList>

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
