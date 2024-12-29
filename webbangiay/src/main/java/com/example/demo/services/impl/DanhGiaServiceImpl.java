package com.example.demo.services.impl;

import com.example.demo.models.DanhGia;
import com.example.demo.services.DanhGiaService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class DanhGiaServiceImpl implements DanhGiaService {
    @Override
    public Page<DanhGia> findAll(Pageable pageable) {
        return null;
    }

    @Override
    public List<DanhGia> findAll() {
        return null;
    }

    @Override
    public List<DanhGia> search(String search) {
        return null;
    }

    @Override
    public DanhGia findById(UUID id) {
        return null;
    }

    @Override
    public DanhGia add(DanhGia danhGia) {
        return null;
    }

    @Override
    public DanhGia update(UUID id, DanhGia danhGia) {
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        return null;
    }
}
