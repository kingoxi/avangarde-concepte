<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="KZ.WebUI.General_Pages.Contact" MaintainScrollPositionOnPostback="true" %>

<%@ Import Namespace="KZ.Business.Concrete" %>
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
                            <%= Resources.value.iletisim %>
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
                    <%= Resources.value.iletisim %>
                </h1>
            </div>
            <div class="row">
                <div class="col-lg-8">
                    <div class="contact-form-wrapper">
                        <h3>
                            <%= Resources.value.iletisimFormu %>
                        </h3>
                        <div class="contact-form">
                            <div class="row">
                                <div class="col-md-12">
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
                                            <%= Resources.value.Telefon %>
                                        </label>
                                        <asp:TextBox runat="server" ID="txtPhone" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
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
                                <div class="col-md-12">
                                    <div class="form-group">

                                        <label>
                                            <%= Resources.value.Konu %>
                                        </label>

                                        <asp:DropDownList ID="ddlSubjectList" runat="server" CssClass="form-select" ClientIDMode="Static">
                                            <asp:ListItem Text="Konu Seçiniz" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Özel Tasarım Perde" Value="Özel Tasarım Perde"></asp:ListItem>
                                            <asp:ListItem Text="Hizmetlerimiz" Value="Hizmetlerimiz"></asp:ListItem>
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
                                        <asp:Image ID="imgKod" runat="server" alt="Güvenlik kodu doğrulama görseli" title="Güvenlik kodu" />
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

                <div class="col-lg-4">
                    <div class="contact-info-wrapper">
                        <div class="contact-info-box contact-info-item">
                            <div class="contact-info-icon">
                                <i class="fa-solid fa-map-marker-alt"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4>
                                    MERKEZ / ADRES
                                </h4>
                                <p>
                                    <%=StaticGeneralSettingManager.GeneralSettingData().Address %>
                                </p>

                            </div>
                        </div>

                        <div class="contact-info-box contact-info-item">
                            <div class="contact-info-icon">
                                <i class="fa-solid fa-phone"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4>
                                    <%= Resources.value.Telefon %>
                                </h4>
                                <a href="tel:+<%= StaticGeneralSettingManager.GeneralSettingData().Phone.Replace(" ","").Replace("(","").Replace(")","").Replace("+","") %>" title="Avangarde Concept Perde telefon">
                                    <%=StaticGeneralSettingManager.GeneralSettingData().Phone %>
                                </a>
                            </div>
                        </div>

                        <div class="contact-info-box contact-info-item">
                            <div class="contact-info-icon">
                                <i class="fa-brands fa-whatsapp"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4>WhatsApp</h4>
                                <a href="tel:+<%= StaticGeneralSettingManager.GeneralSettingData().Phone2.Replace(" ","").Replace("(","").Replace(")","").Replace("+","") %>" title="Avangarde Concept Perde WhatsApp">
                                    <%=StaticGeneralSettingManager.GeneralSettingData().Phone2 %>
                                </a>
                            </div>
                        </div>

                        <div class="contact-info-box contact-info-item">
                            <div class="contact-info-icon">
                                <i class="fa-solid fa-envelope"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4><%= Resources.value.E_Posta %></h4>
                                <a href="mailto:<%=StaticGeneralSettingManager.GeneralSettingData().Mail %>" title="Avangarde Concept Perde e-posta">
                                    <%=StaticGeneralSettingManager.GeneralSettingData().Mail %>
                                </a>
                            </div>
                        </div>

                        <div class="contact-info-box contact-info-item">
                            <div class="contact-info-icon">
                                <i class="fa-solid fa-clock"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4>Çalışma Saatleri</h4>
                                <p>Pazartesi - Cumartesi 09:00 - 19:00</p>
                            </div>
                        </div>


                        <div class="contact-social ">
                            <h4>
                                <%= Resources.value.Sosyal_Medya %>
                            </h4>
                            <div class="social-links">
                                <a href="<%=StaticGeneralSettingManager.GeneralSettingData().Facebook %>" target="_blank" title="Facebook"><i class="fa-brands fa-facebook-f"></i></a>

                                <a href="<%=StaticGeneralSettingManager.GeneralSettingData().Twitter %>" target="_blank" title="Twitter"><i class="fa-brands fa-twitter"></i></a>

                                <a href="<%=StaticGeneralSettingManager.GeneralSettingData().Instagram %>" target="_blank" title="Instagram"><i class="fa-brands fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <section class="map-section">
        <div class="container-fluid p-0">
            <div class="map-wrapper" id="contactMap">
                <%=StaticGeneralSettingManager.GeneralSettingData().Maps %>
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
