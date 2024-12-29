package com.example.demo.services.impl;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.repositories.ChiTietSanPhamRepository;
import com.example.demo.services.TemplateExcelService;
import com.example.demo.util.XLXUtils;
import com.google.gson.Gson;
import org.jxls.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TemplateExcelServiceImpl implements TemplateExcelService {

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Override
    public ByteArrayOutputStream downloadExcelSanPham() throws IOException {
        XLXUtils report = new XLXUtils();

        ByteArrayOutputStream out = null;
        out = new ByteArrayOutputStream();
        Map<String, Object> map = new HashMap<>();
        List<ChiTietSanPham> chiTietSanPham = chiTietSanPhamRepository.findAllByIsDelete(1);
        System.out.println(chiTietSanPham.get(0).getKichThuoc().getSize());
        map.put("sanPham", chiTietSanPham);

        report.createDocument(out, "export_san_pham", map);
        return out;
    }
}
