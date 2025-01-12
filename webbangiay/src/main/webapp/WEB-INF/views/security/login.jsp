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
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Login Basic - Pages | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

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

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="../assets/vendor/css/pages/page-auth.css"/>
    <!-- Helpers -->
</head>

<body>
<!-- Content -->

<div class="container-xxl">
    <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
            <!-- Register -->
            <div class="card">
                <div class="card-body">
                    <!-- Logo -->
                    <div class="app-brand justify-content-center">
                        <a href="/home" class="app-brand-link">
                            <img src="/uploads/Diamond_Sneaker-removebg.png">
                        </a>
                        <span class="app-brand-logo demo">

                  </span>
                        <span class="app-brand-text demo text-body fw-bolder"></span>
                        </a>
                    </div>
                    <!-- /Logo -->
                    <h4 class="mb-2">Chào mừng đến với DIAMOOND SNEAKER! 👋</h4>
                    <p class="mb-4">Vui lòng đăng nhập vào tài khoản của bạn</p>

                    <form:form id="formAuthentication" class="mb-3" action="/login" modelAttribute="userLogin"
                               method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label">Tài khoản</label>
                            <form:input
                                    path="username"
                                    type="text"
                                    class="form-control"
                                    id="email"
                                    name="email-username"
                                    placeholder="Nhập email hoặc tên người dùng của bạn"
                            />
                        </div>
                        <div class="mb-3 form-password-toggle">
                            <div class="d-flex justify-content-between">
                                <label class="form-label" for="password">Mật khẩu</label>
                                <a href="/forgot-password">
                                    <small>Quên mật khẩu?</small>
                                </a>
                            </div>
                            <div class="input-group input-group-merge">
                                <form:input
                                        path="password"
                                        type="password"
                                        id="password"
                                        class="form-control"
                                        name="password"
                                        placeholder="Password@1"
                                        aria-describedby="password"
                                />
                                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                            </div>
                        </div>
                        <% if (request.getParameter("error") != null) { %>

                        <div class="mb-3">
                            <div>
                                <span class="text-danger">Tên người dùng hoặc mật khẩu không hợp lệ, hoặc tài khoản đã bị ngưng hoạt động.</span>
                            </div>
                        </div>
                        <% } %>
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="remember-me"/>
                                <label class="form-check-label" for="remember-me"> Nhớ tài khoản </label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary d-grid w-100" type="submit">Đăng nhập</button>
                        </div>
                    </form:form>

                    <p class="text-center">
                        <span>Bạn chưa có tài khoản?</span>
                        <a href="/auth-register">
                            <span>Đăng kí</span>
                        </a>
                    </p>
                </div>
            </div>
            <!-- /Register -->
        </div>
    </div>
</div>
</div>
</body>
</html>

