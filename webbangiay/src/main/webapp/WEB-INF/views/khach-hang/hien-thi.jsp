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
            rel="stylesheet"/>

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="../assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <script src="../assets/vendor/js/helpers.js"></script>

    <script src="../assets/js/config.js"></script>
</head>
<body>
<br>
<div class="card mb-4">
    <table class="table container">
        <tbody>
        <h3 class="card-header">Thông tin khách hàng</h3>
        <tr>
            <td style="text-align: center">
                <form action="/khach-hang/search" method="post">
                    <div class="input-group" style="width:100%; text-align: center">
                        <input type="text" class="form-control" placeholder="Bạn tìm gì..."
                               aria-label="Bạn tìm gì..." name="search">
                        <div class="input-group-append">
                            <button class="btn btn-sm btn-primary" style="height: 40px" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </td>
            <td>
                <form action="/khach-hang/loc" method="post">
                    <div class="card-body" style="text-align: center">
                        <div class="demo-inline-spacing">
                            <div class="btn-group">
                                <select class="form-select" name="locTT">
                                    <option selected disabled>Trạng thái</option>
                                    <option value="0">Hoạt động</option>
                                    <option value="1">Không hoạt động</option>
                                </select>
                            </div>

                            <div class="btn-group">
                                <select class="form-select" name="locGT">
                                    <option selected disabled>Giới tính</option>
                                    <option value="false">Nam</option>
                                    <option value="true">Nữ</option>
                                </select>
                            </div>

                            <div class="btn-group">
                                <button type="submit" class="btn btn-primary mr-2">
                                    Lọc
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </td>
        </tr>
        <tr class="text-center">
            <td class="text-center" colspan="2">
                <%--                <a class="btn btn-primary" href="/chi-tiet-san-pham/hien-thi-delete">Sản phẩm đã xoá</a>--%>
                <a type="button" class="btn btn-primary" href="/khach-hang/view-add">Thêm mới khách hàng</a>
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
                <th>STT</th>
                <th>Mã</th>
                <th>Họ tên</th>
                <th>Giới tính</th>
                <th>Email</th>
                <th>SDT</th>
                <th>Ngày sinh</th>
                <th>Tài khoản</th>
                <th>Mật khẩu</th>
                <th colspan="2">Chức năng</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-2">
            <c:forEach items="${khachHang}" var="kh" varStatus="stt">
                <tr>
                    <td>${stt.index+1}</td>
                    <td>${kh.ma}</td>
                    <td>${kh.hoTen}</td>
                    <td>
                        <c:if test="${kh.gioiTinh == false}">Nam</c:if>
                        <c:if test="${kh.gioiTinh == true}">Nữ</c:if>
                    </td>
                    <td>${kh.email}</td>
                    <td>${kh.sdt}</td>
                    <td>${kh.ngaySinh}</td>
                    <td>${kh.taiKhoan}</td>
                    <td>${kh.matKhau}</td>
                    <td colspan="2">
                        <a href="/khach-hang/delete/${kh.id}" class="btn btn-success"
                           onclick="return myFunction2()">Delete</a>
                        <a href="/khach-hang/view-update?id=${kh.id}" class="btn btn-success"
                           onclick="return myFunction2()">Update</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center pagination-lg">
        <li class="page-item"><a class="page-link" href="/khach-hang/hien-thi?num=0">First</a></li>

        <c:forEach begin="1" end="${total}" varStatus="status">
            <li class="page-item">
                <a href="${pageContext.request.contextPath}/khach-hang/hien-thi?num=${status.index -1}"
                   class="page-link">${status.index}</a>
            </li>
        </c:forEach>

        <li class="page-item"><a class="page-link" href="/khach-hang/hien-thi?num=${total-1}">Last</a></li>
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
        let text = "Bạn chắc chắn muốn sang trang thông tin đã thay đổi";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }


</script>
<%--<script>--%>
<%--    document.querySelectorAll('.dropdown-menu').forEach(function (dropdown) {--%>
<%--        dropdown.style.display = 'none';--%>
<%--    });--%>

<%--    // Hiển thị/ẩn các dropdown menu con khi người dùng chọn một giá trị từ dropdown menu cha--%>
<%--    document.querySelectorAll('.dropdown-toggle').forEach(function (dropdown) {--%>
<%--        dropdown.addEventListener('click', function () {--%>
<%--            const dropdownMenu = dropdown.nextElementSibling;--%>

<%--            if (dropdownMenu.style.display === 'block') {--%>
<%--                dropdownMenu.style.display = 'none';--%>
<%--            } else {--%>
<%--                dropdownMenu.style.display = 'block';--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
</html>
