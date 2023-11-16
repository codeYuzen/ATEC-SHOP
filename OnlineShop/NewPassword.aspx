﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="NewPassword.aspx.cs" Inherits="OnlineShop.NewPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <!--head links -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="h-100 bg-transparent">
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
                <h3 class="mb-5 text-uppercase">Change Password</h3>

                <div class="form-outline mb-3">
                  <asp:TextBox type="password" ID="newPW" runat="server" class="form-control form-control-lg"></asp:TextBox>
                  <label class="form-label" for="newPW">Password</label>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="confirmPW" ControlToValidate="newPW" ErrorMessage="*" ForeColor="Red"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="newPW" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>

                <div class="form-outline mb-3">
                  <asp:TextBox type="password" ID="confirmPW" runat="server" class="form-control form-control-lg"></asp:TextBox>
                  <label class="form-label" for="confirmPW">Confirm Password</label>
                </div>

                <div class="d-flex justify-content-end pt-3">
                  <asp:Button ID="changePW" runat="server" Text="Submit" class="btn btn-warning btn-lg ms-2" OnClick="changePW_Click"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</asp:Content>
