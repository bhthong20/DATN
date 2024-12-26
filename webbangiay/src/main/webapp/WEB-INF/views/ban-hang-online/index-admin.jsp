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
<section>

    <section class="container" style="display: none" id="gioHangShow">
        <h4 class="fw-bold py-3 mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 24 24"
                 style="fill: rgba(0, 0, 0, 1);transform: ;msFilter:;">
                <path d="M4 6h2v2H4zm0 5h2v2H4zm0 5h2v2H4zm16-8V6H8.023v2H18.8zM8 11h12v2H8zm0 5h12v2H8z"></path>
            </svg>
            <span id="title"></span>
        </h4>
        <div class="row">
            <div class="col-lg-8 mb-3" style="min-height: 100%">
                <div class="card" style="height: 100%">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Thông tin hóa đơn</h5>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Trạng thái</label>
                                <div class="col-sm-7">
                                    <span id="trangThai">Chưa thanh toán</span>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Đơn giá</label>
                                <div class="col-sm-7">
                                    <span id="donGia">0</span><span>VNĐ</span>
                                </div>
                            </div>
                            <c:if test="${not empty listKM}">
                                <div class="row mb-3" id="maGiamGia">
                                    <label class="col-sm-5 col-form-label">Mã giảm giá</label>
                                    <div class="col-sm-7">
                                        <span class="mini-vouchers__vouchers flex flex-auto flex-no-overflow">
                                            <span id="renderMaGiamGia">
<%--                                                <div class="voucher-ticket voucher-ticket--VN voucher-ticket--seller-mini-solid mini-voucher-with-popover">--%>
<%--                                                    <div class=""><span--%>
<%--                                                            class="voucher-promo-value voucher-promo-value--percent">20</span><span--%>
<%--                                                            class="voucher-promo-label">%</span><span--%>
<%--                                                            class="voucher-promo-label voucher-promo-label--off">GIẢM</span></div>--%>
<%--                                                </div>--%>
                                            </span>
                                        </span>

                                    </div>
                                </div>
                            </c:if>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Tiền giảm</label>
                                <div class="col-sm-7">
                                    <span id="tienGiam">0</span><span>VNĐ</span>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" title="(Không được áp dụng mã giảm giá)">Tiền
                                    Ship</label>
                                <div class="col-sm-7">
                                    <span id="tienShip">0</span><span>VNĐ</span>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Thành tiền</label>
                                <div class="col-sm-7">
                                    <span id="tongTien">0</span><span>VNĐ</span>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label">Phương thức thanh
                                    toán</label>
                                <div class="col-sm-7">
                                    <div class="form-check">
                                        <input
                                                name="default-radio-1"
                                                class="form-check-input"
                                                type="radio"
                                                value=""
                                                disabled
                                                id="defaultRadio1"
                                        />
                                        <label class="form-check-label" for="defaultRadio1"> Thanh toán khi nhận
                                            hàng </label>
                                    </div>
                                    <div class="form-check">
                                        <input
                                                name="default-radio-1"
                                                class="form-check-input"
                                                type="radio"
                                                value=""
                                                disabled
                                                id="defaultRadio2"
                                                checked
                                        />
                                        <label class="form-check-label" for="defaultRadio2"> Thanh toán online </label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 text-center">
                                    <a href="/hoa-don" type="button" class="btn btn-danger">Quay lại</a>
                                    <button type="button" onclick="thayDoiTrangThai(8)" id="btnHuyDon" class="btn btn-danger">Hủy đơn</button>
                                    <button type="button" onclick="thayDoiTrangThai(1)" id="btnXacNhan" class="btn btn-danger">Xác nhận đơn hàng</button>
                                    <button type="button" onclick="thayDoiTrangThai(5)" id="btnXacNhanGiao" class="btn btn-danger">Xác nhận giao hàng</button>
                                    <button type="button" onclick="thayDoiTrangThai(6)" id="btnGiaoHang" class="btn btn-danger">Giao hàng thành công</button>
                                    <button type="button" onclick="quayLaiTrangThai()" id="btnQuayLai" class="btn btn-danger">Quay lại trạng thái</button>
                                    <button type="button" onclick="exportHTMLtoPDF()" class="btn btn-danger btnExport">In hóa đơn</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-3">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Thông tin người nhận</h5>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" for="tenNguoiNhan">Tên người nhận</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="tenNguoiNhan" disabled
                                           placeholder="Nhập thông tin"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" for="soDienThoai">Số điện thoại</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="soDienThoai" disabled
                                           placeholder="Nhập thông tin"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" for="diaChi">Địa chỉ</label>
                                <div class="col-sm-7">
                                    <select name="" class="form-select mb-2" disabled onchange="clearTienShip()" id="province">
                                        <option value="-1">Chọn tỉnh thành</option>
                                    </select>
                                    <select name="" class="form-select mb-2" disabled onchange="getTienShip()" id="district">
                                        <option value="-1">Chọn quận/huyện</option>
                                    </select>
                                    <input type="text" class="form-control" id="diaChi" disabled
                                           placeholder="Nhập thông tin"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" for="maKhachHang">Mã khách hàng</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="maKhachHang" disabled
                                           placeholder="Nhập thông tin"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" for="tenKhachHang">Tên khách hàng</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="tenKhachHang" disabled
                                           placeholder="Nhập thông tin"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-5 col-form-label" for="moTa">Mô tả</label>
                                <div class="col-sm-7">
                                    <textarea type="text" class="form-control" id="moTa" disabled
                                              placeholder="Nhập thông tin"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div class="card-title w-100">
                            <div class="d-flex align-items-center justify-content-between">
                                <h5 class="mb-0">Danh sách sản phẩm</h5>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive text-nowrap">
                        <table class="table">
                            <thead>
                            <tr>
                                <th><input class="form-check-input" type="checkbox" disabled id="checkAll" onchange="checkAll(this)" type="checkbox"/></th>
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
        </div>
    </section>
</section>

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
                            <div onclick="renderSale(this)" class="voucher-ticket voucher-ticket--VN voucher-ticket--seller-mini-solid mini-voucher-with-popover"
                                 hinhThucGiam="${item.hinhThucGiamGia}"
                                 giaTriGiam="${item.giaTriGiam}"
                                 dieuKienGia="${item.dieuKienGia}"
                                 ngayKetThuc="${item.ngayKetThuc}"
                                 ten="${item.ten}"
                                 value="${item.id}"
                                 id="${item.id}"
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

<div class="modal fade" id="inhoadon"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-xl modal-dialog-centered" style="min-width: 1400px;">
        <div class="modal-content">
            <div id="content">
                <div style="width: 100%; text-align: center; padding: 30px 0">
                    <h1>HÓA ĐƠN BÁN HÀNG</h1>
                    <span>Mã hóa đơn: <span id="maHoaDonPdf" style="font-weight: 900;">HD0222</span></span>
                    <div class="pb-2" style=""><img style="background: #FFFFFF; padding: 10px" src="../uploads/barcode.png" width="200px" height="70px" /></div>
                    <span>Ngày tạo: <span id="ngayTaoPdf" style="font-weight: 900;">18/05/2024</span></span>
                </div>
                <div class="container">
                    <!--        row 1-->
<%--                    <div class="row">--%>
<%--                        <div class="col-2">--%>
<%--                            <span class="text-end">Mã hóa đơn</span>--%>
<%--                        </div>--%>
<%--                        <div class="col-4">--%>
<%--                            <span id="maHoaDonPdf"></span>--%>
<%--                        </div>--%>
<%--                        <div class="col-2">--%>
<%--                            <span class="text-end">Ngày tạo</span>--%>
<%--                        </div>--%>
<%--                        <div class="col-4">--%>
<%--                            <span id="ngayTaoPdf"></span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <!--        row 2-->
                    <div class="row">
                        <div class="col-4">
                            <span class="text-end">Chi nhánh:</span>
                        </div>
                        <div class="col-8">
                            <span>Sneaker Hà Nội</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <span class="text-end">Nhân viên:</span>
                        </div>
                        <div class="col-8">
                            <span id="nhanVien"></span>
                        </div>
                    </div>
                    <div class="row">
<%--                        <div class="col-2">--%>
<%--                            <span class="text-end">Mã người đặt hàng</span>--%>
<%--                        </div>--%>
<%--                        <div class="col-4">--%>
<%--                            <span id="maKhachHangPdf"></span>--%>
<%--                        </div>--%>
                        <div class="col-4">
                            <span class="text-end">Tên người nhận</span>
                        </div>
                        <div class="col-8">
                            <span id="tenNguoiNhanPdf"></span>
                        </div>
                    </div>
                    <!--        row 3-->
                    <div class="row">
<%--                        <div class="col-4">--%>
<%--                            <span class="text-end">Tên người đặt hàng</span>--%>
<%--                        </div>--%>
<%--                        <div class="col-8">--%>
<%--                            <span id="tenKhachHangPdf"></span>--%>
<%--                        </div>--%>
                        <div class="col-4">
                            <span class="text-end">Địa chỉ người nhận</span>
                        </div>
                        <div class="col-8">
                            <span id="diaChiNhanPdf"></span>
                        </div>
                    </div>
                    <!--        row 4-->
                    <div class="row mb-5">
<%--                        <div class="col-2">--%>
<%--                            <span class="text-end">Số điện thoại người đặt</span>--%>
<%--                        </div>--%>
<%--                        <div class="col-4">--%>
<%--                            <span id="soDienThoaiNguoiDatPdf"></span>--%>
<%--                        </div>--%>
                        <div class="col-4">
                            <span class="text-end">Sđt người nhận</span>
                        </div>
                        <div class="col-8">
                            <span id="soDienThoaiNguoiNhanPdf"></span>
                        </div>
                    </div>
                    <!--        row 5-->

                    <div class="row mb-5">
                        <div class="text-nowrap">
                            <table border="1" class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Tên sản phẩm</th>
<%--                                    <th>Màu sắc</th>--%>
<%--                                    <th>Kích cỡ</th>--%>
<%--                                    <th>Chất liệu</th>--%>
                                    <th>Giá(VNĐ)</th>
                                    <th>Sl Mua</th>
                                    <th>Tổng tiền</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-2" id="listSanPhamPdf">

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="row mb-5">
                        <div class="col-6">
                            <div>
                                ghi chú:
                                <span id="ghiChu">

                                </span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <div class="col-4">
                                    <span class="text-end">Đơn giá</span>
                                </div>
                                <div class="col-8">
                                    <span id="donGiaPdf"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <span class="text-end">Phí ship</span>
                                </div>
                                <div class="col-8">
                                    <span id="phiShipPdf"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <span class="text-end">Tiền giảm</span>
                                </div>
                                <div class="col-8">
                                    <span id="tienDuocGiamPdf"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <span class="text-end">Tổng tiền</span>
                                </div>
                                <div class="col-8">
                                    <span id="tongTienPdf"></span>
                                </div>
                                <%--                        <div class="col-2">--%>
                                <%--                            <span class="text-end">Trạng thái</span>--%>
                                <%--                        </div>--%>
                                <%--                        <div class="col-4">--%>
                                <%--                            <span id="trangThaiPdf"></span>--%>
                                <%--                        </div>--%>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6 text-center">
                            Người đặt hàng
                        </div>
                        <div class="col-6 text-center">
                            Người nhận hàng
                        </div>
                    </div>

                </div>
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
<script src="../assets/vendor/api-province/data.json"></script>
<script src="../assets/vendor/api-province/api.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    function exportHTMLtoPDF() {
        window.scrollTo(0, 0);
        fillExportHoaDon(hoaDonSelect);
        setTimeout(function () {
            let htmlElement = document.getElementById('content');

            html2pdf().from(htmlElement).save('exported_file.pdf');
        }, 500);
    }
    function formatDateTime(dateTimeStr) {
        let date = new Date(dateTimeStr);
        let options = {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit',
            hour12: false
        };
        return date.toLocaleDateString('en-GB', options).replace(',', '');
    }
    const fillExportHoaDon = (hoaDon) => {
        $("#maHoaDonPdf").text(hoaDon.ma);
        $("#ngayTaoPdf").text(formatDateTime(hoaDon.ngayTao));
        $("#nhanVien").text(hoaDon.nhanVien ? hoaDon.nhanVien.hoTen : "Không có dữ liệu");
        $("#maKhachHangPdf").text(hoaDon.khachHang ? hoaDon.khachHang.ma : "Không có dữ liệu");
        $("#tenKhachHangPdf").text(hoaDon.khachHang ? hoaDon.khachHang.hoTen : "Không có dữ liệu");
        $("#tenNguoiNhanPdf").text(hoaDon.tenNguoiNhan ? hoaDon.tenNguoiNhan : "Không có dữ liệu");
        $("#diaChiNhanPdf").text(hoaDon.diaChi ? hoaDon.diaChi.replaceAll("{,}", ",") : "Không có dữ liệu");
        $("#soDienThoaiNguoiDatPdf").text(hoaDon.khachHang ? hoaDon.khachHang.sdt : "Không có dữ liệu");
        $("#soDienThoaiNguoiNhanPdf").text(hoaDon.sdt ? hoaDon.sdt : "Không có dữ liệu");
        $("#donGiaPdf").text((hoaDon.tongTien + hoaDon.tienGiam - hoaDon.tienShip).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " VNĐ");
        $("#phiShipPdf").text(hoaDon.tienShip ? hoaDon.tienShip.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " VNĐ" : "0 VNĐ");
        $("#tenMaGiamGiaPdf").text(hoaDon.khuyenMai ? hoaDon.khuyenMai.ten : "Không có dữ liệu");
        $("#tienDuocGiamPdf").text(hoaDon.tienGiam ? hoaDon.tienGiam.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " VNĐ" : "0 VNĐ");
        $("#tongTienPdf").text(hoaDon.tongTien ? hoaDon.tongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " VNĐ" : "0 VNĐ");
        $("#trangThaiPdf").text(switchTrangThai(hoaDon.trangThai));
        $("#ghiChu").text(hoaDon.ghiChu);

        const tableProduct = document.getElementById("listSanPhamPdf");
        let html = '';
        $('#listChiTietSanPham').find('tr').each(function () {
            const lastInput = $(this).find('input:last');
            let product = JSON.parse($(this).attr('item'));
            const lastInputValue = lastInput.val();
            html += `
                <tr>
                    <td>
                        ` + product.chiTietSanPham.sanPham.tenSP + `
                        (` + product.chiTietSanPham.mauSac.ten + ` - ` + product.chiTietSanPham.kichThuoc.size + ` - ` + product.chiTietSanPham.chatLieu.tenChatLieu + `)
                    </td>
                    <td><strong>` +  product.donGia.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + `</strong></td>
                    <td><strong>` + product.soLuong.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + `</strong></td>
                    <td><strong>` + (product.soLuong*product.donGia).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + `</strong></td>
                </tr>
            `
        });
        tableProduct.innerHTML = html;
    }

    let urlBanHangTaiQuay = window.location.href;

    let urlParams = new URLSearchParams(new URL(urlBanHangTaiQuay).search);

    let id = urlParams.get("id");

    let khuyenMaiSelect = {
        id: "",
        hinhThucGiamGia: 1,
        giaTriGiam: 0,
    }

    const tenNguoiNhan = $('#tenNguoiNhan');
    const soDienThoai = $('#soDienThoai');
    const email = $('#email');
    const diaChi = $("#diaChi");
    const moTa = $("#moTa");
    const tienGiam = $('#tienGiam');

    window.onload = async function () {
        await loadChiTietSanPham();
    };

    function thanhToan() {
        // if (validateFields()) {
        let kt = confirm("Bạn có chắc chắn muốn thanh toán không?");
        if (kt) {
            $.ajax({
                type: "POST",
                url: "/ban-hang-online/rest/them-gio-hang",
                contentType: "application/json",
                data: JSON.stringify(data), // Chuyển đổi dữ liệu thành chuỗi JSON
                success: function (response) {
                    alert("Sản phẩm đã được thêm vào giỏ hàng");
                    location.reload();
                },
                error: function (xhr, status, error) {
                    if (xhr.responseJSON.status && xhr.responseJSON.status === 400) {
                        alert(xhr.responseJSON.message)
                    }
                }
            });
        }
        // }
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
                    $('#title').text("Hóa đơn " + response.hoaDon.ma)
                    $('#gioHangShow').show();

                    $('#trangThai').text(switchTrangThai(response.hoaDon.trangThai));
                    switchBtn(response.hoaDon.trangThai);

                    response.hoaDonChiTiet.forEach(el => {
                        index++;
                        html += `<tr item='` + JSON.stringify(el) + `'>
                                <td><input class="form-check-input checkStatus" disabled type="checkbox" name="chiTietSanPham" value="` + el.chiTietSanPham.id + `" /></td>
                                <td>` + (el.chiTietSanPham.sanPham ? el.chiTietSanPham.sanPham.tenSP : "") + `</td>
                                <td>` + (el.chiTietSanPham.mauSac ? el.chiTietSanPham.mauSac.ten : "") + `</td>
                                <td>` + (el.chiTietSanPham.kichThuoc ? el.chiTietSanPham.kichThuoc.size : "") + `</td>
                                <td>` + (el.chiTietSanPham.chatLieu ? el.chiTietSanPham.chatLieu.tenChatLieu : "") + `</td>
                                <td><strong>` + el.donGia.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + `</strong></td>
                                <td colspan="2">
                                    <input class="form-control" type="number" disabled onchange="validateInputSoLuong(this)" placeholder="Chọn số lượng" min="1" value="` + el.soLuong + `" />
                                </td>
                            </tr>
                            `
                    })
                    tableProduct.innerHTML = html;
                    hoaDonSelect = response.hoaDon;
                    fillDataFiled(response.hoaDon);
                } else {
                    $('#gioHangShow').hide();
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr.responseText);
            }
        });
    }

    const fillDataFiled = (hoaDon) => {
        tenNguoiNhan.val(hoaDon.tenNguoiNhan);
        soDienThoai.val(hoaDon.sdt);
        diaChi.val(hoaDon.diaChi);
        moTa.val(hoaDon.ghiChu);
        if (hoaDon.diaChi) {
            let diaChiData = hoaDon.diaChi.split("{,} ");
            if (diaChiData.length === 3) {
                diaChi.val(diaChiData[0]);
                $('#province').html('<option value="-1">'+ diaChiData[2] +'</option>');
                $('#district').html('<option value="-1">'+ diaChiData[1] +'</option>')
            }
        }
        $('#maKhachHang').val(hoaDon.khachHang.ma)
        $('#tenKhachHang').val(hoaDon.khachHang.hoTen)
        hoaDon.phuongThucThanhToan == 1 ? $('#defaultRadio2').attr("checked", true) : $('#defaultRadio1').attr("checked", true)

        if (hoaDon.khuyenMai) {
            renderSale($('#' + hoaDon.khuyenMai.id));
        }
        $('#tienShip').text(hoaDon.tienShip ? hoaDon.tienShip.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') : 0);

        $('#tienGiam').text(hoaDon.tienGiam ? hoaDon.tienGiam.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') : 0);
        $('#tongTien').text(hoaDon.tongTien ? hoaDon.tongTien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') : 0);
        $('#donGia').text((hoaDon.tienGiam + hoaDon.tongTien - hoaDon.tienShip).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));

    }

    function thayDoiTrangThai(trangThai) {
        let kt = confirm("Bạn có chắc chắn muốn thay đổi trang thái hóa đơn không?");
        if (kt) {
            let data = {
                idHoaDon: hoaDonSelect.id,
                trangThai: trangThai,
            }
            $.ajax({
                type: "POST",
                url: "/ban-hang-online/rest/thay-doi-trang-thai",
                contentType: "application/json",
                data: JSON.stringify(data), // Chuyển đổi dữ liệu thành chuỗi JSON
                success: function (response) {
                    alert("Thay đổi trang thái hóa đơn thành công!!!")
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

    function quayLaiTrangThai() {
        let kt = confirm("Bạn có chắc chắn muốn quay lại trạng thái trước không?");
        if (kt) {
            console.log(hoaDonSelect.id)
            $.ajax({
                type: "POST",
                url: "/ban-hang-online/rest/quay-lai-trang-thai/" + hoaDonSelect.id,
                success: function (response) {
                    alert("Thay đổi trang thái hóa đơn thành công!!!")
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

    const checkAll = (checkbox) => {
        $('#listChiTietSanPham').find('tr').each(function () {
            const firstCheckbox = $(this).find('input[type="checkbox"]:first');
            firstCheckbox.prop('checked', $(checkbox).is(':checked'));
        });
    }

    // validate số lượng
    const validateInputSoLuong = (input) => {
        const soLuong = parseInt(input.value, 10);
        if (isNaN(soLuong) || soLuong <= 0) {
            alert("Vui lòng nhập vào một số nguyên dương.");
            input.value = 1;
        }
    }

    function switchTrangThai(trangThai) {
        switch (trangThai) {
            case 0: return "Đang chờ xác nhận";
            case 1: return "Đã xác nhận";
            case 2: return "Đã thanh toán";
            case 3: return "Chờ thanh toán";
            case 4: return "Chờ vẫn chuyển";
            case 5: return "Đang vận chuyển";
            case 6: return "Vận chuyển hoàn tất";
            case 7: return "Giao trễ";
            case 8: return "Đã hủy";
            case 9: return "Mới tạo";
            case 10: return "Hoàn tất";
            default: return "";
        }
    }

    function switchBtn(trangThai) {
        switch (trangThai) {
            case 0: {
                $('#btnGiaoHang').hide();
                $('#btnXacNhanGiao').hide();
                $('#btnXacNhan').show();
                $('#btnHuyDon').show();
                $(".btnExport").hide();
                $("#btnQuayLai").hide();
                break;
            }
            case 1: {
                $('#btnGiaoHang').hide();
                $('#btnXacNhanGiao').show();
                $('#btnXacNhan').hide();
                $('#btnHuyDon').show();
                $(".btnExport").show();
                break;
            }
            case 2: {
                $('#btnGiaoHang').hide();
                $('#btnXacNhanGiao').hide();
                $('#btnXacNhan').hide();
                $('#btnHuyDon').hide();
                $(".btnExport").show();
                break;
            }
            case 3: {
                $('#btnGiaoHang').hide();
                $('#btnXacNhanGiao').hide();
                $('#btnXacNhan').hide();
                $('#btnHuyDon').hide();
                $(".btnExport").hide();
                break;
            }
            case 4: {
                $('#btnGiaoHang').hide();
                $('#btnXacNhanGiao').hide();
                $('#btnXacNhan').hide();
                $('#btnHuyDon').hide();
                $(".btnExport").show();
                break;
            }
            case 5: {
                $('#btnGiaoHang').show();
                $('#btnXacNhanGiao').hide();
                $('#btnXacNhan').hide();
                $('#btnHuyDon').hide();
                $(".btnExport").show();
                break;
            }
            case 6: {
                $('#btnGiaoHang').hide();
                $('#btnXacNhanGiao').hide();
                $('#btnXacNhan').hide();
                $('#btnHuyDon').hide();
                $(".btnExport").show();
                break;
            }
            case 7: {
                $('#btnGiaoHang').hide();
                $('#btnXacNhanGiao').hide();
                $('#btnXacNhan').hide();
                $('#btnHuyDon').hide();
                $(".btnExport").show();
                break;
            }
            case 8: {
                $('#btnGiaoHang').hide();
                $('#btnXacNhanGiao').hide();
                $('#btnXacNhan').hide();
                $('#btnHuyDon').hide();
                $(".btnExport").hide();
                break;
            }
            case 9: {
                $('#btnGiaoHang').hide();
                $('#btnXacNhanGiao').hide();
                $('#btnXacNhan').hide();
                $('#btnHuyDon').hide();
                $(".btnExport").hide();
                $("#btnQuayLai").hide();
                break;
            }
            case 10: {
                $('#btnGiaoHang').hide();
                $('#btnXacNhanGiao').hide();
                $('#btnXacNhan').hide();
                $('#btnHuyDon').hide();
                $(".btnExport").show();
                $("#btnQuayLai").hide();
                break;
            }
            default: return "";
        }
    }
</script>
</html>
