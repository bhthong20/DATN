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
public class SanPhamThongKeDto {

    private UUID id;
    private String tenSanPham;
    private String url;
    private int soLuongTon;
    private int soLuongBan;
    private Long doanhThu;
}
