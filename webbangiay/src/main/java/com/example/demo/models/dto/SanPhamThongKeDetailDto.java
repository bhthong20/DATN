package com.example.demo.models.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SanPhamThongKeDetailDto {
    private UUID id;
    private String tenSanPham;
    private String url;
    private String kichThuoc;
    private String mauSac;
    private String chatLieu;
    private int soLuongTon;
    private int soLuongBan;
    private Long doanhThu;
}
