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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
</head>
<body>
<h4 style="text-align: center">Giỏ hàng</h4>
<div class="container">
    <form:form action="/gio-hang/add" method="post" modelAttribute="gioHang">
        <div class="row">
            <div class="form-check mb-3 mt-3">
                <form:label class="form-label" path="trangThai">Tình Trạng:</form:label>
                <br>
                <form:radiobutton path="trangThai" value="1" checked="true"/>Hoạt động
                <br>
                <form:radiobutton path="trangThai" value="0"/>Ngưng hoạt động
            </div>
            <div class="col-6">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ghiChu"/>
                    <form:label class="form-label" path="ghiChu">Ghi chú:</form:label>
                    <form:errors path="ghiChu" cssStyle="color: red"/>
                </div>
            </div>
            <div class="col-6">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="khachHang"/>
                    <form:label class="form-label" path="khachHang">Khách hàng:</form:label>
                    <form:errors path="khachHang" cssStyle="color: red"/>
                </div>
            </div>
            <div class="row">
                <div class="col-12" style="text-align: center">
                    <button type="submit" class="btn btn-success"
                    >Add
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

</html>