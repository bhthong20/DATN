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
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>

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

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
</head>
</head>

<body>
<div class="container">
    <div class="col-md-12">
        <div class="card">
            <h3 class="card-header">Thêm mới khách hàng</h3>
            <div class="card-body">
                <form:form action="/khach-hang/add" method="post" modelAttribute="khachHang">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3 mt-3">
                                <form:input id="tenKH" class="form-control" placeholder="" path="hoTen"/>
                                <form:label for="tenKH" path="hoTen">Tên khách hàng:</form:label>
                                <form:errors path="hoTen" cssStyle="color: red"/>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <form:select class="form-select" id="gioiTinh" path="gioiTinh">
                                    <option selected disabled value="">Giới tính</option>
                                    <form:option value="0">Nam</form:option>
                                    <form:option value="1">Nữ</form:option>
                                </form:select>
                                <form:label for="gioiTinh" path="gioiTinh">Giới tính:</form:label>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <form:input id="email" class="form-control" type="email" placeholder="" path="email"/>
                                <form:label for="email" path="email">Email:</form:label>
                                <form:errors path="email" cssStyle="color: red"/>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <form:input id="sdt" class="form-control" type="number" placeholder="" path="sdt"/>
                                <form:label for="sdt" path="sdt">SDT:</form:label>
                                <form:errors path="sdt" cssStyle="color: red"/>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <form:input id="ngaySinh" class="form-control" type="date" path="ngaySinh"/>
                                <form:label for="ngaySinh" path="ngaySinh">Ngày sinh:</form:label>
                                <form:errors path="ngaySinh" cssStyle="color: red"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-3 mt-3">
                                <form:input id="taiKhoan" class="form-control" placeholder="" path="taiKhoan"/>
                                <form:label for="taiKhoan" path="taiKhoan">Tài khoản:</form:label>
                                <form:errors path="taiKhoan" cssStyle="color: red"/>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <form:input id="matKhau" class="form-control" placeholder="" path="matKhau"/>
                                <form:label for="matKhau" path="matKhau">Mật khẩu:</form:label>
                                <form:errors path="matKhau" cssStyle="color: red"/>
                            </div>
                            <div class="form-check mb-3 mt-3">
                                <form:label class="" path="trangThai">Trạng thái:</form:label>
                                <br>
                                <form:radiobutton path="trangThai" value="0" checked="true"/>Hoạt động
                                <br>
                                <form:radiobutton path="trangThai" value="1"/>Ngưng hoạt động
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="text-align: center">
                            <button type="submit" class="btn btn-primary"
                                    id="btt" onclick="return myFunction1()">Add
                            </button>
                        </div>
                    </div>
                </form:form>
                <br>
                <div class="row">
                    <div class="col-12" style="text-align: center">
                        <a class="btn btn-primary" href="/khach-hang/hien-thi">Quay lại</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function myFunction1() {
        let text = "Bạn chắc chắn muốn thêm thông tin";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Thêm thành công");
            return true
        } else {
            return false;
        }
    }

    function myFunction3() {
        let text = "Bạn chắc chắn muốn thay đổi trạng thái";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Thay đổi trạng thái thành công");
            return true
        } else {
            return false;
        }
    }

    function myFunction4() {
        let text = "Bạn chắc chắn muốn về lại trang hiển thị";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction5() {
        let text = "Bạn chắc chắn muốn tìm kiếm thông tin";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction6() {
        let text = "Bạn chắc chắn muốn sang trang thêm thông tin";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction7() {
        let text = "Bạn chắc chắn muốn sang trang thông tin đã thay đổi";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

</script>
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
<script>
    function validateSanPham(sanPham) {
        if (!sanPham.tenSanPham) {
            alert("Tên sản phẩm không được để trống");
            return false;
        }
        if (!sanPham.idLoaiSanPham) {
            alert("Loại sản phẩm không được để trống");
            return false;
        }
        if (!sanPham.idHinhAnh) {
            alert("Hình ảnh quảng bá không được để trống")
            return false;
        }
        if (!sanPham.idThuongHieu) {
            alert("Thương hiệu không được để trống")
            return false;
        }
        if (!sanPham.moTa) {
            alert("Mô tả quảng bá không được để trống");
            return false;
        }
        if (!sanPham.chiTietSanPhamDtos) {
            alert("Chi tiết sản phẩm không được để trống")
            return false;
        }
        let check = true;
        sanPham.chiTietSanPhamDtos.forEach(el => {
            if (!el.soLuongTon) {
                check = false;
            }
            if (!el.donGia) {
                check = false;
            }
            if (!el.moTa) {
                check = false;
            }
            if (!el.idHinhAnh) {
                check = false;
            }
        })
        if (!check) {
            alert("Chi tiết sản phẩm phải nhập đủ thông tin");
            return false;
        }
        return true;
    }

    function myFunction1() {
        let text = "Bạn chắc chắn muốn thêm";
        var tenSPValue = document.getElementById('tenSP').value;
        var moTaValue = document.getElementById('moTa').value;
        var thuongHieu = document.getElementById('thuongHieu').value;
        var hinhAnh = document.getElementById('hinhAnh').value;
        var phanLoai = document.getElementById('phanLoai').value;
        getMoney();
        getQuantity();
        getNote();
        getStatus();
        getImages();
        let sanPham = {
            id: null,
            tenSanPham: tenSPValue,
            idLoaiSanPham: phanLoai,
            idHinhAnh: hinhAnh,
            idThuongHieu: thuongHieu,
            moTa: moTaValue,
            chiTietSanPhamDtos: listProductDetail.map(el => {
                return {
                    id: null,
                    idKichThuoc: el.sizeId,
                    idMauSac: el.colorId,
                    idChatLieu: el.categoryId,
                    soLuongTon: el.quantity,
                    donGia: el.money,
                    moTa: el.note,
                    trangThai: el.status,
                    idHinhAnh: el.image
                }
            })
        };
        if (!validateSanPham(sanPham)) {
            return
        }
        let kt = confirm(text);
        if (kt == true) {
            $.ajax({
                type: "POST",
                url: "/chi-tiet-san-pham/rest/them-san-pham",
                contentType: "application/json",
                data: JSON.stringify(sanPham),
                success: function (response) {
                    alert("Thêm sản phẩm mới thành công");
                    console.log(response)
                    window.location.href = "/chi-tiet-san-pham/hien-thi";
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                }
            });
            return true
        } else {
            return false;
        }
    }

    function myFunction2() {
        let text = "Bạn chắc chắn muốn sửa";
        var tenSPValue = document.getElementById('tenSP').value;
        var moTaValue = document.getElementById('moTa').value;
        var thuongHieu = document.getElementById('thuongHieu').value;
        var hinhAnh = document.getElementById('hinhAnh').value;
        var phanLoai = document.getElementById('phanLoai').value;
        getMoney();
        getQuantity();
        getNote();
        getStatus();
        getImages();
        let sanPham = {
            id: id,
            tenSanPham: tenSPValue,
            idLoaiSanPham: phanLoai,
            idHinhAnh: hinhAnh,
            idThuongHieu: thuongHieu,
            moTa: moTaValue,
            chiTietSanPhamDtos: listProductDetail.map(el => {
                var listDetail = dataProductDetailUpdate.filter(detail => detail.sizeId === el.sizeId && detail.colorId === el.colorId && detail.categoryId === el.categoryId);
                return {
                    id: listDetail.length === 0 ? null : listDetail[0].id,
                    idKichThuoc: el.sizeId,
                    idMauSac: el.colorId,
                    idChatLieu: el.categoryId,
                    soLuongTon: el.quantity,
                    donGia: el.money,
                    moTa: el.note,
                    trangThai: el.status,
                    idHinhAnh: el.image
                }
            })
        };

        if (!validateSanPham(sanPham)) {
            return
        }

        let kt = confirm(text);
        if (kt == true) {
            $.ajax({
                type: "POST",
                url: "/chi-tiet-san-pham/rest/update-san-pham",
                contentType: "application/json",
                data: JSON.stringify(sanPham),
                success: function (response) {
                    alert("Update sản phẩm thành công");
                    console.log(response)
                    window.location.href = "/chi-tiet-san-pham/hien-thi";
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                }
            });
            return true
        } else {
            return false;
        }
    }

    document.getElementById("hinhAnh").addEventListener("change", function () {
        var selectedOption = this.options[this.selectedIndex];

        var anh1Value = selectedOption.getAttribute("anh1");
        var anh2Value = selectedOption.getAttribute("anh2");
        var anh3Value = selectedOption.getAttribute("anh3");

        document.getElementById("preview-anh1").src = '../../../uploads/' + anh1Value;
        document.getElementById("preview-anh2").src = '../../../uploads/' + anh2Value;
        document.getElementById("preview-anh3").src = '../../../uploads/' + anh3Value;
    });

    let listMauSac = [];
    let listSize = [];
    let listCategory = [];
    let listProductDetail = [];

    let dataProductDetailUpdate = [];

    var url = window.location.href;

    var urlParams = new URLSearchParams(new URL(url).search);

    var id = urlParams.get("idctsp");

    function addRow(checkbox, name, id, type) {
        if (checkbox.checked) {
            if (type === 'COLOR') {
                listMauSac.push({
                    id: id,
                    name: name
                })
            }
            if (type === 'SIZE') {
                listSize.push({
                    id: id,
                    name: name
                })
            }
            if (type === 'CATEGORY') {
                listCategory.push({
                    id: id,
                    name: name
                })
            }
        } else {
            if (type === 'COLOR') {
                listMauSac = listMauSac.filter(el => el.id !== id);
            }
            if (type === 'SIZE') {
                listSize = listSize.filter(el => el.id !== id);
            }
            if (type === 'CATEGORY') {
                listCategory = listCategory.filter(el => el.id !== id);
            }
        }
        renderProductDetail();
        updateColorTable();
    }

    function genComboboxImage(index) {
        var htmlSelect = '<select class="form-select productImg" index="' + index + '" >';
        var selectElement = document.getElementById("hinhAnh");

        var options = selectElement.options;
        for (var i = 0; i < options.length; i++) {
            htmlSelect += '<option value="' + options[i].value + '" anh1="' + options[i].getAttribute('anh1') +
                '" anh2="' + options[i].getAttribute('anh2') + '" anh3="' + options[i].getAttribute('anh3') + '">' + options[i].text + '</option>';
        }
        htmlSelect += '</select>'

        return htmlSelect;
    }

    function updateColorTable() {
        var tableBody = document.getElementById('colorTableBody');
        var html = '';
        listProductDetail.forEach(function (product) {
            html +=
                '<tr>' +
                '<td>' + product.index + '</td>' +
                '<td>' + product.name + '</td>' +
                '<td> <input class="form-control productMoney" index="' + product.index + '" type="number" placeholder="Default input" value="' + product.money + '" /></td>' +
                '<td> <input class="form-control productQuantity" index="' + product.index + '" type="number" placeholder="Default input" value="' + product.quantity + '" /></td>' +
                '<td>' + product.categoryName + '</td>' +
                '<td>' + product.sizeName + '</td>' +
                '<td>' + product.colorName + '</td>' +
                '<td>' + genComboboxImage(product.index) + '</td>' +
                '<td><input class="form-control productNote" type="text" index="' + product.index + '" placeholder="Default input" value="' + product.note + '" /></td>' +
                '<td><div class="form-check form-switch text-center"><input index="' + product.index + '" class="form-check-input productStatus" type="checkbox" ' + (product.status ? `checked`: ``) + ' /></div></td>' +
                '</tr>';
        });

        tableBody.innerHTML = html;
    }

    function renderProductDetail() {
        listProductDetail = [];
        var tableCreate = document.getElementById('tableCreate');
        tableCreate.style.display = 'none';

        if (listMauSac.length !== 0 && listSize.length !== 0 && listCategory.length !== 0) {
            let index = 0;
            var tenSPValue = document.getElementById('tenSP').value;
            // var donGia = document.getElementById('donGia').value;
            // var soLuongTon = document.getElementById('soLuongTon').value;
            tableCreate.style.display = 'block';
            listMauSac.forEach(color => {
                listSize.forEach(size => {
                    listCategory.forEach(category => {
                        index++;
                        listProductDetail.push({
                            index: index,
                            colorId: color.id,
                            colorName: color.name,
                            sizeId: size.id,
                            sizeName: size.name,
                            categoryId: category.id,
                            categoryName: category.name,
                            quantity: 1,
                            money: 1,
                            name: tenSPValue,
                            note: "",
                            status: true,
                            image: ""
                        })
                    })
                })
            })
        }
    }

    function getMoney() {
        var inputs = document.querySelectorAll('.productMoney');
        inputs.forEach(function (input) {
            var index = input.getAttribute('index');

            listProductDetail = listProductDetail.map(el => {
                if (parseInt(el.index) == parseInt(index)) {
                    el.money = input.value
                }
                return el;
            })
        });
    }

    function getQuantity() {
        var inputs = document.querySelectorAll('.productQuantity');
        inputs.forEach(function (input) {
            var index = input.getAttribute('index');

            listProductDetail = listProductDetail.map(el => {
                if (parseInt(el.index) == parseInt(index)) {
                    el.quantity = input.value
                }
                return el;
            })
        });
    }

    function getNote() {
        var inputs = document.querySelectorAll('.productNote');
        inputs.forEach(function (input) {
            var index = input.getAttribute('index');

            listProductDetail = listProductDetail.map(el => {
                if (parseInt(el.index) == parseInt(index)) {
                    el.note = input.value
                }
                return el;
            })
        });
    }

    function getStatus() {
        var inputs = document.querySelectorAll('.productStatus');
        inputs.forEach(function (input) {
            var index = input.getAttribute('index');

            listProductDetail = listProductDetail.map(el => {
                if (parseInt(el.index) == parseInt(index)) {
                    el.status = input.checked ? 1 : 0;
                }
                return el;
            })
        });
    }

    function getImages() {
        var inputs = document.querySelectorAll('.productImg');
        inputs.forEach(function (input) {
            var index = input.getAttribute('index');

            listProductDetail = listProductDetail.map(el => {
                if (parseInt(el.index) == parseInt(index)) {
                    el.image = input.value
                }
                return el;
            })
        });
    }

    window.onload = function () {
        if (id) {
            $('#bttCreate').hide();
            $('#bttUpdate').show();

            var tableCreate = document.getElementById('tableCreate');
            tableCreate.style.display = 'block';
            $.ajax({
                type: "GET",
                url: "/chi-tiet-san-pham/rest/detail-san-pham?idctsp=" + id,
                success: function (response) {
                    if (response.sanPham) {
                        $('#tenSP').val(response.sanPham.tenSP);
                        $('#ma').val(response.sanPham.ma);
                        $('#moTa').val(response.sanPham.moTa);
                        $('#hinhAnh').val(response.sanPham.hinhAnh ? response.sanPham.hinhAnh.id : "");
                        $('#thuongHieu').val(response.sanPham.thuongHieu ? response.sanPham.thuongHieu.id : "");
                        $('#phanLoai').val(response.sanPham.phanLoai ? response.sanPham.phanLoai.id : "");
                        if (response.sanPham.hinhAnh) {
                            document.getElementById("preview-anh1").src = '../../../uploads/' + response.sanPham.hinhAnh.anh1;
                            document.getElementById("preview-anh2").src = '../../../uploads/' + response.sanPham.hinhAnh.anh2;
                            document.getElementById("preview-anh3").src = '../../../uploads/' + response.sanPham.hinhAnh.anh3;
                        }
                    }
                    if (response.chiTietSanPham) {
                        var mauSacElements = $('input[name="mauSac"]');
                        var kichThuocElements = $('input[name="kichThuoc"]');
                        var chatLieuElements = $('input[name="chatLieu"]');
                        let index = 0;
                        response.chiTietSanPham.forEach(el => {
                            mauSacElements.each(function () {
                                if (el.mauSac.id.toString() === $(this).val()) {
                                    $(this).prop('checked', true);
                                    if (listMauSac.filter(color => color.id == el.mauSac.id).length == 0) {
                                        listMauSac.push({
                                            id: el.mauSac.id,
                                            name: el.mauSac.ten
                                        });
                                    }
                                }
                            });
                            kichThuocElements.each(function () {
                                if (el.kichThuoc.id.toString() === $(this).val()) {
                                    $(this).prop('checked', true);
                                    if (listSize.filter(size => size.id == el.kichThuoc.id).length == 0) {
                                        listSize.push({
                                            id: el.kichThuoc.id,
                                            name: el.kichThuoc.size
                                        });
                                    }
                                }
                            });
                            chatLieuElements.each(function () {
                                if (el.chatLieu.id.toString() === $(this).val()) {
                                    $(this).prop('checked', true);
                                    if (listCategory.filter(category => category.id == el.chatLieu.id).length == 0) {
                                        listCategory.push({
                                            id: el.chatLieu.id,
                                            name: el.chatLieu.tenChatLieu
                                        });
                                    }
                                }
                            });

                            index++;
                            listProductDetail.push({
                                index: index,
                                colorId: el.mauSac.id,
                                colorName: el.mauSac.ten,
                                sizeId: el.kichThuoc.id,
                                sizeName: el.kichThuoc.size,
                                categoryId: el.chatLieu.id,
                                categoryName: el.chatLieu.tenChatLieu,
                                quantity: el.soLuongTon,
                                money: el.donGia,
                                name: el.sanPham.tenSP,
                                note: el.moTa,
                                status: el.trangThai === 1,
                                image: el.hinhAnh.id
                            });
                            dataProductDetailUpdate.push({
                                id: el.id,
                                colorId: el.mauSac.id,
                                sizeId: el.kichThuoc.id,
                                categoryId: el.chatLieu.id,
                                image: el.hinhAnh.id
                            })
                        });
                        updateColorTable();
                        var inputs = $('.productImg');
                        inputs.each(function () {
                            var currentIndex = $(this).attr('index');

                            var matchedProductDetail = listProductDetail.find(function(el) {
                                return parseInt(el.index) === parseInt(currentIndex);
                            });

                            if (matchedProductDetail) {
                                $(this).val(matchedProductDetail.image);
                            }
                        });
                    }
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                }
            });
        } else {
            $('#bttCreate').show();
            $('#bttUpdate').hide();
        }
        // getAllHoaDon();
        // findHoaDonById();
        //
        // if (hoaDon.trangThai && (hoaDon.trangThai == 2 || hoaDon.trangThai == 8)) {
        //     $(".checkStatus").attr('disabled', 'disabled')
        // }
    };
</script>
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
</html>
