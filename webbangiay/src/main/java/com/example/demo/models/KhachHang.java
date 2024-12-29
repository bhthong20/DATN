package com.example.demo.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.NumberFormat;

import java.sql.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Entity
@Table(name = "khach_hang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id_khach_hang")
    private UUID id;

    @Column(name = "ma")
    private String ma;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "ten_khach_hang")
    private String hoTen;

    @Column(name = "gioi_tinh")
    private Boolean gioiTinh;

    @NotBlank(message = "Không để trống thông tin")
//    @Pattern(regexp = "^.{8,}@gmail\\.com$", message = "Email phải có ít nhất 8 ký tự và phải có đuôi @gmail.com")
    @Email(message = "Email không hợp lệ")
    @Column(name = "email")
    private String email;

    @NotBlank(message = "Không để trống thông tin")
    @Pattern(regexp = "^0[0-9]{9}$", message = "Số điện thoại không hợp lệ")
    @Column(name = "sdt")
    private String sdt;

    @Column(name = "ngay_sinh")
    private Date ngaySinh;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "tai_khoan")
    @Pattern(regexp = "^[a-zA-Z0-9]*$", message = "Tài khoản không được chứa ký tự đặc biệt")
    private String taiKhoan;

    @NotBlank(message = "Không để trống thông tin")
    @Column(name = "mat_khau")
    private String matKhau;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_cap_nhat")
    private Date ngayCapNhat;

    @Column(name = "trang_thai")
    private String trangThai;

    @Column(name = "reset_code")
    private String resetCode;

}
