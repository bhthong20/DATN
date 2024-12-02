package com.example.demo.services.impl;

import com.example.demo.models.GioHangChiTiet;
import com.example.demo.services.GioHangChiTietService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class GioHangChiTietServiceImpl implements GioHangChiTietService {
    @Override
    public Page<GioHangChiTiet> findAll(Pageable pageable) {
        return null;
    }

    @Override
    public List<GioHangChiTiet> findAll() {
        return null;
    }

    @Override
    public List<GioHangChiTiet> search(String search) {
        return null;
    }

    @Override
    public GioHangChiTiet findById(UUID id) {
        return null;
    }

    @Override
    public GioHangChiTiet add(GioHangChiTiet gioHangChiTiet) {
        return null;
    }

    @Override
    public GioHangChiTiet update(UUID id, GioHangChiTiet gioHangChiTiet) {
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        return null;
    }
}
