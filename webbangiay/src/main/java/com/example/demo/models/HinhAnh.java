package com.example.demo.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Entity
@Table(name = "hinh_anh")
public class HinhAnh {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id_hinh_anh")
    private UUID id;

    @Column(name = "ma")
    private String ma;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "ten_hinh_anh")
    private String ten;

    @Column(name = "url_anh")
    private String anh1;

    @Column(name = "url_anh1")
    private String anh2;

    @Column(name = "url_anh2")
    private String anh3;

    @CreationTimestamp
    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_cap_nhat")
    private Date ngayCapNhat;

    @Column(name = "trang_thai")
    private int trangThai;

    @Column(name = "mo_ta")
    private String moTa;
}
