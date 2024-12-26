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
    <link rel="shortcut icon" href="../../images/favicon.png"/>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
<br>
<div class="card mb-4">
    <table class="table container">
        <tbody>
        <h3 class="card-header">Thông tin sản phẩm</h3>
        <tr>
            <td style="text-align: center">
                <form action="/chi-tiet-san-pham/search" method="get">
                    <div class="input-group" style="width:100%; text-align: center">
                        <input type="text" class="form-control" value="${param.search}" placeholder="Bạn tìm gì..."
                               aria-label="Bạn tìm gì..." name="search">
                        <div class="input-group-append">
                            <button class="btn btn-sm btn-primary" style="height: 40px" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </td>
            <td>
                <form action="/chi-tiet-san-pham/loc" method="get">
                    <div class="card-body" style="text-align: center">
                        <div class="demo-inline-spacing">
                            <div class="btn-group">
                                <select class="form-select" name="locTH">
                                    <option selected disabled>Thương hiệu</option>
                                    <c:forEach items="${listTH}" var="th">
                                        <option value="${th.ten}" ${param.locTH == th.ten ? 'selected' : ''}>${th.ten}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="btn-group">
                                <select class="form-select" name="locPL">
                                    <option selected disabled>Phân loại</option>
                                    <c:forEach items="${listPL}" var="pl">
                                        <option value="${pl.tenLoai}" ${param.locPL == pl.tenLoai ? 'selected' : ''}>${pl.tenLoai}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="btn-group">
                                <select class="form-select" name="locTT">
                                    <option selected disabled>Trạng thái</option>
                                    <option value="0" ${param.locTT != null && param.locTT == '0' ? 'selected' : ''}>Ngừng bán</option>
                                    <option value="1" ${param.locTT != null && param.locTT == '1' ? 'selected' : ''}>Còn bán</option>
                                </select>
                            </div>

                            <div class="btn-group">
                                <button type="submit" class="btn btn-primary mr-2">Lọc</button>
                            </div>
                        </div>
                    </div>
                </form>

            </td>
        </tr>
        <tr class="text-center">
            <td class="text-center" colspan="2">
                <%--                <a class="btn btn-primary" href="/chi-tiet-san-pham/hien-thi-delete">Sản phẩm đã xoá</a>--%>
                <a type="button" class="btn btn-primary" onclick="return myFunction1()"
                   href="/chi-tiet-san-pham/view-add">Thêm
                    mới sản phẩm</a>
            </td>
        </tr>
        </tbody>
    </table>


</div>
<div class="card">
    <div class="table-responsive text-nowrap" id="searchResults">
        <table class="table">
            <thead>
            <tr>
                <th></th>
                <th>STT</th>
                <th>Mã</th>
                <th>Ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Thương hiệu</th>
                <th>Loại</th>
                <th>Ngày tạo</th>
                <th>Trạng thái</th>
                <%--                <th>Mô tả</th>--%>
                <th colspan="2">Chức năng</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-2">
            <c:forEach items="${listCTSP}" var="ctsp" varStatus="stt">
                <tr>
                    <td><input class="form-check-input" type="checkbox" name="idCTSP" value="${ctsp.id}"/></td>
                    <td>${stt.index+1}</td>
                    <td>${ctsp.ma}</td>
                    <td align="center">
                        <img src="../../../uploads/${ctsp.hinhAnh.anh1}" width="100" height="100"
                             style="border-radius:50% 50% 50% 50%">

                    </td>
                    <td>${ctsp.tenSP}</td>
                    <td>${ctsp.thuongHieu.ten}</td>
                    <td>${ctsp.phanLoai.tenLoai}</td>
                    <td>${ctsp.ngayTao}</td>
                    <td>
                        <c:if test="${ctsp.trangThai==0}">Ngừng bán</c:if>
                        <c:if test="${ctsp.trangThai==1}">Còn bán</c:if>
                    </td>
                        <%--                    <td>${ctsp.moTa}</td>--%>
                    <td>
                        <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                <i class="bx bx-dots-vertical-rounded"></i></button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/chi-tiet-san-pham/view-update?idctsp=${ctsp.id}"
                                   onclick="return myFunction2()"><i class="bx bx-edit-alt me-1"></i>Edit</a>
                                <a class="dropdown-item" href="/chi-tiet-san-pham/delete/${ctsp.id}"
                                   onclick="return myFunction2()"><i class="bx bx-trash me-1"></i>Delete</a>
                                <a class="dropdown-item" onclick="getDanhSachSanPham()"
                                   data-bs-toggle="modal" data-bs-target="#modalDanhSachSanPham"><i
                                        class="bx bxs-user-detail me-1"></i>Chi tiết</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center pagination-lg">
        <li class="page-item"><a class="page-link" href="/chi-tiet-san-pham/hien-thi?num=0">First</a></li>

        <c:forEach begin="1" end="${total}" varStatus="status">
            <li class="page-item">
                <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/hien-thi?num=${status.index -1}"
                   class="page-link">${status.index}</a>
            </li>
        </c:forEach>

        <li class="page-item"><a class="page-link" href="/chi-tiet-san-pham/hien-thi?num=${total-1}">Last</a></li>
    </ul>
</nav>
<div class="modal fade" id="modalDanhSachSanPham" tabindex="-1" aria-labelledby="modalDanhSachSanPhamLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-xl modal-dialog-centered" style="min-width: 1400px;">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Danh sách sản phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <div class="row">

                        <div class="col-xl">
                            <div class="mb-3">
                                <label class="form-label" for="mauSacSearch">Màu sắc</label>
                                <select class="form-select" id="mauSacSearch">
                                    <option selected value="">Lựa chọn</option>
                                    <c:forEach items="${listMS}" var="item">
                                        <option value="${item.id}">${item.ten}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="sizeSearch">Kích cỡ</label>
                                <select class="form-select" id="sizeSearch">
                                    <option selected value="">Lựa chọn</option>
                                    <c:forEach items="${listKT}" var="item">
                                        <option value="${item.id}">${item.size}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-xl">
                            <div class="mb-3">
                                <label class="form-label" for="chatLieuSearch">Chất liệu</label>
                                <select class="form-select" id="chatLieuSearch">
                                    <option selected value="">Lựa chọn</option>
                                    <c:forEach items="${listCL}" var="item">
                                        <option value="${item.id}">${item.tenChatLieu}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="trangThaiSearch">Trạng thái</label>
                                <select class="form-select" id="trangThaiSearch">
                                    <option selected value="">Lựa chọn</option>
                                    <option value='0'>Ngưng bán</option>
                                    <option value='1'>Còn bán</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <span class="text-center"><button id="btnSearchSanPham" onclick="searchSanPham()" type="button"
                                                          class="btn btn-primary">Search</button></span>
                    </div>
                </div>
                <div class="table-responsive text-nowrap" style="max-height: 600px;">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Mã</th>
                            <th>Ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Màu sắc</th>
                            <th>Kích cỡ</th>
                            <th>Chất liệu</th>
                            <th>Phân loại</th>
                            <th>Thương hiệu</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody class="table-border-bottom-2" id="listProduct">
                        <!-- Thêm dữ liệu sản phẩm vào đây -->
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <a id="updateBtnt" type="button" style="color:white" class="btn btn-secondary" data-bs-dismiss="modal">Update</a>
            </div>
        </div>
    </div>
</div>
</body>
<script>


    // mở modal lấy danh sách sản phẩm
    const getDanhSachSanPham = () => {
        const VND = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
        });
        const tableProduct = document.getElementById("listProduct");
        let html = '';
        let ctspElements = document.getElementsByName("idCTSP");
        let selectedIds = []; // Mảng chứa các idCTSP đã được chọn
        ctspElements.forEach((ctsp) => {
            if (ctsp.checked) {
                selectedIds.push(ctsp.value);
            }
        });
        // Kiểm tra và loại bỏ các giá trị không phải UUID hợp lệ
        selectedIds = selectedIds.filter(id => {
            try {
                // Thử chuyển đổi giá trị sang UUID
                new URLSearchParams({idctsp: id}).get("idctsp");
                return true;
            } catch (error) {
                console.error("Invalid UUID:", id);
                return false;
            }
        });

        // Kiểm tra xem có sản phẩm nào được chọn không
        if (selectedIds.length === 0) {
            console.error("No valid UUIDs to send in the request.");
            window.alert("Chưa chọn một sản phẩm để xem chi tiết.");
            $('#modalDanhSachSanPham').hide();// Ẩn modal
            return false; // Dừng thực hiện hàm
        }

        // Kiểm tra nếu người dùng chọn nhiều hơn một idCTSP
        if (selectedIds.length > 1) {
            $('#modalDanhSachSanPham').modal('hide'); // Ẩn modal
            console.error("Chỉ được chọn một sản phẩm để xem chi tiết.");
            // Hiển thị thông báo lỗi cho người dùng
            // Ví dụ: Thông báo lỗi sử dụng window.alert
            window.alert("Chỉ được chọn một sản phẩm để xem chi tiết.");
            return false; // Dừng việc gửi request AJAX
        }

        // Gửi request AJAX với các idCTSP đã được chọn

        $.ajax({
            type: "GET",
            url: "/chi-tiet-san-pham/rest/detail-san-phams?idctsp=" + selectedIds.join(","),
            success: function (response) {
                let index = 0;
                response.forEach(el => {
                    index++;
                    html += `<tr item='` + JSON.stringify(el) + `'>
                            <td><input class="form-check-input" type="checkbox" name="chiTietSanPham" value="` + el.id + `" /></td>
                            <td>` + (el ? el.ma : "") + `</td>
                            <td align="center">
                                <img src="../../../uploads/` + (el.hinhAnh ? el.hinhAnh.anh1 : "") + `" width="100" height="100"
                                     style="border-radius:50% 50% 50% 50%">

                            </td>
                            <td>` + (el.sanPham ? el.sanPham.tenSP : "") + `</td>
                            <td>` + (el.mauSac ? el.mauSac.ten : "") + `</td>
                            <td>` + (el.kichThuoc ? el.kichThuoc.size : "") + `</td>
                            <td>` + (el.chatLieu ? el.chatLieu.tenChatLieu : "") + `</td>
                            <td>` + (el.sanPham.phanLoai ? el.sanPham.phanLoai.tenLoai : "") + `</td>
                            <td>` + (el.sanPham.thuongHieu ? el.sanPham.thuongHieu.ten : "") + `</td>
                            <td>` + el.soLuongTon + `</td>
                            <td><strong>  ` + VND.format(el.donGia) + `</strong></td>
                            <td>` + (el.trangThai == 1 ? 'Còn bán' : 'Ngừng bán') + `</td>
                        </tr>`
                })
                tableProduct.innerHTML = html;
            },
            error: function (xhr, status, error) {
                console.log(xhr.responseText);
            }
        });
        $(document).ready(function () {
            // Bắt sự kiện click trên button "Update"
            $('#updateBtnt').click(function () {
                // Lấy id của sản phẩm đang được chọn để cập nhật
                let selectedProductId = $('input[name="idCTSP"]:checked').val();

                // Kiểm tra xem có sản phẩm nào được chọn không
                if (!selectedProductId) {
                    // Hiển thị thông báo lỗi nếu không có sản phẩm nào được chọn
                    alert("Chưa chọn sản phẩm để cập nhật.");
                    return;
                }

                // Chuyển hướng sang trang cập nhật sản phẩm với id của sản phẩm được chọn
                window.location.href = `/chi-tiet-san-pham/view-update?idctsp=` + selectedIds.join(",");
            });
        });

    }

    const searchSanPham = () => {
        let maSanPhamSearch = $("#maSanPhamSearch").val();
        let tenSanPhamSearch = $('#tenSanPhamSearch').val();
        let mauSacSearch = $('#mauSacSearch').val();
        let kichCoSearch = $('#sizeSearch').val();
        let chatLieuSearch = $('#chatLieuSearch').val();
        let hinhAnhSearch = $('#hinhAnhSearch').val();
        let loaiSearch = $('#loaiSearch').val();
        let thuongHieuSearch = $('#thuongHieuSearch').val();
        let trangThaiSearch = $('#trangThaiSearch').val(); // Giá trị của trạng thái
        $('#listProduct').find('tr').each(function () {
            let product = JSON.parse($(this).attr('item'));
            let check = true;

            // Kiểm tra mã sản phẩm
            if (maSanPhamSearch) {
                if (!product.ma.includes(maSanPhamSearch)) {
                    check = false;
                }
            }

            // Kiểm tra tên sản phẩm
            if (tenSanPhamSearch) {
                if (!product.ten.toLowerCase().includes(tenSanPhamSearch.toLowerCase())) {
                    check = false;
                }
            }

            // Kiểm tra màu sắc
            if (mauSacSearch) {
                if (!product.mauSac.id.toLowerCase().includes(mauSacSearch.toLowerCase())) {
                    check = false;
                }
            }

            // Kiểm tra kích cỡ
            if (kichCoSearch) {
                if (!product.kichThuoc.id.includes(kichCoSearch)) {
                    check = false;
                }
            }

            // Kiểm tra chất liệu
            if (chatLieuSearch) {
                if (!product.chatLieu.id.toLowerCase().includes(chatLieuSearch.toLowerCase())) {
                    check = false;
                }
            }

            // Kiểm tra hình ảnh
            if (hinhAnhSearch) {
                if (!product.hinhAnh.id.toLowerCase().includes(hinhAnhSearch.toLowerCase())) {
                    check = false;
                }
            }

            if (loaiSearch) {
                if (!product.loai.id.toLowerCase().includes(loaiSearch.toLowerCase())) {
                    check = false;
                }
            }
            if (thuongHieuSearch) {
                if (!product.thuongHieu.id.toLowerCase().includes(thuongHieuSearch.toLowerCase())) {
                    check = false;
                }
            }
            if (trangThaiSearch !== "") {
                // Nếu trạng thái của sản phẩm không trùng khớp với giá trị trạng thái được chọn, đặt check thành false
                if (product.trangThai != trangThaiSearch) {
                    check = false;
                }
            }


            // Nếu sản phẩm không thỏa mãn các điều kiện tìm kiếm, ẩn nó đi
            if (!check) {
                $(this).hide();
            } else {
                $(this).show();
            }
        });

    }

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
        let text = "Bạn chắc chắn muốn xóa sản phẩm";
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
</html>
