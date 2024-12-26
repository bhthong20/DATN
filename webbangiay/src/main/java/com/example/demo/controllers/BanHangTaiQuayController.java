package com.example.demo.controllers;

import com.example.demo.services.ChatLieuService;
import com.example.demo.services.HinhAnhService;
import com.example.demo.services.KhuyenMaiService;
import com.example.demo.services.KichThuocService;
import com.example.demo.services.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ban-hang-tai-quay")
public class BanHangTaiQuayController {

    @Autowired
    private MauSacService mauSacService;

    @Autowired
    private KichThuocService kichThuocService;

    @Autowired
    private ChatLieuService chatLieuService;

    @Autowired
    private HinhAnhService hinhAnhService;

    @Autowired
    private KhuyenMaiService khuyenMaiService;

    @GetMapping
    public String banHangTaiQuayView(Model model) {
        model.addAttribute("listHA", hinhAnhService.findAll());
        model.addAttribute("listMS", mauSacService.findAll());
        model.addAttribute("listKT", kichThuocService.findAll());
        model.addAttribute("listCL", chatLieuService.findAll());
        model.addAttribute("listKM", khuyenMaiService.getComboboxKhuyenMai());
        model.addAttribute("contentPage", "../ban-hang-tai-quay/index.jsp");
        return "home/layout";
    }
}
