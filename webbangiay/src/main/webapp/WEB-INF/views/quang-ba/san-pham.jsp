<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content=""/>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico"/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="../assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <link rel="stylesheet" href="../assets/vendor/libs/apex-charts/apex-charts.css"/>

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
    <script src="../js/menu.js"></script>
    <style>
        .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
            background-color: #ff3e1d !important;
            border-color: #ff3e1d !important;
            box-shadow: 0 2px 4px 0 rgba(255, 105, 105, 0.4) !important;
        }

    </style>
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>

<section id="content" class="mt-4" style="background-color: #f5f5f9;">
    <section class="container-fluid">
        <div class="row">
            <div class="col-2 min-vh-100 card">
                <h5 class="card-header">
                    Tìm kiếm sản phẩm</h5>
                <hr class="m-0"/>
                <div class="card-body">
                    <div class="mb-3">
                        <label for="ten" class="col-form-label">Tên giày</label>
                        <div>
                            <input class="form-control" type="text" value="" id="ten"/>
                        </div>
                    </div>
                    <div class="divider">
                        <div class="divider-text">Màu sắc</div>
                    </div>

                    <c:forEach var="mauSacItem" items="${listMS}">
                        <div class="form-check mb-3">
                            <input class="form-check-input mauSac" checked type="checkbox" name="mauSac"
                                   value="${mauSacItem.id}"
                                   id="${mauSacItem.id}"/>
                            <label class="form-check-label" for="${mauSacItem.id}"> ${mauSacItem.ten} </label>
                        </div>
                    </c:forEach>

                    <div class="divider">
                        <div class="divider-text">Phân loại</div>
                    </div>
                    <c:forEach items="${listPL}" var="phanLoai">
                        <div class="form-check mb-3">
                            <input class="form-check-input phanLoai" checked type="checkbox" name="mauSac"
                                   value="${phanLoai.id}"
                                   id="${phanLoai.id}"/>
                            <label class="form-check-label" for="${phanLoai.id}"> ${phanLoai.tenLoai} </label>
                        </div>
                    </c:forEach>

                    <div class="divider">
                        <div class="divider-text">Thương hiệu</div>
                    </div>
                    <c:forEach items="${listTH}" var="thuongHieu">
                        <div class="form-check mb-3">
                            <input class="form-check-input thuongHieu" checked type="checkbox" name="mauSac"
                                   value="${thuongHieu.id}"
                                   id="${thuongHieu.id}"/>
                            <label class="form-check-label" for="${thuongHieu.id}"> ${thuongHieu.ten} </label>
                        </div>
                    </c:forEach>
                    <div class="divider">
                        <div class="divider-text">Giá thành</div>
                    </div>
                    <div class="form-check mb-3 p-0 d-flex justify-between align-items-center">
                        <input class="form-control" type="text" value="" id="giaBatDau" placeholder="Từ"/>
                        <span class="d-flex justify-between align-items-center mx-2"> - </span>
                        <input class="form-control" type="text" value="" id="giaKetThuc" placeholder="Đến"/>
                    </div>

                    <button type="button" onclick="filterSanPham()" class="btn btn-danger w-100">Tìm kiếm</button>
                </div>
            </div>
            <div class="col-10 ps-4 ">
                <section>

                    <h4 class="fw-bold py-3 m-0">
                        <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 24 24"
                             style="fill: rgba(0, 0, 0, 1);transform: ;msFilter:;">
                            <path d="M4 6h2v2H4zm0 5h2v2H4zm0 5h2v2H4zm16-8V6H8.023v2H18.8zM8 11h12v2H8zm0 5h12v2H8z"></path>
                        </svg>
                        <span class="">Danh sách sản phẩm</span>
                    </h4>

                    <section class="list-product shopee-search-item-result">
                        <fieldset class="shopee-sort-bar" style="border: 0px;">
                            <legend style="display: none;"></legend>
                            <div class="shopee-sort-bar__label">Sắp xếp theo</div>
                            <div class="shopee-sort-by-options">
                                <section class="shopee-sort-by-options__option-group">
                                    <button aria-label=""
                                            onclick="orderBy(this, 'ngay_tao')" aria-pressed="false"
                                            class="shopee-sort-by-options__option shopee-sort-by-options__option--selected">
                                        <span aria-hidden="true">Mới nhất</span></button>
                                    <button aria-label=""
                                            onclick="orderBy(this, 'luotMua')" aria-pressed="false"
                                            class="shopee-sort-by-options__option">
                                        <span aria-hidden="true">Bán chạy</span></button>
                                    <button aria-label=""
                                            onclick="orderBy(this, 'donGia')" aria-pressed="false"
                                            class="shopee-sort-by-options__option">
                                        <span aria-hidden="true">Giá bán</span></button>
                                </section>
                                <section>
                                    <div style="pointer-events: auto;">
                                        <select class="sort-price-select" id="orderByType"
                                                onchange="selectTypeOrderBy(this)"
                                                aria-label="Default select example">
                                            <option value="acs">Thấp đến cao</option>
                                            <option value="desc" selected>Cao đến thấp</option>
                                        </select>
                                    </div>
                                </section>
                            </div>
                        </fieldset>
                    </section>

                    <section>
                        <div class="row" id="listSanPham">
                        </div>
                        <nav aria-label="Page navigation example"
                             class="pt-4 d-flex align-items-end justify-content-center">
                            <ul id="pagination" class="pagination m-0">
                            </ul>
                        </nav>
                    </section>
                </section>
            </div>
        </div>
    </section>
</section>

<jsp:include page="footer.jsp"></jsp:include>

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
<script src="../assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="../assets/js/main.js"></script>

<!-- Page JS -->
<script src="../assets/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="../../../js/select-2.js"></script>
<script>
    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(number);
    }

    let filter = {
        ma: "",
        ten: "",
        listIdThuongHieu: [],
        listIdMauSac: [],
        listIdPhanLoai: [],
        giaBatDau: null,
        giaKetThuc: null,
        page: 0,
        size: 12,
        sortField: "ngay_tao",
        sortType: "DESC"
    }
    let total = 0;

    function getListData() {
        const pageing = document.getElementById("pagination");
        let renderPage = '';

        $.ajax({
            type: "POST",
            url: "/home/rest",
            contentType: "application/json",
            data: JSON.stringify(filter),
            success: function (response) {
                console.log(response)
                renderCard(response.content);
                if (response.totalPages > 1) {
                    for (let i = 0; i < response.totalPages; i++) {
                        renderPage += `
                        <li class="page-item"><button onclick="currentPage(` + i + `)"
                        class="page-link bg-white ` + (response.pageable.pageNumber == i ? 'active' : '') + `" href="#">` + (i + 1) + `</button></li>
                    `;
                    }
                    pageing.innerHTML = renderPage;
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr.responseText);
            }
        });
    }

    function currentPage(page) {
        filter.page = page;
        filterSanPham();
    }

    function orderBy(button, type) {
        $('.shopee-sort-by-options__option').removeClass('shopee-sort-by-options__option--selected');
        $(button).addClass('shopee-sort-by-options__option--selected');
        filter.sortField = type;
        filterSanPham();
    }

    function selectTypeOrderBy(select) {
        filter.sortType = $(select).val();
        filterSanPham();
    }

    function formatCurrencyInput(input) {
        input = input.replace(/\D/g, ''); // Remove non-digit characters
        return input.replace(/\B(?=(\d{3})+(?!\d))/g, ','); // Add commas for thousands
    }

    function removeFormatCurrency(input) {
        return input.replace(/,/g, ''); // Remove commas
    }

    function filterSanPham() {
        // Validate giá bắt đầu và giá kết thúc
        let giaBatDau = removeFormatCurrency($('#giaBatDau').val());
        let giaKetThuc = removeFormatCurrency($('#giaKetThuc').val());

        if (parseInt(giaKetThuc) < parseInt(giaBatDau)) {
            alert('Giá kết thúc không được nhỏ hơn giá bắt đầu');
            return;
        }

        filter.listIdMauSac = [];
        filter.listIdThuongHieu = [];
        filter.listIdPhanLoai = [];

        filter.ma = $("#ma").val();
        filter.ten = $("#ten").val();
        filter.giaBatDau = giaBatDau ? parseInt(giaBatDau) : null;
        filter.giaKetThuc = giaKetThuc ? parseInt(giaKetThuc) : null;

        let mauSac = $(".mauSac");
        let thuongHieu = $(".thuongHieu");
        let phanLoai = $(".phanLoai");
        mauSac.each(function () {
            if ($(this).prop("checked")) {
                filter.listIdMauSac.push($(this).val());
            }
        });

        thuongHieu.each(function () {
            if ($(this).prop("checked")) {
                filter.listIdThuongHieu.push($(this).val());
            }
        });

        phanLoai.each(function () {
            if ($(this).prop("checked")) {
                filter.listIdPhanLoai.push($(this).val());
            }
        });

        getListData();
        renderCard();
    }

    $(document).ready(function () {
        // Add event listeners to format currency on input
        $('#giaBatDau, #giaKetThuc').on('input', function () {
            let formattedValue = formatCurrencyInput($(this).val());
            $(this).val(formattedValue);
        });

        // Initialize filter when page loads
        filterSanPham();
    });

    window.onload = function () {
        filterSanPham();
    };

    function renderCard(listCard) {
        const listSanPham = document.getElementById("listSanPham");
        let html = '';
        let index = 0;
        if (listCard && listCard.length !== 0) {
            listCard.forEach(el => {
                console.log(el)
                index++;
                html += `
                <div class="col-3 mt-4">
                    <div class="card card__product">
                        <div class="position-relative" style="overflow: hidden">
                            <img src="../../../uploads/` + el.hinhAnh + `"
                                 class="card-img-top" alt="...">
                            <img src="https://down-vn.img.susercontent.com/file/vn-50009109-caf8b883b8713804c28abfe16ed9ec0d"
                                 class="position-absolute w-100" style="left: 0;
    bottom: 0;"/>
                        </div>
                        <div class="card-body shopee_ic">
                            <h5 class="card-title">` + el.tenSanPham + `</h5>
                            <div class="space-y-1 mb-1 flex-1 flex flex-col justify-between min-h-[4rem]">
                                <div class="line-clamp-2 break-words min-h-[2.5rem] text-sm">
                                    ` + el.moTa + `
                                </div>
                            </div>
                            <div class="flex-1 flex flex-col justify-between">
                                <div class="mb-2 flex items-center">
                                    <div class="flex-shrink flex flex-row min-w-0 space-x-1 mr-1">
                                        <div class="shrink-0 max-w-full truncate text-shopee-primary flex items-center font-normal">
                                            <span aria-label="promotion price"></span>
                                            <div class="truncate flex items-baseline"><span
                                                    class="text-base/5 truncate">` + formatCurrency(el.donGia) + `</span><span
                                                    class="text-xs/sp14"></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex justify-between items-center space-x-1 mb-2 last:mb-0">
                                    <div class="rating">
                                        <input value="5" name="rate` + index + `" id="star5` + el.idSanPham + `" type="radio">
                                        <label title="text" for="star5` + el.idSanPham + `"></label>
                                        <input value="4" name="rate` + index + `" id="star4` + el.idSanPham + `" type="radio">
                                        <label title="text" for="star4` + el.idSanPham + `"></label>
                                        <input value="3" name="rate` + index + `" id="star3` + el.idSanPham + `" type="radio" checked="">
                                        <label title="text" for="star3` + el.idSanPham + `"></label>
                                        <input value="2" name="rate` + index + `" id="star2` + el.idSanPham + `" type="radio">
                                        <label title="text" for="star2` + el.idSanPham + `"></label>
                                        <input value="1" name="rate` + index + `" id="star1` + el.idSanPham + `" type="radio">
                                        <label title="text" for="star1` + el.idSanPham + `"></label>
                                    </div>
                                    <div class="truncate text-shopee-black87 text-xs min-h-4 flex-shrink-1">
                                        Đã bán ` + el.luotMua + `
                                    </div>
                                </div>
                                <a href="/san-pham/` + el.idSanPham + `" class="btn btn-danger">Mua Ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
            `
            })
        }
        listSanPham.innerHTML = html;
    }
</script>
</html>
