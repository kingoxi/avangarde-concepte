<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BlogDetail.aspx.cs" Inherits="KZ.WebUI.General_Pages.BlogDetail" EnableViewState="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta property="og:locale" content="tr_TR" />
    <asp:Literal ID="ltlOgTitle" runat="server"></asp:Literal>
    <asp:Literal ID="ltlOgSiteName" runat="server"></asp:Literal>
    <asp:Literal ID="ltlOgDesciprion" runat="server"></asp:Literal>

    <meta name="twitter:card" content="summary" />
    <asp:Literal ID="ltlTwitter_Title" runat="server"></asp:Literal>
    <asp:Literal ID="ltlTwitter_Description" runat="server"></asp:Literal>
    <asp:Literal ID="ltlTwitter_Url" runat="server"></asp:Literal>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css" />

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
                        <a href="/<%= Resources.value.url_Folder %><%= Resources.value.url_Blog %>">
                            <%= Resources.value.Blog %>
                        </a>
                    </li>
                    <li>
                        <span>
                           <asp:Literal ID="ltlTitle" runat="server"></asp:Literal>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <section class="blog-detail-section-full">
        <div class="container">
            <div class="blog-hero-image">

                <asp:Literal ID="ltlImage" runat="server"></asp:Literal>
            </div>
        </div>

        <div class="container">
            <article class="blog-detail-full">
                <div class="blog-detail-body">
                    <div class="blog-detail-meta">
                        <span>
                            <i class="fa-solid fa-calendar"></i>
                            <asp:Literal ID="ltlDate" runat="server"></asp:Literal>
                        </span>
                    </div>

                    <h1>
                        <%= ltlTitle.Text %>
                    </h1>


                    <div class="blog-content-text">
                        <asp:Literal ID="ltlDescription" runat="server"></asp:Literal>
                    </div>

                    <div class="blog-detail-actions">
                        <a class="button-74" role="button" href="/<%= Resources.value.url_Folder %><%= Resources.value.url_Blog %>">
                            Tüm Yazılar
                        </a>
                    </div>
                </div>
            </article>

            <div class="row blog-detail-gallery g-4">
                <asp:Repeater ID="rptGalleryImageList" runat="server">
                    <ItemTemplate>

                        <div class="col-lg-4 col-sm-6">
                            <a class="blog-detail-gallery-item" href="/Management/UploadFiles/Gallery_Images/Big_<%# Eval("Image") %>" data-fancybox="gallery">
                                <img src="/Management/UploadFiles/Gallery_Images/<%# Eval("Image") %>" alt="Galeri görseli" />
                            </a>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>
    </section>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="custom" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
</asp:Content>
