package com.example.demo.controllers;

import com.example.demo.models.dto.FileUploadDTO;
import com.example.demo.models.dto.PaymentRequest;
import com.example.demo.services.impl.VNPayService;
import com.example.demo.util.ConvertImage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;

@RestController
public class AjaxController {

    @Autowired
    private VNPayService service;

    @Autowired
    private ConvertImage convertImage;

    @PostMapping("/payment")
    public String payment(@RequestBody PaymentRequest request) throws UnsupportedEncodingException {
        return service.createOrder(request.getTotal(), request.getIdHoaDon());
    }

    @GetMapping("/vnpay-payment")
    public PaymentRequest GetMapping(HttpServletRequest request){
        int paymentStatus = service.orderReturn(request);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");
//        return paymentStatus == 1 ? "ordersuccess" : "orderfail";
        return new PaymentRequest(Integer.parseInt(totalPrice), orderInfo, paymentStatus);
    }

    @PostMapping("/test/upload")
    public String test(@RequestBody FileUploadDTO fileUploadDTO) {
        return convertImage.convertImageFromBase64(fileUploadDTO.getFile());
    }
}
