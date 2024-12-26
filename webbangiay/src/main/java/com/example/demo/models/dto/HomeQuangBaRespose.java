package com.example.demo.models.dto;

import java.math.BigDecimal;

public interface HomeQuangBaRespose {
    String getIdSanPham();
    String getMaSanPham();
    String getTenSanPham();
    String getHinhAnh();
    String getLoai();
    String getThuongHieu();
    String getMoTa();
    BigDecimal getDonGia();
    Long getSale();
    Long getLuotMua();
}
