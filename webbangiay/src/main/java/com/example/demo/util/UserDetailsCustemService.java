package com.example.demo.util;

import com.example.demo.models.KhachHang;
import com.example.demo.models.NhanVien;
import com.example.demo.repositories.KhachHangRepository;
import com.example.demo.repositories.NhanVienRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;

@Configuration
public class UserDetailsCustemService implements UserDetailsService {

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private HttpSession session;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // Kiểm tra tài khoản khách hàng (USER)
        Optional<KhachHang> khachHang = khachHangRepository.findByTaiKhoan(username);

        if (khachHang.isPresent()) {
            // Kiểm tra trạng thái tài khoản
            if (khachHang.get().getTrangThai() == null || "1".equals(khachHang.get().getTrangThai())) {
                throw new UsernameNotFoundException("Tài khoản của bạn đã bị ngưng hoạt động.");
            }

            // Mã hóa lại mật khẩu (theo yêu cầu giữ nguyên)
            String hashedPassword = passwordEncoder.encode(khachHang.get().getMatKhau());
            khachHang.get().setMatKhau(hashedPassword);

            // Lưu thông tin vào session
            session.setAttribute("USER_LOGIN", khachHang.get());
            session.setAttribute("USER_LOGIN_TYPE", "USER");

            return User.builder()
                    .username(khachHang.get().getTaiKhoan())
                    .password(khachHang.get().getMatKhau())
                    .roles("USER")
                    .build();
        }

        // Kiểm tra tài khoản nhân viên (STAFF/ADMIN)
        Optional<NhanVien> nhanVien = nhanVienRepository.findByTaiKhoanWithRole(username);

        if (nhanVien.isEmpty()) {
            throw new UsernameNotFoundException("Không tìm thấy người dùng với tên đăng nhập: " + username);
        }

        // Kiểm tra trạng thái tài khoản nhân viên (nếu cần)
        if (nhanVien.get().getTinhTrang() == 1) {
            throw new UsernameNotFoundException("Tài khoản của bạn đã bị ngưng hoạt động.");
        }

        // Lấy vai trò từ bảng `chuc_vu`
        String roleName = nhanVien.get().getChucVu().getTenChucVu().toUpperCase();

        // Mã hóa lại mật khẩu (theo yêu cầu giữ nguyên)
        String hashedPassword = passwordEncoder.encode(nhanVien.get().getMatKhau());
        nhanVien.get().setMatKhau(hashedPassword);

        // Lưu thông tin vào session
        session.setAttribute("USER_LOGIN", nhanVien.get());
        session.setAttribute("USER_LOGIN_TYPE", roleName);

        return User.builder()
                .username(nhanVien.get().getTaiKhoan())
                .password(nhanVien.get().getMatKhau())
                .roles(roleName) // Sử dụng vai trò từ `chuc_vu` (ADMIN/STAFF)
                .build();
    }
}
