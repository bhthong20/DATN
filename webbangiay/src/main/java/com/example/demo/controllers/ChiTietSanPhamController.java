package com.example.demo.controllers;

import com.example.demo.models.ChatLieu;
import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.KichThuoc;
import com.example.demo.models.MauSac;
import com.example.demo.models.SanPham;
import com.example.demo.repositories.SanPhamRepository;
import com.example.demo.services.ChatLieuService;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.HinhAnhService;
import com.example.demo.services.KichThuocService;
import com.example.demo.services.MauSacService;
import com.example.demo.services.PhanLoaiService;
import com.example.demo.services.SanPhamService;
import com.example.demo.services.ThuongHieuService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/chi-tiet-san-pham")
public class ChiTietSanPhamController {
    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private MauSacService mauSacService;

    @Autowired
    private KichThuocService kichThuocService;

    @Autowired
    private ChatLieuService chatLieuService;

    @Autowired
    private HinhAnhService hinhAnhService;

    @Autowired
    private PhanLoaiService phanLoaiService;

    @Autowired
    private ThuongHieuService thuongHieuService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam("num") Optional<Integer> num, @RequestParam(name = "size", defaultValue = "10", required = false) Integer size) {
        model.addAttribute("listMS", mauSacService.findAll());
        model.addAttribute("listKT", kichThuocService.findAll());
        model.addAttribute("listCL", chatLieuService.findAll());
        model.addAttribute("listPL", phanLoaiService.findAll());
        model.addAttribute("listTH", thuongHieuService.findAll());

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<SanPham> list = sanPhamService.getAll(pageable);
        model.addAttribute("listCTSP", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "../chi-tiet-san-pham/hien-thi.jsp");
        return "home/layout";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        chiTietSanPhamService.delete(id);
        return "redirect:/chi-tiet-san-pham/hien-thi";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("chiTietSanPham") ChiTietSanPham chiTietSanPham,
                          @ModelAttribute("mauSac") MauSac mauSac,
                          @ModelAttribute("kichThuoc") KichThuoc kichThuoc,
                          @ModelAttribute("chatLieu") ChatLieu chatLieu) {
        model.addAttribute("chiTietSanPham", new ChiTietSanPham());
        model.addAttribute("listTH", thuongHieuService.findAll());
        model.addAttribute("listPL", phanLoaiService.findAll());
        model.addAttribute("listHA", hinhAnhService.findAll());
        model.addAttribute("listMS", mauSacService.findAll());
        model.addAttribute("listKT", kichThuocService.findAll());
        model.addAttribute("listCL", chatLieuService.findAll());
        model.addAttribute("contentPage", "../chi-tiet-san-pham/add.jsp");
        return "home/layout";
    }

    @GetMapping("/view-update")
    public String viewUpdate(Model model,
                             @ModelAttribute("mauSac") MauSac mauSac,
                             @ModelAttribute("kichThuoc") KichThuoc kichThuoc,
                             @ModelAttribute("chatLieu") ChatLieu chatLieu) {

        model.addAttribute("listTH", thuongHieuService.findAll());
        model.addAttribute("listPL", phanLoaiService.findAll());
        model.addAttribute("listHA", hinhAnhService.findAll());
        model.addAttribute("listMS", mauSacService.findAll());
        model.addAttribute("listKT", kichThuocService.findAll());
        model.addAttribute("listCL", chatLieuService.findAll());
        model.addAttribute("contentPage", "../chi-tiet-san-pham/add.jsp");
        return "home/layout";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "chiTietSanPham") ChiTietSanPham chiTietSanPham, BindingResult result, Model model,
                      @ModelAttribute("mauSac") MauSac mauSac,
                      @ModelAttribute("kichThuoc") KichThuoc kichThuoc,
                      @ModelAttribute("chatLieu") ChatLieu chatLieu) {
        if (result.hasErrors()) {
            model.addAttribute("listSP", sanPhamRepository.findAll());
            model.addAttribute("listMS", mauSacService.findAll());
            model.addAttribute("listKT", kichThuocService.findAll());
            model.addAttribute("listCL", chatLieuService.findAll());
            model.addAttribute("contentPage", "chi-tiet-san-pham/add.jsp");
            return "home/layout";
        }
        String maCTSP = "CTSP" + (chiTietSanPhamService.findAll().size() + 1);
        chiTietSanPham.setMa(maCTSP);
        chiTietSanPham.setNgayTao(Date.valueOf(LocalDate.now()));
        chiTietSanPhamService.add(chiTietSanPham);
        return "redirect:/chi-tiet-san-pham/hien-thi";
    }

    @PostMapping("/update/{idctsp}")
    public String update(@ModelAttribute(name = "chiTietSanPham") ChiTietSanPham chiTietSanPham, @PathVariable(name = "idctsp") UUID id,
                         @ModelAttribute("mauSac") MauSac mauSac,
                         @ModelAttribute("kichThuoc") KichThuoc kichThuoc,
                         @ModelAttribute("chatLieu") ChatLieu chatLieu) {
        ChiTietSanPham ctsp = chiTietSanPhamService.findById(id);
        chiTietSanPham.setId(id);
        chiTietSanPham.setMa(ctsp.getMa());
        chiTietSanPham.setNgayTao(ctsp.getNgayTao());
        chiTietSanPham.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        chiTietSanPhamService.update(id, chiTietSanPham);
        return "redirect:/chi-tiet-san-pham/hien-thi";
    }


    @GetMapping("/search")
    public String search(Model model, @ModelAttribute("chiTietSanPham") ChiTietSanPham chiTietSanPham, @RequestParam("search") String search) {
        model.addAttribute("listSP", sanPhamRepository.findAll());
        model.addAttribute("listMS", mauSacService.findAll());
        model.addAttribute("listKT", kichThuocService.findAll());
        model.addAttribute("listCL", chatLieuService.findAll());
        model.addAttribute("listTH", thuongHieuService.findAll());
        model.addAttribute("listPL", phanLoaiService.findAll());

        List<SanPham> list = chiTietSanPhamService.search0(search);
        model.addAttribute("listCTSP", list);
        model.addAttribute("contentPage", "../chi-tiet-san-pham/hien-thi.jsp");
        return "home/layout";
    }

    @GetMapping("/loc")
    public String loc(Model model,
                      @ModelAttribute("chiTietSanPham") ChiTietSanPham chiTietSanPham,
                      @RequestParam(value = "locTH", required = false) String locTH,
                      @RequestParam(value = "locPL", required = false) String locPL,
                      @RequestParam(value = "locTT", required = false) Integer locTT,
                      @RequestParam("num") Optional<Integer> num,
                      @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {

        model.addAttribute("listTH", thuongHieuService.findAll());
        model.addAttribute("listPL", phanLoaiService.findAll());
        model.addAttribute("locTH", locTH);
        model.addAttribute("locPL", locPL);
        model.addAttribute("locTT", locTT);

        List<SanPham> list;
        if (locTT != null) {
            list = chiTietSanPhamService.loc1(locTH, locPL, locTT);
        } else {
            list = chiTietSanPhamService.loc(locTH, locPL);
        }

        model.addAttribute("contentPage", "../chi-tiet-san-pham/hien-thi.jsp");
        model.addAttribute("listCTSP", list);
        return "home/layout";
    }


    @PostMapping("/modal-add-mau-sac")
    public ModelAndView addMauSac(@ModelAttribute("chiTietSanPham") ChiTietSanPham
                                          chiTietSanPham, @ModelAttribute("mauSac") @Valid MauSac mauSac, BindingResult result,
                                  @ModelAttribute("kichThuoc") KichThuoc kichThuoc,
                                  @ModelAttribute("chatLieu") ChatLieu chatLieu, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("listSP", sanPhamRepository.findAll());
            model.addAttribute("listMS", mauSacService.findAll());
            model.addAttribute("listKT", kichThuocService.findAll());
            model.addAttribute("listCL", chatLieuService.findAll());
            model.addAttribute("contentPage", "chi-tiet-san-pham/add.jsp");
            return new ModelAndView("layout", model);
        }
        String maMS = "MS" + (mauSacService.findAll().size() + 1);
        mauSac.setMa(maMS);
        mauSac.setNgayTao(Date.valueOf(LocalDate.now()));
        mauSacService.add(mauSac);
        model.addAttribute("chiTietSanPham", chiTietSanPham);
        return new ModelAndView("redirect:/chi-tiet-san-pham/view-add", model);
    }

    @PostMapping("/modal-add-kich-thuoc")
    public String addSize(@ModelAttribute("chiTietSanPham") ChiTietSanPham
                                  chiTietSanPham, @ModelAttribute("kichThuoc") @Valid KichThuoc kichThuoc, BindingResult result,
                          @ModelAttribute("mauSac") MauSac mauSac,
                          @ModelAttribute("chatLieu") ChatLieu chatLieu, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("listSP", sanPhamRepository.findAll());
            model.addAttribute("listMS", mauSacService.findAll());
            model.addAttribute("listKT", kichThuocService.findAll());
            model.addAttribute("listCL", chatLieuService.findAll());
            model.addAttribute("contentPage", "chi-tiet-san-pham/add.jsp");
            return "layout";
        }
        String maSize = "Size" + (kichThuocService.findAll().size() + 1);
        kichThuoc.setMa(maSize);
        kichThuoc.setNgayTao(Date.valueOf(LocalDate.now()));
        kichThuocService.add(kichThuoc);
        return "redirect:/chi-tiet-san-pham/view-add";
    }

    @PostMapping("/modal-add-chat-lieu")
    public String addDe(@ModelAttribute("chiTietSanPham") ChiTietSanPham
                                chiTietSanPham, @ModelAttribute("chatLieu") @Valid ChatLieu chatLieu, BindingResult result,
                        @ModelAttribute("mauSac") MauSac mauSac,
                        @ModelAttribute("kichThuoc") KichThuoc kichThuoc, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("listSP", sanPhamRepository.findAll());
            model.addAttribute("listMS", mauSacService.findAll());
            model.addAttribute("listKT", kichThuocService.findAll());
            model.addAttribute("listCL", chatLieuService.findAll());
            model.addAttribute("contentPage", "chi-tiet-san-pham/add.jsp");
            return "layout";
        }
        String maCL = "CL" + (chatLieuService.findAll().size() + 1);
        chatLieu.setMa(maCL);
        chatLieu.setNgayTao(Date.valueOf(LocalDate.now()));
        chatLieuService.add(chatLieu);
        return "redirect:/chi-tiet-san-pham/view-add";
    }
}
