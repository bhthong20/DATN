
<html lang="en">
%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
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

</head>
<body>
<h1>Hóa Đơn Chi Tiết</h1>
<table class="table container">
    <tr>
        <th>STT</th>
        <th>Mã Hóa Đơn</th>
        <th>Chi Tiết Sản Phẩm</th>
        <th>Số Lượng</th>
        <th>Đơn Gía</th>
        <th>Trạng Thái</th>
        <th colspan="2">Chức năng</th>
    </tr>
    <c:forEach items="${listhoaDonCT}" var="hoaDonCT" varStatus="stt">


        <tr>
            <td>${stt.index+1}</td>
            <td>${hoaDonCT.hoaDon.ma}</td>
            <td>${hoaDonCT.chiTietSanPham.sanPham.tenSP}</td>
            <td>${hoaDonCT.soLuong}</td>
            <td>${hoaDonCT.donGia}</td>
            <td>
<%--                <c:if test="${hoaDonCT.tinhTrang==0}">Đang Chờ Xác Nhận</c:if>--%>
<%--                <c:if test="${hoaDonCT.tinhTrang==1}">Đã Xác Nhận</c:if>--%>
            </td>
            <td>
                <div class="dropdown">
                    <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-edit-alt me-1"></i>Edit</a>
                        <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-trash me-1"></i>Delete</a>
                    </div>
                </div>
            </td>
            <td colspan="2">
                <a href="/hoa-don-chi-tiet/delete/${hoaDonCT.id}" class="btn btn-success"
                   onclick="return tbxd()">Delete</a>

                <a href="/hoa-don-chi-tiet/view-update/${hoaDonCT.id}" class="btn btn-success"
                   onclick="return tbxd()">Update</a>
            </td>
        </tr>
    </c:forEach>
</table>
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
</html>