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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>

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
</head>

<body>
<div  class="container-xxl flex-grow-1 container-p-y">
    <div class="col-md-12">
        <div class="card">
            <h4 class="card-header" style="text-align: center">Thông tin chi tiết sản phẩm</h4>
            <%--@elvariable id="chiTietSanPham" type=""--%>
            <div class="card-body">
                <form:form action="/chi-tiet-san-pham/update/${chiTietSanPham.id}" method="post"
                           modelAttribute="chiTietSanPham"><div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3 mt-3">
                                <form:select class="form-select" path="sanPham">
                                    <option selected disabled>Sản phẩm</option>
                                    <form:options items="${listSP}" itemValue="id" itemLabel="tenSP"/>
                                </form:select>
                                <form:label class="form-label" path="sanPham">Tên sản phẩm:</form:label>
                            </div>

                            <div class="form-floating mb-3 mt-3">
                                <form:input class="form-control" placeholder="" path="soLuongTon"/>
                                <form:label for="floatingInput" path="soLuongTon">Số lượng tồn:</form:label>
                                <form:errors path="soLuongTon" cssStyle="color: red"/>
                            </div>
                            <div class="form-floating mb-3 mt-3">
                                <form:input class="form-control" placeholder="" path="donGia"/>
                                <form:label for="floatingInput" path="donGia">Đơn giá:</form:label>
                                <form:errors path="donGia" cssStyle="color: red"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row mb-3 mt-3">
                                <div class="col-11">
                                    <form:select path="mauSac" class="form-select" id="selectMauSac">
                                        <option selected disabled>Màu sắc</option>
                                        <form:options items="${listMS}" itemLabel="ten" itemValue="id"/>
                                    </form:select>
                                </div>
                                <div class="col-1">
                                    <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModalMauSac">
                                        <img src="/uploads/plus.png">
                                    </a>
                                </div>
                            </div>

                            <div class="row mb-3 mt-3">
                                <div class="col-11 form-floating">
                                    <form:select path="kichThuoc" class="form-select" id="selectKichThuoc">
                                        <option selected disabled>Kích cỡ</option>
                                        <form:options items="${listKT}" itemLabel="size" itemValue="id"/>
                                    </form:select>
                                </div>
                                <div class="col-1">
                                    <a data-bs-toggle="modal" data-bs-target="#exampleModalKichThuoc">
                                        <img src="/uploads/plus.png">
                                    </a>
                                </div>
                            </div>
                            <div class="row mb-3 mt-3">
                                <div class="col-11 form-floating">
                                    <form:select path="chatLieu" class="form-select" id="selectChatLieu">
                                        <option selected disabled>Chất liệu</option>
                                        <form:options items="${listCL}" itemLabel="tenChatLieu" itemValue="id"/>
                                    </form:select>
                                </div>
                                <div class="col-1">
                                    <a data-bs-toggle="modal" data-bs-target="#exampleModalChatLieu">
                                        <img src="/uploads/plus.png">
                                    </a>
                                </div>
                            </div>

                            <div class="form-floating mb-3 mt-3">
                                <form:textarea class="form-control" path="moTa"/>
                                <form:label for="floatingInput" path="moTa">Mô tả:</form:label>
                                <form:errors path="moTa" cssStyle="color: #ff0000"/>
                            </div>

                            <div class="form-check mb-3 mt-3">
                                <form:label class="form-label" path="trangThai">Tình Trạng:</form:label>
                                <form:radiobutton path="trangThai" value="0" checked="true"/>Còn hàng
                                <form:radiobutton path="trangThai" value="1"/>Hết hàng
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12" style="text-align: center">
                                <button type="submit" class="btn btn-success"
                                        id="btt" onclick="return myFunction1()">Add
                                </button>
                            </div>
                        </div>
                    </div>
                </form:form>

            </div>
        </div>
    </div>


    <%--Them nhanh mau sac--%>
    <div class="modal fade" id="exampleModalMauSac" tabindex="-1" aria-labelledby="exampleModalLabelMauSac"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelMauSac">Màu Sắc</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="imeiListMauSac">
                        <table class="table">
                            <%--@elvariable id="mauSac" type=""--%>
                            <form:form action="/chi-tiet-san-pham/modal-add-mau-sac" method="post"
                                       modelAttribute="mauSac">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-floating mb-3 mt-3">
                                            <form:input class="form-control" placeholder="" path="ten"/>
                                            <form:label class="form-label" path="ten">Tên màu sắc:</form:label>
                                            <form:errors path="ten" cssStyle="color: red"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3 mt-3">
                                            <form:input class="form-control" placeholder="" path="moTa"/>
                                            <form:label class="form-label" path="moTa">Mô tả:</form:label>
                                            <form:errors path="moTa" cssStyle="color: red"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-check mb-3 mt-3">
                                            <form:label class="form-label" path="trangThai">Tình Trạng:</form:label>
                                            <br>
                                            <form:radiobutton path="trangThai" value="0" checked="true"/>Hoạt động
                                            <br>
                                            <form:radiobutton path="trangThai" value="1"/>Ngưng hoạt động
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12" style="text-align: center">
                                            <button type="submit" class="btn btn-success"
                                                    onclick="myFunction1()">Add
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--Them nhanh kich co--%>
    <div class="modal fade" id="exampleModalKichThuoc" tabindex="-1" aria-labelledby="exampleModalLabelKichThuoc"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelKichThuoc">Kích cỡ</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="imeiListKichThuoc">
                        <table class="table">
                            <%--@elvariable id="size" type=""--%>
                            <form:form action="/chi-tiet-san-pham/modal-add-kich-thuoc" method="post"
                                       modelAttribute="kichThuoc">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-floating mb-3 mt-3">
                                            <form:input class="form-control" placeholder="" path="size"/>
                                            <form:label class="form-label" path="size">Kích cỡ:</form:label>
                                            <form:errors path="size" cssStyle="color: red"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3 mt-3">
                                            <form:input class="form-control" placeholder="" path="moTa"/>
                                            <form:label class="form-label" path="moTa">Mô tả:</form:label>
                                            <form:errors path="moTa" cssStyle="color: red"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-check mb-3 mt-3">
                                            <form:label class="form-label" path="trangThai">Tình Trạng:</form:label>
                                            <br>
                                            <form:radiobutton path="trangThai" value="0" checked="true"/>Hoạt động
                                            <br>
                                            <form:radiobutton path="trangThai" value="1"/>Ngưng hoạt động
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12" style="text-align: center">
                                            <button type="submit" class="btn btn-success"
                                                    onclick="myFunction1()">Add
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--Them nhanh de--%>
    <div class="modal fade" id="exampleModalChatLieu" tabindex="-1" aria-labelledby="exampleModalLabelChatLieu"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelChatLieu">Loại đế</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="imeiListChatLieu">
                        <table class="table">
                            <%--@elvariable id="de" type=""--%>
                            <form:form action="/chi-tiet-san-pham/modal-add-chat-lieu" method="post"
                                       modelAttribute="chatLieu">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-floating mb-3 mt-3">
                                            <form:input class="form-control" placeholder="" path="tenChatLieu"/>
                                            <form:label class="form-label"
                                                        path="tenChatLieu">Chất liệu:</form:label>
                                            <form:errors path="tenChatLieu" cssStyle="color: red"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3 mt-3">
                                            <form:input class="form-control" placeholder="" path="moTa"/>
                                            <form:label class="form-label" path="moTa">Mô tả:</form:label>
                                            <form:errors path="moTa" cssStyle="color: red"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-check mb-3 mt-3">
                                            <form:label class="form-label" path="trangThai">Tình Trạng:</form:label>
                                            <br>
                                            <form:radiobutton path="trangThai" value="0" checked="true"/>Hoạt động
                                            <br>
                                            <form:radiobutton path="trangThai" value="1"/>Ngưng hoạt động
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12" style="text-align: center">
                                            <button type="submit" class="btn btn-success"
                                                    onclick="myFunction1()">Add
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
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
        let text = "Bạn chắc chắn muốn thay đổi trạng thái";
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
<script src="../../vendors/js/vendor.bundle.base.js"></script>
<script src="../../js/off-canvas.js"></script>
<script src="../../js/hoverable-collapse.js"></script>
<script src="../../js/template.js"></script>
<script src="../../js/settings.js"></script>
<script src="../../js/todolist.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script>
    $(document).ready(function () {
        $('#selectMauSac').select2();
        $('#selectKichThuoc').select2();
        $('#selectChatLieu').select2();
    });

</script>
<!-- Core JS -->
</html>
