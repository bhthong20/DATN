<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />
    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content=""/>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico"/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="../assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <link rel="stylesheet" href="../assets/vendor/libs/apex-charts/apex-charts.css"/>

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
    <script src="../js/menu.js"></script>
</head>

<body>
<!-- Layout wrapper -->

<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo">
                <a href="" class="app-brand-link">
                    <img src="/uploads/Diamond_Sneaker-removebg.png">
                </a>
            </div>

            <div class="menu-inner-shadow"></div>

            <ul class="menu-inner py-1">
                <!-- Dashboard -->
                <li class="menu-item">
                    <a href="/thong-ke" class="menu-link" aria-expanded="false">
                        <i class="menu-icon tf-icons bx bx-home-circle"></i>
                        <div data-i18n="Analytics">Thống kê</div>
                    </a>
                </li>

                <!-- BanHang -->
                <li class="menu-item">
                    <a href="/ban-hang-tai-quay" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-layout"></i>
                        <div data-i18n="Layouts">Bán hàng tại quầy</div>
                    </a>
                </li>

                <!-- Hoa don -->
                <li class="menu-item">
                    <a href="/hoa-don" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-dock-top"></i>
                        <div data-i18n="Account Settings">Quản Lý Đơn Hàng</div>
                    </a>
                </li>

                <!-- TaiKhoan -->
                <li class="menu-item">
                    <a href="javascript:void(0);" class="menu-link menu-toggle" aria-expanded="false">
                        <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
                        <div data-i18n="Authentications">Tài Khoản</div>
                    </a>
                    <ul class="menu-sub" aria-expanded="false">
                        <li class="menu-item">
                            <a href="/khach-hang/hien-thi" class="menu-link">
                                <div data-i18n="Basic">Khách hàng</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="/nhan-vien/hien-thi" class="menu-link">
                                <div data-i18n="Basic">Nhân Viên</div>
                            </a>
                        </li>
                        <li class="menu-item" STYLE="display:none;">
                            <a href="/chuc-vu/hien-thi" class="menu-link">
                                <div data-i18n="Basic">Chức vụ</div>
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- SanPham -->
                <li class="menu-item">
                    <a href="/chi-tiet-san-pham" class="menu-link menu-toggle" aria-expanded="false">
                        <i class="menu-icon tf-icons bx bx-cube-alt"></i>
                        <div data-i18n="Misc">Quản lý sản phẩm</div>
                    </a>
                    <ul class="menu-sub" aria-expanded="false">
                        <li class="menu-item">
                            <a href="/chi-tiet-san-pham/hien-thi" class="menu-link">
                                <div data-i18n="Under Maintenance">Sản phẩm</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="/kich-thuoc/hien-thi" class="menu-link">
                                <div data-i18n="Under Maintenance">Size</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="/chat-lieu/hien-thi" class="menu-link">
                                <div data-i18n="Under Maintenance">Chất liệu</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="/mau-sac/hien-thi" class="menu-link">
                                <div data-i18n="Under Maintenance">Màu sắc</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="/loai/hien-thi" class="menu-link">
                                <div data-i18n="Under Maintenance">Phân loại</div>
                            </a>
                        </li>
<%--                        <li class="menu-item">--%>
<%--                            <a href="/hinh-anh/hien-thi" class="menu-link">--%>
<%--                                <div data-i18n="Under Maintenance">Hình ảnh</div>--%>
<%--                            </a>--%>
<%--                        </li>--%>
                        <li class="menu-item">
                            <a href="/thuong-hieu/hien-thi" class="menu-link">
                                <div data-i18n="Under Maintenance">Thương hiệu</div>
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- Khuyên mai -->
                <li class="menu-item">
                    <a href="/khuyen-mai/hien-thi" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-collection"></i>
                        <div data-i18n="Basic">Quản lý khuyến mại</div>
                    </a>
                </li>
            </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->

            <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar"
            >
                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        <i class="bx bx-menu bx-sm"></i>
                    </a>
                </div>

                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                    <!-- Search -->
                    <div class="navbar-nav align-items-center">
                        <div class="nav-item d-flex align-items-center">
                        </div>
                    </div>
                    <!-- /Search -->

                    <ul class="navbar-nav flex-row align-items-center ms-auto">
                        <!-- Place this tag where you want the button to render. -->


                        <!-- User -->
                        <li class="nav-item navbar-dropdown dropdown-user ">
                            <a class="nav-link" onclick="showDropdow()" href="javascript:void(0);">
                                <div class="avatar avatar-online">
                                    <i style="font-size: 30px" class='bx bxs-user'></i> <span ></span>
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" id="dropdown-menu">
                                <li>
                                    <a class="dropdown-item">
                                        <a id="myProfileLink" class="dropdown-item" href="#">
                                            <i class="bx bx-user me-2"></i>
                                            <span class="align-middle" id="taiKhoan"></span>
                                        </a>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="/logout">
                                        <i class="bx bx-power-off me-2"></i>
                                        <span class="align-middle">Log Out</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!--/ User -->
                    </ul>
                </div>
            </nav>

            <!-- / Navbar -->

            <div class="content-body">
                <!-- row -->
                <div class="container-xxl flex-grow-1 container-p-y">
                    <jsp:include page="${contentPage}"/>
                </div>

                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                    </div>
                </footer>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- / Layout page -->
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

</div>
</div>
</body>
<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assets/vendor/libs/popper/popper.js"></script>
<script src="../assets/vendor/js/bootstrap.js"></script>
<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="../assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="../assets/js/main.js"></script>

<!-- Page JS -->
<script src="../assets/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>

<%--<script src="../../../js/select-2.js"></script>--%>
<script>

    var url = window.location.href;
    var domain = new URL(url).pathname;
    var menuItem = $('.menu-item')
    menuItem.each(function () {
        var hrefMenu = $(this).find("a").attr("href");
        var parts = hrefMenu.split('/');
        if (parts.length > 0) {
            if (domain.includes(parts[1])) {
                $(this).addClass("active open")
            } else {
                $(this).removeClass("active open")
            }
        }
    })

    let show = 0
    const showDropdow = () => {
        show++;
        if (show % 2 == 0) {
            $('#dropdown-menu').hide();
        } else {
            $('#dropdown-menu').show();
        }
    }

    $(document).ready(function() {
        $.ajax({
            url: '/user-infor',
            method: 'GET',
            success: function(data) {
                if (data) {
                    $('#taiKhoan').text(data.hoTen);  // Assuming `ten` is the property for the name
                    $('#idNV').text(data.id);
                    // Set href attribute dynamically
                    $('#myProfileLink').attr('href', '/nhan-vien/view-update?id=' + data.id);
                }
            }
        });
    });
</script>
</html>
