//package com.example.demo.models;
//
//import jakarta.persistence.Column;
//import jakarta.persistence.Entity;
//import jakarta.persistence.FetchType;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.GenerationType;
//import jakarta.persistence.Id;
//import jakarta.persistence.JoinColumn;
//import jakarta.persistence.ManyToOne;
//import jakarta.persistence.Table;
//import jakarta.validation.constraints.NotBlank;
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//import lombok.ToString;
//import org.hibernate.annotations.CreationTimestamp;
//
//import java.sql.Date;
//import java.util.UUID;
//
//@AllArgsConstructor
//@NoArgsConstructor
//@ToString
//@Getter
//@Setter
//@Entity
//@Table(name = "san_pham")
//public class SanPham {
//    @Id
//    @GeneratedValue(strategy = GenerationType.UUID)
//    @Column(name = "id_san_pham")
//    private UUID id;
//
//    @Column(name = "ma_san_pham")
//    private String ma;
//
//    @NotBlank(message = "Không để trống thông tin")
//    @Column(name = "ten_san_pham")
//    private String tenSP;
//
//    @CreationTimestamp
//    @Column(name = "ngay_tao")
//    private Date ngayTao;
//
//    @Column(name = "ngay_cap_nhat")
//    private Date ngayCapNhat;
//
//    @Column(name = "trang_thai")
//    private int trangThai;
//
//    @NotBlank(message = "Không để trống thông tin")
//    @Column(name = "mo_ta")
//    private String moTa;
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "id_hinh_anh")
//    private HinhAnh hinhAnh;
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "id_thuong_hieu")
//    private ThuongHieu thuongHieu;
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "id_loai")
//    private PhanLoai phanLoai;
//
//}
