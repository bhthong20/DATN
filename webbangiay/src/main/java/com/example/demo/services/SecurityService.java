package com.example.demo.services;

import com.example.demo.models.KhachHang;
import org.springframework.validation.BindingResult;

import java.util.UUID;

public interface SecurityService {
    KhachHang addKhachHang(KhachHang khachHang, BindingResult bindingResult);
    public boolean sendResetPasswordEmail(String emailAddress);
    boolean resetPassword(String resetCode, String newPassword);
    boolean isValidResetCode(String resetCode);
    KhachHang updateKhachHang(UUID id, KhachHang khachHang);
}
