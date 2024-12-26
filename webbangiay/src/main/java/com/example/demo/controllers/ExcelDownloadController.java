package com.example.demo.controllers;

import com.example.demo.services.TemplateExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

@RestController
@RequestMapping("/excel")
public class ExcelDownloadController {

    @Autowired
    private TemplateExcelService templateExcelService;

    // Excel
    @GetMapping("/download/san-pham")
    public ResponseEntity<byte[]> getFile() throws IOException {
        String filename = "danh_sach_san_pham" + new Random().nextInt(100) + ".xlsx";
        ByteArrayOutputStream file = templateExcelService.downloadExcelSanPham();

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + filename)
                .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(file.toByteArray());
    }
}
