package com.example.demo.services;

import com.example.demo.models.ChucVu;
import com.example.demo.models.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface ChucVuService {

    public Page<ChucVu> FindAll(Pageable pageable);

    public List<ChucVu> getAll();

    public List<ChucVu> search(String search);

    public ChucVu findById(UUID id);

    public ChucVu add(ChucVu chucVu);

    public ChucVu update(UUID id, ChucVu chucVu);

    public void deleteChucVu(UUID id);
}
