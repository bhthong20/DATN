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

        .cart-empty_cart-status {
            border: 3px solid #fff; /* Viền màu trắng */
            background-color: #fff; /* Nền trắng */
            padding: 20px;
            text-align: center; /* Canh giữa nội dung */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); /* Tạo hiệu ứng đổ bóng mờ dần ra ngoài */
            border-radius: 10px; /* Bo tròn góc viền */
        }

        .cart-empty_cart-status img {
            display: block;
            margin: 0 auto 20px; /* Canh giữa ảnh và thêm khoảng cách phía dưới */
        }

        .cart-text {
            font-size: 24px; /* Cỡ chữ to hơn */
            color: #808080; /* Màu ghi */
            margin-bottom: 10px;
        }

        .cart-empty {
            font-size: 20px; /* Cỡ chữ to hơn */
            color: #808080; /* Màu ghi */
            margin-bottom: 20px;
        }

        .cart-empty_cart-status a {
            text-decoration: none;
        }

        .cart-empty_cart-status button {
            display: inline-block;
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            background-color: #e39595; /* Màu nền nút - xám ghi */
            color: #fff; /* Màu chữ nút */
            border-radius: 50px; /* Bo tròn nút */
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Tạo hiệu ứng đổ bóng cho nút */
        }

        .cart-empty_cart-status button:hover {
            background-color: #ef2f2fee; /* Màu nền nút khi hover - xám đậm */
            transform: translateY(-2px); /* Hiệu ứng nâng lên khi hover */
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* Tăng hiệu ứng đổ bóng khi hover */
        }

        .cart-empty_cart-status button:active {
            transform: translateY(0); /* Loại bỏ hiệu ứng nâng khi click */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Giảm hiệu ứng đổ bóng khi click */
        }

    </style>

</head>

<body>
<section id="content" class="mt-4" style="background-color: #f5f5f9;">
    <section class="container">
        <h4 class="fw-bold py-3 m-0">
            <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 24 24"
                 style="fill: rgba(0, 0, 0, 1);transform: ;msFilter:;">
                <path d="M4 6h2v2H4zm0 5h2v2H4zm0 5h2v2H4zm16-8V6H8.023v2H18.8zM8 11h12v2H8zm0 5h12v2H8z"></path>
            </svg>
            <span class="">Giỏ hàng</span>

        </h4>
        <div class="row" style="display: none" id="gioHangShow">
            <div class="col-8">

                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div class="card-title w-100">
                            <div class="d-flex align-items-center justify-content-between">
                                <h5 class="mb-0">Danh sách sản phẩm</h5>
                                <span>
                                    <button class="btn btn-danger checkStatus"
                                            onclick="deleteProduct()">Xóa sản phẩm</button>
                                    <button class="btn btn-danger checkStatus"
                                            onclick="updateProduct()">Sửa số lượng</button>
                                    <a href="/san-pham" class="btn btn-danger checkStatus">Tiếp Tục Mua Sắm</a>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive text-nowrap">
                        <table class="table">
                            <thead>
                            <tr>
                                <th><input class="form-check-input" type="checkbox" id="checkAll"
                                           onchange="checkAll(this)" type="checkbox"/></th>
                                <th>Ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Màu sắc</th>
                                <th>Kích cỡ</th>
                                <th>Chất liệu</th>
                                <th>Giá(VNĐ)</th>
                                <th colspan="2">Sl Mua</th>
                            </tr>
                            </thead>
                            <tbody class="table-border-bottom-2" id="listChiTietSanPham">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Thông tin giá</h5>
                    </div>
                    <div class="card-body">
                        <form>
                            <%--                            <div class="divider">--%>
                            <%--                                <div class="divider-text">Thông tin khách hàng</div>--%>
                            <%--                            </div>--%>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Đơn giá</label>
                                <div class="col-sm-7">
                                    <span id="donGia">0</span><span></span>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Thành tiền</label>
                                <div class="col-sm-7">
                                    <span id="tongTien">0</span><span></span>
                                </div>
                            </div>

                            <div class="divider">
                                <div class="divider-text">Thông tin sản phẩm</div>
                            </div>
                            <span id="sanPhamThanhToan">
                            </span>

                            <div class="row">
                                <div class="col-12 text-center">
                                    <button type="button" onclick="taoHoaDonThanhToan()" class="btn btn-danger">Tiếp Tục
                                        Đặt Hàng
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div style="display: none" id="emptyCartMessage">
            <div class="cart-empty_cart-status">
                <div class=" m-b-16 m-b-sm-12">
                    <picture><img alt="img"
                                  src="data:image/png;base64,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"
                                  width="296" height="180" decoding="async"
                                  data-nimg="1" loading="lazy" style="color: transparent;"></picture>
                </div>
                <p class="cart-text">Bạn chưa có sản phẩm nào trong giỏ hàng!</p>
                <p class="cart-empty">Cùng mua sắm hàng ngàn sản phẩm tại DIAMOND SNEAKER nhé!</p>
                <div class=><a href="/san-pham">
                    <button type="button"
                            class="ant-btn css-10ed4xt ant-btn-primary max-w-[133px] rounded-full md:max-w-none estore-btn estore-btn-bg  css-1krd2ey"><span>Mua
            hàng</span></button>
                </a></div>
            </div>
        </div>
    </section>
</section>
 <br>

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
<script>
    // let khuyenMaiSelect = {
    //     id: "",
    //     hinhThucGiamGia: 1,
    //     giaTriGiam: 0,
    // }
    //
    // const tenNguoiNhan = $('#tenNguoiNhan');
    // const soDienThoai = $('#soDienThoai');
    // const email = $('#email');
    // const diaChi = $("#diaChi");
    // const moTa = $("#moTa");
    // const tienGiam = $('#tienGiam');
    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(number);
    }

    window.onload = function () {
        loadChiTietSanPham();
    };

    function taoHoaDonThanhToan() {
        let productShopping = []
        let kt = confirm("Bạn có muốn tiếp tục đặt hàng?");
        if (kt) {
            let check = true;
            let checkRecordProduct = false;
            $('#listChiTietSanPham').find('tr').each(function () {
                const firstCheckbox = $(this).find('input[type="checkbox"]:first');
                if (firstCheckbox.is(':checked')) {
                    checkRecordProduct = true;
                    let product = JSON.parse($(this).attr('item'));

                    const lastInput = $(this).find('input:last');
                    const lastInputValue = lastInput.val();

                    productShopping.push({
                        chiTietSanPham: product.chiTietSanPham.id,
                        soLuong: parseInt(lastInputValue),
                        donGia: product.chiTietSanPham.donGia
                    })
                }
            });
            if (!checkRecordProduct) {
                alert("Bạn phải chọn ít nhất một sản phẩm");
                return;
            }

            if (check) {
                $.ajax({
                    type: "POST",
                    url: "/ban-hang-online/rest/tao-hoa-don",
                    contentType: "application/json",
                    data: JSON.stringify(productShopping),
                    success: function (response) {
                        alert("Thành Công! Mời Bạn Đến Thông Tin Thanh Toán.");
                        window.location.href = "/ban-hang-online/hoa-don-detail?id=" + response;
                    },
                    error: function (xhr, status, error) {
                        if (xhr.responseJSON.status && xhr.responseJSON.status === 400) {
                            alert(xhr.responseJSON.message)
                        }
                    }
                });
            }
        }
    }

    const loadChiTietSanPham = () => {
        const tableProduct = document.getElementById("listChiTietSanPham");
        $.ajax({
            type: "GET",
            url: "/ban-hang-online/rest/list-gio-hang",
            success: function (response) {
                let index = 0;
                let html = '';
                if (response && response.length != 0) {
                    $('#gioHangShow').show();
                    response.forEach(el => {
                        index++;
                        html += `<tr item='` + JSON.stringify(el) + `'>
                                <td><input class="form-check-input checkStatus" onchange="fillTongTien()" type="checkbox" name="chiTietSanPham" value="` + el.chiTietSanPham.id + `" /></td>
                                <td align="center">
                                    <img src="../../../uploads/` + (el.chiTietSanPham.hinhAnh ? el.chiTietSanPham.hinhAnh.anh1 : "") + `" width="100" height="100"
                                         style="border-radius:50% 50% 50% 50%">

                                </td>
                                <td>` + (el.chiTietSanPham.sanPham ? el.chiTietSanPham.sanPham.tenSP : "") + `</td>
                                <td>` + (el.chiTietSanPham.mauSac ? el.chiTietSanPham.mauSac.ten : "") + `</td>
                                <td>` + (el.chiTietSanPham.kichThuoc ? el.chiTietSanPham.kichThuoc.size : "") + `</td>
                                <td>` + (el.chiTietSanPham.chatLieu ? el.chiTietSanPham.chatLieu.tenChatLieu : "") + `</td>
                                <td><strong>` + formatCurrency(el.chiTietSanPham.donGia) + `</strong></td>
                                <td colspan="2">
                                    <input class="form-control" type="number" onchange="validateInputSoLuong(this)" placeholder="Chọn số lượng" min="1" value="` + el.soLuong + `" />
                                </td>
                            </tr>
                            `
                    })
                    tableProduct.innerHTML = html;

                } else {
                    $('#gioHangShow').hide();
                    $('#emptyCartMessage').show();
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr.responseText);
            }
        });
    }


    const fillTongTien = () => {
        let tongTien = 0;
        let products = [];
        $('#listChiTietSanPham').find('tr').each(function () {
            const firstCheckbox = $(this).find('input[type="checkbox"]:first');
            if (firstCheckbox.is(':checked')) {
                const lastInput = $(this).find('input:last');
                const lastInputValue = lastInput.val();
                let product = JSON.parse($(this).attr('item'));
                product.soLuong = parseInt(lastInputValue);
                products.push(product);
                tongTien += parseInt(lastInputValue) * product.chiTietSanPham.donGia;
            } else {
                $('#checkAll').prop('checked', false);
            }
        });

        $('#donGia').text(formatCurrency(tongTien));
        renderSanPhamThanhToan(products);
        $('#tongTien').text(formatCurrency(tongTien));
    }

    const renderSanPhamThanhToan = (listProduct) => {
        let html = "";
        listProduct.forEach(el => {
            html += `
                <div class="row mb-3">
                    <label class="col-sm-5 col-form-label"><span>` + el.chiTietSanPham.sanPham.tenSP + `</span> x<span>` + el.soLuong + `</span></label>
                    <div class="col-sm-7">
                        <span>` + formatCurrency(el.chiTietSanPham.donGia * el.soLuong) + `</span><span></span>
                    </div>
                </div>
           `
        });
        $('#sanPhamThanhToan').html(html);
    }

    const deleteProduct = () => {
        let productShopping = []
        let kt = confirm("Bạn có chắc chắn muốn sản phẩm khỏi giỏ hàng không?");
        if (kt == true) {
            let check = true;
            let checkRecordProduct = false;
            $('#listChiTietSanPham').find('tr').each(function () {
                const firstCheckbox = $(this).find('input[type="checkbox"]:first');
                if (firstCheckbox.is(':checked')) {
                    checkRecordProduct = true;
                    let product = JSON.parse($(this).attr('item'));
                    productShopping.push(product.id)
                }
            });
            if (!checkRecordProduct) {
                alert("Bạn phải chọn ít nhất một sản phẩm");
                return;
            }
            if (check) {
                $.ajax({
                    type: "POST",
                    url: "/ban-hang-online/rest/delete-gio-hang",
                    contentType: "application/json",
                    data: JSON.stringify(productShopping),
                    success: function (response) {
                        alert("Xóa sản phẩm khỏi giỏ hàng thành công")
                        location.reload();
                    },
                    error: function (xhr, status, error) {
                        console.log(xhr.responseText);
                        alert("Lỗi hệ thống !!!")
                    }
                });
            }
        }
    }

    const updateProduct = () => {
        let productShopping = []
        let kt = confirm("Bạn có chắc chắn muốn sửa số lượng sản phẩm không?");
        if (kt == true) {
            let check = true;
            let checkRecordProduct = false;
            $('#listChiTietSanPham').find('tr').each(function () {
                const firstCheckbox = $(this).find('input[type="checkbox"]:first');
                if (firstCheckbox.is(':checked')) {
                    checkRecordProduct = true;
                    let product = JSON.parse($(this).attr('item'));

                    const lastInput = $(this).find('input:last');
                    const lastInputValue = lastInput.val();

                    productShopping.push({
                        chiTietSanPham: product.chiTietSanPham.id,
                        soLuong: parseInt(lastInputValue),
                        donGia: product.chiTietSanPham.donGia
                    })
                }
            });
            if (!checkRecordProduct) {
                alert("Bạn phải chọn ít nhất một sản phẩm");
                return;
            }
            if (check) {
                $.ajax({
                    type: "POST",
                    url: "/ban-hang-online/rest/update-gio-hang",
                    contentType: "application/json",
                    data: JSON.stringify(productShopping),
                    success: function (response) {
                        alert("Sửa số lượng sản phẩm thành công")
                        location.reload();
                    },
                    error: function (xhr, status, error) {
                        console.log(xhr.responseText);
                        alert("Bạn Đã Thêm Quá Số Lượng Hiện Có!!!")
                        location.reload();

                    }
                });
            }
        }
    }

    const checkAll = (checkbox) => {
        $('#listChiTietSanPham').find('tr').each(function () {
            const firstCheckbox = $(this).find('input[type="checkbox"]:first');
            firstCheckbox.prop('checked', $(checkbox).is(':checked'));
        });
        fillTongTien();
    }

    // validate số lượng
    const validateInputSoLuong = (input) => {
        const soLuong = parseInt(input.value, 10);
        if (isNaN(soLuong) || soLuong <= 0) {
            alert("Vui lòng nhập vào một số nguyên dương.");
            input.value = 1;
        }
        fillTongTien();
    }
</script>
</html>
