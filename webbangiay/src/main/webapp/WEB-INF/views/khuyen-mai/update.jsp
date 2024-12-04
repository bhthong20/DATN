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
</head>
<body>
<h4 style="text-align: center">Cập nhật khuyến mãi</h4>
<div class="container">
    <form:form action="/khuyen-mai/update/${khuyenMai.id}" method="post" modelAttribute="khuyenMai">
        <div class="row">
            <div class="col-6">

                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ma" disabled="disabled"/>
                    <form:label class="form-label" path="ma">Mã khuyến mại:</form:label>
                    <form:errors path="ma" cssStyle="color: red"/>
                </div>

            </div>
            <div class="col-6">

                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ten"/>
                    <form:label class="form-label" path="ten">Tên khuyến mại:</form:label>
                    <form:errors path="ten" cssStyle="color: red"/>
                </div>

            </div>
            <div class="col-6">

                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ngayBatDau"/>
                    <form:label class="form-label" path="ngayBatDau">Ngày bắt đầu:</form:label>
                    <form:errors path="ngayBatDau" cssStyle="color: red"/>
                </div>

            </div>

            <div class="col-6">

                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ngayKetThuc"/>
                    <form:label class="form-label" path="ngayKetThuc">Ngày kết thúc:</form:label>
                    <form:errors path="ngayKetThuc" cssStyle="color: red"/>
                </div>

            </div>
            <div class="col-6">

                <div class="form-check mb-3 mt-3">
                    <form:label class="form-label" path="loaiGiamGia">Loại giảm giá:</form:label>
                    <br>
                    <form:radiobutton path="loaiGiamGia" value="1" />%
                    <br>
                    <form:radiobutton path="loaiGiamGia" value="0"/>Tiền mặt
                </div>

            </div>

            <div class="col-6">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="giaTriGiam"/>
                    <form:label class="form-label" path="giaTriGiam">Giá trị giảm:</form:label>
                    <form:errors path="giaTriGiam" cssStyle="color: red"/>
                </div>

            </div>
            <div class="col-6">

                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="moTa"/>
                    <form:label class="form-label" path="moTa">Mô tả:</form:label>
                    <form:errors path="moTa" cssStyle="color: red"></form:errors>
                </div>
                <div class="form-check mb-3 mt-3">
                    <form:label class="form-label" path="trangThai">Trạng thái:</form:label>
                    <br>
                    <form:radiobutton path="trangThai" value="1"/>Hoạt động
                    <br>
                    <form:radiobutton path="trangThai" value="0"/>Ngưng hoạt động
                </div>
            </div>
            <div class="row">
                <div class="col-12" style="text-align: center">
                    <button type="submit" class="btn btn-success"
                            id="btt">Update
                    </button>
                </div>
            </div>
        </div>
    </form:form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</html>