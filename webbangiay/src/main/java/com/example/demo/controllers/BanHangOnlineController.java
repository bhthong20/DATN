package com.example.demo.controllers;

import com.example.demo.models.dto.PaymentRequest;
import com.example.demo.services.BanHangOnlineService;
import com.example.demo.services.KhuyenMaiService;
import com.example.demo.services.impl.VNPayService;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
@RequestMapping("/ban-hang-online")
public class BanHangOnlineController {

    @Autowired
    private VNPayService service;

    @Autowired
    private KhuyenMaiService khuyenMaiService;

    @Autowired
    private BanHangOnlineService banHangOnlineService;

    @GetMapping("/hoa-don-detail")
    public String getDetailHoaDon(Model model, @RequestParam(name = "id", defaultValue = "") String id) {

        model.addAttribute("listKM", khuyenMaiService.getComboboxKhuyenMai());
        return "ban-hang-online/index-khach-hang";
    }

    @GetMapping("/hoa-don")
    public String getHoaDon() {
        return "ban-hang-online/list-hoa-don-khach-hang";
    }

    @GetMapping("/vnpay-payment")
    public String GetMapping(Model model, HttpServletRequest request) throws BadRequestException {
        int paymentStatus = service.orderReturn(request);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");
//        return paymentStatus == 1 ? "ordersuccess" : "orderfail";
        model.addAttribute("id", orderInfo);
        if (paymentStatus == 1) {
            banHangOnlineService.thayDoiTrangThaiHoaDon(UUID.fromString(orderInfo), 0);
        }
        return paymentStatus == 1 ? "ban-hang-online/thanh-toan-thanh-cong" : "ban-hang-online/thanh-toan-that-bai";
    }
}
