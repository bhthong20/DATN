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
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="col-md-12">
        <div class="card">
            <h4 class="card-header" style="text-align: center">Sửa Khách Hàng</h4>
            <%--@elvariable id="chiTietSanPham" type=""--%>
            <div class="card-body">
                <form:form action="/khach-hang/update/${khachHang.id}" method="post" modelAttribute="khachHang">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3 mt-3">
                                <input id="ma" disabled class="form-control" placeholder=""/>
                                <label for="ma" path="sanPham">Mã khách hàng:</label>
                                <span path="sanPham" cssStyle="color: red"></span>
                            </div>

                            <div class="form-floating mb-3 mt-3">
                                <form:input id="tenKH" class="form-control" placeholder="" path="hoTen"/>
                                <form:label for="tenKH" path="hoTen">Tên khách hàng:</form:label>
                                <form:errors path="hoTen" cssStyle="color: red"></form:errors>
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
                                <form:errors path="email" cssStyle="color: red"></form:errors>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <form:input id="sdt" class="form-control" type="number" placeholder="" path="sdt"/>
                                <form:label for="sdt" path="sdt">SDT:</form:label>
                                <form:errors path="sdt" cssStyle="color: red"></form:errors>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <form:input id="ngaySinh" class="form-control" type="date" placeholder="" path="ngaySinh"/>
                                <form:label for="ngaySinh" path="ngaySinh">Ngày sinh:</form:label>
                                <form:errors path="ngaySinh" cssStyle="color: red"></form:errors>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-3 mt-3">
                                <form:input id="taiKhoan" class="form-control" placeholder="" path="taiKhoan"/>
                                <form:label for="taiKhoan" path="taiKhoan">Tài khoản:</form:label>
                                <form:errors path="taiKhoan" cssStyle="color: red"></form:errors>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <form:input id="matKhau" class="form-control" placeholder="" path="matKhau"/>
                                <form:label for="matKhau" path="matKhau">Mật khẩu:</form:label>
                                <form:errors path="matKhau" cssStyle="color: red"></form:errors>
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
                                    id="btt" onclick="return myFunction1()">Sửa
                            </button>
                        </div>
                    </div>
                </form:form>
            </table>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    </div>
</div>
</div>
</div>
</body>
<script>
    function myFunction1() {
        let text = "Bạn chắc chắn muốn thêm";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction2() {
        let text = "Bạn chắc chắn muốn sửa";
        let kt = confirm(text);
        if (kt == true) {
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
    $(document).ready(function () {
        $('#selectMauSac').select2();
        $('#selectKichThuoc').select2();
        $('#selectChatLieu').select2();
    });

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
