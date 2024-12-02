package com.example.demo.services.impl;

import com.example.demo.models.GioHang;
import com.example.demo.services.GioHangService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class GioHangServiceImpl implements GioHangService {
    @Override
    public Page<GioHang> findAll(Pageable pageable) {
        return null;
    }

    @Override
    public List<GioHang> findAll() {
        return null;
    }

    @Override
    public List<GioHang> search(String search) {
        return null;
    }

    @Override
    public GioHang findById(UUID id) {
        return null;
    }

    @Override
    public GioHang add(GioHang gioHang) {
        return null;
    }

    @Override
    public GioHang update(UUID id, GioHang gioHang) {
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        return null;
    }
}
