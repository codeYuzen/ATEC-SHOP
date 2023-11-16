<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="OnlineShop.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="inputs" class="container-fluid">
        <div class="row g-2" style="margin-left: 4%; margin-top: 4%">
            <h1 class="text-light d-flex justify-content-center mb-5">Admin Control Panel</h1>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Serial</label>
                    <!-- <input type="text" id="inputSerial" placeholder="Serial" style="text-transform: uppercase"
                        oninput="this.value = this.value.toUpperCase()" class="form-control"> -->
                    <asp:TextBox ID="tb_serial" placeholder="Serial" style="text-transform: uppercase" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Price</label>
                     <!-- <input type="number" id="inputPrice" placeholder="Number" step="0.01" min="0" value="0"
                        class="form-control"> -->
                    <asp:TextBox ID="tb_price" placeholder="Number" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Category </label>
                    <!-- <select name="Category" id="inputCategory" class="form-control">
                        <option value="Select Category" selected disabled hidden>Select Category</option>
                        <option value="Cases">Cases</option>
                        <option value="Coolers">Coolers</option>
                        <option value="Graphics Cards">Graphics Cards</option>
                        <option value="Memory">Memory</option>
                        <option value="Motherboards">Motherboards</option>
                        <option value="Power Supplies">Power Supplies</option>
                        <option value="Processors">Processors</option>
                        <option value="Storage">Storage</option>
                    </select> -->
                    <asp:DropDownList ID="ddl_category" class="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Manufacturer </label>
                    <!-- <select name="Manufacturer" id="inputManufacturer" class="form-control">
                        <option value="Select Manufacturer" selected disabled hidden>Select Manufacturer</option>
                        <option value="Acer">Acer</option>
                        <option value="AMD">AMD</option>
                        <option value="ARCTIC">ARCTIC</option>
                        <option value="ASRock">ASRock</option>
                        <option value="Asus">Asus</option>
                        <option value="be quiet!">be quiet!</option>
                        <option value="Cooler Master">Cooler Master</option>
                        <option value="Corsair">Corsair</option>
                        <option value="Crucial">Crucial</option>
                        <option value="Deepcool">Deepcool</option>
                        <option value="EVGA">EVGA</option>
                        <option value="Fractal Design">Fractal Design</option>
                        <option value="G.Skill">G.Skill</option>
                        <option value="Gigabyte">Gigabyte</option>
                        <option value="Intel">Intel</option>
                        <option value="Kingston">Kingston</option>
                        <option value="KIOXIA">KIOXIA</option>
                        <option value="Lian Li">Lian Li</option>
                        <option value="Noctua">Noctua</option>
                        <option value="NOX">NOX</option>
                        <option value="MSI">MSI</option>
                        <option value="NVIDIA">NVIDIA</option>
                        <option value="NZXT">NZXT</option>
                        <option value="Samsung">Samsung</option>
                        <option value="Sapphire">Sapphire</option>
                        <option value="Seagate">Seagate</option>
                        <option value="SeaSonic">SeaSonic</option>
                        <option value="Thermaltake">Thermaltake</option>
                        <option value="Western Digital">Western Digital</option>
                        <option value="XFX">XFX</option>
                        <option value="Zotac">Zotac</option>
                    </select> -->
                    <asp:DropDownList ID="ddl_manufacturer" class="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Model </label>
                    <!-- <input type="text" id="inputModel" placeholder="Model" class="form-control"> -->
                    <asp:TextBox ID="tb_model" placeholder="Model" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Color </label>
                    <!-- <select name="Color" id="inputColor" class="form-control">
                        <option value="None">None</option>
                        <option value="Beige">Beige</option>
                        <option value="Black">Black</option>
                        <option value="Blue">Blue</option>
                        <option value="Camo">Camo</option>
                        <option value="Gold">Gold</option>
                        <option value="Grey">Grey</option>
                        <option value="Green">Green</option>
                        <option value="Orange">Orange</option>
                        <option value="Purple">Purple</option>
                        <option value="Red">Red</option>
                        <option value="Silver">Silver</option>
                        <option value="Yellow">Yellow</option>
                        <option value="White">White</option>
                    </select> -->
                    <asp:DropDownList ID="ddl_color" class="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Photo</label>
                    <!-- <input type="url" id="inputPhoto" placeholder="URL" class="form-control"> -->
                    <asp:TextBox ID="tb_photo" placeholder="URL" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Stock</label>
                    <!-- <input type="number" placeholder="Number" step="1" min="0" id="inputStock" value="0"
                        class="form-control"> -->
                    <asp:TextBox ID="tb_stock" placeholder="Number" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">Details</label>
                    <!-- <input type="url" id="inputDetails" placeholder="URL" class="form-control"> -->
                    <asp:TextBox ID="tb_details" placeholder="URL" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-xs col-sm col-md">
                <div class="form-outline">
                    <label class="form-label text-light">&nbsp;</label>
                    <br>
                    <!-- <button type="button" onclick="clickAddComponent()" class="btn btn-primary" id="submit">
                        <i class="fa-solid fa-circle-plus"></i>
                    </button> -->
                    <asp:Button ID="btn_submit" runat="server" class="btn btn-primary" Text="Submit" />
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
                    <th scope="col">Details</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody id="tb"></tbody>
        </table>
    </div>
</asp:Content>
