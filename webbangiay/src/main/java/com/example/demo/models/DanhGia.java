package com.example.demo.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.UUID;

@AllArgsConstructor
    @NoArgsConstructor
    @ToString
    @Getter
    @Setter
    @Entity
    @Table(name = "danh_gia")
    public class DanhGia {
        @Id
        @GeneratedValue(strategy = GenerationType.UUID)
        @Column(name = "id_danh_gia")
        private UUID id;

        @Column(name = "ma")
        private String ma;

        @Column(name = "ghi_chu")
        private String ghiChu;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "khach_hang_id")
        private KhachHang khachHang;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "chi_tiet_san_pham_id")
        private ChiTietSanPham chiTietSanPham;
    }

