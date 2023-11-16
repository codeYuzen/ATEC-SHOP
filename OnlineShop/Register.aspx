<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineShop.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="h-100 bg-white">
  <div class="container py-5 h-100">
      <h1 style="text-align: center"><asp:Label ID="lbl_message" runat="server" Text=""></asp:Label></h1>
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-6 d-none d-xl-block">
              <img src="Images/32318401_7922058.jpg"
                alt="Sample photo" class="img-fluid"
                style="border-top-left-radius: .15rem; border-bottom-left-radius: .15rem;" />
            </div>
            <div class="col-xl-6">
              <div class="card-body p-md-5 text-black">
                <h3 class="mb-5 text-uppercase">Create your account</h3>

                <div class="form-outline mb-4">
                  <asp:TextBox type="text" ID="email" runat="server" class="form-control form-control-lg"></asp:TextBox>
                  <label class="form-label" for="email">Email</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-outline mb-4">
                  <asp:TextBox type="password" ID="password" runat="server" class="form-control form-control-lg"></asp:TextBox>
                  <label class="form-label" for="password">Password</label>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="confirmPW" ControlToValidate="password" ErrorMessage="*" ForeColor="Red">Password doesn&#39;t match</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-outline mb-4">
                  <asp:TextBox type="password" ID="confirmPW" runat="server" class="form-control form-control-lg"></asp:TextBox>
                  <label class="form-label" for="confirmPW">Confirm Password</label>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <asp:TextBox type="text" ID="firstName" runat="server" class="form-control form-control-lg"></asp:TextBox>
                      <label class="form-label" for="firstName">First name</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="firstName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <asp:TextBox type="text" ID="lastName" runat="server" class="form-control form-control-lg"></asp:TextBox>
                      <label class="form-label" for="lastName">Last name</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lastName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                  </div>
                </div>

                <div class="form-outline mb-4">
                    <asp:TextBox type="text" ID="address" runat="server" class="form-control form-control-lg"></asp:TextBox>
                    <label class="form-label" for="address">Address</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="address" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="form-outline">
                            <asp:TextBox type="text" ID="postalCode" runat="server" class="form-control form-control-lg"></asp:TextBox>
                            <label class="form-label" for="postalCode">Postal Code</label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="postalCode" ErrorMessage="*" ForeColor="Red" ValidationExpression="^\d{4}(-\d{3})?$">Postal Code not valid</asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="form-outline">
                            <asp:TextBox type="text" ID="region" runat="server" class="form-control form-control-lg"></asp:TextBox>
                            <label class="form-label" for="region">Region</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="region" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-end pt-3">
                  <asp:Button ID="resetAll" runat="server" Text="Reset" class="btn btn-light btn-lg" OnClick="resetAll_Click"/>
                  <asp:Button ID="registerUser" runat="server" Text="Register" class="btn btn-warning btn-lg ms-2" OnClick="registerUser_Click"/>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</asp:Content>
