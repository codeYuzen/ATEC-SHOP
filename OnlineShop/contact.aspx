<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="OnlineShop.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <!-- local css -->
    <link rel="stylesheet" href="css/contacts.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bootstrap snippets bootdeys p-4 mt-5">
        <h1 class="mb-5 text-center">Contact Us</h1>
        <div class="row text-center mb-4">
            <div class="col-sm-3">
                <div class="contact-detail-box">
                    <h4><i class="fas fa-user"></i> Bruno Rafael</h4>
                    <a target="blank" href="mailto:Bruno.Rafael.T0123761@edu.atec.pt"><i
                            class="fas fa-envelope"></i></a>
                    <a target="blank" href="https://www.linkedin.com/in/brafael14/"><i
                            class="fa-brands fa-linkedin"></i></a>
                    <a target="blank" href="https://github.com/brafaell14"><i class="fa-brands fa-github"></i></a>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="contact-detail-box">
                    <h4><i class="fas fa-user"></i> João Martins</h4>
                    <a target="blank" href="mailto:Joao.Martins.T0123777@edu.atec.pt"><i
                            class="fas fa-envelope"></i></a>
                    <a target="blank" href="https://www.linkedin.com/in/jo%C3%A3o-martins-a77622277/"><i
                            class="fa-brands fa-linkedin"></i></a>
                    <a target="blank" href="https://github.com/codeYuzen"><i class="fa-brands fa-github"></i></a>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="contact-detail-box">
                    <h4><i class="fas fa-user"></i> Onur Ergün</h4>
                    <a target="blank" href="mailto:Onur.Ergun.T0123772@edu.atec.pt"><i class="fas fa-envelope"></i></a>
                    <a target="blank" href="https://www.linkedin.com/in/onur-ergün-a4313b1b7/"><i
                            class="fa-brands fa-linkedin"></i></a>
                    <a target="blank" href="https://github.com/NoFlamerHere"><i class="fa-brands fa-github"></i></a>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="contact-detail-box">
                    <h4><i class="fas fa-user"></i> Rodrigo Silva</h4>
                    <a target="blank" href="mailto:Rodrigo.Silva.T0123773@edu.atec.pt"><i
                            class="fas fa-envelope"></i></a>
                    <a target="blank" href="https://www.linkedin.com/in/rodrigo-silva-92910b1a7/"><i
                            class="fa-brands fa-linkedin"></i></a>
                    <a target="blank" href="https://github.com/D34dlyK1ss"><i class="fa-brands fa-github"></i></a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="contact-map">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d24952.31456073992!2d-9.017665278822745!3d38.5789423387214!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd194622e5ad46d1%3A0x123b3f86b5ed915a!2sATEC%20-%20Academia%20de%20Forma%C3%A7%C3%A3o%20-%20Palmela!5e0!3m2!1spt-PT!2spt!4v1686689936529!5m2!1spt-PT!2spt"
                        frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                        style="width: 100%; height: 360px;"></iframe>
                </div>
            </div>

            <div class="col-sm-6">
                <div role="form" name="ajax-form" id="ajax-form"
                    action="https://formsubmit.io/send/coderthemes@gmail.com" method="post" class="form-main">

                    <div class="form-group">
                        <label for="name2">Name</label>
                        <!-- <input class="form-control" id="name2" name="name"
                            onblur="if(this.value == '') this.value='Name'"
                            onfocus="if(this.value == 'Name') this.value=''" type="text" value="Name"> -->
                        <asp:TextBox ID="tb_name" class="form-control" runat="server"></asp:TextBox>
                        <div class="error" id="err-name" style="display: none;">Please enter name</div>
                    </div>

                    <div class="form-group">
                        <label for="subject2">Subject</label>
                        <!-- <input class="form-control" id="subject2" name="subject" type="text"
                            onfocus="if(this.value == 'Subject') this.value='';"
                            onblur="if(this.value == '') this.value='Subject';" value="Subject"> -->
                        <asp:TextBox ID="tb_subject" class="form-control" runat="server"></asp:TextBox>
                        <div class="error" id="err-subjectvld" style="display: none;">Subject is not a valid format
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="message2">Message</label>
                        <!-- <textarea class="form-control" id="message2" name="message" rows="5"
                            onblur="if(this.value == '') this.value='Message'"
                            onfocus="if(this.value == 'Message') this.value=''">Message</textarea> -->
                        <asp:TextBox ID="tb_message" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox>
                        <div class="error" id="err-message" style="display: none;">Please enter message</div>
                    </div>

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- <button type="submit" class="btn btn-primary btn-shadow btn-rounded w-md mt-4">Submit</button> -->
                            <asp:Button ID="btn_submit" class="btn btn-primary btn-shadow btn-rounded w-md mt-4" runat="server" Text="Button" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
