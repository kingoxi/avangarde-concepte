<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MenuList.aspx.cs" Inherits="KZ.WebUI.General_Pages.MenuList" EnableViewState="false" %>

<%@ Import Namespace="KZ.Core" %>
<%@ Import Namespace="KZ.Business.Concrete" %>
<%@ Import Namespace="KZ.WebUI.Tool" %>
<%@ Import Namespace="KZ.Entity.Enums" %>

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
                        <span>
                            <asp:Literal ID="ltlMenuName" runat="server"></asp:Literal>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <asp:Literal ID="ltlDescription" runat="server"></asp:Literal>

    <div class="container">
        <div class="row mt-5">
            <asp:Repeater ID="rptGalleryImageList" runat="server">
                <ItemTemplate>

                    <div class="col-sm-4 col-6 mb-5">
                        <a href="/Management/UploadFiles/Gallery_Images/Big_<%# Eval("Image") %>" data-fancybox="gallery">
                            <img src="/Management/UploadFiles/Gallery_Images/<%# Eval("Image") %>" />
                        </a>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="custom" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
</asp:Content>
