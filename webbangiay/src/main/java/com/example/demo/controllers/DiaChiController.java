package com.example.demo.controllers;

import com.example.demo.models.ChatLieu;
import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.ChucVu;
import com.example.demo.models.DiaChi;
import com.example.demo.models.HoaDon;
import com.example.demo.models.KhachHang;
import com.example.demo.models.KhuyenMai;
import com.example.demo.models.KichThuoc;
import com.example.demo.models.MauSac;
import com.example.demo.models.NhanVien;
import com.example.demo.services.ChucVuService;
import com.example.demo.services.DiaChiService;
import com.example.demo.services.KhachHangService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
//@RequestMapping("/nhan-vien")
public class DiaChiController {

    @Autowired
    private DiaChiService diaChiService;

    @Autowired
    private KhachHangService khachHangService;


    @GetMapping("/hien-thi/dia-chi")
    public String hienThi(Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "4", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<DiaChi> list = diaChiService.FindAll(pageable);
        model.addAttribute("diaChi", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "dia-chi/hien-thi.jsp");
        return "dia-chi/hien-thi";
    }

    @GetMapping("/dia-chi/delete/{id}")
    public String deleteDiaChi(@PathVariable(name = "id") UUID id) {
        diaChiService.deleteDiaChi(id);
        return "redirect:/hien-thi/dia-chi";
    }

    @GetMapping("/dia-chi/view-update/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id,
                             @ModelAttribute(name = "diaChi") DiaChi diaChi,
                             @ModelAttribute(name = "khachHang") KhachHang khachHang) {
        List<KhachHang> listKh = khachHangService.findAll();
        model.addAttribute("listKh", listKh);
        DiaChi dc = diaChiService.findById(id);
        model.addAttribute("diaChi", dc);
        model.addAttribute("contentPage", "/dia-chi/update.jsp");
        return "/dia-chi/update";
    }


    @PostMapping("/dia-chi/update/{id}")
    public String update(@ModelAttribute(name = "diaChi") DiaChi diaChi,
                         @PathVariable(name = "id") UUID id, @ModelAttribute("khachHang") KhachHang khachHang) {
        DiaChi nv = diaChiService.findById(id);
        diaChi.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        System.out.println(nv.toString());
        diaChiService.update(id, diaChi);
        return "redirect:/hien-thi/dia-chi";
    }

    @GetMapping("/dia-chi/view-add")
    public String viewAdd(Model model, @ModelAttribute("diaChi") DiaChi diaChi,
                          @ModelAttribute("khachHang") KhachHang khachHang) {
        List<KhachHang> listKh = khachHangService.findAll();
        model.addAttribute("chucVu", new ChucVu());
        model.addAttribute("listKh", listKh);
        model.addAttribute("contentPage", "dia-chi/add.jsp");
        return "dia-chi/add";
    }

    @PostMapping("/dia-chi/add")
    public String add(Model model, @ModelAttribute("diaChi") DiaChi diaChi,
                      @ModelAttribute("khachHang") KhachHang khachHang, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("listKh", khachHangService.findAll());
            model.addAttribute("contentPage", "dia-chi/add.jsp");
            return "dia-chi/add";
        }
        diaChi.setId(UUID.randomUUID());
        diaChi.setNgayTao(Date.valueOf(LocalDate.now()));
        diaChiService.add(diaChi);
        System.out.println("listChucVu");
        return "redirect:/hien-thi/dia-chi";
    }
}

