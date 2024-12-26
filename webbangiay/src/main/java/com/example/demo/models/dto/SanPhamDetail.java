package com.example.demo.models.dto;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.SanPham;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class SanPhamDetail {

    private SanPham sanPham;
    private List<ChiTietSanPham> chiTietSanPham;
    private Long soLuongDaBan;
}
