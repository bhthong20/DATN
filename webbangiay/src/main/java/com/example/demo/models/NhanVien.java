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
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Entity
@Table(name = "nhan_vien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id_nhan_vien")
    private UUID id;

    @Column(name = "ma")
    private String ma;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "ten_nhan_vien")
    private String hoTen;


    @Column(name = "hinh_anh")
    private String urlAnh;

    @Column(name = "gioi_tinh")
    private Boolean gioiTinh;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "email")
    private String email;

//    @NotBlank(message = "Không để trống thông tin")
//    @Pattern(regexp = "^0\\d{9}$", message = "Số điện thoại không hợp lệ")
//    @jakarta.validation.constraints.Size(max = 10, message = "Số điện thoại không quá 10 ký tự")
    @Column(name = "sdt")
    private String sdt;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "dia_chi")
    private String diaChi;

//    @NotNull(message = "Không để trống thông tin")
    @Column(name = "ngay_sinh")
    private Date ngaySinh;

//    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "cccd")
    private String canCuoc;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "tai_khoan")
    private String taiKhoan;

    @NotBlank(message = "Không để trống thông tin")
    @Size(max = 8, message = "Mật khẩu không quá 8 ký tự")
    @Column(name = "mat_khau")
    private String matKhau;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_cap_nhat")
    private Date ngayCapNhat;

    @NotNull(message = "Không để trống thông tin")
    @Column(name = "trang_thai")
    private int tinhTrang;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "chuc_vu_id")
    private ChucVu chucVu;
}
