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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
</head>

<body>

<section>
    <nav class="navbar navbar-expand-lg bg-white">
        <div class="container justify-content-between p-0">
            <div class="d-flex">
                <div class="site-brand">
                    <a href="/home"><img src="/uploads/Diamond_Sneaker-removebg.png"></a>
                </div>
                <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                    <ul class="navbar-nav text-center mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="/home"><i class="bi bi-house"></i>Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/san-pham"><i class="bi bi-bag"></i>Sản phẩm</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div>
                <div class="dropdown">
                    <span role="button" onclick="showDropdow()" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                        <i style="font-size: 30px" class='bx bxs-user'></i> <span id="taiKhoan">Tài khoản</span>
                    </span>
                    <ul class="dropdown-menu" id="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <c:choose>
                            <c:when test="${not empty user}">
                                <li><a class="dropdown-item" href="/ban-hang-online/hoa-don">Danh Sách Đơn Mua</a></li>
                                <li><a class="dropdown-item" href="/khach-hang/thong-tin-ca-nhan">Tài Khoản Của Tôi</a></li>
                                <li><a class="dropdown-item" href="/logout" onclick="clearUserInfoCookie()">Đăng xuất</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a class="dropdown-item" href="/login">Đăng nhập</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>

                    <script>
                            function clearUserInfoCookie() {
                                document.cookie = "user_info=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                                window.location.href = "/login"; // Chuyển hướng về trang đăng nhập
                            }
                    </script>
                    <a href="/gio-hang" class="position-relative"><i style="font-size: 30px; background-color: #8c8c8cư" class='bx bx-cart'></i>
                        <span class="position-absolute top-0 translate-middle badge rounded-pill bg-danger">
                        <span id="soLuongGioHang"></span>
                      </span>
                    </a>
                </div>
            </div>
        </div>
    </nav>
</section>

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

<script>
    var url = window.location.href;
    var domain = new URL(url).pathname;
    var menuItem = $('.nav-link')
    menuItem.each(function () {
        var hrefMenu = $(this).attr("href");
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

    var userInfoCookie = getCookie("user_info");
    if (userInfoCookie) {
        $('#taiKhoan').text(JSON.parse(userInfoCookie));
        // Hiển thị các mục dành cho người dùng đã đăng nhập
        $('#dropdown-menu').html(`
        <li><a class="dropdown-item" href="/ban-hang-online/hoa-don">Danh Sách Đơn Mua</a></li>
        <li><a class="dropdown-item" href="/khach-hang/thong-tin-ca-nhan">Tài Khoản Của Tôi</a></li>
        <li><a class="dropdown-item" href="/logout" onclick="clearUserInfoCookie()">Đăng xuất</a></li>
    `);
    } else {
        $.ajax({
            type: "GET",
            url: "/user-infor",
            success: function (response) {
                if (response) {
                    setCookie("user_info", JSON.stringify(response.taiKhoan));
                    $('#taiKhoan').text(response.taiKhoan)
                }
                $('#dropdown-menu').html(`
                <li><a class="dropdown-item" href="/ban-hang-online/hoa-don">Danh Sách Đơn Mua</a></li>
                <li><a class="dropdown-item" href="/khach-hang/thong-tin-ca-nhan">Tài Khoản Của Tôi</a></li>
                <li><a class="dropdown-item" href="/logout" onclick="clearUserInfoCookie()">Đăng xuất</a></li>
            `);
            },
            error: function (xhr, status, error) {
                if (xhr.status === 401) {
                    $('#taiKhoan').text("Tài khoản");
                    $('#dropdown-menu').html(`
                    <li><a class="dropdown-item" href="/login">Đăng nhập</a></li>
                `);
                }
            }
        });
    }


    $.ajax({
        type: "GET",
        url: "/ban-hang-online/rest/count-gio-hang",
        success: function (response) {
            $('#soLuongGioHang').text(response)
        },
        error: function (xhr, status, error) {
            console.log(xhr.responseText);
        }
    });
</script>
</html>
