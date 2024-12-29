package com.example.demo.controllers;

import com.example.demo.models.DanhGia;
import com.example.demo.services.DanhGiaService;
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

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("danh-gia")
public class DanhGiaController {
    @Autowired
    private DanhGiaService danhGiaService;

    @GetMapping("hien-thi")
    public String hienThi(Model model,
                          @RequestParam("page")Optional<Integer> pageParam) {
        int page = pageParam.orElse(0);
        Pageable p = PageRequest.of(page, 5);
        Page<DanhGia> pageData = danhGiaService.findAll(p);
        model.addAttribute("pageData", pageData);
        return "danh-gia/hien-thi";
    }
    @GetMapping("view-add")
    public String viewAdd(Model model, @ModelAttribute("danhGia") DanhGia danhGia){
        model.addAttribute("danhGia",new DanhGia());
        return "danh-gia/add";
    }
    @PostMapping("add")
    public String add(@Valid @ModelAttribute(name = "danhGia") DanhGia danhGia, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "danh-gia/add";
        }
        String maDG = "DG" + (danhGiaService.findAll().size()+1);
        danhGia.setMa(maDG);
        danhGiaService.add(danhGia);
        return "redirect:/danh-gia/hien-thi";
    }
    @GetMapping("delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id){
        danhGiaService.delete(id);
        return "redirect:/danh-gia/hien-thi";
    }
    @GetMapping("view-update/{id}")
    public String detail(Model model, @PathVariable("id") UUID id){
        DanhGia dg = danhGiaService.findById(id);
        model.addAttribute("danhGia",dg);
        return "danh-gia/update";
    }
    @PostMapping("update/{id}")
    public String update(@Valid @ModelAttribute(name = "danhGia") DanhGia danhGia,
                         @PathVariable(name = "id") UUID id,
                         BindingResult result){
        if (result.hasErrors()){
            System.out.println("Co loi");
        }
    danhGiaService.update(id, danhGia);
        return "redirect:/danh-gia/hien-thi";
    }
    @PostMapping("search")
    public String search (Model model, @ModelAttribute("danhGia") DanhGia danhGia, @RequestParam("search") String search){
        List<DanhGia> list = danhGiaService.search(search);
        model.addAttribute("list",list);
        return "danh-gia/hien-thi";
    }
}
