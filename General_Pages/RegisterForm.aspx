<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="KZ.WebUI.General_Pages.RegisterForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="breadcrumb-area">
        <div class="container">
            <div class="breadcrumb-content">
                <ul class="breadcrumb-list">
                    <li>
                        <a href="/<%= Resources.value.url_Folder %>">
                            <%= Resources.value.Anasayfa %>
                        </a>
                    </li>
                    <li>
                        <span>
                            <%= Resources.value.On_Kayit_Formu %>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <section class="contact-section">
        <div class="container">
            <div class="section-header">
                <h1>
                    <%= Resources.value.On_Kayit_Formu %>
                </h1>
            </div>
            <div class="row w-100 d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="contact-form-wrapper">
                        <div class="contact-form">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>
                                            <%= Resources.value.Adiniz_Soyadiniz %>
                                        </label>
                                        <asp:TextBox runat="server" ID="txtNameSurname" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>
                                            <%= Resources.value.E_Posta %>
                                        </label>
                                        <asp:TextBox runat="server" ID="txtMail" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>
                                            <%= Resources.value.Telefon %>
                                        </label>
                                        <asp:TextBox runat="server" ID="txtPhone" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>
                                            <%= Resources.value.Konu %>
                                        </label>

                                        <asp:DropDownList ID="ddlSubjectList" runat="server" CssClass="form-select" ClientIDMode="Static">
                                            <asp:ListItem Text="Konu Seçiniz" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Eğitim Programları" Value="Eğitim Programları"></asp:ListItem>
                                            <asp:ListItem Text="Hizmetlerimiz" Value="Hizmetlerimiz"></asp:ListItem>
                                            <asp:ListItem Text="Ön Kayıt" Value="Ön Kayıt"></asp:ListItem>
                                            <asp:ListItem Text="Diğer" Value="Diğer"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>
                                            <%= Resources.value.Mesajiniz %>
                                        </label>

                                        <asp:TextBox runat="server" ID="txtMessage" ClientIDMode="Static" TextMode="MultiLine" Height="100" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12">

                                    <div class="form-group">
                                        <label>
                                            <%= Resources.value.Guvenlik_Kodu %>
                                        </label>
                                        <asp:Image ID="imgKod" runat="server" />
                                        <br />
                                        <br />
                                        <asp:TextBox ID="txtCode" runat="server" ClientIDMode="Static" placeholder="<%$ Resources:value, Guvenlik_Kodu %>" CssClass="form-control"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="col-12">

                                    <asp:Button runat="server" ID="btnSend" Text="<%$ Resources:value, Gonder %>" OnClientClick="return contactValidation();" OnClick="btnSend_OnClick" CssClass="submit-btn" />
                                    <br />
                                    <br />
                                    <asp:Literal ID="ltlMessage" runat="server"></asp:Literal>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="custom" runat="server">
    <script>
        function contactValidation() {
            var isValid = true;

            $('#txtNameSurname, #txtMail, #txtPhone, #ddlSubjectList, #txtMessage, #txtCode').each(function () {
                if ($.trim($(this).val()) == '0' || $.trim($(this).val()) == '') {
                    isValid = false;
                    $(this).css({
                        "border": "1px solid red",
                        "background": "#FFCECE"
                    });
                }
                else {
                    $(this).css({
                        "border": "",
                        "background": ""
                    });
                }
            });

            if (isValid == false) {
                return false;
            }
            else {
                return true;
            }
        };
    </script>
</asp:Content>
