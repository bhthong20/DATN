package com.example.demo.controllers;

import com.example.demo.models.*;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.HoaDonChiTietService;
import com.example.demo.services.HoaDonService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/hoa-don-chi-tiet")
public class HoaDonChiTietController {
    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;
    @Autowired
    private HoaDonService hoaDonService;
    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;
    @GetMapping("/hien-thi")
    public String hiethi(Model model)
    {

//        Pageable pageable = PageRequest.of(5,size);
//        Page<HoaDonChiTiet> list = hoaDonChiTietService.getAll(pageable);
//        System.out.println(list.getContent());
        List<HoaDonChiTiet> hdct = hoaDonChiTietService.findAll();
        model.addAttribute("listhoaDonCT", hdct);
//        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "../hoa-don-chi-tiet/hien-thi.jsp");
        return "home/layout";

    }
    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("hoaDonCT") HoaDonChiTiet hoaDonChiTiet, @ModelAttribute(name="hoaDon") HoaDon hoaDon, @ModelAttribute(name="chiTietSanPham") ChiTietSanPham chiTietSanPham) {
        List<HoaDon> listHoaDon = hoaDonService.findAll();
        List<ChiTietSanPham> listCTSP = chiTietSanPhamService.findAll();
        model.addAttribute("hoaDonCT", new HoaDonChiTiet());
        model.addAttribute("listHoaDon", listHoaDon);
        model.addAttribute("listCTSP", listCTSP);
        return "hoa-don-chi-tiet/add";
    }
    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "hoaDonChiTiet") HoaDonChiTiet hoaDonChiTiet, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "hoa-don-chi-tiet/add";
        }
        hoaDonChiTietService.add(hoaDonChiTiet);
        return "redirect:/hoa-don-chi-tiet/hien-thi";
    }
    @GetMapping("/view-update/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id,  @ModelAttribute("hoaDonCT") HoaDonChiTiet hoaDonCT, @ModelAttribute("hoaDon") HoaDon hoaDon, @ModelAttribute("chiTietSanPham") ChiTietSanPham chiTietSanPham) {
        List<HoaDon> listHoaDon = hoaDonService.findAll();
        List<ChiTietSanPham> listCTSP = chiTietSanPhamService.findAll();
        model.addAttribute("listHoaDon", listHoaDon);
        model.addAttribute("listCTSP", listCTSP);
        HoaDonChiTiet hoaDonCT1 = hoaDonChiTietService.findById(id);
        model.addAttribute("hoaDonCT", hoaDonCT1);
        return "hoa-don-chi-tiet/update";
    }
        @PostMapping("/update/{id}")
        public String update(@ModelAttribute( "hoaDonCT") HoaDonChiTiet hoaDonCT,
                @PathVariable("id") UUID id) {
            HoaDonChiTiet hoaDonCT1 = hoaDonChiTietService.findById(id);
            hoaDonCT1.setId(id);
            hoaDonChiTietService.update(id, hoaDonCT1);
            return "redirect:/hoa-don-chi-tiet/hien-thi";
        }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") UUID id) {
        hoaDonChiTietService.delete(id);
        return "redirect:/hoa-don-chi-tiet/hien-thi";
    }
    }

