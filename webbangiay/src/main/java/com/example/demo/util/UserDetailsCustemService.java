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
        StringBuilder roleName = new StringBuilder("USER");

        Optional<KhachHang> khachHang = khachHangRepository.findByTaiKhoan(username);

        if (khachHang.isEmpty()) {

            roleName.setLength(0);
            roleName.append("ADMIN");
            Optional<NhanVien> nhanVien = nhanVienRepository.findByTaiKhoan(username);

            if (nhanVien.isEmpty()) {
                throw new UsernameNotFoundException("Không tìm thấy người dùng với tên đăng nhập: " + username);
            }

            String hashedPassword = passwordEncoder.encode(nhanVien.get().getMatKhau());
            nhanVien.get().setMatKhau(hashedPassword);
            session.setAttribute("USER_LOGIN", nhanVien.get());
            session.setAttribute("USER_LOGIN_TYPE", "ADMIN");

            return User.builder()
                    .username(nhanVien.get().getTaiKhoan())
                    .password(nhanVien.get().getMatKhau())
                    .roles(roleName.toString())
                    .build();
        }

        String hashedPassword = passwordEncoder.encode(khachHang.get().getMatKhau());
        khachHang.get().setMatKhau(hashedPassword);
        session.setAttribute("USER_LOGIN", khachHang.get());
        session.setAttribute("USER_LOGIN_TYPE", "USER");

        return User.builder()
                .username(khachHang.get().getTaiKhoan())
                .password(khachHang.get().getMatKhau())
                .roles(roleName.toString())
                .build();
    }
}
