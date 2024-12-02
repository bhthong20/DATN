package com.example.demo.controllers;

import com.example.demo.models.HinhAnh;
import com.example.demo.models.dto.SanPhamDetail;
import com.example.demo.services.HinhAnhService;
import com.example.demo.util.FileUploadUtil;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/hinh-anh")
public class HinhAnhController {
    @Autowired
    private HinhAnhService anhService;

    @GetMapping("hien-thi")
    public String hienThi(@ModelAttribute("anh") HinhAnh anh, Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<HinhAnh> list = anhService.getAll(pageable);
        model.addAttribute("listAnh", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        model.addAttribute("contentPage", "../hinh-anh/hien-thi.jsp");
        return "home/layout";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model, @ModelAttribute("anh") HinhAnh anh) {
        model.addAttribute("anh", new HinhAnh());
        model.addAttribute("contentPage", "../hinh-anh/add.jsp");
        return "home/layout";
    }

//    @GetMapping("/detail-san-pham")
//    public SanPhamDetail detailSanPham(@RequestParam("id") UUID id) {
//        SanPhamDetail sanPhamDetail = new SanPhamDetail();
////        sanPhamDetail.setSanPham(sanPhamService.findById(id));
//        sanPhamDetail.setChiTietSanPham(chiTietSanPhamService.findChiTietSanPhamBySanPham(sanPhamDetail.getSanPham()));
//        return sanPhamDetail;
//    }

    @GetMapping("/detail")
    public String detail(Model model, @ModelAttribute("anh") HinhAnh anh, @RequestParam("id") UUID id) {
        model.addAttribute("anh", anhService.findById(id));
        model.addAttribute("contentPage", "../hinh-anh/update.jsp");
        return "home/layout";
    }

    @GetMapping("/delete/{id}")
    public String deleteHa(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                               @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("anh") HinhAnh anh) {
        anhService.delete(id);
        return "redirect:/hinh-anh/hien-thi";
    }

    @PostMapping("/search-0")
    public String search0(Model model, @ModelAttribute("anh") HinhAnh anh, @RequestParam("search") String search, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (search.isEmpty()) {
            model.addAttribute("thongBao", "Không để trống thông tin");
            Sort sort = Sort.by("ngayTao").descending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<HinhAnh> list = anhService.getAll(pageable);
            model.addAttribute("listAnh", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            model.addAttribute("contentPage", "hinh-anh/hien-thi.jsp");
            return "hinh-anh/hien-thi";
        } else {
            List<HinhAnh> list = anhService.search0(search);
            model.addAttribute("listAnh", list);
            model.addAttribute("contentPage", "../hinh-anh/hien-thi.jsp");
            return "home/layout";
        }

    }

    @PostMapping("/add")
    public String add(Model model,
                      @ModelAttribute("anh") @Valid HinhAnh anh,
                      BindingResult bindingResult,
                      @RequestParam("anh1s") MultipartFile anh1,
                      @RequestParam("anh2s") MultipartFile anh2,
                      @RequestParam("anh3s") MultipartFile anh3,
                      @RequestParam("num") Optional<Integer> num,
                      @RequestParam(name = "size", defaultValue = "5", required = false) Integer size
    ) throws IOException {
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "anh/add.jsp");
            return "hinh-anh/add";
        }
        String mhd="";
        Integer sl = anhService.findAll().size() + 1;
        if(sl<9){
            mhd = "ANH0" + sl;
        }else {
            mhd = "ANH" + sl;
        }
        anh.setMa(mhd);
        anh.setNgayTao(date);
        anh.setTrangThai(0);

        // Xử lý ảnh 1
        String fileName1 = StringUtils.cleanPath(anh1.getOriginalFilename());

        if(fileName1.equals("")){

        }else {
            String uploadDir = "src/main/webapp/uploads/";
            FileUploadUtil.saveFile(uploadDir, fileName1, anh1);
            anh.setAnh1(fileName1);
        }

        // Xử lý ảnh 2
        String fileName2 = StringUtils.cleanPath(anh2.getOriginalFilename());

        if(fileName2.equals("")){

        }else {
            String uploadDir = "src/main/webapp/uploads/";
            FileUploadUtil.saveFile(uploadDir, fileName2, anh2);
            anh.setAnh2(fileName2);
        }

        // Xử lý ảnh 3
        String fileName3 = StringUtils.cleanPath(anh3.getOriginalFilename());

        if(fileName3.equals("")){

        }else {
            String uploadDir = "src/main/webapp/uploads/";
            FileUploadUtil.saveFile(uploadDir, fileName3, anh3);
            anh.setAnh3(fileName3);
        }
        anhService.add(anh);
        return "redirect:/hinh-anh/hien-thi";
    }

    @PostMapping("/update/{id}")
    public String updateDongSP(Model model, @ModelAttribute("anh") @Valid HinhAnh anh,
                               BindingResult bindingResult,
                               @PathVariable("id") UUID id,
                               @RequestParam("checkanh1") String checkanh1,
                               @RequestParam("checkanh2") String checkanh2,
                               @RequestParam("checkanh3") String checkanh3,
                               @RequestParam("anh1s") MultipartFile anh1,
                               @RequestParam("anh2s") MultipartFile anh2,
                               @RequestParam("anh3s") MultipartFile anh3,
                               @RequestParam("num") Optional<Integer> num,
                               @RequestParam(name = "size", defaultValue = "5", required = false) Integer size
    ) throws IOException {
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "anh/update.jsp");
            return "hinh-anh/update";
        }
        HinhAnh tt = anhService.findById(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        anh.setNgayCapNhat(date);
        anh.setNgayTao(tt.getNgayTao());
        anh.setTrangThai(tt.getTrangThai());
        anh.setMa(tt.getMa());
        String fileName1 = StringUtils.cleanPath(anh1.getOriginalFilename());
        if (checkanh1.equals("cu1")) {
        } else {
            if (fileName1.equals("")) {
            } else {
                String uploadDir = "src/main/webapp/uploads/";
                FileUploadUtil.saveFile(uploadDir, fileName1, anh1);
            }
            anh.setAnh1(fileName1);
        }
        String fileName2 = StringUtils.cleanPath(anh2.getOriginalFilename());
        if (checkanh2.equals("cu2")) {
        } else {
            if (fileName2.equals("")) {
            } else {
                String uploadDir = "src/main/webapp/uploads/";
                FileUploadUtil.saveFile(uploadDir, fileName2, anh2);
            }
            anh.setAnh2(fileName2);
        }
        String fileName3 = StringUtils.cleanPath(anh3.getOriginalFilename());
        if (checkanh3.equals("cu3")) {
        } else {
            if (fileName3.equals("")) {
            } else {
                String uploadDir = "src/main/webapp/uploads/";
                FileUploadUtil.saveFile(uploadDir, fileName3, anh3);
            }
            anh.setAnh3(fileName3);
        }
        anhService.update(id, anh);
        return "redirect:/hinh-anh/hien-thi";
    }
}
