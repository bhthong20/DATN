package com.example.demo.controllers;


import com.example.demo.models.KhachHang;
import com.example.demo.models.NhanVien;
import com.example.demo.services.KhachHangService;
import com.example.demo.util.UserLoginCommon;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/khach-hang")
public class KhachHangController {

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private UserLoginCommon userLoginCommon;

    @GetMapping("/thong-tin-ca-nhan")
    public String thongTinCaNhan(Model model) {
        model.addAttribute("user", userLoginCommon);
        return "khach-hang/thong-tin-ca-nhan";
    }

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<KhachHang> list = khachHangService.FindAll(pageable);
        model.addAttribute("khachHang", list.getContent());
        model.addAttribute("total", list.getTotalPages());
//        model.addAttribute("khachHang" , khachHangService.getAll());
        model.addAttribute("contentPage", "../khach-hang/hien-thi.jsp");
        return "home/layout";
    }

    @GetMapping("/delete/{id}")
    public String deleteChucVu(@PathVariable(name = "id") UUID id) {
        khachHangService.deleteKhachHang(id);
        return "redirect:/khach-hang/hien-thi";
    }

    @GetMapping("/view-update")
    public String viewUpdate(Model model, @RequestParam("id") UUID id) {
        KhachHang kh = khachHangService.findById(id);
        model.addAttribute("khachHang", kh);
        ;
        model.addAttribute("contentPage", "../khach-hang/update.jsp");
        return "home/layout";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute(name = "khachHang") KhachHang khachHang,
                         @PathVariable(name = "id") UUID id) {
        KhachHang kh = khachHangService.findById(id);
        khachHang.setMa(kh.getMa());
        khachHang.setNgayTao(kh.getNgayTao());
        khachHang.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        khachHangService.update(id, khachHang);
        return "redirect:/khach-hang/hien-thi";
    }


    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("khachHang") KhachHang khachHang) {
        model.addAttribute("khachHang", new KhachHang());
        model.addAttribute("contentPage", "../khach-hang/add.jsp");
        return "home/layout";
    }


    @PostMapping("/add")
    public String add(Model model, @Valid @ModelAttribute("khachHang") KhachHang khachHang, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("contentPage", "../khach-hang/add.jsp");
            return "home/layout";
        }
        String maKhachHang = "khachHang" + (khachHangService.findAll().size() + 1);
        khachHang.setNgayTao(Date.valueOf(LocalDate.now()));
        khachHang.setMa(maKhachHang);
        khachHangService.add(khachHang);
        return "redirect:/khach-hang/hien-thi";
    }

    @PostMapping("/loc")
    public String loc(Model model, @RequestParam("num") Optional<Integer> num,
                      @RequestParam(name = "size", defaultValue = "5", required = false) Integer size, @RequestParam(value = "locTT", required = false) Integer locTT,
                      @RequestParam(value = "locGT", required = false) Boolean locGT) {
        if (locTT == null && locGT == null) {
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<KhachHang> list = khachHangService.FindAll(pageable);
            model.addAttribute("khachHang", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "../khach-hang/hien-thi.jsp");
            return "home/layout";
        } else {
            List<KhachHang> list = khachHangService.loc(locTT, locGT);
            model.addAttribute("khachHang", list);
            model.addAttribute("contentPage", "../khach-hang/hien-thi.jsp");
            return "home/layout";
        }
    }

    @PostMapping("/search")
    public String search(Model model, @RequestParam("search") String search, @RequestParam("num") Optional<Integer> num, @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (search.isEmpty()) {
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<KhachHang> list = khachHangService.FindAll(pageable);
            model.addAttribute("khachHang", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "../khach-hang/hien-thi.jsp");
            return "home/layout";
        } else {
            List<KhachHang> list = khachHangService.search(search);
            model.addAttribute("khachHang", list);
            model.addAttribute("contentPage", "../khach-hang/hien-thi.jsp");
            return "home/layout";
        }
    }

}

