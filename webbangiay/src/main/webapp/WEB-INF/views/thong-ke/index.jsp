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

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>
</head>
<body>
    <section class="mb-4">
        <div class="row">
            <div class="col-3">
                <div class="card">
                    <h5 class="text-center card-header">Số lượng bán</h5>
                    <div class="card-body">
                        <h2 class="text-center"><span id="soLuongBan"></span>👟</h2>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card">
                    <h5 class="text-center card-header">Tổng doanh số</h5>
                    <div class="card-body">
                        <h2 class="text-center"><span id="tongDoanhSo"></span>🪙</h2>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card">
                    <h5 class="text-center card-header">Tổng tại quầy</h5>
                    <div class="card-body">
                        <h2 class="text-center"><span id="tongTaiQuay"></span>🪙</h2>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card">
                    <h5 class="text-center card-header">Tổng bán online</h5>
                    <div class="card-body">
                        <h2 class="text-center"><span id="tongOnline"></span>🪙</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="mb-4">
        <div class="card">
            <h4 class="card-header">Trạng Thái Hóa Đơn Tháng Này</h4>
            <div class="card-body">
                <div id="pieChart"></div>
            </div>
        </div>
    </section>

    <section class="mb-4">
        <div class="card">
            <h4 class="card-header d-flex justify-content-between align-items-center"><span>Thống kê doanh thu</span>
                <span>
                    <select class="form-select" id="phanLoai">
                        <option value="1">Theo ngày</option>
                        <option selected value="2">Theo tháng</option>
                        <option value="3">Theo năm</option>
                    </select>
                </span>
            </h4>
            <div class="card-body">
                <div id="columnChart"></div>
            </div>
        </div>
    </section>
    <section class="mb-4">
        <div class="row">
            <div style="min-height: 100%" class="col-8">
                <div style="height: 100%" class="card">
                    <h4 class="card-header">Danh sách sản phẩm đã bán</h4>
                    <div class="card-body">
                        <div class="table-responsive text-nowrap">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tên Sp</th>
                                    <th>Số lượng tồn</th>
                                    <th>Số lượng bán</th>
                                    <th>Doanh thu</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-2" id="listSanPham">
                                    <tr>
                                        <td>2</td>
                                        <td align="center" data-bs-toggle="modal" data-bs-target="#thongKeSanPham">
                                            <img src="../../../uploads/download.png" width="50" height="50"
                                                 style="border-radius:50% 50% 50% 50%">
                                            <span class="text-primary cursor-pointer">Sản phẩm A</span>
                                        </td>
                                        <td>10</td>
                                        <td>20</td>
                                        <td>10.000.00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div style="min-height: 100%" class="col-4">
                <div style="height: 100%" class="card">
                    <h4 class="card-header">
                        Thống kê sản phẩm
                    </h4>
                    <div class="card-body">
                        <div id="lineChart"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="modal fade" id="thongKeSanPham"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-xl modal-dialog-centered" style="min-width: 1400px;">
            <div class="modal-content">
                <div id="content">
                    <div class="modal-header">
                        <h4 class="modal-title">Thống kê chi tiết sản phẩm </h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="card mb-3">
                            <div id="lineChartCtsp"></div>
                        </div>
                        <div class="card">
                            <div class="table-responsive text-nowrap" style="max-height: 600px;">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã Sp</th>
                                        <th>Kích thước</th>
                                        <th>Màu sắc</th>
                                        <th>Chất liệu</th>
                                        <th>Số lượng tồn</th>
                                        <th>Số lượng bán</th>
                                    </tr>
                                    </thead>
                                    <tbody class="table-border-bottom-2" id="listSanPhamDetail">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

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

<!-- Main JS -->
<script src="../assets/js/main.js"></script>

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script>
    function columnChart(series, xaxis, id) {
        var options = {
            series: series,
            chart: {
                type: 'bar',
                height: 350,
                stacked: true,
                toolbar: {
                    show: true
                },
                zoom: {
                    enabled: true
                }
            },
            responsive: [{
                breakpoint: 480,
                options: {
                    legend: {
                        position: 'bottom',
                        offsetX: -10,
                        offsetY: 0
                    }
                }
            }],
            plotOptions: {
                bar: {
                    horizontal: false,
                    borderRadius: 10,
                    borderRadiusApplication: 'end', // 'around', 'end'
                    borderRadiusWhenStacked: 'last', // 'all', 'last'
                    dataLabels: {
                        total: {
                            enabled: true,
                            style: {
                                fontSize: '13px',
                                fontWeight: 900
                            }
                        }
                    }
                },
            },
            xaxis: xaxis,
            legend: {
                position: 'right',
                offsetY: 40
            },
            fill: {
                opacity: 1
            }
        };

        document.querySelector("#" + id).innerHTML = ''
        var chart = new ApexCharts(document.querySelector("#" + id), options);
        chart.render();
    }

    function lineChart(series, xaxis, lineChart) {
        var options = {
            series: series,
            chart: {
                height: 350,
                type: 'line',
                dropShadow: {
                    enabled: true,
                    color: '#000',
                    top: 18,
                    left: 7,
                    blur: 10,
                    opacity: 0.2
                },
                zoom: {
                    enabled: true
                },
                toolbar: {
                    show: true
                }
            },
            colors: ['#77B6EA', '#545454'],
            dataLabels: {
                enabled: true,
            },
            stroke: {
                curve: 'smooth'
            },
            grid: {
                borderColor: '#e7e7e7',
                row: {
                    colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                    opacity: 0.5
                },
            },
            markers: {
                size: 1
            },
            xaxis: xaxis,
            yaxis: {
                min: 5,
                max: 40
            },
            legend: {
                position: 'top',
                horizontalAlign: 'right',
                floating: true,
                offsetY: -25,
                offsetX: -5
            }
        };
        document.querySelector("#" + lineChart).innerHTML = '';
        var chart = new ApexCharts(document.querySelector("#" + lineChart), options);
        chart.render();
    }

    function genderSanPham(listData) {
        const tableProduct = document.getElementById("listSanPham");
        let html = '';
        let index = 0;
        listData.forEach(product => {
            index++;
            html += `
                <tr>
                    <td>` + index + `</td>
                    <td onclick="detailSanPham('` + product.id + `')" data-bs-toggle="modal" data-bs-target="#thongKeSanPham">
                        <img src="../../../uploads/` + product.url + `" width="50" height="50"
                        style="border-radius:50% 50% 50% 50%">
                        <span class="text-primary cursor-pointer">` + product.tenSanPham + `</span>
                    </td>
                    <td>` + product.soLuongTon.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + `</td>
                    <td>` + product.soLuongBan.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + `</td>
                    <td>` + product.doanhThu.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + `</td>
                </tr>
            `
        });
        tableProduct.innerHTML = html;
    }

    function genderSanPhamDetail(listData) {
        const tableProduct = document.getElementById("listSanPhamDetail");
        let html = '';
        let index = 0;
        listData.forEach(product => {
            index++;
            html += `
                <tr>
                    <td>` + index + `</td>
                    <td align="center">
                        <img src="../../../uploads/` + product.url + `" width="50" height="50"
                             style="border-radius:50% 50% 50% 50%">
                        <span class="text-primary cursor-pointer">` + product.tenSanPham + `</span>
                    </td>
                    <td>` + product.kichThuoc + `</td>
                    <td>` + product.mauSac + `</td>
                    <td>` + product.chatLieu + `</td>
                    <td>` + product.soLuongTon.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + `</td>
                    <td>` + product.soLuongBan.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + `</td>
                </tr>
            `
        });
        tableProduct.innerHTML = html;
    }

    let type = 1;

    window.onload = function () {
        getAllThongKe(1);
    }

    document.getElementById('phanLoai').addEventListener('change', function() {
        var selectedOption = this.value;
        type = selectedOption;
        getAllThongKe(selectedOption)
    });

    function getAllThongKe(type) {
        $.ajax({
            type: "GET",
            url: "/thong-ke/api/" + type,
            success: function (response) {
                console.log(response)
                $('#soLuongBan').text(response.thongKeTong.soLuongBan.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
                $('#tongDoanhSo').text(response.thongKeTong.tongDoanhSo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
                $('#tongOnline').text(response.thongKeTong.tongOnline.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
                $('#tongTaiQuay').text(response.thongKeTong.tongTaiQuay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));

                columnChart(response.getLineChartTong, {
                    categories: response.categories,
                }, 'columnChart');

                lineChart(response.getLineChartSanPham, {
                    categories: response.categories,
                }, 'lineChart');

                genderSanPham(response.getAllSanPham);
            },
            error: function (xhr, status, error) {
                console.error(error);
                alert("Lỗi hệ thống !!!")
            }
        });
    }

    function detailSanPham(id) {
       $.ajax({
            type: "GET",
            url: "/thong-ke/detail/" + id + "/" + type,
            success: function (response) {
                genderSanPhamDetail(response.getSanPhamDetail)
                setTimeout(function() {
                    lineChart(response.getLineChartDetail, {
                        categories: response.categories,
                    }, 'lineChartCtsp');
                }, 500);
            },
            error: function (xhr, status, error) {
                console.error(error);
                alert("Lỗi hệ thống !!!")
            }
        });
    }

    function pieChart(series, labels, id) {
        var options = {
            series: series,
            chart: {
                width: 380,
                type: 'pie',
            },
            labels: labels,
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 300
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }]
        };

        document.querySelector("#" + id).innerHTML = '';
        var chart = new ApexCharts(document.querySelector("#" + id), options);
        chart.render();
    }

    function getTrangThaiHoaDonThang() {
        $.ajax({
            type: "GET",
            url: "/hoa-don/thong-ke/trang-thai-thang",
            success: function (response) {
                console.log(response);
                const data = response.data;

                const labels = data.map(item => {
                    switch (item.trangThai) {
                        case 0: return 'Chờ xác nhận';
                        case 1: return 'Đã xác nhận';
                        case 2: return 'Đã thanh toán';
                        case 3: return 'Chờ thanh toán';
                        case 4: return 'Chờ vận chuyển';
                        case 5: return 'Đang giao hàng';
                        case 6: return 'Vận chuyển hoàn tất';
                        case 7: return 'Giao trễ';
                        case 8: return 'Đã hủy';
                        case 9: return 'Mới tạo';
                        case 10: return 'Hoàn tất';
                        default: return 'Khác';
                    }
                });

                const series = data.map(item => item.soLuong);

                pieChart(series, labels, 'pieChart');
            },
            error: function (xhr, status, error) {
                console.error(error);
                alert("Lỗi khi tải trạng thái hóa đơn tháng này.");
            }
        });
    }

    window.onload = function () {
        getAllThongKe(2);
        getTrangThaiHoaDonThang();
    };

</script>
</html>
