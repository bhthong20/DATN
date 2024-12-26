<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html
        lang="en"
        class="light-style customizer-hide"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Register Basic - Pages | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="../assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
</head>

<body>
<!-- Content -->

<div class="container-xxl">
    <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
            <!-- Register Card -->
            <div class="card">
                <div class="card-body">
                    <!-- Logo -->
                    <div class="app-brand justify-content-center">
                        <img src="/uploads/Diamond_Sneaker-removebg.png">
                  <span class="app-brand-logo demo">

                  </span>
                            <span class="app-brand-text demo text-body fw-bolder"></span>
                        </a>
                    </div>
                    <!-- /Logo -->
                    <h4 class="mb-2">Cuộc phiêu lưu bắt đầu từ đây 🚀</h4>
                    <p class="mb-4">Làm cho việc mua sắm của bạn trở nên dễ dàng và thú vị!</p>

                    <form:form id="formAuthentication" class="mb-3" modelAttribute="khachHang" action="/auth-register" method="POST">
                        <div class="mb-3">
                            <label for="tenTaiKhoan" class="form-label">Tên khách hàng</label>
                            <form:input
                                    path="hoTen"
                                    type="text"
                                    id="tenTaiKhoan"
                                    class="form-control"
                                    name="username"
                                    placeholder="Enter your username"
                            />
                        </div>
                        <div>
                            <form:errors path="hoTen" cssStyle="color: #ff0000"/>
                        </div>

                        <div class="mb-3">
                            <label for="taiKhoan" class="form-label">Tài khoản</label>
                            <form:input
                                    path="taiKhoan"
                                    type="text"
                                    id="taiKhoan"
                                    class="form-control"
                                    name="username"
                                    placeholder="Enter your username"
                            />
                        </div>
                        <div>
                            <form:errors path="taiKhoan" cssStyle="color: #ff0000"/>
                        </div>

                        <div class="mb-3">
                            <label for="soDienThoai" class="form-label">Số điện thoại</label>
                            <form:input
                                    path="sdt"
                                    type="text"
                                    class="form-control"
                                    id="soDienThoai"
                                    name="username"
                                    placeholder="Enter your username"
                            />
                        </div>
                        <div>
                            <form:errors path="sdt" cssStyle="color: #ff0000"/>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <form:input path="email" type="text" class="form-control" id="email" name="email" placeholder="Enter your email" />
                        </div>
                        <div>
                            <form:errors path="email" cssStyle="color: #ff0000"/>
                        </div>

                        <div class="mb-3 form-password-toggle">
                            <label class="form-label" for="password">Mật khẩu</label>
                            <div class="input-group input-group-merge">
                                <form:input
                                        path="matKhau"
                                        type="password"
                                        id="password"
                                        class="form-control"
                                        name="password"
                                        aria-describedby="password"
                                />
                                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                            </div>
                            <div>
                                <form:errors path="matKhau" cssStyle="color: #ff0000"/>
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="terms-conditions" name="terms" />
                                <label class="form-check-label" for="terms-conditions">
                                    I agree to
                                    <a href="javascript:void(0);">privacy policy & terms</a>
                                </label>
                            </div>
                        </div>
                        <button onsubmit="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;" type="submit" class="btn btn-primary d-grid w-100">Sign up</button>
                    </form:form>

                    <p class="text-center">
                        <span>Already have an account?</span>
                        <a href="/login">
                            <span>Sign in instead</span>
                        </a>
                    </p>
                </div>
            </div>
            <!-- Register Card -->
        </div>
    </div>
</div>

<!-- / Content -->

<div class="buy-now">
    <a
            href="https://themeselection.com/products/sneat-bootstrap-html-admin-template/"
            target="_blank"
            class="btn btn-danger btn-buy-now"
    >Upgrade to Pro</a
    >
</div>

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assets/vendor/libs/popper/popper.js"></script>
<script src="../assets/vendor/js/bootstrap.js"></script>
<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="../assets/js/main.js"></script>

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
