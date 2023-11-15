<%@ Page Title="" Language="C#" MasterPageFile="~/Log.Master" AutoEventWireup="true" CodeBehind="Recover-Password.aspx.cs" Inherits="OnlineShop.Recover_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="h-100 bg-white">
  <div class="container py-5 h-100"/>
   <h1 style="text-align: center"><asp:Label ID="lbl_message" runat="server" Text=""></asp:Label></h1>
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-5 d-none d-xl-block">
              <img src="Images/32318401_7922058.jpg"
                alt="Sample photo" class="img-fluid"
                style="border-top-left-radius: .10rem; border-bottom-left-radius: .10rem;" />
            </div>
            <div class="col-xl-6">
              <div class="card-body p-md-5 text-black">
                <h3 class="mb-5 text-uppercase">Forgot Password</h3>

                <div class="form-outline mb-3">
                  <asp:TextBox type="text" ID="email" runat="server" class="form-control form-control-lg"></asp:TextBox>
                  <label class="form-label" for="email">Email</label>
                </div>

                <div class="d-flex justify-content-end pt-3">
                  <asp:Button ID="forgotPW" runat="server" Text="Submit" class="btn btn-warning btn-lg ms-2" OnClick="forgotPW_Click"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</asp:Content>
