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
        <h3 class="card-header">Thông tin hóa đơn</h3>
        <tr>
            <td style="text-align: center">
                <form action="/hoa-don/search" method="get">
                    <div class="input-group" style="width:100%; text-align: center">
                        <input type="text" class="form-control" placeholder="Bạn tìm gì..."
                               aria-label="Bạn tìm gì..." name="ma" value="${param.ma}">
                        <div class="input-group-append">
                            <button class="btn btn-sm btn-primary" style="height: 40px" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </td>
            <td>
                <form action="/hoa-don/loc" method="get"  onsubmit="return validateDate();">
                    <div class="card-body" style="text-align: center">
                        <div class="btn-group">
                            <select class="form-select" name="locTT">
                                <option selected disabled>Trạng thái</option>
                                <option value="0" ${param.locTT == '0' ? 'selected' : ''}>Chờ xác nhận</option>
                                <option value="1" ${param.locTT == '1' ? 'selected' : ''}>Đã xác nhận</option>
                                <option value="3" ${param.locTT == '3' ? 'selected' : ''}>Chờ thanh toán</option>
                                <option value="5" ${param.locTT == '5' ? 'selected' : ''}>Đang vận chuyển</option>
                                <option value="6" ${param.locTT == '6' ? 'selected' : ''}>Vận chuyển hoàn tất</option>
                                <option value="8" ${param.locTT == '8' ? 'selected' : ''}>Đã hủy</option>
                                <option value="10" ${param.locTT == '10' ? 'selected' : ''}>Hoàn tất</option>
                            </select>
                        </div>

                        <div class="btn-group" style="display: none">
                            <select class="form-select" name="locLoai">
                                <option selected disabled>Loại</option>
                                <option value="0" ${param.locLoai == '0' ? 'selected' : ''}>Tại quầy</option>
                                <option value="1" ${param.locLoai == '1' ? 'selected' : ''}>Online</option>
                            </select>
                        </div>

                        <div class="btn-group">
                            <select class="form-select" name="locPTTT" style="display: none">
                                <option selected disabled>PT Thanh toán</option>
                                <option value="0" ${param.locPTTT == '0' ? 'selected' : ''}>Nhận hàng</option>
                                <option value="1" ${param.locPTTT == '1' ? 'selected' : ''}>Online</option>
                            </select>
                        </div>
                        <!-- Chọn ngày bắt đầu -->
                        <div class="btn-group">
                            <label for="ngayBatDau"
                                   style="display: inline-block; width: 70px; text-align: right; margin-right: 10px;margin-top:10px ">Từ:</label>
                            <input type="date" class="form-control" id="ngayBatDau" name="ngayBatDau"
                                   value="${param.ngayBatDau}">
                        </div>
                        <!-- Chọn ngày kết thúc -->
                        <div class="btn-group">
                            <label for="ngayBatDau"
                                   style="display: inline-block; width: 70px; text-align: right; margin-right: 10px;margin-top:10px ">Đến:</label>
                            <input type="date" class="form-control" id="ngayKetThuc" name="ngayKetThuc"
                                   value="${param.ngayKetThuc}">
                        </div>

                        <div class="btn-group">
                            <button type="submit" class="btn btn-primary mr-2">
                                Lọc
                            </button>
                        </div>
                    </div>
                </form>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<div class="card">
    <ul class="nav nav-tabs nav-pills" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all" type="button"
                    role="tab" aria-controls="all" aria-selected="true">Tất cả hóa đơn
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="counter-tab" data-bs-toggle="tab" data-bs-target="#counter" type="button"
                    role="tab" aria-controls="counter" aria-selected="false">Tại quầy
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="online-tab" data-bs-toggle="tab" data-bs-target="#online" type="button"
                    role="tab" aria-controls="online" aria-selected="false">Online
            </button>
        </li>
    </ul>
</div>
<div class="card">
    <div class="card-body">
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
                <div class="table-responsive text-nowrap">
                    <table class="table container">
                        <tr>
                            <th>STT</th>
                            <th>Mã</th>
                            <th>Khách hàng</th>
                            <th>Nhân viên</th>
                            <th>Ngày tạo</th>
                            <th>Ngày Cập nhật</th>
                            <th>Trạng thái</th>
                            <th>Loại</th>
                            <th>Tổng tiền</th>
                            <th>Chức năng</th>
                        </tr>
                        <c:forEach items="${listhoaDon}" var="item" varStatus="stt">
                            <tr>
                                <td>${stt.index+1}</td>
                                <td>${item.ma}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty item.khachHang}">
                                            ${item.khachHang.hoTen}
                                        </c:when>
                                        <c:otherwise>
                                            -
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty item.nhanVien}">
                                            ${item.nhanVien.hoTen}
                                        </c:when>
                                        <c:otherwise>
                                            -
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="ngay-tao">${item.ngayTao}</td>
                                <td class="ngay-tao">${item.ngayCapNhat}</td>
                                <td>
                                    <c:if test="${item.trangThai==0}">Chờ xác nhận</c:if>
                                    <c:if test="${item.trangThai==1}">Đã xác nhận</c:if>
                                    <c:if test="${item.trangThai==2}">Đã thanh toán</c:if>
                                    <c:if test="${item.trangThai==3}">Chờ thanh toán</c:if>
                                    <c:if test="${item.trangThai==4}">Chờ vẫn chuyển</c:if>
                                    <c:if test="${item.trangThai==5}">Đang vận chuyển</c:if>
                                    <c:if test="${item.trangThai==6}">Vận chuyển hoàn tất</c:if>
                                    <c:if test="${item.trangThai==7}">Giao trễ</c:if>
                                    <c:if test="${item.trangThai==8}">Đã hủy</c:if>
                                    <c:if test="${item.trangThai==9}">Mới tạo</c:if>
                                    <c:if test="${item.trangThai==10}">Hoàn tất</c:if>
                                </td>
                                <td>
                                    <c:if test="${item.loai==0}">tại quầy</c:if>
                                    <c:if test="${item.loai==1}">Online</c:if>
                                </td>
                                <td class="tong-tien">
                                    <c:choose>
                                        <c:when test="${not empty item.tongTien}">
                                            ${item.tongTien}
                                        </c:when>
                                        <c:otherwise>
                                            -
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:if test="${item.loai==0}"><a href="/ban-hang-tai-quay?id=${item.id}"
                                                                    class="btn btn-success">Chi
                                        tiết</a></c:if>
                                    <c:if test="${item.loai==1}"><a href="/hoa-don/detail?id=${item.id}"
                                                                    class="btn btn-success">Chi
                                        tiết</a></c:if>

                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade" id="counter" role="tabpanel" aria-labelledby="counter-tab">
                <div class="table-responsive text-nowrap">
                    <table class="table container">
                        <tr>
                            <th>STT</th>
                            <th>Mã</th>
                            <th>Khách hàng</th>
                            <th>Nhân viên</th>
                            <th>Ngày tạo</th>
                            <th>Ngày Cập nhật</th>
                            <th>Trạng thái</th>
                            <th>Loại</th>
                            <th>Tổng tiền</th>
                            <th>Chức năng</th>
                        </tr>
                        <% int sttAll = 1; %>
                        <c:forEach items="${listhoaDon}" var="item" varStatus="stt">
                            <c:if test="${item.loai == 0}">
                                <tr>
                                    <td><%= sttAll++ %>
                                    </td>
                                    <td>${item.ma}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty item.khachHang}">
                                                ${item.khachHang.hoTen}
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty item.nhanVien}">
                                                ${item.nhanVien.hoTen}
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="ngay-tao">${item.ngayTao}</td>
                                    <td class="ngay-tao">${item.ngayCapNhat}</td>
                                    <td>
                                        <c:if test="${item.trangThai==0}">Chờ xác nhận</c:if>
                                        <c:if test="${item.trangThai==1}">Đã xác nhận</c:if>
                                        <c:if test="${item.trangThai==2}">Đã thanh toán</c:if>
                                        <c:if test="${item.trangThai==3}">Chờ thanh toán</c:if>
                                        <c:if test="${item.trangThai==4}">Chờ vẫn chuyển</c:if>
                                        <c:if test="${item.trangThai==5}">Đang vận chuyển</c:if>
                                        <c:if test="${item.trangThai==6}">Vận chuyển hoàn tất</c:if>
                                        <c:if test="${item.trangThai==7}">Giao trễ</c:if>
                                        <c:if test="${item.trangThai==8}">Đã hủy</c:if>
                                        <c:if test="${item.trangThai==9}">Mới tạo</c:if>
                                        <c:if test="${item.trangThai==10}">Hoàn tất</c:if>
                                    </td>
                                    <td>
                                        tại quầy
                                    </td>
                                    <td class="tong-tien">
                                        <c:choose>
                                            <c:when test="${not empty item.tongTien}">
                                                ${item.tongTien}
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="/ban-hang-tai-quay?id=${item.id}" class="btn btn-success">Chi
                                            tiết</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade" id="online" role="tabpanel" aria-labelledby="online-tab">
                <div class="table-responsive text-nowrap">
                    <table class="table container">
                        <tr>
                            <th>STT</th>
                            <th>Mã</th>
                            <th>Khách hàng</th>
                            <th>Nhân viên</th>
                            <th>Ngày tạo</th>
                            <th>Ngày Cập nhật</th>
                            <th>Trạng thái</th>
                            <th>Loại</th>
                            <th>Tổng tiền</th>
                            <th>Chức năng</th>
                        </tr>
                        <% int sttAlll = 1; %>
                        <c:forEach items="${listhoaDon}" var="item" varStatus="stt">
                            <c:if test="${item.loai == 1}">
                                <tr>
                                    <td><%= sttAlll++ %>
                                    </td>
                                    <td>${item.ma}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty item.khachHang}">
                                                ${item.khachHang.hoTen}
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty item.nhanVien}">
                                                ${item.nhanVien.hoTen}
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="ngay-tao">${item.ngayTao}</td>
                                    <td class="ngay-tao">${item.ngayCapNhat}</td>
                                    <td>
                                        <c:if test="${item.trangThai==0}">Chờ xác nhận</c:if>
                                        <c:if test="${item.trangThai==1}">Đã xác nhận</c:if>
                                        <c:if test="${item.trangThai==2}">Đã thanh toán</c:if>
                                        <c:if test="${item.trangThai==3}">Chờ thanh toán</c:if>
                                        <c:if test="${item.trangThai==4}">Chờ vẫn chuyển</c:if>
                                        <c:if test="${item.trangThai==5}">Đang vận chuyển</c:if>
                                        <c:if test="${item.trangThai==6}">Vận chuyển hoàn tất</c:if>
                                        <c:if test="${item.trangThai==7}">Giao trễ</c:if>
                                        <c:if test="${item.trangThai==8}">Đã hủy</c:if>
                                        <c:if test="${item.trangThai==9}">Mới tạo</c:if>
                                        <c:if test="${item.trangThai==10}">Hoàn tất</c:if>
                                    </td>
                                    <td>
                                        Online
                                    </td>
                                    <td class="tong-tien">
                                        <c:choose>
                                            <c:when test="${not empty item.tongTien}">
                                                ${item.tongTien}
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="/hoa-don/detail?id=${item.id}" class="btn btn-success">Chi
                                            tiết</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script>
    function validateDate() {
        var ngayBatDau = document.getElementById("ngayBatDau").value;
        var ngayKetThuc = document.getElementById("ngayKetThuc").value;

        // Chuyển đổi ngày từ chuỗi thành đối tượng Date để so sánh
        var startDate = new Date(ngayBatDau);
        var endDate = new Date(ngayKetThuc);

        // Kiểm tra nếu ngày kết thúc nhỏ hơn ngày bắt đầu
        if (endDate < startDate) {
            alert("Ngày kết thúc không được nhỏ hơn ngày bắt đầu");
            return false; // Ngăn chặn việc gửi biểu mẫu nếu ngày kết thúc nhỏ hơn ngày bắt đầu
        }
        return true; // Cho phép gửi biểu mẫu nếu không có lỗi
    }

    window.onload = function () {
        formatAllDates();
        formatAllCurrencies();

        // Thêm sự kiện cho các tab
        document.querySelectorAll('.nav-link').forEach(function (tab) {
            tab.addEventListener('click', function () {
                // Xác định tab hiện tại bằng cách lấy ID của tab đang được nhấp
                let currentTabId = this.getAttribute('id');

                // Dựa vào tab hiện tại, thực hiện tìm kiếm và lọc phù hợp
                if (currentTabId === 'all-tab') {
                    // Thực hiện tìm kiếm và lọc trong tab "Tất cả"
                    searchAndFilterInTab('all');
                } else if (currentTabId === 'counter-tab') {
                    // Thực hiện tìm kiếm và lọc trong tab "Tại quầy"
                    searchAndFilterInTab('counter');
                } else if (currentTabId === 'online-tab') {
                    // Thực hiện tìm kiếm và lọc trong tab "Online"
                    searchAndFilterInTab('online');
                }
            });
        });
    };

    function searchAndFilterInTab(tabId) {
        // Tìm kiếm và lọc trong tab được chỉ định
        let tabContent = document.getElementById(tabId);

        // Thực hiện tìm kiếm và lọc trong tabContent
        // Ví dụ: bạn có thể lọc các phần tử trong tabContent và hiển thị chỉ các phần tử thỏa mãn điều kiện tìm kiếm và lọc
    }

    function formatDateTime(dateTimeStr) {
        let date = new Date(dateTimeStr);
        let options = {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit',
            hour12: false
        };
        return date.toLocaleDateString('en-GB', options).replace(',', '');
    }

    function formatCurrency(value) {
        let number = parseFloat(value);
        if (isNaN(number)) {
            return value; // If value is not a valid number, return it as is
        }
        return number.toLocaleString('en-US', {minimumFractionDigits: 0, maximumFractionDigits: 2}) + " VNĐ";
    }

    function formatAllDates() {
        document.querySelectorAll('.ngay-tao').forEach(function (element) {
            element.textContent = formatDateTime(element.textContent);
        });
    }

    function formatAllCurrencies() {
        document.querySelectorAll('.tong-tien').forEach(function (element) {
            let value = element.textContent.trim();
            if (value && value !== '-') {
                element.textContent = formatCurrency(value);
            }
        });
    }

    window.onload = function () {
        formatAllDates();
        formatAllCurrencies();
    };
</script>
</html>