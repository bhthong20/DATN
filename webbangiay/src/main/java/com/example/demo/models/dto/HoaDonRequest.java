package com.example.demo.models.dto;

import com.example.demo.models.HoaDon;
import com.example.demo.models.KhachHang;
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
public class HoaDonRequest {
    private List<SanPhamAddHoaDon> sanPhamAddHoaDons;
    private HoaDon hoaDon;
    private KhachHang khachHang;
    private UUID idKhuyenMai;
}
