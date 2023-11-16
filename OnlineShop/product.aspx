<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="OnlineShop.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- MDB -->
    <link rel="stylesheet" href="css/mdb.min.css" />
    <link rel="stylesheet" href="css/product.css" />
    <!-- content -->
    <section class="py-5">
        <div class="container">
            <div class="row gx-5">
                <aside class="col-lg-6">
                    <div class="border rounded-4 mb-3 d-flex justify-content-center">
                        <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="images/bruno.jpg" />
                    </div>
                </aside>
                <main class="col-lg-6">
                    <div class="ps-lg-3">
                        <h4 class="title text-dark">Quality Men's Hoodie for Winter, Men's Fashion
                            <br />
                            Casual Hoodie
                        </h4>
                        <div class="d-flex flex-row my-3">
                            <span class="h5">$75.00</span>
                            <span class="text-success ms-2">In stock</span>
                        </div>

                        <p>
                            Modern look and quality demo item is a streetwear-inspired collection that continues to break away from the conventions of mainstream fashion. Made in Italy, these black and brown clothing low-top shirts for
            men.
                        </p>

                        <div class="row">
                            <dt class="col-3">Serial:</dt>
                            <dd class="col-9">Regular</dd>

                            <dt class="col-3">Category:</dt>
                            <dd class="col-9">Brown</dd>

                            <dt class="col-3">Model:</dt>
                            <dd class="col-9">Cotton, Jeans</dd>

                            <dt class="col-3">Manufacturer</dt>
                            <dd class="col-9">Reebook</dd>
                        </div>

                        <hr />

                        <div class="row mb-4">
                            <!-- col.// -->
                            <div class="col-md-4 col-6 mb-3">
                                <label class="mb-2 d-block">Quantity</label>
                                <div class="input-group mb-3" style="width: 170px;">
                                    <button class="btn btn-white border border-secondary px-3" type="button" id="button-addon1" data-mdb-ripple-color="dark">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <input type="text" class="form-control text-center border border-secondary" placeholder="14" aria-label="Example text with button addon" aria-describedby="button-addon1" />
                                    <button class="btn btn-white border border-secondary px-3" type="button" id="button-addon2" data-mdb-ripple-color="dark">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-4 col-6">
                                <a href="#" class="btn btn-primary shadow-0"><i class="me-1 fa fa-shopping-basket"></i>Add to cart </a>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </section>
    <!-- content -->
</asp:Content>
