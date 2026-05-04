<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BlogList.aspx.cs" Inherits="KZ.WebUI.General_Pages.BlogList" EnableViewState="false" %>

<%@ Import Namespace="KZ.Core" %>

<%@ Register Src="~/UserControl/ucPageSeo.ascx" TagPrefix="uc1" TagName="ucPageSeo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <uc1:ucPageSeo runat="server" ID="ucPageSeo" />
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
                            <%= Resources.value.Blog %>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <!--
    SEO Title: Perde ve Dekorasyon Blogu | Avangarde Concept Perde
    SEO Description: Perde seçimi, dekorasyon önerileri, kumaş, duvar kağıdı ve motorlu perde sistemleri hakkında blog yazılarını inceleyin.
    SEO Keywords: perde blog, dekorasyon önerileri, perde seçimi, stor perde, zebra perde, motorlu perde sistemleri
    H1: Perde ve Dekorasyon Blogu
    -->

    <section class="blog-section">
        <div class="container">

            <div class="section-header">
                <h1>Avangarde Concept Perde ve Dekorasyon Blogu</h1>
                <p>Perde seçimi, dekorasyon önerileri, kumaş tercihleri ve yaşam alanlarına özel uygulama fikirleri hakkında hazırladığımız içerikleri inceleyebilirsiniz.</p>
            </div>


            <div class="row">

                <asp:Repeater ID="rptBlogList" runat="server">
                    <ItemTemplate>

                        <div class="col-lg-4 col-md-6">
                            <article class="blog-card-simple">
                                <div class="blog-card-image">
                                    <a href="/<%= Resources.value.url_Folder %><%= Resources.value.url_Blog %>/<%# Tools.UrlSeo(Resources.value.eval_Title) %>-<%# Eval("Id") %>" title="<%# Eval(Resources.value.eval_Title) %>">

                                        <img src="/Management/UploadFiles/Blog_Images/Small_<%# Eval(Resources.value.eval_Image) %>" alt="<%# Eval(Resources.value.eval_Title) %>" title="<%# Eval(Resources.value.eval_Title) %>" />

                                        <div class="blog-date-badge">
                                            <span class="day">
                                                <%# Convert.ToDateTime(Eval("CreationDate")).ToString("dd") %>
                                            </span>
                                            <span class="month">
                                                <%# Convert.ToDateTime(Eval("CreationDate")).ToString("MMM") %>
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="blog-card-content">

                                    <h3>
                                        <a href="/<%= Resources.value.url_Folder %><%= Resources.value.url_Blog %>/<%# Tools.UrlSeo(Resources.value.eval_Title) %>-<%# Eval("Id") %>" title="<%# Eval(Resources.value.eval_Title) %>">

                                            <%# Eval(Resources.value.eval_Title) %>

                                        </a>
                                    </h3>

                                    <a class="button-74" role="button" href="/<%= Resources.value.url_Folder %><%= Resources.value.url_Blog %>/<%# Tools.UrlSeo(Resources.value.eval_Title) %>-<%# Eval("Id") %>" title="<%# Eval(Resources.value.eval_Title) %>">
                                        Devamını Oku
                                    </a>
                                </div>
                            </article>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>


            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="custom" runat="server">
</asp:Content>
