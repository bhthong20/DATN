package com.example.demo.controllers;


import com.example.demo.models.MauSac;
import com.example.demo.models.ThuongHieu;
import com.example.demo.services.MauSacService;
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
@RequestMapping("/mau-sac")
public class MauSacController {
    @Autowired
    private MauSacService mauSacService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<MauSac> list = mauSacService.getAll(pageable);
        model.addAttribute("listMauSac", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "../mau-sac/hien-thi.jsp");
        return "home/layout";
    }
    @GetMapping("/view-add")
    public String viewAdd(Model model , @ModelAttribute("MauSac") MauSac mauSac){
        List<MauSac>list = mauSacService.findAll();
        model.addAttribute("listMS", list);
        model.addAttribute("MauSac", new MauSac());
        model.addAttribute("contentPage", "../mau-sac/add.jsp");
        return "home/layout";
    }
    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "MauSac") MauSac mauSac , BindingResult bindingResult ){
        if(bindingResult.hasErrors()){
            return "mau-sac/add";
        }
        String maTH = "MS" + (mauSacService.findAll().size()+1);
        mauSac.setMa(maTH);
        mauSac.setNgayTao(Date.valueOf(LocalDate.now()));
        mauSacService.add(mauSac);
        return "redirect:/mau-sac/hien-thi";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id){
        mauSacService.delete(id);
        return "redirect:/mau-sac/hien-thi";
    }
    @GetMapping("/view-update")
    public String detail(Model model, @RequestParam("id") UUID id){
        List<MauSac>list = mauSacService.findAll();
        model.addAttribute("listMS", list);
        MauSac mauSac = mauSacService.findById(id);
        model.addAttribute("mauSac", mauSac);
        model.addAttribute("contentPage", "../mau-sac/update.jsp");
        return "home/layout";
    }
    @PostMapping("/update/{id}")
    public String update(@ModelAttribute(name = "mauSac") MauSac mauSac,
                         @PathVariable(name = "id")UUID id,BindingResult result,Model model){
        if (result.hasErrors()){
            System.out.println("Co loi");
            model.addAttribute("contentPage", "../mau-sac/update.jsp");
            return "home/layout";
        }
        MauSac sizeUpdate = mauSacService.findById(id);
        mauSac.setId(id);
        mauSac.setMa(sizeUpdate.getMa());
        mauSac.setNgayTao(sizeUpdate.getNgayTao());
        mauSac.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        System.out.println(sizeUpdate.toString());
        mauSacService.update(id, mauSac);
        return "redirect:/mau-sac/hien-thi";
    }
    @PostMapping("/search")
    public String search(Model model,@RequestParam("search") String search, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size){
        if (search.isEmpty()) {
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<MauSac> list = mauSacService.getAll(pageable);
            model.addAttribute("listMauSac", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "../mau-sac/hien-thi.jsp");
            return "home/layout";
        }
        List<MauSac> list = mauSacService.search(search);
        model.addAttribute("listMauSac",list);
        model.addAttribute("contentPage", "../mau-sac/hien-thi.jsp");
        return "home/layout";
    }
}
