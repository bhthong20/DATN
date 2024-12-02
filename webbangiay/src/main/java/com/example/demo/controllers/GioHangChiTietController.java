package com.example.demo.controllers;

import com.example.demo.models.GioHangChiTiet;
import com.example.demo.services.GioHangChiTietService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("gio-hang-chi-tiet")
public class GioHangChiTietController {
    @Autowired
    private GioHangChiTietService gioHangChiTietService;

    @GetMapping("hien-thi")
    public String hienThi(Model model,
                          @RequestParam("page") Optional<Integer> pageParam) {
        int page = pageParam.orElse(0);
        Pageable p = PageRequest.of(page, 5);
        Page<GioHangChiTiet> pageData = gioHangChiTietService.findAll(p);
        model.addAttribute("pageData", pageData);
        return "gio-hang-chi-tiet/hien-thi";
    }
    @GetMapping("view-add")
    public String viewAdd(Model model, @ModelAttribute("gioHang") GioHangChiTiet gioHangChiTiet){
        model.addAttribute("gioHangChiTiet",new GioHangChiTiet());
        return "gio-hang-chi-tiet/add";
    }
    @PostMapping("add")
    public String add(@Valid @ModelAttribute(name = "gioHangChiTiet") GioHangChiTiet gioHangChiTiet, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "gio-hang-chi-tiet/add";
        }
        String maGHCT = "GHCT" + (gioHangChiTietService.findAll().size()+1);
        gioHangChiTietService.add(gioHangChiTiet);
        return "redirect:/gio-hang-chi-tiet/hien-thi";
    }
    @GetMapping("delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id){
        gioHangChiTietService.delete(id);
        return "redirect:/gio-hang-chi-tiet/hien-thi";
    }
    @GetMapping("view-update/{id}")
    public String detail(Model model, @PathVariable("id") UUID id){
        GioHangChiTiet ghct = gioHangChiTietService.findById(id);
        model.addAttribute("gioHangChiTiet",ghct);
        return "gio-hang-chi-tiet/update";
    }
    @PostMapping("update/{id}")
    public String update(@Valid @ModelAttribute(name = "gioHang") GioHangChiTiet gioHangChiTiet,
                         @PathVariable(name = "id") UUID id,
                         BindingResult result){
        if (result.hasErrors()){
            System.out.println("Co loi");
        }
        gioHangChiTietService.update(id, gioHangChiTiet);
        return "redirect:/gio-hang-chi-tiet/hien-thi";
    }
    @PostMapping("search")
    public String search (Model model, @ModelAttribute("giohangChiTiet") GioHangChiTiet gioHang, @RequestParam("search") String search){
        List<GioHangChiTiet> list = gioHangChiTietService.search(search);
        model.addAttribute("list",list);
        return "gio-hang-chi-tiet/hien-thi";
    }
}
