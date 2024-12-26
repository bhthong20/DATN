package com.example.demo.services.impl;

import com.example.demo.models.KhachHang;
import com.example.demo.repositories.KhachHangRepository;
import com.example.demo.repositories.NhanVienRepository;
import com.example.demo.services.KhachHangService;
import com.example.demo.services.SecurityService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;
import java.util.UUID;

@Service
public class SecurityServiceImpl implements SecurityService {

    @Autowired
    private KhachHangService service;

    @Autowired
    private KhachHangRepository repository;

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public KhachHang addKhachHang(KhachHang khachHang, BindingResult bindingResult) {
        if (!repository.findByTaiKhoan(khachHang.getTaiKhoan()).isEmpty()) {
            bindingResult.rejectValue("taiKhoan", "taiKhoan", "Tài khoản đã tồn tại");
            return null;
        }
        if (!nhanVienRepository.findByTaiKhoan(khachHang.getTaiKhoan()).isEmpty()) {
            bindingResult.rejectValue("taiKhoan", "taiKhoan", "Tài khoản đã tồn tại");
            return null;
        }
        String maKhachHang = "KH00" + (service.findAll().size() + 1);
        khachHang.setMa(maKhachHang);

        return service.add(khachHang);
    }

    @Override
    public KhachHang updateKhachHang(UUID id, KhachHang khachHang) {
        if (id != null) {
            KhachHang existingKhachHang = repository.findById(id).orElse(null);
            if (existingKhachHang != null) {
                String existingPassword = existingKhachHang.getMatKhau(); // Retain the existing password
                BeanUtils.copyProperties(khachHang, existingKhachHang, "matKhau"); // Exclude password from copying
                existingKhachHang.setMatKhau(existingPassword); // Set the existing password
                return repository.save(existingKhachHang);
            }
        }
        return null;
    }


    @Override
    public boolean sendResetPasswordEmail(String emailAddress) {
        try {
            Optional<KhachHang> khachHangOpt = repository.findByEmail(emailAddress);

            if (!khachHangOpt.isPresent()) {
                return false;
            }
            KhachHang khachHang = khachHangOpt.get();


            String resetCode = generateResetCode();
            khachHang.setResetCode(resetCode);
            repository.save(khachHang);


            khachHang.setResetCode(resetCode);
            repository.save(khachHang);


            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("thongbt8@gmail.com");
            message.setTo(emailAddress);
            message.setSubject("Reset Password Request");


            String emailContent = "Please click the following link to reset your password:\n\n"
                    +

                    "http://localhost:8080/reset-password?code=" + resetCode;
            message.setText(emailContent);
            mailSender.send(message);

            message.setText(emailContent);
            mailSender.send(message);
            return true;
        } catch (MailException e) {
            e.printStackTrace();
            return false;
        }
    }

    private String generateResetCode() {
        return UUID.randomUUID().toString();
    }

    @Override
    public boolean resetPassword(String resetCode, String newPassword) {
        Optional<KhachHang> khachHangOpt = repository.findByResetCode(resetCode);
        if (!khachHangOpt.isPresent()) {
            return false;
        }
        KhachHang khachHang = khachHangOpt.get();
        khachHang.setMatKhau(newPassword);
        khachHang.setResetCode(null);
        repository.save(khachHang);
        return true;
    }

    @Override
    public boolean isValidResetCode(String resetCode) {
        return repository.findByResetCode(resetCode).isPresent();
    }
}