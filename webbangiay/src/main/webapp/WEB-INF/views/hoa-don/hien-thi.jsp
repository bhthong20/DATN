
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<h1>List of Invoices</h1>
    <table class="table container">
        <tr>
            <th>STT</th>
            <th>Mã</th>
            <th>Ngày Tạo</th>
            <th>Nhân Viên</th>
            <th>Khách Hàng</th>
            <th>khuyến Mãi</th>
            <th>Tên Người Nhận</th>
            <th>SDT</th>
            <th>Địa Chỉ</th>
            <th>Tổng Tiền</th>

            <th>Ghi Chú</th>
            <th>Trạng Thái</th>
            <th colspan="2">Chức năng</th>
        </tr>
<c:forEach items="${listhoaDon}" var="hoadon" varStatus="stt">
    <tr>
        <td>${stt.index+1}</td>
        <td>${hoadon.ma}</td>
        <td>${hoadon.ngayTao}</td>
        <td>${hoadon.nhanVien.hoTen}</td>
        <td>${hoadon.khachHang.hoTen}</td>
        <td>${hoadon.khuyenMai.ten}</td>
        <td>${hoadon.tenNguoiNhan} </td>
        <td>${hoadon.sdt}</td>
        <td>${hoadon.diaChi}</td>
        <td>${hoadon.tongTien}</td>
        <td>${hoadon.ghiChu}</td>
        <td>
<%--            <c:if test="${hoadon.tinhTrang==0}">Đang Chờ Xác Nhận</c:if>--%>
<%--            <c:if test="${hoadon.tinhTrang==1}">Đã Xác Nhận</c:if>--%>
                <%--                    <c:if test="${hoaDon.tinhTrang==2}">Sản phẩm cũ</c:if>--%>
                <%--                    <c:if test="${hoaDon.tinhTrang==3}">Sản phẩm cũ</c:if>--%>
                <%--                    <c:if test="${hoaDon.tinhTrang==4}">Sản phẩm cũ</c:if>--%>
        </td>
        <td colspan="2">
            <a href="/hoa-don/delete/${hoadon.id}" class="btn btn-success"
               onclick="return tbxd()">Delete</a>
            <a href="/hoa-don/view-update/${hoadon.id}" class="btn btn-success"
               onclick="return tbxd()">Update</a>
        </td>
    </tr>
</c:forEach>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</html>