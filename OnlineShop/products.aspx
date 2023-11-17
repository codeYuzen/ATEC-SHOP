<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="OnlineShop.products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- local css -->
    <link rel="stylesheet" href="css/admin.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="inputs" class="container-fluid">
        <div class="row g-2" style="margin-left: 4%; margin-top: 4%">
            <h1 class="text-light d-flex justify-content-center mb-5">Manage Products</h1>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Serial</label>
                    <asp:TextBox ID="tb_serial" placeholder="Serial" Style="text-transform: uppercase" class="form-control" runat="server"></asp:TextBox>
<%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Serial is required"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Price</label>
                    <asp:TextBox ID="tb_price" placeholder="Price" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
<%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Price is required"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Category </label>
                    <asp:DropDownList ID="ddl_category" placeholder="Category" class="form-control" runat="server" AppendDataBoundItems="false">
                        <asp:ListItem Text="Select Category" Value="" />
                        <asp:ListItem>Cases</asp:ListItem>
                        <asp:ListItem>Coolers</asp:ListItem>
                        <asp:ListItem>Graphic Cards</asp:ListItem>
                        <asp:ListItem>Memory</asp:ListItem>
                        <asp:ListItem>Motherboards</asp:ListItem>
                        <asp:ListItem>Power Supplies</asp:ListItem>
                        <asp:ListItem>Processors</asp:ListItem>
                        <asp:ListItem>Storage</asp:ListItem>
                    </asp:DropDownList>
<%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Category is required"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Manufacturer </label>
                    <asp:DropDownList ID="ddl_manufacturer" placeholder="Manufacturer" class="form-control" runat="server" AppendDataBoundItems="false">
                        <asp:ListItem Text="Select Manufacturer" Value="" />
                        <asp:ListItem>Acer</asp:ListItem>
                        <asp:ListItem>AMD</asp:ListItem>
                        <asp:ListItem>ARCTIC</asp:ListItem>
                        <asp:ListItem>ASRock</asp:ListItem>
                        <asp:ListItem>Asus</asp:ListItem>
                        <asp:ListItem>be quiet!</asp:ListItem>
                        <asp:ListItem>Cooler Master</asp:ListItem>
                        <asp:ListItem>Corsair</asp:ListItem>
                        <asp:ListItem>Crucial</asp:ListItem>
                        <asp:ListItem>Deepcool</asp:ListItem>
                        <asp:ListItem>EVGA</asp:ListItem>
                        <asp:ListItem>Fractal Design</asp:ListItem>
                        <asp:ListItem>G.Skill</asp:ListItem>
                        <asp:ListItem>Intel</asp:ListItem>
                        <asp:ListItem>Kingston</asp:ListItem>
                        <asp:ListItem>KIOXIA</asp:ListItem>
                        <asp:ListItem>Lian Li</asp:ListItem>
                        <asp:ListItem>Noctua</asp:ListItem>
                        <asp:ListItem>NOX</asp:ListItem>
                        <asp:ListItem>MSI</asp:ListItem>
                        <asp:ListItem>NVIDIA</asp:ListItem>
                        <asp:ListItem>NZXT</asp:ListItem>
                        <asp:ListItem>Samsung</asp:ListItem>
                        <asp:ListItem>Sapphire</asp:ListItem>
                        <asp:ListItem>Seagate</asp:ListItem>
                        <asp:ListItem>SeaSonic</asp:ListItem>
                        <asp:ListItem>Thermaltake</asp:ListItem>
                        <asp:ListItem>Western Digital</asp:ListItem>
                        <asp:ListItem>XFX</asp:ListItem>
                        <asp:ListItem>Zotac</asp:ListItem>
                    </asp:DropDownList>
<%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Manufacturer is required"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Model </label>
                    <asp:TextBox ID="tb_model" placeholder="Model" class="form-control" runat="server"></asp:TextBox>
<%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Model is required"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Color </label>
                    <asp:DropDownList ID="ddl_color" placeholder="Color" class="form-control" runat="server" AppendDataBoundItems="false">
                        <asp:ListItem Text="None" Value="" />
                        <asp:ListItem>Beige</asp:ListItem>
                        <asp:ListItem>Black</asp:ListItem>
                        <asp:ListItem>Blue</asp:ListItem>
                        <asp:ListItem>Camo</asp:ListItem>
                        <asp:ListItem>Gold</asp:ListItem>
                        <asp:ListItem>Grey</asp:ListItem>
                        <asp:ListItem>Green</asp:ListItem>
                        <asp:ListItem>Orange</asp:ListItem>
                        <asp:ListItem>Purple</asp:ListItem>
                        <asp:ListItem>Red</asp:ListItem>
                        <asp:ListItem>Silver</asp:ListItem>
                        <asp:ListItem>Yellow</asp:ListItem>
                        <asp:ListItem>White</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
<%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Color is required"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Photo</label>
                    <asp:TextBox ID="tb_photoProduct" placeholder="Photo" class="form-control" runat="server"></asp:TextBox>
                    <!-- URL or Upload -->
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Stock</label>
                    <asp:TextBox ID="tb_stock" placeholder="Stock" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
<%--                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Stock is required"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Description</label>
                    <asp:TextBox ID="tb_desc" placeholder="Description" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">&nbsp;</label>
                    <br>
                    <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="Submit"></asp:Button>
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
                    <th scope="col">Serial</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col">Manufacturer</th>
                    <th scope="col">Model</th>
                    <th scope="col">Color</th>
                    <th scope="col">Photo</th>
                    <th scope="col">Stock</th>
                    <th scope="col">Desc</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody id="tb">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemCreated" OnItemCreated="Repeater1_ItemCreated">
                    <ItemTemplate>
                        <tr>
                            <td><button type="button" class="btn btn-secondary btn-sm" onclick="clickEditComponent(${component.id})"><i class="fa-solid fa-pen-to-square"></i></button></td>
                            <td><asp:Label ID="lbl_serial" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_price" runat="server"></asp:Label> €</td>
                            <td><asp:Label ID="lbl_category" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_manufacturer" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_model" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_color" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_photo" runat="server"></asp:Label></td> <!-- Conseguir colocar o url da imagem num img src -->
                            <td><asp:Label ID="lbl_stock" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lbl_description" runat="server"></asp:Label></td> <!-- Guardar a info daqui num modal ou botão -->
                            <td><button type="button" class="btn btn-danger btn-sm" onclick="clickDeleteComponent(${component.id})"><i class="fa-solid fa-trash"></i></button></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineShopConnectionString %>"
                    SelectCommand="SELECT [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description] FROM [Products]"></asp:SqlDataSource>
            </tbody>
        </table>
    </div>
</asp:Content>
