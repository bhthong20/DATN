package com.example.demo.controllers;

import com.example.demo.models.GioHang;
import com.example.demo.services.GioHangService;
import com.example.demo.services.KhuyenMaiService;
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
@RequestMapping("/gio-hang")
public class GioHangController {
    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private KhuyenMaiService khuyenMaiService;

    @GetMapping
    public String viewGioHang(Model model) {
        model.addAttribute("listKM", khuyenMaiService.getComboboxKhuyenMai());

        return "quang-ba/gio-hang";
    }

    @GetMapping("hien-thi")
    public String hienThi(Model model,
                          @RequestParam("page") Optional<Integer> pageParam) {
        int page = pageParam.orElse(0);
        Pageable p = PageRequest.of(page, 5);
        Page<GioHang> pageData = gioHangService.findAll(p);
        model.addAttribute("pageData", pageData);
        return "gio-hang/hien-thi";
    }
    @GetMapping("view-add")
    public String viewAdd(Model model, @ModelAttribute("gioHang") GioHang gioHang){
        model.addAttribute("gioHang",new GioHang());
        return "gio-hang/add";
    }
    @PostMapping("add")
    public String add(@Valid @ModelAttribute(name = "danhGia") GioHang gioHang, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "gio-hang/add";
        }
        String maGH = "GH" + (gioHangService.findAll().size()+1);
        gioHang.setMa(maGH);
        gioHang.setNgayTao(Date.valueOf(LocalDate.now()));
        gioHangService.add(gioHang);
        return "redirect:/gio-hang/hien-thi";
    }
    @GetMapping("delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id){
        gioHangService.delete(id);
        return "redirect:/gio-hang/hien-thi";
    }
    @GetMapping("view-update/{id}")
    public String detail(Model model, @PathVariable("id") UUID id){
        GioHang gh = gioHangService.findById(id);
        model.addAttribute("gioHang",gh);
        return "gio-hang/update";
    }
    @PostMapping("update/{id}")
    public String update(@Valid @ModelAttribute(name = "gioHang") GioHang gioHang,
                         @PathVariable(name = "id") UUID id,
                         BindingResult result){
        if (result.hasErrors()){
            System.out.println("Co loi");
        }
        gioHangService.update(id, gioHang);
        return "redirect:/gio-hang/hien-thi";
    }
    @PostMapping("search")
    public String search (Model model, @ModelAttribute("danhGia") GioHang gioHang, @RequestParam("search") String search){
        List<GioHang> list = gioHangService.search(search);
        model.addAttribute("list",list);
        return "gio-hang/hien-thi";
    }
}
