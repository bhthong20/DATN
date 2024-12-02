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
<h4 style="text-align: center">Thông tin Hóa Đơn</h4>
<div class="container">
    <form:form action="/hoa-don/update/${hoadon.id}" method="post" modelAttribute="hoaDon">
        <div class="row">
            <div class="col-6">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="tenNguoiNhan" value="${hoadon.tenNguoiNhan}"/>
                    <form:label class="form-label" path="tenNguoiNhan">Tên sản phẩm:</form:label>
                    <form:errors path="tenNguoiNhan" cssStyle="color: #ff0000"/>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="sdt" value="${hoadon.sdt}"/>
                    <form:label class="form-label" path="sdt">Số điện thoai :</form:label>
                    <form:errors path="sdt" cssStyle="color: #ff0000"/>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="tongTien" value="${hoadon.tongTien}"/>
                    <form:label class="form-label" path="tongTien">Tổng Tiền</form:label>
                    <form:errors path="tongTien" cssStyle="color: #ff0000"/>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ghiChu" value="${hoadon.ghiChu}" />
                    <form:label class="form-label" path="ghiChu">Ghi Chú:</form:label>
                    <form:errors path="ghiChu" cssStyle="color: #ff0000"/>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="diaChi" value="${hoadon.diaChi}" />
                    <form:label class="form-label" path="diaChi">Ghi Chú:</form:label>
                    <form:errors path="diaChi" cssStyle="color: #ff0000"/>
                </div>
            </div>
            <div class="form-floating mb-3 mt-3">
                <div class="row">
                    <div class="col-4">
                        <form:select path="nhanVien" class="form-control" id="selectNhanVien"
                                     cssStyle="font-weight: bold; width: 100%">
                            <option selected disabled>Nhân Viên </option>
                            <form:options items="${listNhanVien}"  itemLabel="hoTen" itemValue="id"/>
                        </form:select>

                    </div>

                    <div class="col-4">
                        <form:select path="khuyenMai" class="form-control" id="selectKhuyenMai"
                                     cssStyle="font-weight: bold; width: 100%">
                            <option selected disabled>Khuyến Mãi </option>
                            <form:options items="${listKhuyenMai}" itemLabel="ten" itemValue="id"/>
                        </form:select>
                    </div>
                    <div class="col-4">
                        <form:select path="khachHang" class="form-control" id="selectKhachHang"
                                     cssStyle="font-weight: bold; width: 100%">
                            <option selected disabled>Khách Hang </option>
                            <form:options items="${listKhachHang}" itemLabel="hoTen" itemValue="id"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12" style="text-align: center">
                    <button type="submit" class="btn btn-success"
                            id="btt">update
                    </button>
                </div>
            </div>
        </div>
    </form:form>
</div>

</body>
</html>