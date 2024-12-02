package com.example.demo.models.dto;

import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonDto {
    private HoaDon hoaDon;
    private HoaDonChiTiet hoaDonChiTiet;
}
