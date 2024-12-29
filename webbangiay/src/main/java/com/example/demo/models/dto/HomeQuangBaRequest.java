package com.example.demo.models.dto;

import com.example.demo.models.ThuongHieu;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HomeQuangBaRequest {
    private String ma;
    private String ten;
    private List<String> listIdThuongHieu;
    private List<String> listIdMauSac;
    private List<String> listIdPhanLoai;
    private BigDecimal giaBatDau;
    private BigDecimal giaKetThuc;
    private int page = 0;
    private int size = 10;
    private String sortField = "ngay_tao";
    private String sortType = "DESC";
}
