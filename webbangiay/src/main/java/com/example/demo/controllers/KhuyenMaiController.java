package com.example.demo.controllers;


import com.example.demo.models.KhuyenMai;
import com.example.demo.repositories.KhuyenMaiRepository;
import com.example.demo.services.KhuyenMaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/khuyen-mai")
public class KhuyenMaiController {
    @Autowired
    private KhuyenMaiService khuyenMaiService;
    @Autowired
    private KhuyenMaiRepository khuyenMaiRepository;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<KhuyenMai> list = khuyenMaiService.getAll(pageable);
        model.addAttribute("listKhuyenMai", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "../khuyen-mai/hien-thi.jsp");
        return "home/layout";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model) {
        model.addAttribute("contentPage", "../khuyen-mai/add.jsp");
        return "home/layout";
    }

    @PostMapping("/add")
    @ResponseBody
    public KhuyenMai add(@RequestBody KhuyenMai khuyenMai) {
        khuyenMai.setNgayTao(Date.valueOf(LocalDate.now()));
        khuyenMai.setMa("KM00" + (khuyenMaiService.findAll().size() + 1));
        return khuyenMaiService.add(khuyenMai);
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        khuyenMaiService.delete(id);
        return "redirect:/khuyen-mai/hien-thi";
    }

    @GetMapping("/view-update")
    public String detail(Model model, @RequestParam("id") UUID id) {
        model.addAttribute("contentPage", "../khuyen-mai/add.jsp");
        return "home/layout";
    }

    @GetMapping("/detail")
    @ResponseBody
    public KhuyenMai detailRest(@RequestParam("id") UUID id) {
        return khuyenMaiService.findById(id);
    }

    @PostMapping("/update/{id}")
    @ResponseBody
    public KhuyenMai update(@RequestBody KhuyenMai khuyenMai,
                            @PathVariable(name = "id") UUID id) {
        return khuyenMaiService.update(id, khuyenMai);
    }

    @GetMapping("/search")
    public String search(Model model, @ModelAttribute("khuyenMai") KhuyenMai khuyenMai, @RequestParam("search") String search) {
        List<KhuyenMai> list = khuyenMaiService.search(search);
        model.addAttribute("listKhuyenMai", list);
        model.addAttribute("contentPage", "../khuyen-mai/hien-thi.jsp");
        return "home/layout";
    }


    @GetMapping("/loc")
    public String loc(Model model,
                      @RequestParam(value = "locTT", required = false) Integer locTT,
                      @RequestParam(value = "locHTG", required = false) Integer locHTG,
                      @RequestParam(value = "ngayKiemTra", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate ngayKiemTra) {

        Long ngayKiemTraMillis = (ngayKiemTra == null) ? null : ngayKiemTra.atStartOfDay(ZoneOffset.UTC).toInstant().toEpochMilli();
        List<KhuyenMai> list = khuyenMaiRepository.loc(locTT, locHTG, ngayKiemTraMillis);
        model.addAttribute("listKhuyenMai", list);

        // Add the input values to the model
        model.addAttribute("locTT", locTT);
        model.addAttribute("locHTG", locHTG);
        model.addAttribute("ngayKiemTra", ngayKiemTra);

        model.addAttribute("contentPage", "../khuyen-mai/hien-thi.jsp");
        return "home/layout";
    }



}
