<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="shortcut icon" href="../../images/favicon.png"/>
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css"/>
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="../assets/css/demo.css"/>
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>
    <script src="../assets/vendor/js/helpers.js"></script>
</head>
</head>

<body>
<div class="container">
    <div class="col-md-12">
        <div class="card">
            <h3 class="card-header">Thêm mới mã giảm giá</h3>
            <div class="card-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3 mt-3">
                                <input id="ma" disabled class="form-control" placeholder="Nhập tự động"/>
                                <label for="ma">Mã:</label>
                                <span id="maError" style="color: red"></span>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input id="ten" class="form-control" placeholder=""/>
                                <label for="ten">Tên:</label>
                                <span id="tenError" style="color: red"></span>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input id="ngayBatDau" type="datetime-local" class="form-control" placeholder=""
                                       path="sanPham"/>
                                <label for="ngayBatDau">Ngày bắt đầu:</label>
                                <span id="ngayBatDauError" style="color: red"></span>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input id="ngayKetThuc" type="datetime-local" class="form-control" placeholder=""
                                       path="sanPham"/>
                                <label for="ngayKetThuc">Ngày kết thúc:</label>
                                <span id="ngayKetThucError" style="color: red"></span>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating mb-3 mt-3">
                                <div class="form-check">
                                    <input
                                            name="default-radio-1"
                                            class="form-check-input"
                                            type="radio"
                                            value="0"
                                            id="giamTheoPhamTram"
                                            checked
                                    />
                                    <label class="form-check-label" for="giamTheoPhamTram"> Giảm theo phần trăm </label>
                                </div>
                                <div class="form-check">
                                    <input
                                            name="default-radio-1"
                                            class="form-check-input"
                                            type="radio"
                                            value="1"
                                            id="giamTheoTien"
                                    />
                                    <label class="form-check-label" for="giamTheoTien"> Giảm theo VNĐ </label>
                                </div>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input id="giaTriGiam" type="text" class="form-control" placeholder=""
                                       path="sanPham"/>
                                <label for="giaTriGiam">Giá trị giảm:</label>
                                <span id="giaTriGiamError" style="color: red"></span>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <input id="dieuKienGia" type="text" class="form-control" placeholder=""
                                       path="sanPham"/>
                                <label for="giaTriGiam">Điều kiện giảm:</label>
                                <span id="dieuKienGiaError" style="color: red"></span>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <textarea id="moTa" class="form-control" path="moTa"></textarea>
                                <label for="moTa" path="moTa">Mô tả:</label>
                                <span id="moTaError" style="color: red"></span>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="row">
                    <div class="col-12" style="text-align: center">
                        <a class="btn btn-primary" href="/khuyen-mai/hien-thi">Quay lại</a>
                        <button type="button" class="btn btn-primary"
                                id="bttCreate" onclick="return createKhuyenMai()">Thêm mới
                        </button>
                        <button type="button" class="btn btn-primary"
                                id="bttUpdate" onclick="return updateKhuyenMai()">Update
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<!-- Core JS -->
<script>

    var url = window.location.href;

    var urlParams = new URLSearchParams(new URL(url).search);

    var id = urlParams.get("id");

    window.onload = function () {
        if (id) {
            $('#bttCreate').hide();
            $('#bttUpdate').show();
            $.ajax({
                type: "GET",
                url: "/khuyen-mai/detail?id=" + id,
                success: function (response) {
                    ma.val(response.ma);
                    ten.val(response.ten);
                    ngayBatDau.val(new Date(response.ngayBatDau).toISOString().slice(0, 16));
                    ngayKetThuc.val(new Date(response.ngayKetThuc).toISOString().slice(0, 16));
                    response.hinhThucGiamGia === 1 ? giamTheoPhamTram.attr("checked", true) : giamTheoTien.attr("checked", true);
                    giaTriGiam.val(formatNumber(response.giaTriGiam));
                    moTa.val(response.moTa);
                    dieuKienGia.val(formatNumber(response.dieuKienGia));
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                }
            });
        } else {
            $('#bttCreate').show();
            $('#bttUpdate').hide();
        }
    };

    // Hàm formatNumber để định dạng số với dấu phẩy
    function formatNumber(value) {
        return parseFloat(value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }


    const ma = $('#ma');
    const ten = $('#ten');
    const ngayBatDau = $('#ngayBatDau');
    const ngayKetThuc = $('#ngayKetThuc');
    const giamTheoPhamTram = $('#giamTheoPhamTram');
    const giamTheoTien = $('#giamTheoTien');
    const giaTriGiam = $('#giaTriGiam');
    const moTa = $('#moTa');
    const dieuKienGia = $('#dieuKienGia');

    const maError = $('#maError');
    const tenError = $('#tenError');
    const ngayBatDauError = $('#ngayBatDauError');
    const ngayKetThucError = $('#ngayKetThucError');
    const giaTriGiamError = $('#giaTriGiamError');
    const moTaError = $('#moTaError');
    const dieuKienGiaError = $('#dieuKienGiaError');
    const validate = () => {
        let isValid = true;

        tenError.text('');
        ngayBatDauError.text('');
        ngayKetThucError.text('');
        giaTriGiamError.text('');
        moTaError.text('');
        dieuKienGiaError.text('');

        if (ten.val().trim() === '') {
            isValid = false;
            tenError.text('Trường Tên không được bỏ trống');
        }
        if (ngayBatDau.val().trim() === '') {
            isValid = false;
            ngayBatDauError.text('Trường Ngày bắt đầu không được bỏ trống');
        }
        if (ngayKetThuc.val().trim() === '') {
            isValid = false;
            ngayKetThucError.text('Trường Ngày kết thúc không được bỏ trống');
        }
        if (removeFormat(giaTriGiam.val()).trim() === '') {
            isValid = false;
            giaTriGiamError.text('Trường Giá trị giảm không được bỏ trống');
        }
        if (removeFormat(dieuKienGia.val()).trim() === '') {
            isValid = false;
            dieuKienGiaError.text('Điều kiện giá không được bỏ trống');
        }
        if (moTa.val().trim() === '') {
            isValid = false;
            moTaError.text('Trường Mô tả không được bỏ trống');
        }

        const ngayBatDauValue = new Date(ngayBatDau.val()).getTime();
        const ngayKetThucValue = new Date(ngayKetThuc.val()).getTime();
        if (ngayBatDauValue > ngayKetThucValue) {
            isValid = false;
            ngayKetThucError.text('Ngày bắt đầu không được lớn hơn ngày kết thúc');
        }

        // Kiểm tra giá trị giảm khi giamTheoPhanTram được chọn
        if (giamTheoPhamTram.is(':checked')) {
            const giaTriGiamValue = parseFloat(removeFormat(giaTriGiam.val()));
            if (giaTriGiamValue < 0 || giaTriGiamValue > 100 || isNaN(giaTriGiamValue)) {
                isValid = false;
                giaTriGiamError.text('Giá trị giảm phải nằm trong khoảng từ 0 đến 100');
            }
        }

        return isValid;
    }

    const getValue = () => {
        return {
            id: id,
            ma: ma.val(),
            ten: ten.val(),
            ngayBatDau: new Date(ngayBatDau.val()).getTime(),
            ngayKetThuc: new Date(ngayKetThuc.val()).getTime(),
            trangThai: 1,
            hinhThucGiamGia: giamTheoPhamTram.is(':checked') ? 1 : 0,
            giaTriGiam: removeFormat(giaTriGiam.val()),
            dieuKienGia: removeFormat(dieuKienGia.val()),
            moTa: moTa.val(),
        }
    }

    // Hàm removeFormat để loại bỏ dấu phẩy khỏi giá trị
    function removeFormat(value) {
        return value.replace(/,/g, '');
    }

    $(document).ready(function () {
        $('#giaTriGiam').on('input', function () {
            let value = removeFormat($(this).val());
            if (!isNaN(value) && value !== '') {
                $(this).val(formatNumber(value));
            } else {
                $(this).val('');
            }
        });

        $('#dieuKienGia').on('input', function () {
            let value = removeFormat($(this).val());
            if (!isNaN(value) && value !== '') {
                $(this).val(formatNumber(value));
            } else {
                $(this).val('');
            }
        });
    });

    const createKhuyenMai = () => {
        if (validate()) {
            let kt = confirm("Bạn có chắc chắn muốn thêm chương trình khuyến mại mới không?");
            if (kt) {
                $.ajax({
                    type: "POST",
                    url: "/khuyen-mai/add",
                    contentType: "application/json",
                    data: JSON.stringify(getValue()),
                    success: function (response) {
                        alert("Thêm thành công");
                        window.location.href = "/khuyen-mai/hien-thi";
                    },
                    error: function (xhr, status, error) {
                        if (xhr.responseJSON.status && xhr.responseJSON.status === 400) {
                            alert(xhr.responseJSON.message)
                        }
                    }
                });
                return true;
            } else {
                return false;
            }
        }
    }

    const updateKhuyenMai = () => {
        if (validate()) {
            let kt = confirm("Bạn có chắc chắn muốn thêm chương trình khuyến mại mới không?");
            if (kt) {
                $.ajax({
                    type: "POST",
                    url: "/khuyen-mai/update/" + id,
                    contentType: "application/json",
                    data: JSON.stringify(getValue()),
                    success: function (response) {
                        alert("Sửa thành công");
                        window.location.href = "/khuyen-mai/hien-thi";
                    },
                    error: function (xhr, status, error) {
                        if (xhr.responseJSON.status && xhr.responseJSON.status === 400) {
                            alert(xhr.responseJSON.message)
                        }
                    }
                });
                return true;
            } else {
                return false;
            }
        }
    }
</script>
</html>
