package com.example.demo.models.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChiTietSanPhamDto {
    private String id;
    private String idKichThuoc;
    private String idMauSac;
    private String idChatLieu;
    private int soLuongTon;
    private BigDecimal donGia;
    private String moTa;
    private int trangThai;
    private String idHinhAnh;
    private String anh1;
    private String anh2;
    private String anh3;
}
