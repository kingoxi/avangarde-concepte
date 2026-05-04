<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormSuccess.aspx.cs" Inherits="KZ.WebUI.General_Pages.FormSuccess" EnableViewState="false" %>

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
                            <%= Resources.value.Mesaj_Bilgilendirme %>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <section class="about-page-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <img src="/site_files/images/success.png" />
                    <br />
                    <br />
                    <%= Resources.value.formBasariliMesaj %>
                    <br />
                    <br />
                    <a href="/<%= Resources.value.url_Folder %>" class="btn btn-success" title="<%= Resources.value.Anasayfa_Don %>">
                        <%= Resources.value.Anasayfa_Don %>
                    </a>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="custom" runat="server">
</asp:Content>
