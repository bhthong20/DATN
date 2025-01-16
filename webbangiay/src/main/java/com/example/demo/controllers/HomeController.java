package com.example.demo.controllers;

import com.example.demo.models.KhachHang;
import com.example.demo.services.ChatLieuService;
import com.example.demo.services.HinhAnhService;
import com.example.demo.services.KhuyenMaiService;
import com.example.demo.services.KichThuocService;
import com.example.demo.services.MauSacService;
import com.example.demo.services.PhanLoaiService;
import com.example.demo.services.ThuongHieuService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;


@Controller
public class HomeController {


    @Autowired
    private MauSacService mauSacService;

    @Autowired
    private KichThuocService kichThuocService;

    @Autowired
    private ChatLieuService chatLieuService;

    @Autowired
    private HinhAnhService hinhAnhService;

    @Autowired
    private PhanLoaiService phanLoaiService;

    @Autowired
    private ThuongHieuService thuongHieuService;

    @Autowired
    private KhuyenMaiService khuyenMaiService;


    private KhachHang khachHang;

    @GetMapping("/home")
    public String showHome() {
        return "quang-ba/home";
    }

    @GetMapping("/san-pham")
    public String showSanPham(Model model) {
        model.addAttribute("listTH", thuongHieuService.findAll());
        model.addAttribute("listPL", phanLoaiService.findAll());
        model.addAttribute("listMS", mauSacService.findAll());
        return "quang-ba/san-pham";
    }

    @GetMapping("/san-pham/{id}")
    public String showSanPhamDetail(Model model) {
        model.addAttribute("listKM", khuyenMaiService.getComboboxKhuyenMai());
        return "quang-ba/detail-san-pham";
    }

    @GetMapping("/403")
    public String show403() {
        return "quang-ba/403";
    }
    @GetMapping("/kiem-tra-dang-nhap")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> kiemTraDangNhap(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        if (session.getAttribute("khachHang") == null) {
            response.put("loggedIn", false);
            response.put("message", "Vui lòng đăng nhập!");
        } else {
            response.put("loggedIn", true);
        }
        return ResponseEntity.ok(response);
    }
}