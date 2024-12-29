package com.example.demo.services;

import com.example.demo.models.ChucVu;
import com.example.demo.models.DiaChi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface DiaChiService  {
    public Page<DiaChi> FindAll(Pageable pageable);

    public List<DiaChi> getAll();

    public List<DiaChi> search(String search);

    public DiaChi findById(UUID id);

    public DiaChi add(DiaChi diaChi);

    public DiaChi update(UUID id, DiaChi diaChi);

    public void deleteDiaChi(UUID id);

}
