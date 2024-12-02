package com.example.demo.controllers;


import com.example.demo.models.PhanLoai;
import com.example.demo.models.ThuongHieu;
import com.example.demo.services.PhanLoaiService;
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
@RequestMapping("/loai")
public class LoaiController {
    @Autowired
    private PhanLoaiService phanLoaiService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<PhanLoai> list = phanLoaiService.getAll(pageable);
        model.addAttribute("listMauSac", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "../loai/hien-thi.jsp");
        return "home/layout";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("PhanLoai") PhanLoai mauSac) {
        List<PhanLoai>list = phanLoaiService.findAll();
        model.addAttribute("listPL", list);
        model.addAttribute("PhanLoai", new PhanLoai());
        model.addAttribute("contentPage", "../loai/add.jsp");
        return "home/layout";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "PhanLoai") PhanLoai phanLoai, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "../loai/add.jsp");
            return "home/layout";
        }
        String maPL = "PL" + (phanLoaiService.findAll().size()+1);
        phanLoai.setMa(maPL);
        phanLoai.setNgayTao(Date.valueOf(LocalDate.now()));
        phanLoaiService.add(phanLoai);
        return "redirect:/loai/hien-thi";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        phanLoaiService.delete(id);
        return "redirect:/loai/hien-thi";
    }

    @GetMapping("/view-update")
    public String detail(Model model, @RequestParam("id") UUID id ) {
        PhanLoai mauSac = phanLoaiService.findById(id);
        model.addAttribute("PhanLoai", mauSac);
        model.addAttribute("contentPage", "../loai/update.jsp");
        return "home/layout";
    }

    @PostMapping("/update/{id}")
    public String update(@Valid@ModelAttribute(name = "PhanLoai") PhanLoai phanLoai,
                         @PathVariable(name = "id") UUID id, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            System.out.println("Co loi");
            model.addAttribute("contentPage", "../loai/update.jsp");
            return "home/layout";
        }
        PhanLoai pl = phanLoaiService.findById(id);
        phanLoai.setId(id);
        phanLoai.setMa(pl.getMa());
        phanLoai.setNgayTao(pl.getNgayTao());
        phanLoai.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        System.out.println(pl.toString());
        phanLoaiService.update(id, phanLoai);
        return "redirect:/loai/hien-thi";
    }

    @PostMapping("/search")
    public String search(Model model, @RequestParam("search") String search, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (search.isEmpty()) {
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<PhanLoai> list = phanLoaiService.getAll(pageable);
            model.addAttribute("listMauSac", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "../loai/hien-thi.jsp");
            return "home/layout";
        }
        List<PhanLoai> list = phanLoaiService.search(search);
        model.addAttribute("listMauSac", list);
        model.addAttribute("contentPage", "../loai/hien-thi.jsp");
        return "home/layout";
    }
}
