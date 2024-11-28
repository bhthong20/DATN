package com.example.demo.controllers;


import com.example.demo.models.KichThuoc;
import com.example.demo.services.KichThuocService;
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

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/kich-thuoc")
public class KichThuocController {

    @Autowired
    private KichThuocService kichThuocService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<KichThuoc> list = kichThuocService.getAll(pageable);
        model.addAttribute("listSize", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "../size/hien-thi.jsp");
        return "home/layout";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("Size") KichThuoc size) {
        model.addAttribute("size", new KichThuoc());
        List<KichThuoc>list = kichThuocService.findAll();
        model.addAttribute("listKT", list);
        model.addAttribute("contentPage", "../size/add.jsp");
        return "home/layout";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "Size") KichThuoc size, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "../size/add.jsp");
            return "home/layout";
        }

        String makt = "KT" + (kichThuocService.findAll().size() + 1);
        size.setMa(makt);
        size.setNgayTao(Date.valueOf(LocalDate.now()));
        kichThuocService.add(size);
        return "redirect:/kich-thuoc/hien-thi";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        kichThuocService.delete(id);
        return "redirect:/kich-thuoc/hien-thi";
    }

    @GetMapping("/view-update")
    public String detail(Model model, @RequestParam("id") UUID id) {
        List<KichThuoc>list = kichThuocService.findAll();
        model.addAttribute("listKT", list);
        KichThuoc size = kichThuocService.findById(id);
        model.addAttribute("Size", size);
        model.addAttribute("contentPage", "../size/update.jsp");
        return "home/layout";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute(name = "Size") KichThuoc size,
                         @PathVariable(name = "id") UUID id, BindingResult result, Model model) {
        if (result.hasErrors()) {
            System.out.println("Co loi");
            model.addAttribute("contentPage", "../size/update.jsp");
            return "home/layout";
        }
        KichThuoc clUd = kichThuocService.findById(id);
        size.setId(id);
        size.setMa(clUd.getMa());
        size.setNgayTao(clUd.getNgayTao());
        size.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        kichThuocService.update(id, size);
        return "redirect:/kich-thuoc/hien-thi";
    }

    @PostMapping("/search")
    public String search(Model model, @RequestParam("search") String search, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {

        if (search.isEmpty()) {
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<KichThuoc> list = kichThuocService.getAll(pageable);
            model.addAttribute("listSize", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "../size/hien-thi.jsp");
            return "home/layout";
        }
        List<KichThuoc> list = kichThuocService.search(search);
        model.addAttribute("listSize", list);
        model.addAttribute("contentPage", "../size/hien-thi.jsp");
        return "home/layout";

    }
}
