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

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
</head>
<body>
<div class="card mb-4">
    <table class="table container">
        <tbody>

        <h3 class="card-header">Thông tin khuyến mại</h3>
        <tr>
            <td style="text-align: center">
                <form action="/khuyen-mai/search" method="get" class="row g-3 align-items-center">
                    <div class="col-auto">
                        <label for="search" class="visually-hidden">Tìm kiếm</label>
                        <input type="text" class="form-control" id="search" value="${param.search}" name="search" placeholder="Tìm kiếm...">
                    </div>
                    <div class="col-auto">
                        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                    </div>
                </form>
            </td>
            <td>
                <form action="/khuyen-mai/loc" method="get" class="row g-3 align-items-center mt-3">
                    <div class="card-body" style="text-align: center">
                        <div class="btn-group">
                            <select class="form-select" name="locHTG">
                                <option selected disabled>Loại</option>
                                <option value="0" ${locHTG != null && locHTG == 0 ? 'selected' : ''}>Tiền</option>
                                <option value="1" ${locHTG != null && locHTG == 1 ? 'selected' : ''}>%</option>
                            </select>
                        </div>
                        <div class="btn-group">
                            <select class="form-select" name="locTT">
                                <option selected disabled>Trạng thái</option>
                                <option value="0" ${locTT != null && locTT == 0 ? 'selected' : ''}>Ngừng hoạt động</option>
                                <option value="1" ${locTT != null && locTT == 1 ? 'selected' : ''}>Hoạt động</option>
                            </select>
                        </div>
                        <div class="btn-group">
                            <input type="date" class="form-control" name="ngayKiemTra" value="${ngayKiemTra}">
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-primary" type="submit">Lọc</button>
                        </div>
                    </div>
                </form>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="text-center mt-3">
        <a type="button" class="btn btn-primary" href="/khuyen-mai/view-add">Thêm mới</a>
    </div>
    <br>
</div>

<div class="card">
    <div class="table-responsive text-nowrap">
        <table class="table container">
            <tr>
                <th>STT</th>
                <th>Mã</th>
                <th>Tên khuyến mãi</th>
                <th>Ngày tạo</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Giá trị giảm</th>
                <th>Điều kiện giảm</th>
                <%--                <th>Tình trạng</th>--%>
                <th>Chức năng</th>
            </tr>
            <c:forEach items="${listKhuyenMai}" var="hangSanPham" varStatus="stt">
                <tr>
                    <td>${stt.index+1}</td>
                    <td>${hangSanPham.ma}</td>
                    <td>${hangSanPham.ten}</td>
                    <td>${hangSanPham.ngayTao}</td>
                    <td>
                        <script>document.write(new Date(${hangSanPham.ngayBatDau}).toLocaleString())</script>
                    </td>
                    <td>
                        <script>document.write(new Date(${hangSanPham.ngayKetThuc}).toLocaleString())</script>
                    </td>
                    <td>
                        <script>
                            var hinhThucGiamGia = ${hangSanPham.hinhThucGiamGia};
                            var giaTriGiam = ${hangSanPham.giaTriGiam};
                            if (hinhThucGiamGia == 0) {
                                document.write(formatCurrency(giaTriGiam) + " VNĐ");
                            } else {
                                document.write(giaTriGiam + " %");
                            }

                            function formatCurrency(value) {
                                return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            }
                        </script>
                    </td>
                    <td>
                        <script> function formatCurrency(value) {
                            return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        }

                        document.write(formatCurrency(${hangSanPham.dieuKienGia}) + " VNĐ");</script>
                    </td>
                        <%--                    <td>--%>
                        <%--                        <c:if test="${hangSanPham.trangThai==0}">Ngừng hoạt động</c:if>--%>
                        <%--                        <c:if test="${hangSanPham.trangThai==1}">Hoạt động</c:if>--%>
                        <%--                    </td>--%>
                    <td>
                        <a href="/khuyen-mai/delete/${hangSanPham.id}" class="btn btn-success"
                           onclick="return tbxd()">Delete</a>
                        <a href="/khuyen-mai/view-update?id=${hangSanPham.id}" class="btn btn-success">Update</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
                <li class="page-item"><a class="page-link" href="/khuyen-mai/hien-thi?num=0">First</a></li>

                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath}/khuyen-mai/hien-thi?num=${status.index -1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>

                <li class="page-item"><a class="page-link" href="/khuyen-mai/hien-thi?num=${total-1}">Last</a></li>
            </ul>
        </nav>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
