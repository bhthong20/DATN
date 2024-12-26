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
public class SanPhamAddHoaDon {

    private UUID hoaDonId;
    private UUID sanPhamId;
    private int quantity;
    private BigDecimal donGia;
}
