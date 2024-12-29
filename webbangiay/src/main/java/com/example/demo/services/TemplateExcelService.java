package com.example.demo.services;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public interface TemplateExcelService {
    ByteArrayOutputStream downloadExcelSanPham() throws IOException;
}
