package com.example.demo.controllers;

import com.example.demo.models.KichThuoc;
import com.example.demo.models.ThuongHieu;
import com.example.demo.services.ThuongHieuService;
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
@RequestMapping("/thuong-hieu")
public class ThuongHieuController {
    @Autowired
    private ThuongHieuService thuongHieuService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<ThuongHieu> pageData = thuongHieuService.findAll(pageable);
        model.addAttribute("pageData", pageData.getContent());
        model.addAttribute("contentPage", "../thuong-hieu/hien-thi.jsp");
        return "home/layout";
    }
    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("thuongHieu") ThuongHieu thuongHieu){
        List<ThuongHieu>list = thuongHieuService.findAll();
        model.addAttribute("listTH", list);
        model.addAttribute("thuongHieu",new ThuongHieu());
        model.addAttribute("contentPage", "../thuong-hieu/add.jsp");
        return "home/layout";
    }
    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "thuongHieu") ThuongHieu thuongHieu, BindingResult bindingResult,Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("contentPage", "../thuong-hieu/add.jsp");
            return "home/layout";
        }
        String maTH = "TH" + (thuongHieuService.findAll().size()+1);
        thuongHieu.setMa(maTH);
        thuongHieu.setNgayTao(Date.valueOf(LocalDate.now()));
        thuongHieuService.add(thuongHieu);
        return "redirect:/thuong-hieu/hien-thi";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id){
        thuongHieuService.delete(id);
        return "redirect:/thuong-hieu/hien-thi";
    }
    @GetMapping("/view-update")
    public String detail(Model model, @RequestParam("id") UUID id){
        List<ThuongHieu>list = thuongHieuService.findAll();
        model.addAttribute("listTH", list);
        ThuongHieu thuongHieu = thuongHieuService.findById(id);
        model.addAttribute("thuongHieu",thuongHieu);
        model.addAttribute("contentPage", "../thuong-hieu/update.jsp");
        return "home/layout";
    }
    @PostMapping("/update/{id}")
    public String update(@Valid @ModelAttribute(name = "thuongHieu") ThuongHieu thuongHieu,Model model,
                         @PathVariable(name = "id") UUID id,
                         BindingResult result){
        if (result.hasErrors()){
            System.out.println("Co loi");
            model.addAttribute("contentPage", "../thuong-hieu/update.jsp");
            return "home/layout";
        }
        ThuongHieu th = thuongHieuService.findById(id);
        thuongHieu.setId(id);
        thuongHieu.setMa(th.getMa());
        thuongHieu.setNgayTao(th.getNgayTao());
        thuongHieu.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        thuongHieuService.update(id, thuongHieu);
        return "redirect:/thuong-hieu/hien-thi";
    }
    @PostMapping("/search")
    public String search (Model model, @ModelAttribute("thuongHieu") ThuongHieu thuongHieu, @RequestParam("search") String search, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size){
        if (search.isEmpty()) {
            Sort sort = Sort.by("ngayTao").ascending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<ThuongHieu> pageData = thuongHieuService.findAll(pageable);
            model.addAttribute("pageData", pageData.getContent());
            model.addAttribute("contentPage", "../thuong-hieu/hien-thi.jsp");
            return "home/layout";
        }
        List<ThuongHieu> list = thuongHieuService.search(search);
        model.addAttribute("pageData", list);
        model.addAttribute("contentPage", "../thuong-hieu/hien-thi.jsp");
        return "home/layout";
    }
}
