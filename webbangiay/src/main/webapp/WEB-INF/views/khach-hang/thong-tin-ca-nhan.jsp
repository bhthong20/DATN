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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
    <script src="../js/menu.js"></script>
    <style>
        .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
            background-color: #ff3e1d !important;
            border-color: #ff3e1d !important;
            box-shadow: 0 2px 4px 0 rgba(255, 105, 105, 0.4) !important;
        }
    </style>
</head>

<body>
<jsp:include page="../quang-ba/header.jsp"></jsp:include>
<section style="background-color: #f5f5f9;">
    <div class="container py-5">
        <div class="row">
            <div class="col">
                <h3>Thông tin tài khoản</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4" style="min-height: 100%">
                <div class="card my-4 pt-4" style="height: 100%">
                    <div class="card-body text-center">
                        <img src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="avatar"
                             class="rounded-circle img-fluid" style="width: 150px;">
                        <h5 class="my-3" id="tenKhachHang"></h5>
                        <p class="text-muted mb-1">Mã người dùng <span id="maKhachHang"></span></p>
                        <p class="text-muted mb-4">Tài khoản người dùng <span id="taiKhoanText"></span></p>
                        <div class="d-flex justify-content-center mb-2">
                            <button type="button" data-mdb-button-init data-mdb-ripple-init
                                    class="btn btn-outline-primary ms-1" id="updateButton">Cập nhật dữ liệu
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8" style="min-height: 100%">
                <div class="card my-4" style="height: 100%">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Tên tài khoản</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><input id="taiKhoanForm" disabled class="form-control"/></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Họ tên</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><input id="hoTen" class="form-control"/></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Email</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><input id="email" class="form-control"/></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Số điện thoại</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><input id="sdt" class="form-control"/></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Ngày sinh</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><input id="ngaySinh" type="date" class="form-control"/></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Mật khẩu</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><input id="matKhau" type="password" disabled
                                                                  value="**********" class="form-control"/></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../quang-ba/footer.jsp"></jsp:include>

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
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="../../../js/select-2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>


<script>
    async function updateUser() {
        const updatedKhachHang = {
            hoTen: $('#hoTen').val(),
            email: $('#email').val(),
            sdt: $('#sdt').val(),
            ngaySinh: $('#ngaySinh').val(),
            // Add other necessary fields
        };

        $.ajax({
            type: "POST",
            url: "/update-user",
            contentType: "application/json",
            data: JSON.stringify(updatedKhachHang),
            success: function (response) {
                alert(response);
            },
            error: function (xhr, status, error) {
                alert("Error: " + xhr.responseText);
            }
        });
    }

    window.onload = async function () {
        await loadUserLogin();
    };

    function loadUserLogin() {
        $.ajax({
            type: "GET",
            url: "/user-infor",
            success: function (response) {
                if (response) {
                    $('#maKhachHang').text(response.ma);
                    $('#tenKhachHang').text(response.hoTen)
                    $('#taiKhoanForm').val(response.taiKhoan);
                    $('#hoTen').val(response.hoTen);
                    $('#email').val(response.email);
                    $('#sdt').val(response.sdt);
                    $('#ngaySinh').val(response.ngaySinh);
                    $('#taiKhoanText').text(response.taiKhoan)
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr.responseText);
            }
        });
    }

    // Bind the update function to the button click
    $('#updateButton').click(function () {
        updateUser();
    });
</script>

</html>
