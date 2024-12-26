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
<section id="content" class="mt-4" style="background-color: #f5f5f9;">
    <section class="container">
        <h4 class="fw-bold py-3 mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 24 24"
                 style="fill: rgba(0, 0, 0, 1);transform: ;msFilter:;">
                <path d="M4 6h2v2H4zm0 5h2v2H4zm0 5h2v2H4zm16-8V6H8.023v2H18.8zM8 11h12v2H8zm0 5h12v2H8z"></path>
            </svg>
            <span id="title"></span>
        </h4>
        <div class="row" style="display: none" id="gioHangShow">
            <div class="col-lg-8 mb-3">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div class="card-title w-100">
                            <div class="d-flex align-items-center justify-content-between">
                                <h5 class="mb-0">Danh sách sản phẩm</h5>
                                <span>
                                    <button class="btn btn-danger checkHidden"
                                            onclick="deleteProduct()">Xóa sản phẩm</button>
                                    <button class="btn btn-danger checkHidden"
                                            onclick="updateProduct()">Sửa số lượng</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive text-nowrap">
                        <table class="table">
                            <thead>
                            <tr>
                                <th><input class="form-check-input checkStatus" type="checkbox" id="checkAll"
                                           onchange="checkAll(this)" type="checkbox"/></th>
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
            <div class="col-lg-4 mb-3">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Đơn hàng</h5>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="divider">
                                <div class="divider-text">Thông tin khách hàng</div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" for="tenNguoiNhan">Tên người nhận</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="tenNguoiNhan"
                                           placeholder="Nhập thông tin"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" for="soDienThoai">Số điện thoại</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="soDienThoai"
                                           placeholder="Nhập thông tin"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" for="diaChi">Địa chỉ</label>
                                <div class="col-sm-7">
                                    <select name="" class="form-select mb-2" onchange="clearTienShip()" id="province">
                                        <option value="-1">Chọn tỉnh thành</option>
                                    </select>
                                    <select name="" class="form-select mb-2" onchange="getTienShip()" id="district">
                                        <option value="-1">Chọn quận/huyện</option>
                                    </select>
                                    <input type="text" class="form-control" id="diaChi"
                                           placeholder="Nhập thông tin"/>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" for="moTa">Mô tả</label>
                                <div class="col-sm-7">
                                    <textarea type="text" class="form-control" id="moTa"
                                              placeholder="Nhập thông tin"></textarea>
                                </div>
                            </div>

                            <div class="divider">
                                <div class="divider-text">Thông tin đơn hàng</div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Trạng thái</label>
                                <div class="col-sm-7">
                                    <span id="trangThai">Chưa thanh toán</span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Đơn giá</label>
                                <div class="col-sm-7">
                                    <span id="donGia">0</span><span></span>
                                </div>
                            </div>
                            <c:if test="${not empty listKM}">
                                <div class="row mb-3">
                                    <label class="col-sm-5 col-form-label">Mã giảm giá SP</label>
                                    <div class="col-sm-7">
                                        <span class="mini-vouchers__vouchers flex flex-auto flex-no-overflow">
                                            <span id="renderMaGiamGia">
                                            </span>
                                            <span>
                                                <button type="button" class="btn btn-danger checkHidden"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#ModalChonMaGiamGia">Chọn</button>
                                            </span>
                                        </span>

                                    </div>
                                </div>
                            </c:if>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Tiền giảm</label>
                                <div class="col-sm-7">
                                    <span id="tienGiam">0</span><span></span>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" title="(Không được áp dụng mã giảm giá)">Tiền
                                    Ship</label>
                                <div class="col-sm-7">
                                    <span id="tienShip">0</span><span></span>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Thành tiền</label>
                                <div class="col-sm-7">
                                    <span id="tongTien">0</span><span></span>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Phương thức thanh
                                    toán</label>
                                <div class="col-sm-7">
                                    <div class="form-check">
                                        <input
                                                name="default-radio-1"
                                                class="form-check-input checkStatus"
                                                type="radio"
                                                value=""
                                                id="defaultRadio1"
                                        />
                                        <label class="form-check-label" for="defaultRadio1"> Thanh toán khi nhận
                                            hàng </label>
                                    </div>
                                    <div class="form-check">
                                        <input
                                                name="default-radio-1"
                                                class="form-check-input checkStatus"
                                                type="radio"
                                                value=""
                                                id="defaultRadio2"
                                                checked
                                        />
                                        <label class="form-check-label" for="defaultRadio2"> Thanh toán online </label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 text-center">
<%--                                    <a href="/san-pham" type="button" class="btn btn-danger">Quay lại</a>--%>
                                    <button type="button" id="btnHuyDonHang" onclick="huyDonHang()"
                                            class="btn btn-danger">Hủy đơn hàng`
                                    </button>
                                    <button type="button" id="btnThanhToan" onclick="thanhToan()"
                                            class="btn btn-danger">Hoàn Tất Đặt Hàng
                                    </button>
                                    <button type="button" id="hoanThanhDonHang" onclick="hoanThanhDonHangKhachHang()"
                                            class="btn btn-danger">Đã nhận đơn hàng
                                    </button>
<%--                                        <a href="/san-pham" type="button" class="btn btn-danger">Quay lại</a>--%>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../quang-ba/footer.jsp"></jsp:include>

<%--Chon ma giam gia--%>
<div class="modal fade" id="ModalChonMaGiamGia" tabindex="-1" aria-labelledby="exampleModalLabelMauSac"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5">Chọn mã giảm giá</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span class="mini-vouchers__vouchers flex flex-auto flex-no-overflow">
                    <c:forEach items="${listKM}" var="item" varStatus="loop">
                        <div data-bs-toggle="tooltip" data-bs-placement="top" title="Tooltip on top">
                            <div onclick="renderSale(this)"
                                 class="voucher-ticket mb-1 voucher-ticket--VN voucher-ticket--seller-mini-solid mini-voucher-with-popover"
                                 id="${item.id}"
                                 hinhThucGiam="${item.hinhThucGiamGia}"
                                 giaTriGiam="${item.giaTriGiam}"
                                 dieuKienGia="${item.dieuKienGia}"
                                 ngayKetThuc="${item.ngayKetThuc}"
                                 ten="${item.ten}"
                                 value="${item.id}"
                            >
                                <div class=""><span
                                        class="voucher-promo-value voucher-promo-value--percent">${item.giaTriGiam}</span><span
                                        class="voucher-promo-label"><c:if
                                        test="${item.hinhThucGiamGia==0}"> VNĐ</c:if>
                                <c:if test="${item.hinhThucGiamGia==1}"> %</c:if></span><span
                                        class="voucher-promo-label voucher-promo-label--off">GIẢM</span></div>
                            </div>
                        </div>
                    </c:forEach>
                </span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
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
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="../../../js/select-2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="../assets/vendor/api-province/data.json"></script>
<script src="../assets/vendor/api-province/api.js"></script>
<script>
    function formatCurrency(number) {
        return number;
    }
    let urlBanHangTaiQuay = window.location.href;

    let urlParams = new URLSearchParams(new URL(urlBanHangTaiQuay).search);

    let id = urlParams.get("id");

    let khuyenMaiSelect = {
        id: "",
        hinhThucGiamGia: 1,
        giaTriGiam: 0,
    }

    let hoaDonSelect = {};

    const tenNguoiNhan = $('#tenNguoiNhan');
    const soDienThoai = $('#soDienThoai');
    const diaChi = $("#diaChi");
    const moTa = $("#moTa");
    const tienGiam = $('#tienGiam');

    window.onload = async function () {
        await loadChiTietSanPham();
        if (hoaDonSelect.trangThai == 9) {
            await loadUserLogin();
            fillTongTien();
        }
    };

    function loadUserLogin() {
        $.ajax({
            type: "GET",
            url: "/user-infor",
            success: function (response) {
                if (response) {
                    tenNguoiNhan.val(response.hoTen);
                    soDienThoai.val(response.sdt);
                }
            },
            error: function (xhr, status, error) {
                if (xhr.responseJSON.status && xhr.responseJSON.status === 400) {
                    alert(xhr.responseJSON.message)
                }
            }
        });
    }

    function validateFields() {
        const tenNguoiNhanVal = tenNguoiNhan.val();
        const soDienThoaiVal = soDienThoai.val();
        const diaChiVal = diaChi.val();
        const moTaVal = moTa.val();

        // Kiểm tra định dạng số điện thoại (chỉ chứa chữ số và có độ dài từ 10 đến 11)
        const phonePattern = /^\d{10,11}$/;
        if (!phonePattern.test(soDienThoai.val())) {
            alert("Số điện thoại không đúng định dạng");
            check = false;
        }

        if (!tenNguoiNhanVal.trim()) {
            alert("Vui lòng nhập tên người nhận.");
            return false;
        }

        if (!soDienThoaiVal.trim()) {
            alert("Vui lòng nhập số điện thoại.");
            return false;
        }

        if (!diaChiVal.trim()) {
            alert("Vui lòng nhập địa chỉ.");
            return false;
        }

        if (!moTaVal.trim()) {
            alert("Vui lòng nhập mô tả.");
            return false;
        }

        return true;
    }
    function removeCurrencyFormat(value) {
        // // Loại bỏ các ký tự không phải là số hoặc dấu phẩy
        // return value.replace(/[^\d.,]/g, '')
        //     // Loại bỏ dấu phẩy nếu nó ở giữa các số
        //     .replace(/,(?=\d{3})/g, '')
        //     // Loại bỏ dấu chấm nếu nó ở cuối số
        //     .replace(/\.(?=\d*$)/g, '');
        return value;
    }

    function thanhToan() {
        if (validateFields()) {
            let kt = confirm("Bạn có chắc chắn muốn đặt hàng không?");
            if (kt) {
                let sanPhamAddHoaDons = []
                $('#listChiTietSanPham').find('tr').each(function () {
                    const lastInput = $(this).find('input:last');
                    const lastInputValue = lastInput.val();
                    let product = JSON.parse($(this).attr('item'));
                    sanPhamAddHoaDons.push({
                        hoaDonId: product.id,
                        sanPhamId: product.chiTietSanPham.id,
                        quantity: parseInt(lastInputValue),
                        donGia: product.chiTietSanPham.donGia
                    })
                });

                var selectedProvinceText = $("#province option:selected").text();
                var selectedDistrictText = $("#district option:selected").text();

                hoaDonSelect.loai = 1
                hoaDonSelect.phuongThucThanhToan = $("#defaultRadio2").is(':checked') ? 1 : 0
                hoaDonSelect.tenNguoiNhan = tenNguoiNhan.val();
                hoaDonSelect.sdt = soDienThoai.val();
                hoaDonSelect.diaChi = diaChi.val() + "{,} " + selectedDistrictText + "{,} " + selectedProvinceText;
                hoaDonSelect.ghiChu = moTa.val();
                hoaDonSelect.tienGiam = removeCurrencyFormat(tienGiam.text());
                hoaDonSelect.tongTien = removeCurrencyFormat($('#tongTien').text());
                hoaDonSelect.tienShip = removeCurrencyFormat($('#tienShip').text());

                let data = {
                    sanPhamAddHoaDons: sanPhamAddHoaDons,
                    hoaDon: hoaDonSelect,
                    idKhuyenMai: khuyenMaiSelect.id
                }

                $.ajax({
                    type: "POST",
                    url: "/ban-hang-online/rest/thanh-toan-hoa-don",
                    contentType: "application/json",
                    data: JSON.stringify(data), // Chuyển đổi dữ liệu thành chuỗi JSON
                    success: function (response) {
                        // console.log(response)
                        // window.location.href = response;
                        alert("Đặt hàng thành công!"); // Hiển thị thông báo thành công
                        setTimeout(function() {
                            window.location.href = response;
                        }, 2000); // Chuyển hướng sau 2 giây
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

    function huyDonHang() {
        let kt = confirm("Bạn có chắc chắn muốn hủy hóa đơn không?");
        if (kt) {
            let data = {
                idHoaDon: hoaDonSelect.id,
                trangThai: 8,
            }
            $.ajax({
                type: "POST",
                url: "/ban-hang-online/rest/thay-doi-trang-thai",
                contentType: "application/json",
                data: JSON.stringify(data), // Chuyển đổi dữ liệu thành chuỗi JSON
                success: function (response) {
                    alert("Hủy hóa đơn thành công!!!")
                    location.reload();
                },
                error: function (xhr, status, error) {
                    if (xhr.responseJSON.status && xhr.responseJSON.status === 400) {
                        alert(xhr.responseJSON.message)
                    }
                }
            });
        }
    }

    function hoanThanhDonHangKhachHang() {
        let kt = confirm("Bạn có chắc chắn muốn hoàn tất đơn hàng không?");
        if (kt) {
            let data = {
                idHoaDon: hoaDonSelect.id,
                trangThai: 10,
            }
            $.ajax({
                type: "POST",
                url: "/ban-hang-online/rest/thay-doi-trang-thai",
                contentType: "application/json",
                data: JSON.stringify(data), // Chuyển đổi dữ liệu thành chuỗi JSON
                success: function (response) {
                    alert("Cảm ơn bạn đã mua hàng của shop!")
                    location.reload();
                },
                error: function (xhr, status, error) {
                    if (xhr.responseJSON.status && xhr.responseJSON.status === 400) {
                        alert(xhr.responseJSON.message)
                    }
                }
            });
        }
    }

    let clearKhuyenMai = () => {
        khuyenMaiSelect = {
            id: "",
            hinhThucGiamGia: 1,
            giaTriGiam: 0,
            dieuKienGia: 0,
        }
    }

    function renderSale(sale) {
        const listSale = $('.voucher-ticket');
        const saleSelect = $(sale);

        var hinhThucGiam = saleSelect.attr("hinhThucGiam");
        var giaTriGiam = saleSelect.attr("giaTriGiam");
        var id = saleSelect.attr("value");
        var dieuKienGia = saleSelect.attr("dieuKienGia");

        khuyenMaiSelect.giaTriGiam = parseInt(giaTriGiam);
        khuyenMaiSelect.id = id;
        khuyenMaiSelect.hinhThucGiamGia = parseInt(hinhThucGiam);
        khuyenMaiSelect.dieuKienGia = parseInt(dieuKienGia);

        $('#renderMaGiamGia').html(saleSelect.clone());

        listSale.removeClass('checked');
        saleSelect.addClass('checked');

        fillTongTien();
    }

    function rowDisabledInput() {
        $('#listChiTietSanPham').find('tr').each(function () {
            const firstCheckbox = $(this).find('input[type="checkbox"]:first');
            const lastInput = $(this).find('input:last');

            if (firstCheckbox.is(':checked')) {
                lastInput.prop('disabled', false);
            } else {
                lastInput.prop('disabled', true);
            }
        });
    }

    const loadChiTietSanPham = async () => {
        const tableProduct = document.getElementById("listChiTietSanPham");
        await $.ajax({
            type: "POST",
            url: "/ban-hang-online/rest/list-hoa-don?id=" + id,
            success: function (response) {
                let index = 0;
                let html = '';
                if (response && response.length != 0) {
                    // $('#title').text("Thông Tin Thanh Toán ")
                    $('#title').text("Thông Tin Thanh Toán " + response.hoaDon.ma)
                    $('#gioHangShow').show();

                    $('#trangThai').text(switchTrangThai(response.hoaDon.trangThai));
                    switchBtn(response.hoaDon.trangThai);

                    response.hoaDonChiTiet.forEach(el => {
                        index++;
                        html += `<tr item='` + JSON.stringify(el) + `'>
                                <td><input class="form-check-input checkStatus" onchange="rowDisabledInput()"  type="checkbox" name="chiTietSanPham" value="` + el.chiTietSanPham.id + `" /></td>
                                <td>` + (el.chiTietSanPham.sanPham ? el.chiTietSanPham.sanPham.tenSP : "") + `</td>
                                <td>` + (el.chiTietSanPham.mauSac ? el.chiTietSanPham.mauSac.ten : "") + `</td>
                                <td>` + (el.chiTietSanPham.kichThuoc ? el.chiTietSanPham.kichThuoc.size : "") + `</td>
                                <td>` + (el.chiTietSanPham.chatLieu ? el.chiTietSanPham.chatLieu.tenChatLieu : "") + `</td>
                                <td><strong>` + formatCurrency(el.donGia) + `</strong></td>
                                <td colspan="2">
                                    <input class="form-control checkStatus" type="number" onchange="validateInputSoLuong(this)" placeholder="Chọn số lượng" min="1" value="` + el.soLuong + `" disabled/>
                                </td>
                            </tr>
                            `
                    })
                    tableProduct.innerHTML = html;
                    hoaDonSelect = response.hoaDon;
                    console.log(hoaDonSelect)
                    fillDataFiled(response.hoaDon);
                    if (response.hoaDon.trangThai != 3 && response.hoaDon.trangThai != 9) {
                        disableFiled();
                    }
                } else {
                    $('#gioHangShow').hide();
                }
            },
            error: function (xhr, status, error) {
                if (xhr.responseJSON.status && xhr.responseJSON.status === 400) {
                    alert(xhr.responseJSON.message)
                }
            }
        });
    }

    const disableFiled = () => {
        tenNguoiNhan.attr("disabled", true);
        soDienThoai.attr("disabled", true);
        diaChi.attr("disabled", true);
        moTa.attr("disabled", true);
        tienGiam.attr("disabled", true);
        $('#district').attr("disabled", true);
        $('#province').attr("disabled", true);

        $('.checkStatus').each(function () {
            $(this).prop("disabled", true);
        });
        $('.checkHidden').each(function () {
            $(this).hide();
        });
    }

    const fillDataFiled = (hoaDon) => {
        tenNguoiNhan.val(hoaDon.tenNguoiNhan);
        soDienThoai.val(hoaDon.sdt);
        if (hoaDon.diaChi) {
            let diaChiData = hoaDon.diaChi.split("{,} ");
            if (diaChiData.length === 3) {
                diaChi.val(diaChiData[0]);
                $('#province').html('<option value="-1">'+ diaChiData[2] +'</option>');
                $('#district').html('<option value="-1">'+ diaChiData[1] +'</option>')
            }
        }
        moTa.val(hoaDon.ghiChu);
        hoaDon.phuongThucThanhToan == 1 ? $('#defaultRadio2').attr("checked", true) : $('#defaultRadio1').attr("checked", true)
        if (hoaDon.khuyenMai) {
            document.getElementById("renderMaGiamGia").innerHTML = `
                <div class="voucher-ticket mb-1 voucher-ticket--VN voucher-ticket--seller-mini-solid mini-voucher-with-popover" id="4ddefdc1-1bf3-4656-a151-3d5f2186d4ec" hinhthucgiam="0" giatrigiam="5000.00" dieukiengia="200000" ngayketthuc="1717042680000" ten="Sale 25/5" value="4ddefdc1-1bf3-4656-a151-3d5f2186d4ec">
                    <div class=""><span class="voucher-promo-value voucher-promo-value--percent">` + formatCurrency(hoaDon.tienGiam ? hoaDon.tienGiam : 0) + `</span><span class="voucher-promo-label"> VNĐ
                    </span><span class="voucher-promo-label voucher-promo-label--off">GIẢM</span></div>
                </div>
            `
        }
        $('#tienShip').text(formatCurrency(hoaDon.tienShip ? hoaDon.tienShip : 0))
        $('#tongTien').text(formatCurrency(hoaDon.tongTien ? hoaDon.tongTien : 0))
        $('#tienGiam').text(formatCurrency(hoaDon.tienGiam ? hoaDon.tienGiam : 0))
        $('#donGia').text(formatCurrency((hoaDon.tongTien - hoaDon.tienShip + hoaDon.tienGiam) ? hoaDon.tongTien - hoaDon.tienShip + hoaDon.tienGiam : 0))
    }

    const fillTongTien = () => {
        let tongTien = 0;
        $('#listChiTietSanPham').find('tr').each(function () {
            const firstCheckbox = $(this).find('input[type="checkbox"]:first');
            if (!firstCheckbox.is(':checked')) {
                $('#checkAll').prop('checked', false);
            }
            const lastInput = $(this).find('input:last');
            const lastInputValue = lastInput.val();
            let product = JSON.parse($(this).attr('item'));

            tongTien += parseInt(lastInputValue) * product.chiTietSanPham.donGia;
        });

        $('#donGia').text(formatCurrency(tongTien))

        tongTien +=  parseInt(removeCurrencyFormat($('#tienShip').text()));

        if (khuyenMaiSelect.id) {
            if (tongTien >= khuyenMaiSelect.dieuKienGia) {
                if (khuyenMaiSelect.hinhThucGiamGia == 1) {
                    tienGiam.text(formatCurrency(tongTien * (khuyenMaiSelect.giaTriGiam) / 100));
                    tongTien = tongTien * (100 - khuyenMaiSelect.giaTriGiam) / 100
                } else {
                    tienGiam.text(formatCurrency(khuyenMaiSelect.giaTriGiam));
                    tongTien = tongTien - khuyenMaiSelect.giaTriGiam;
                    if (tongTien < 0) {
                        tongTien = 0;
                    }
                }
            } else {
                alert("Hóa đơn không đủ điều kiện để áp dụng mã giảm giá")
                clearKhuyenMai();
                tienGiam.text(0)
                $('#renderMaGiamGia').html('');
                tienGiam.val(0);
            }
        } else {
            tienGiam.val(0);
        }
        $('#tongTien').text(formatCurrency(tongTien));
    }

    const deleteProduct = () => {
        let productShopping = []
        let kt = confirm("Bạn có chắc chắn muốn sản phẩm khỏi hóa đơn không?");
        if (kt == true) {
            let check = true;
            let checkRecordProduct = 0;
            $('#listChiTietSanPham').find('tr').each(function () {
                const firstCheckbox = $(this).find('input[type="checkbox"]:first');
                if (firstCheckbox.is(':checked')) {
                    checkRecordProduct++;
                    let product = JSON.parse($(this).attr('item'));
                    productShopping.push(product.id)
                }
            });
            if (checkRecordProduct == 0) {
                alert("Bạn phải chọn ít nhất một sản phẩm");
                return;
            }
            if (checkRecordProduct == $('#listChiTietSanPham').find('tr').length) {
                let solution = confirm("Đây là sản phẩm cuối cùng trong hóa đơn. Nếu bạn xóa đi thì Hóa đơn sẽ bị xóa theo!!!");
                if (!solution) {
                    return;
                }
            }
            if (check) {
                $.ajax({
                    type: "POST",
                    url: "/ban-hang-online/rest/delete-hoa-don?id=" + hoaDonSelect.id,
                    contentType: "application/json",
                    data: JSON.stringify(productShopping),
                    success: function (response) {
                        alert("Xóa sản phẩm khỏi hóa đơn thành công")
                        if (!response) {
                            window.location.href = "/ban-hang-online/hoa-don";
                        } else {
                            location.reload();
                        }
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
                    url: "/ban-hang-online/rest/update-hoa-don?id=" + hoaDonSelect.id,
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

    function switchTrangThai(trangThai) {
        switch (trangThai) {
            case 0:
                return "Đang chờ xác nhận";
            case 1:
                return "Đã xác nhận";
            case 2:
                return "Đã thanh toán";
            case 3:
                return "Chờ thanh toán";
            case 4:
                return "Chờ vẫn chuyển";
            case 5:
                return "Đang vận chuyển";
            case 6:
                return "Vận chuyển hoàn tất";
            case 7:
                return "Giao trễ";
            case 8:
                return "Đã hủy";
            case 9:
                return "Mới tạo";
            case 10:
                return "Hoàn tất";
            default:
                return "";
        }
    }

    function switchBtn(trangThai) {
        switch (trangThai) {
            case 0: {
                $('#btnThanhToan').hide();
                $('#btnHuyDonHang').show();
                $('#hoanThanhDonHang').hide();
                break;
            }
            case 1: {
                $('#btnThanhToan').hide();
                $('#btnHuyDonHang').hide();
                $('#hoanThanhDonHang').hide();
                break;
            }
            case 2: {
                $('#btnThanhToan').hide();
                $('#btnHuyDonHang').show();
                $('#hoanThanhDonHang').hide();
                break;
            }
            case 3: {
                $('#btnThanhToan').show();
                $('#btnHuyDonHang').show();
                $('#hoanThanhDonHang').hide();
                break;
            }
            case 4: {
                $('#btnThanhToan').hide();
                $('#btnHuyDonHang').hide();
                $('#hoanThanhDonHang').hide();
                break;
            }
            case 5: {
                $('#btnThanhToan').hide();
                $('#btnHuyDonHang').hide();
                $('#hoanThanhDonHang').hide();
                break;
            }
            case 6: {
                $('#btnThanhToan').hide();
                $('#btnHuyDonHang').hide();
                $('#hoanThanhDonHang').show();
                break;
            }
            case 7: {
                $('#btnThanhToan').hide();
                $('#btnHuyDonHang').hide();
                $('#hoanThanhDonHang').hide();
                break;
            }
            case 8: {
                $('#btnThanhToan').hide();
                $('#btnHuyDonHang').hide();
                $('#hoanThanhDonHang').hide();
                break;
            }
            case 9: {
                $('#btnThanhToan').show();
                $('#btnHuyDonHang').show();
                $('#hoanThanhDonHang').hide();
                break;
            }
            case 10: {
                $('#btnThanhToan').hide();
                $('#btnHuyDonHang').hide();
                $('#hoanThanhDonHang').hide();
                break;
            }
            default:
                return "";
        }
    }

    function clearTienShip() {
        $('#tienShip').text(0);
        fillTongTien();
    }

    function getTienShip() {
        var selectedProvinceText = $("#province option:selected").text();
        var selectedDistrictText = $("#district option:selected").text();
        var params = {
            province: selectedProvinceText,
            district: selectedDistrictText
        };
        $.ajax({
            url: "/ban-hang-online/rest/phi-giao-hang",
            type: "GET",
            data: params,
            success: function(response) {
               $('#tienShip').text(formatCurrency(response.fee.fee));
                fillTongTien();
            },
            error: function(xhr, status, error) {
                console.error("Đã có lỗi xảy ra:", status, error);
            }
        });
    }
</script>
</html>
