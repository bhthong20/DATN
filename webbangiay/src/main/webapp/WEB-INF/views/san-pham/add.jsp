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
    <link rel="stylesheet" href="../../vendors/feather/feather.css">
    <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
    <link rel="shortcut icon" href="../../images/favicon.png"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>

</head>
<body>
<h4 style="text-align: center">Thông tin sản phẩm</h4>
<div class="container">
    <form:form action="/san-pham/add" method="post" modelAttribute="sanPham">
        <div class="row">
            <div class="col-6">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="tenSP"/>
                    <form:label class="form-label" path="tenSP">Tên sản phẩm:</form:label>
                    <form:errors path="tenSP" cssStyle="color: #ff0000"/>
                </div>

                <div class="form-floating mb-3 mt-3">
                    <div class="row">
                        <div class="col-10">
                            <form:select path="phanLoai" class="form-control" id="selectPhanLoai"
                                         cssStyle="font-weight: bold; width: 100%">
                                <option selected disabled>Phân loại</option>
                                <form:options items="${listPhanLoai}" itemLabel="tenLoai" itemValue="id"/>
                            </form:select>
                        </div>
                        <div class="col-2">
                            <a class="btn btn-secondary" data-bs-toggle="modal"
                               data-bs-target="#exampleModalPhanLoai">
                                <img src="/uploads/plus.png">
                            </a>

                        </div>
                    </div>
                </div>

                <div class="form-floating mb-3 mt-3">
                    <div class="row">
                        <div class="col-10">
                            <form:select path="thuongHieu" class="form-control" id="selectThuongHieu"
                                         cssStyle="font-weight: bold; width: 100%">
                                <option selected disabled>Thương Hiệu</option>
                                <form:options items="${listThuongHieu}" itemLabel="ten" itemValue="id"/>
                            </form:select>
                        </div>
                        <div class="col-2">
                            <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalThuongHieu">
                                <img src="/uploads/plus.png">
                            </a>

                        </div>
                    </div>
                </div>

                <div class="form-floating mb-3 mt-3">
                    <div class="row">
                        <div class="col-10">
                            <form:select path="hinhAnh" class="form-control" id="selectHinhAnh"
                                         cssStyle="font-weight: bold; width: 100%">
                                <option selected disabled>Hình Ảnh</option>
                                <form:options items="${listHinhAnh}" itemLabel="ten" itemValue="id"/>
                            </form:select>
                        </div>
                        <div class="col-2">
                            <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalHinhAnh">
                                <img src="/uploads/plus.png">
                            </a>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-6">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="moTa"/>
                    <form:label class="form-label" path="moTa">Mô tả:</form:label>
                    <form:errors path="moTa" cssStyle="color: red"/>
                </div>
                <div class="form-check mb-3 mt-3">
                    <form:label class="form-label" path="trangThai">Tình Trạng:</form:label>
                    <form:radiobutton path="trangThai" value="0" checked="true"/>Sản phẩm mới
                    <form:radiobutton path="trangThai" value="1"/>Sản phẩm cũ
                </div>
            </div>
            <div class="row">
                <div class="col-12" style="text-align: center">
                    <button type="submit" class="btn btn-success"
                            id="btt">Add
                    </button>
                </div>
            </div>
        </div>
    </form:form>
</div>


<div class="modal fade" id="exampleModalHinhAnh" tabindex="-1"
     aria-labelledby="exampleModalLabelHinhAnh"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelHinhAnh">Hinh Anh</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiListHinhAnh">
                    <table class="table">
                        <form:form action="/san-pham/modal-add-hinh-anh" method="post"
                                   modelAttribute="hinhAnh" enctype="multipart/form-data">
                        <div class="row">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-4">
                                        <div align="center" >
                                            <br>
                                            <label style="border: 5px solid white;width: 150px;height: 150px;border-radius:50% 50% 50% 50%;" for="anhmoi1" >
                                                <img id="preview-anh1-2" class="preview-image" src="" alt=""
                                                     width="100%" height="100%"
                                                     style="border-radius:50% 50% 50% 50%;border: 2px solid #8c8c8c">
                                                <br><br>
                                                ẢNH
                                            </label>
                                            <br>
                                            <div style="display: none">
                                                <input type="file"  name="anh1s"  accept="image/jpeg, image/png" id="anhmoi1"  >
                                            </div>
                                        </div>
                                        <div style="display: none">
                                            <form:input path="anh1"/>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div align="center" >
                                            <br>
                                            <label style="border: 5px solid white;width: 150px;height: 150px;border-radius:50% 50% 50% 50%;" for="anhmoi2" >
                                                <img id="preview-anh2-2" class="preview-image" src="" alt=""
                                                     width="100%" height="100%"
                                                     style="border-radius:50% 50% 50% 50%;border: 2px solid #8c8c8c">
                                                <br><br>
                                                ẢNH
                                            </label>
                                            <br>
                                            <div style="display: none">
                                                <input type="file"  name="anh2s"  accept="image/jpeg, image/png" id="anhmoi2"  >
                                            </div>
                                        </div>
                                        <div style="display: none">
                                            <form:input path="anh2"/>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div align="center" >
                                            <br>
                                            <label style="border: 5px solid white;width: 150px;height: 150px;border-radius:50% 50% 50% 50%;" for="anhmoi3" >
                                                <img id="preview-anh3-2" class="preview-image" src="" alt=""
                                                     width="100%" height="100%"
                                                     style="border-radius:50% 50% 50% 50%;border: 2px solid #8c8c8c">
                                                <br><br>
                                                ẢNH
                                            </label>
                                            <br>
                                            <div style="display: none">
                                                <input type="file"  name="anh3s"  accept="image/jpeg, image/png" id="anhmoi3"  >
                                            </div>
                                        </div>
                                        <div style="display: none">
                                            <form:input path="anh3"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <form:label path="ten"><b>Tên:</b></form:label>
                                <form:input class="form-control" placeholder="" path="ten"/>
                                <form:errors path="ten" cssClass="text-danger"/>
                            </div>
                            <div class="form-group">
                                <form:label path="moTa"><b>Mô tả:</b></form:label>
                                <form:input class="form-control" placeholder="" path="moTa"/>
                                <form:errors path="moTa" cssClass="text-danger"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12" style="text-align: center">
                                <button type="submit" class="btn btn-success"
                                        id="btt">Add
                                </button>
                            </div>
                        </div>
                </div>
                </form:form>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
            </div>
        </div>
    </div>
</div>

</div>


<div class="modal fade" id="exampleModalThuongHieu" tabindex="-1"
     aria-labelledby="exampleModalLabelThuongHieu"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelThuongHieu">Thương Hiệu</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiListThuongHieu">
                    <table class="table">
                        <form:form action="/san-pham/modal-add-thuong-hieu" method="post"
                                   modelAttribute="thuongHieu">
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-floating mb-3 mt-3">
                                        <form:input class="form-control" placeholder="" path="ten"/>
                                        <form:label class="form-label" path="ten">Tên thương hiệu:</form:label>
                                        <form:errors path="ten" cssStyle="color: red"/>
                                    </div>
                                    <div class="form-floating mb-3 mt-3">
                                        <form:input class="form-control" placeholder="" path="xuatSu"/>
                                        <form:label class="form-label" path="xuatSu">Xuất sứ:</form:label>
                                        <form:errors path="xuatSu" cssStyle="color: red"/>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-floating mb-3 mt-3">
                                        <form:input class="form-control" placeholder="" path="moTa"/>
                                        <form:label class="form-label" path="moTa">Mô tả:</form:label>
                                        <form:errors path="moTa" cssStyle="color: red"/>
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
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModalPhanLoai" tabindex="-1"
     aria-labelledby="exampleModalLabelPhanLoai"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelPhanLoai">Phân Loại</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiListPhanLoai">
                    <table class="table">
                        <form:form action="/san-pham/modal-add-phan-loai" method="post"
                                   modelAttribute="phanLoai">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder=""
                                                path="tenLoai"/>
                                    <form:label class="form-label"
                                                path="tenLoai">Phân Loại:</form:label>
                                    <form:errors path="tenLoai"
                                                 cssStyle="color: #ff0000"/>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder=""
                                                path="moTa"/>
                                    <form:label class="form-label"
                                                path="moTa">Mô tả:</form:label>
                                    <form:errors path="moTa" cssStyle="color: red"/>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check mb-3 mt-3">
                                    <form:label class="form-label"
                                                path="trangThai">Tình Trạng:</form:label>
                                    <form:radiobutton path="trangThai" value="0"
                                                      checked="true"/>Chất
                                    liệu mới
                                    <form:radiobutton path="trangThai" value="1"/>Chất liệu
                                    cũ
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12" style="text-align: center">
                                <button type="submit" class="btn btn-success"
                                        id="btt">Add
                                </button>
                            </div>
                        </div>
                </div>
                </form:form>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Close
                </button>
            </div>
        </div>
    </div>
</div>



</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script>
    $(document).ready(function () {
        $('#selectHinhAnh').select2();
    });

</script>
<script>
    $(document).ready(function () {
        $('#selectPhanLoai').select2();
    });


</script>
<script>
    $(document).ready(function () {
        $('#selectThuongHieu').select2();
    });
</script>
<script>
    const imageInput1 = document.getElementById('anhmoi1');

    const previewAnh12 = document.getElementById('preview-anh1-2');

    imageInput1.addEventListener('change', function () {
        const file = imageInput1.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                previewAnh12.src = e.target.result;
            };
            reader.readAsDataURL(file);
        } else {
            previewAnh12.src = '';
        }
    });
    const imageInput2 = document.getElementById('anhmoi2');

    const previewAnh22 = document.getElementById('preview-anh2-2');

    imageInput2.addEventListener('change', function () {
        const file = imageInput2.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                previewAnh22.src = e.target.result;
            };
            reader.readAsDataURL(file);
        } else {
            previewAnh22.src = '';
        }
    });
    const imageInput3 = document.getElementById('anhmoi3');

    const previewAnh32 = document.getElementById('preview-anh3-2');

    imageInput3.addEventListener('change', function () {
        const file = imageInput3.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                previewAnh32.src = e.target.result;
            };
            reader.readAsDataURL(file);
        } else {
            previewAnh32.src = '';
        }
    });
</script>
</html>