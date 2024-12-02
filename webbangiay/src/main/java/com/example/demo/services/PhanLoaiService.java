package com.example.demo.services;

import com.example.demo.models.ChatLieu;
import com.example.demo.models.PhanLoai;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface PhanLoaiService {

    public Page<PhanLoai> getAll(Pageable pageable);

    public List<PhanLoai> findAll();

    public List<PhanLoai> search(String search);

    public PhanLoai findById(UUID id);

    public PhanLoai add(PhanLoai phanLoai);

    public PhanLoai update(UUID id, PhanLoai phanLoai);

    public Boolean delete(UUID id);
}
