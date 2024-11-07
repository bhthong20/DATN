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
<body>
<br>
<div class="card mb-4">
    <table class="table container">
        <tbody>
        <h3 class="card-header" style="text-align: center">Thông tin hình ảnh</h3>
        <tr>
            <td style="text-align: center">
                <form action="/hinh-anh/search-0" method="post">
                    <div class="input-group" style="width:100%; text-align: center">
                        <input type="text" class="form-control" placeholder="Bạn tìm gì..."
                               aria-label="Bạn tìm gì..." name="search">
                        <div class="input-group-append">
                            <button class="btn btn-sm btn-primary" style="height: 40px" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </td>
        </tr>
        <tr class="text-center">
            <td class="text-center" colspan="2">
                <%--                <a class="btn btn-primary" href="/chi-tiet-san-pham/hien-thi-delete">Sản phẩm đã xoá</a>--%>
                <a type="button" class="btn btn-primary" href="/hinh-anh/view-add" onclick="return myFunction6()">Thêm mới sản phẩm</a>
            </td>
        </tr>

        </tbody>
    </table>
</div>
<div class="card">
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>Mã</th>
                <th>Tên</th>
                <th style="text-align: center">Ảnh 1</th>
                <th style="text-align: center">Ảnh 2</th>
                <th style="text-align: center">Ảnh 3</th>
                <th>Ngày tạo</th>
                <th>Ngày cập nhật</th>
                <th>Tình trạng</th>
                <th>Mô tả</th>
                <th colspan="2">Action</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-2">
            <c:forEach var="list" varStatus="i" items="${listAnh}">
                <tr>
                    <td>${list.ma}</td>
                    <td>${list.ten}</td>
                    <td align="center">
                        <img src="../../../uploads/${list.anh1}" width="150" height="150">
                    </td>
                    <td align="center">
                        <img src="../../../uploads/${list.anh2}" width="150" height="150">

                    </td>
                    <td align="center">
                        <img src="../../../uploads/${list.anh3}" width="150" height="150">

                    </td>
                    <td>${list.ngayTao}</td>
                    <td>${list.ngayCapNhat}</td>
                    <td>
                        <c:if test="${list.trangThai==0}">Hoạt động</c:if>
                        <c:if test="${list.trangThai==1}">Ngừng hoạt động</c:if>
                    </td>
                    <td>${list.moTa}</td>
                    <td>
                        <a class="btn btn-warning btn-icon-text"
                           href="/hinh-anh/detail?id=${list.id}"
                           onclick="return myFunction2()">
                            <i class="ti-file btn-icon-prepend"></i>
                            Update</a>
                        <a class="btn btn-danger btn-icon-text"
                           href="/hinh-anh/delete/${list.id}"
                           onclick="return myFunction7()"><i
                                class="ti-reload btn-icon-prepend"></i>
                            Status</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center pagination-lg">
        <li class="page-item"><a class="page-link" href="/hinh-anh/hien-thi?num=0">First</a>
        </li>
        <c:forEach begin="1" end="${total}" varStatus="status">
            <li class="page-item">
                <a href="${pageContext.request.contextPath}/hinh-anh/hien-thi?num=${status.index -1}"
                   class="page-link">${status.index}</a>
            </li>
        </c:forEach>
        <li class="page-item"><a class="page-link" href="/hinh-anh/hien-thi?num=${total-1}">Last</a>
        </li>
    </ul>
</nav>

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

<!-- Main JS -->
<script src="../assets/js/main.js"></script>

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
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
        let text = "Bạn chắc chắn muốn xóa thông tin";
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
</html>
