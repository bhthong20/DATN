package com.example.demo.controllers;

import com.example.demo.models.ChucVu;
import com.example.demo.services.ChucVuService;
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
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/chuc-vu")
public class ChucVuController {

    @Autowired
    private ChucVuService chucVuService;


    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<ChucVu> list = chucVuService.FindAll(pageable);
        model.addAttribute("chucVu", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "../chuc-vu/hien-thi.jsp");
        return "home/layout";
    }

    @GetMapping("/delete/{id}")
    public String deleteChucVu(@PathVariable(name = "id") UUID id) {
        chucVuService.deleteChucVu(id);
        return "redirect:/chuc-vu/hien-thi";
    }

    @GetMapping("/view-update")
    public String viewUpdate(Model model, @RequestParam("id") UUID id) {
        ChucVu cv = chucVuService.findById(id);
        model.addAttribute("chucVu", cv);
        model.addAttribute("contentPage", "../chuc-vu/update.jsp");
        return "home/layout";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute(name = "chucVu") ChucVu chucVu,
                         @PathVariable(name = "id") UUID id) {
        ChucVu nv = chucVuService.findById(id);
        chucVu.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        System.out.println(nv.toString());
        chucVuService.update(id, chucVu);
        return "redirect:/chuc-vu/hien-thi";
    }


    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("chucVu") ChucVu chucVu) {
        model.addAttribute("chucVu", new ChucVu());
        model.addAttribute("contentPage", "../chuc-vu/add.jsp");
        return "home/layout";
    }

    @PostMapping("/add")
    public String add(Model model, @ModelAttribute("chucVu") ChucVu chucVu, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("contentPage", "chuc-vu/add.jsp");
            return "chuc-vu/add";
        }
        String maChucVu = "CV00" + (chucVuService.getAll().size() + 1);
        chucVu.setMa(maChucVu);
        chucVu.setNgayTao(Date.valueOf(LocalDate.now()));
        chucVuService.add(chucVu);
        System.out.println("listChucVu");
        return "redirect:/chuc-vu/hien-thi";
    }
}

