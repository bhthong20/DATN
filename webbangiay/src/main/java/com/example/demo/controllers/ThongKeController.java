package com.example.demo.controllers;

import com.example.demo.models.dto.ThongKeAllDto;
import com.example.demo.models.dto.ThongKeDetailDto;
import com.example.demo.services.ThongKeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.UUID;

@Controller
@RequestMapping("/thong-ke")
public class ThongKeController {

    @Autowired
    private ThongKeService thongKeService;

    @GetMapping
    public String getThongKe(Model model) {
        model.addAttribute("contentPage", "../thong-ke/index.jsp");
        return "home/layout";
    }

    @GetMapping("/api/{type}")
    @ResponseBody
    public ThongKeAllDto getAllTongApi(@PathVariable(name = "type") int type) {
        return thongKeService.getTongThongKe(type);
    }

    @GetMapping("/detail/{id}/{type}")
    @ResponseBody
    public ThongKeDetailDto getThongKeDetail(@PathVariable(name = "id") UUID id, @PathVariable(name = "type") int type) {
        return thongKeService.getTongThongKeDetail(id, type);
    }
}
