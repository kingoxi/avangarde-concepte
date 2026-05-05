<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KZ.WebUI.Default" %>

<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="KZ.Core" %>
<%@ Import Namespace="KZ.WebUI.Tool.Concrete" %>
<%@ Import Namespace="KZ.Entity.Enums" %>
<%@ Import Namespace="KZ.Business.Concrete" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta property="og:locale" content="tr_TR" />
    <asp:Literal ID="ltlOgTitle" runat="server"></asp:Literal>
    <asp:Literal ID="ltlOgSiteName" runat="server"></asp:Literal>
    <asp:Literal ID="ltlOgDesciprion" runat="server"></asp:Literal>
    <meta name="twitter:card" content="summary" />
    <asp:Literal ID="ltlTwitter_Title" runat="server"></asp:Literal>
    <asp:Literal ID="ltlTwitter_Description" runat="server"></asp:Literal>
    <asp:Literal ID="ltlTwitter_Url" runat="server"></asp:Literal>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <div class="slider-area style-1">
        <div class="te-slider-wrapper">
            <asp:Repeater ID="rptSliderList" runat="server">
                <ItemTemplate>
                    <div class="te-single-slider-wrapper">
                        <div class="te-single-slider" style="background-image: url(/Management/UploadFiles/Slider_Images/<%# Eval("Image") %>);">

                            <%# Eval(Resources.value.eval_Description) %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <asp:Literal ID="ltlContent1" runat="server"></asp:Literal>


    <asp:Literal ID="ltlContent2" runat="server"></asp:Literal>
<div class="brand-slider-area style-1 background-red">
    </div>
    <asp:Literal ID="ltlContent3" runat="server"></asp:Literal>

    <div class="testimonial-slider-area style-1 te-py-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="testimonial-image">
                        <img src="/site_files/images/resimler/yorum.jpg" alt="Avangarde Concept Perde tamamlanan perde uygulaması" title="Perde ve dekorasyon uygulaması" />
                    </div>
                    <div class="te-slider-btn-wrapper style-1 mt-3">
                        <a class="te-slider-nav te-slider-prev" id="testimonial_slider_prev" title="Önceki müşteri yorumu">
                            <i class="fa-solid fa-angle-left"></i>
                        </a>
                        <a class="te-slider-nav te-slider-next" id="testimonial_slider_next" title="Sonraki müşteri yorumu">
                            <i class="fa-solid fa-angle-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">

                    <asp:Literal ID="ltlContent4" runat="server"></asp:Literal>

                    <div class="te-testimonial-slider-wrapper" id="testimonial_two">

                        <asp:Repeater ID="rptCommentList" runat="server">
                            <ItemTemplate>
                                <div class="te-slick-item">
                                    <div class="te-testimonial-card-two">
                                        <div class="te-content-wrapper">
                                            <div class="te-user-meta">
                                                <div class="te-user-info">

                                                    <h2 class="name">
                                                        <%# Eval("Name") %> <%# Eval("Surname") %>
                                                    </h2>
                                                    <span class="designation">
                                                        <%# Eval("Title") %>
                                                    </span>
                                                </div>

                                            </div>
                                            <div class="content">
                                                <p>
                                                    <%# Eval("Description") %>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:Literal ID="ltlContent5" runat="server"></asp:Literal>

    <div class="faq-area style-1 backgorund-black" style="padding-bottom: 50px">
        <div class="container">
            <div class="row gy-5">

                <asp:Literal ID="ltlContent6" runat="server"></asp:Literal>

                <div class="col-xl-6 order-2 order-xxl-1 order-xl-1">
                    <!-- Accordion Start -->
                    <div class="accordion-wrapper">
                        <div class="te-accordion-box-wrapper" id="faq_list">

                            <asp:Repeater ID="rptSssList" runat="server">
                                <ItemTemplate>
                                    <div class="te-accordion-list-item">
                                        <div id="heading<%# Eval("Id") %>">
                                            <div class="te-accordion-head collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapse<%# Eval("Id") %>"
                                                aria-expanded="true" aria-controls="collapse<%# Eval("Id") %>">
                                                <h3 class="te-accordion-title">
                                                    <%# Eval("Title") %>
                                                </h3>
                                            </div>
                                        </div>
                                        <div id="collapse<%# Eval("Id") %>" class="accordion-collapse collapse" aria-labelledby="heading<%# Eval("Id") %>"
                                            data-bs-parent="#faq_list">
                                            <div class="te-accordion-body">
                                                <p>
                                                    <%# Eval("Description") %>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="appointment-area style-1 d-none" style="background-image: url(&quot;/site_files/images/section-bg/appointment-bg.jpg&quot;);">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <!-- Comment Form Start -->
                    <div class="te-comment-respond style-2 mt-0">
                        <h2 class="title text-white">
                            <%= Resources.value.On_Bilgi_Formu %>
                        </h2>
                        <div class="te-comment-form">
                            <div class="row gx-4">
                                <div class="col-xl-6">
                                    <div class="te-contacts-email">
                                       
                                        <asp:TextBox runat="server" ID="txtNameSurname" ClientIDMode="Static" placeholder="<%$ Resources:value, Adiniz_Soyadiniz %>"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="col-xl-6">
                                    <div class="te-contacts-name">
                                        <asp:TextBox runat="server" ID="txtPhone" ClientIDMode="Static" placeholder="<%$ Resources:value, Telefon %>"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="te-contacts-email">
                                        <asp:TextBox runat="server" ID="txtMail" ClientIDMode="Static" placeholder="<%$ Resources:value, E_Posta %>"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="te-contacts-message">
                                        <asp:TextBox runat="server" ID="txtMessage" ClientIDMode="Static" TextMode="MultiLine" Height="100" placeholder="<%$ Resources:value, Mesajiniz %>"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="te-contacts-message">
                                        <asp:Image ID="imgKod" runat="server" alt="Güvenlik kodu doğrulama görseli"/>
                                        <br />
                                        <br />
                                        <asp:TextBox ID="txtCode" runat="server" ClientIDMode="Static" placeholder="<%$ Resources:value, Guvenlik_Kodu %>"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12 mt-5">

                                    <asp:Button runat="server" ID="btnSend" Text="<%$ Resources:value, Gonder %>" OnClientClick="return homeValidation();" OnClick="btnSend_OnClick" CssClass="te-theme-btn" />
                                    <br />
                                    <br />
                                    <asp:Literal ID="ltlMessage" runat="server"></asp:Literal>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Comment Form End -->
                </div>
            </div>
        </div>
    </div>

    <asp:Literal ID="ltlContent7" runat="server"></asp:Literal>

    <div class="latest-posts-area style-1 position-relative te-py-120">

        <div class="container">

            <asp:Literal ID="ltlContent8" runat="server"></asp:Literal>

            <div class="row gy-4">
                <asp:Repeater ID="rptBlogList" runat="server">
                    <ItemTemplate>
                        <div class="col-12 col-md-4">
                            <article class="home-blog-card">

                                <a class="home-blog-card-image" href="/<%= Resources.value.url_Folder %><%= Resources.value.url_Blog %>/<%# Tools.UrlSeo(Eval(Resources.value.eval_Title).ToString()) %>-<%# Eval("Id") %>" title="<%# Eval(Resources.value.eval_Title) %>">
                                    <img src="/Management/UploadFiles/Blog_Images/Small_<%# Eval(Resources.value.eval_Image) %>" alt="<%# Eval(Resources.value.eval_Title) %>" title="<%# Eval(Resources.value.eval_Title) %>" />
                                    <div class="home-blog-card-date">
                                        <span><%# Convert.ToDateTime(Eval("CreationDate")).ToString("dd") %></span>
                                        <span><%# Convert.ToDateTime(Eval("CreationDate")).ToString("MMM") %></span>
                                    </div>
                                </a>
                                <div class="home-blog-card-content">
                                    <h3>
                                        <a href="/<%= Resources.value.url_Folder %><%= Resources.value.url_Blog %>/<%# Tools.UrlSeo(Eval(Resources.value.eval_Title).ToString()) %>-<%# Eval("Id") %>" title="<%# Eval(Resources.value.eval_Title) %>">
                                            <%# Eval(Resources.value.eval_Title) %>
                                        </a>
                                    </h3>
                                    <a class="button-74" role="button" href="/<%= Resources.value.url_Folder %><%= Resources.value.url_Blog %>/<%# Tools.UrlSeo(Eval(Resources.value.eval_Title).ToString()) %>-<%# Eval("Id") %>" title="<%# Eval(Resources.value.eval_Title) %>">
                                        Devamını Oku
                                    </a>
                                </div>
                            </article>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="custom" runat="server">
    <script>
        function homeValidation() {
            var isValid = true;

            $('#txtNameSurname, #txtMail, #txtPhone, #txtMessage, #txtCode').each(function () {
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
