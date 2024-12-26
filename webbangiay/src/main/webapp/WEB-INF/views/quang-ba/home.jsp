<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
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
    <style>
        .text-center {
            text-align: center;
            margin-top: 0px;
        }

        .link-button {
            display: inline-block;
            text-decoration: none;
            background: linear-gradient(45deg, #6a6a6a 0%, #a8a8a8 100%);
            color: white;
            padding: 15px 30px;
            border-radius: 50px;
            transition: background 0.3s, transform 0.3s;
        }

        .link-button h4 {
            margin: 0;
            font-size: 18px;
        }

        .link-button:hover {
            background: linear-gradient(45deg, #a8a8a8 0%, #6a6a6a 100%);
            transform: translateY(-5px);
        }

        .link-button:active {
            transform: translateY(0);
        }
        .card__product .position-relative {
            width: 100%; /* Đảm bảo phần tử cha chiếm toàn bộ chiều rộng */
            height: 300px; /* Đặt chiều cao cố định cho phần tử cha */
            overflow: hidden; /* Ẩn các phần tử con vượt ra ngoài phần tử cha */
        }

        .card__product .position-relative img {
            width: 100%; /* Ảnh chiếm toàn bộ chiều rộng của phần tử cha */
            height: auto; /* Chiều cao của ảnh được điều chỉnh tự động để giữ tỷ lệ khung hình */
            object-fit: cover; /* Cắt ảnh sao cho nó vừa với kích thước của phần tử cha */
        }
    </style>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
</head>

<body style="background-color: #EBF0F5 !important;">

<jsp:include page="header.jsp"></jsp:include>

<section id="content" class="mt-4">
    <section id="banner__page" style="height: 100%">

        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                        class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="3000">
                    <img style="width: 100%; height: 500px; object-fit: cover;"
                         src="/uploads/banner8.jpg"
                         class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                    <img style="width: 100%; height: 500px; object-fit: cover;"
                         src="/uploads/banner6.jpg"
                         class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="3000">
                    <img style="width: 100%; height: 500px; object-fit: cover;"
                         src="/uploads/banner5.jpg"
                         class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>
    <hr>
    <h4 class="text-center">Danh Sách Sản Phẩm Bán Chạy</h4>
    <section>
        <div class="row" id="listSanPham">
            <!-- Product cards will be rendered here -->
        </div>
        <!-- Pagination -->
        <nav aria-label="Page navigation example" class="pt-4 d-flex align-items-end justify-content-center">
            <ul id="pagination" class="pagination m-0">
                <!-- Pagination buttons will be rendered here -->
            </ul>
        </nav>
    </section>

    <div class="text-center">
        <a href="/san-pham" class="link-button">
            <h4 style="color: white">Xem Thêm</h4>
        </a>
    </div>
    <hr>
</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
<script>
    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number);
    }
    function getListData() {
        const pageing = document.getElementById("pagination");
        let renderPage = '';

        $.ajax({
            type: "Get",
            url: "/home/rest/all",
            success: function (response) {
                console.log(response)
                renderCard(response.content.slice(0, 4));
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
    console.log(getListData());
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
                                                    class="text-base/5 truncate">` +formatCurrency (el.donGia) + `</span><span
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
