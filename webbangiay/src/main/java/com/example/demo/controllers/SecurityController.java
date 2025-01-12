package com.example.demo.controllers;

import com.example.demo.models.KhachHang;
import com.example.demo.models.MauSac;
import com.example.demo.models.dto.UserLogin;
import com.example.demo.services.SecurityService;
import com.example.demo.util.UserLoginCommon;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SecurityController {

    @Autowired
    private UserLoginCommon common;

    @Autowired
    private SecurityService service;

    @GetMapping("/login")
    public String loginForm(Model model) {
        model.addAttribute("userLogin", new UserLogin());
        return "security/login";
    }

    @GetMapping("/user-infor")
    @ResponseBody
    public ResponseEntity<?> getUserInfor() {
        Object user = common.getUserLogin();
        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Chưa đăng nhập");
        }
        return ResponseEntity.ok(user);
    }

    @PostMapping("/update-user")
    @ResponseBody
    public ResponseEntity<String> updateUser(@RequestBody KhachHang updatedKhachHang) {
        KhachHang currentUser = (KhachHang) common.getUserLogin();
        if (currentUser == null) {
            return new ResponseEntity<>("User not logged in", HttpStatus.UNAUTHORIZED);
        }

        // Update current user's details with the new data, excluding the password
        currentUser.setHoTen(updatedKhachHang.getHoTen());
        currentUser.setEmail(updatedKhachHang.getEmail());
        currentUser.setSdt(updatedKhachHang.getSdt());
        currentUser.setNgaySinh(updatedKhachHang.getNgaySinh());

        // Save the updated user information
        service.updateKhachHang(currentUser.getId(), currentUser);

        return new ResponseEntity<>("Cập nhật thành công!", HttpStatus.OK);
    }



    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        return "redirect:/login";
    }

    @GetMapping("/auth-register")
    public String registerForm(Model model) {
        model.addAttribute("khachHang", new KhachHang());
        return "security/auth-resgit";
    }

    @PostMapping("/auth-register")
    public String registerAuthForm(@Valid @ModelAttribute(name = "khachHang") KhachHang khachHang, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "security/auth-resgit";
        }
        KhachHang khachHang1 = service.addKhachHang(khachHang, bindingResult);
        if (khachHang1 == null) {
            return "security/auth-resgit";
        }
        return "redirect:/login";
    }

    @GetMapping("/forgot-password")
    public String forgotPasswordForm(Model model) {
        model.addAttribute("userLogin", new UserLogin());
        return "security/forgot-password";
    }

    @PostMapping("/forgot-password")
    public String forgotPasswordSubmit(@RequestParam("email") String email, Model model) {
        boolean emailSent = service.sendResetPasswordEmail(email);
        if (!emailSent) {
            model.addAttribute("error", "Failed to send reset password email. Please try again later.");
            return "security/forgot-password";
        }
        model.addAttribute("success", "Reset password email has been sent. Please check your email inbox.");
        return "redirect:/login";
    }

    @GetMapping("/reset-password")
    public String resetPasswordForm(@RequestParam("code") String code, Model model) {
        if (!service.isValidResetCode(code)) {
            model.addAttribute("error", "Invalid or expired reset code.");
            return "security/reset-password";
        }
        model.addAttribute("resetCode", code);
        return "security/reset-password";
    }

    @PostMapping("/reset-password")
    public String resetPasswordSubmit(@RequestParam("resetCode") String resetCode,
                                      @RequestParam("newPassword") String newPassword,
                                      Model model) {
        boolean passwordReset = service.resetPassword(resetCode, newPassword);
        if (!passwordReset) {
            model.addAttribute("error", "Failed to reset password. Please try again.");
            return "security/reset-password";
        }
        model.addAttribute("success", "Password has been reset successfully. You can now log in with your new password.");
        return "redirect:/login";
    }
}
