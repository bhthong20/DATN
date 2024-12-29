package com.example.demo.models.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamDto {
    private String id;
    private String tenSanPham;
    private String idLoaiSanPham;
    private String idHinhAnh;
    private String anh1;
    private String anh2;
    private String anh3;
    private String idThuongHieu;
    private String moTa;
    private List<ChiTietSanPhamDto> chiTietSanPhamDtos;
}
