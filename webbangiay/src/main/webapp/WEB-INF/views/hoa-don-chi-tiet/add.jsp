<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<h4 style="text-align: center">Thông tin Hóa Đơn Chi Tiết</h4>
<div class="container">
    <form:form action="/hoa-don-chi-tiet/add" method="post" modelAttribute="hoaDonCT">
        <div class="row">
            <div class="col-6">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="soLuong"/>
                    <form:label class="form-label" path="soLuong">Số Lượng:</form:label>
                    <form:errors path="soLuong" cssStyle="color: #ff0000"/>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="donGia"/>
                    <form:label class="form-label" path="donGia">Đơn Giá :</form:label>
                    <form:errors path="donGia" cssStyle="color: #ff0000"/>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="trangThai"/>
                    <form:label class="form-label" path="trangThai">Trạng Thái</form:label>
                    <form:errors path="trangThai" cssStyle="color: #ff0000"/>
                </div>
            </div>
            <div class="form-floating mb-3 mt-3">
                <div class="row">
                    <div class="col-4">
                        <form:select path="hoaDon" class="form-control" id="selectHoaDon"
                                     cssStyle="font-weight: bold; width: 100%">
                            <option selected disabled>Mã Hóa Đơn </option>
                            <form:options items="${listHoaDon}" itemLabel="ma" itemValue="id"/>
                        </form:select>

                    </div>

                    <div class="col-4">
                        <form:select path="chiTietSanPham" class="form-control" id="selectChiTietSanPham"
                                     cssStyle="font-weight: bold; width: 100%">
                            <option selected disabled>Chi Tiet San Pham </option>
                            <form:options items="${listCTSP}" itemLabel="ma" itemValue="id"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12" style="text-align: center">
                    <button type="submit" class="btn btn-success"
                            id="btt">ADD
                    </button>
                </div>
            </div>
        </div>
    </form:form>
</div>

</body>
</html>